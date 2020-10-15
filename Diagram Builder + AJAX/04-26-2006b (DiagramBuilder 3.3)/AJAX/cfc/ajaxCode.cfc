<cfcomponent displayname="ajaxCode" output="No">
	<cfinclude template="../cfinclude_explainError.cfm">

	<cfscript>
		this.HEX = "0123456789ABCDEF";
		this.hexMask = BitSHLN(255, 24);

		const_PK_violation_msg = 'Violation of PRIMARY KEY constraint';
	
		function _isPKviolation(eMsg) {
			var bool = false;
			if (FindNoCase(const_PK_violation_msg, eMsg) gt 0) {
				bool = true;
			}
			return bool;
		}
	</cfscript>
	
	<cffunction name="cf_file" access="public" returntype="any">
		<cfargument name="_action_" type="string" required="yes">
		<cfargument name="_fName_" type="string" required="yes">
		<cfargument name="_vName_" type="string" required="yes">

		<cfset Request.errorMsg = "">
		<cfset Request.fileError = "False">
		<cftry>
			<cfif (UCASE(_action_) eq UCASE("read"))>
				<cffile action="read" file="#_fName_#" variable="#_vName_#">
			<cfelse>
				<cfabort showerror="ERROR - Programming Error - Somebody forgot to pass a meaningful parameter into function known as cf_file().">
			</cfif>
			
			<cfcatch type="Any">
				<cfset Request.fileError = "True">

				<cfsavecontent variable="Request.errorMsg">
					<cfoutput>
						_action_ = [#_action_#], _fName_ = [#_fName_#], _vName_ = [#_vName_#]<br>
						[#cfcatch.message#]<br>
						[#cfcatch.detail#]<br>
					</cfoutput>
				</cfsavecontent>
	
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="cfm_nocache" access="public" returntype="string">
		<cfargument name="LastModified" type="string" required="yes">

		<CFSETTING ENABLECFOUTPUTONLY="YES">
		<CFHEADER NAME="Pragma" VALUE="no-cache">
		<CFHEADER NAME="Cache-Control" VALUE="no-cache, must-revalidate">
		<CFHEADER NAME="Last-Modified" VALUE="#LastModified#">
		<CFHEADER NAME="Expires" VALUE="Mon, 26 Jul 1997 05:00:00 EST">
		<CFSETTING ENABLECFOUTPUTONLY="NO">
		
		<cfreturn "True">
	</cffunction>

	<cffunction name="safely_execSQL" access="public">
		<cfargument name="_qName_" type="string" required="yes">
		<cfargument name="_DSN_" type="string" required="yes">
		<cfargument name="_sql_" type="string" required="yes">
		<cfargument name="_cachedWithin_" type="string" default="">
		
		<cfscript>
			var q = -1;
		</cfscript>
	
		<cfset Request.errorMsg = "">
		<cfset Request.moreErrorMsg = "">
		<cfset Request.explainError = "">
		<cfset Request.explainErrorHTML = "">
		<cfset Request.dbError = "False">
		<cfset Request.isPKviolation = "False">
		<cftry>
			<cfif (Len(Trim(arguments._qName_)) gt 0)>
				<cfif (Len(_DSN_) gt 0)>
					<cfif (Len(_cachedWithin_) gt 0) AND (IsNumeric(_cachedWithin_))>
						<cfquery name="#_qName_#" datasource="#_DSN_#" cachedwithin="#_cachedWithin_#">
							#PreserveSingleQuotes(_sql_)#
						</cfquery>
					<cfelse>
						<cfquery name="#_qName_#" datasource="#_DSN_#">
							#PreserveSingleQuotes(_sql_)#
						</cfquery>
					</cfif>
				<cfelse>
					<cfquery name="#_qName_#" dbtype="query">
						#PreserveSingleQuotes(_sql_)#
					</cfquery>
				</cfif>
			<cfelse>
				<cfset Request.errorMsg = "Missing Query Name which is supposed to be the first parameter.">
				<cfthrow message="#Request.errorMsg#" type="missingQueryName" errorcode="-100">
			</cfif>
	
			<cfcatch type="Database">
				<cfset Request.dbError = "True">
	
				<cfsavecontent variable="Request.errorMsg">
					<cfoutput>
						[#cfcatch.message#]<br>
						[#cfcatch.detail#]<br>
						[<b>cfcatch.SQLState</b>=#cfcatch.SQLState#]
					</cfoutput>
				</cfsavecontent>
	
				<cfsavecontent variable="Request.moreErrorMsg">
					<cfoutput>
						<UL>
							<LI>#cfcatch.Sql#</LI>
							<LI>#cfcatch.type#</LI>
							<LI>#cfcatch.message#</LI>
							<LI>#cfcatch.detail#</LI>
							<LI><b>cfcatch.SQLState</b>=#cfcatch.SQLState#</LI>
						</UL>
					</cfoutput>
				</cfsavecontent>
	
				<cfsavecontent variable="Request.explainErrorText">
					<cfoutput>
						[#explainError(cfcatch, false)#]
					</cfoutput>
				</cfsavecontent>
	
				<cfsavecontent variable="Request.explainErrorHTML">
					<cfoutput>
						[#explainError(cfcatch, true)#]
					</cfoutput>
				</cfsavecontent>
	
				<cfscript>
					if (Len(_DSN_) gt 0) {
						Request.isPKviolation = _isPKviolation(Request.errorMsg);
					}
				</cfscript>
	
				<cfset Request.dbErrorMsg = Request.errorMsg>
				<cfsavecontent variable="Request.fullErrorMsg">
					<cfdump var="#cfcatch#" label="cfcatch">
				</cfsavecontent>
				<cfsavecontent variable="Request.verboseErrorMsg">
					<cfif (IsDefined("Request.bool_show_verbose_SQL_errors"))>
						<cfif (Request.bool_show_verbose_SQL_errors)>
							<cfdump var="#cfcatch#" label="cfcatch :: Request.isPKviolation = [#Request.isPKviolation#]" expand="No">
						</cfif>
					</cfif>
				</cfsavecontent>
	
				<cfscript>
					if ( (IsDefined("Request.bool_show_verbose_SQL_errors")) AND (IsDefined("Request.verboseErrorMsg")) ) {
						if (Request.bool_show_verbose_SQL_errors) {
							if (NOT Request.isPKviolation) 
								writeOutput(Request.verboseErrorMsg);
						}
					}
				</cfscript>
			</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="cf_directory" access="public" returntype="boolean">
		<cfargument name="_qName_" type="string" required="yes">
		<cfargument name="_path_" type="string" required="yes">
		<cfargument name="_filter_" type="string" required="yes">
		<cfargument name="_recurse_" type="boolean" default="False">
	
		<cfset Request.directoryError = "False">
		<cfset Request.directoryErrorMsg = "">
		<cfset Request.directoryFullErrorMsg = "">
		<cftry>
			<cfif (_recurse_)>
				<cfdirectory action="LIST" directory="#_path_#" name="#_qName_#" filter="#_filter_#" recurse="Yes">
			<cfelse>
				<cfdirectory action="LIST" directory="#_path_#" name="#_qName_#" filter="#_filter_#">
			</cfif>

			<cfcatch type="Any">
				<cfset Request.directoryError = "True">

				<cfsavecontent variable="Request.directoryErrorMsg">
					<cfoutput>
						#cfcatch.message#<br>
						#cfcatch.detail#
					</cfoutput>
				</cfsavecontent>
				<cfsavecontent variable="Request.directoryFullErrorMsg">
					<cfdump var="#cfcatch#" label="cfcatch" expand="Yes">
				</cfsavecontent>
			</cfcatch>
		</cftry>
	
		<cfreturn Request.directoryError>
	</cffunction>
	
	<cffunction name="scopesDebugPanelContentLayout" access="public" returntype="string">
		<cfsavecontent variable="content_scopes_debug_panel">
			<cfoutput>
				<table width="100%" cellpadding="-1" cellspacing="-1">
					<tr>
						<td width="25%" align="center" valign="top">
							<cfdump var="#Application#" label="App Scope" expand="No">
						</td>
						<td width="25%" align="center" valign="top">
							<cfdump var="#Session#" label="Session Scope" expand="No">
						</td>
						<td width="25%" align="center" valign="top">
							<cfdump var="#CGI#" label="CGI Scope" expand="No">
						</td>
						<td width="25%" align="center" valign="top">
							<cfdump var="#Request#" label="Request Scope" expand="No">
						</td>
					</tr>
				</table>
			</cfoutput>
		</cfsavecontent>

		<cfreturn content_scopes_debug_panel>
	</cffunction>

	<cfscript>
		function _GetToken(str, index, delim) { // this is a faster GetToken() than GetToken()...
			var ar = -1;
			var retVal = '';
			ar = ListToArray(str, delim);
			try {
				retVal = ar[index];
			} catch (Any e) {
			}
			return retVal;
		}

		function isServerLocal() {
			var CGI_HTTP_HOST = UCASE(TRIM(CGI.HTTP_HOST));
			return ( (CGI_HTTP_HOST eq "LOCALHOST") OR (CGI_HTTP_HOST eq UCASE("laptop.halsmalltalker.com")) );
		}
	
		function filterQuotesForSQL(s) {
			return ReplaceNoCase(s, "'", "''", 'all');
		}
		
		function filterIntForSQL(s) {
			var t = reReplace(s, "(\+|-)?[0-9]+(\.[0-9]*)?", "", "all"); // flter-out numerics thus leaving non-numerics...
			var ar = ArrayNew(1);
			var ar2 = ArrayNew(1);
			var i = -1;
			for (i = 1; i lte Len(t); i = i + 1) {
				ar[ArrayLen(ar) + 1] = Mid(t, i, 1);
				ar2[ArrayLen(ar2) + 1] = '';
			}
			return ReplaceList(s, ArrayToList(ar, ','), ArrayToList(ar2, ','));
		}
	
		function filterQuotesForJS(s) {
			return ReplaceNoCase(s, "'", "\'", 'all');
		}
	
		function filterOutCr(s) {
			return ReplaceNoCase(s, Chr(13), "", 'all');
		}
	
		function filterDoubleQuotesForJS(s) {
			return ReplaceNoCase(s, '"', '\"', 'all');
		}
	
		function html_nocache() {
			var _html = '';
			var LastModified = DateFormat(Now(), "dd mmm yyyy") & " " & TimeFormat(Now(), "hh:mm:ss") & " GMT-5";
			
			cfm_nocache(LastModified);
	
			_html = _html & '<META HTTP-EQUIV="Pragma" CONTENT="no-cache">' & Request.const_Cr;
			_html = _html & '<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">' & Request.const_Cr;
			_html = _html & '<META HTTP-EQUIV="Last-Modified" CONTENT="#LastModified#">' & Request.const_Cr;
			_html = _html & '<META HTTP-EQUIV="Expires" CONTENT="Mon, 26 Jul 1997 05:00:00 EST">' & Request.const_Cr;
	
			return _html;
		}

		function begin_javascript() {
			var _jsCode = '';

			_jsCode = _jsCode & '<scr' & 'ipt language="JavaScript1.2" type="text/javascript">' & Request.const_Cr;
			_jsCode = _jsCode & '<!--\/\/' & Request.const_Cr;
			
			return _jsCode;
		}
	
		function end_javascript() {
			var _jsCode = '';

			_jsCode = _jsCode & '\/\/-->' & Request.const_Cr;
			_jsCode = _jsCode & '</scr' & 'ipt>' & Request.const_Cr;

			return _jsCode;
		}

		function _jsapi_init_js_(qObjName, cols, _method) {
			var _jsCode = '';
			if (_method eq 1) {
				_jsCode = _jsCode & "if (#Request.parentKeyword#jsapi_init_js_#qObjName#) {" & Request.const_Cr;
				_jsCode = _jsCode & "#Request.parentKeyword#jsapi_init_js_#qObjName#('#cols#');" & Request.const_Cr;
				_jsCode = _jsCode & "} else {" & Request.const_Cr;
				_jsCode = _jsCode & "alert('Missing function named #Request.parentKeyword#jsapi_init_js_#qObjName#.');" & Request.const_Cr;
				_jsCode = _jsCode & "} " & Request.const_Cr;
			} else {
				_jsCode = _jsCode & "if (#Request.parentKeyword#initJSQ) {" & Request.const_Cr;
				_jsCode = _jsCode & "#Request.parentKeyword#initJSQ('#qObjName#','#cols#');" & Request.const_Cr;
				_jsCode = _jsCode & "} else {" & Request.const_Cr;
				_jsCode = _jsCode & "alert('Missing function named #Request.parentKeyword#initJSQ().');" & Request.const_Cr;
				_jsCode = _jsCode & "} " & Request.const_Cr;
			}
			return _jsCode;
		}
	
		function _populate_JS_queryObj(q, qObjName, aFunc, bool_asJScode) {
			var i = -1;
			var k = -1;
			var jj = -1;
			var jj_i = -1;
			var jj_n = -1;
			var jj_vVal = '';
			var jj_s = '';
			var vVal = '';
			var js_vVal = '';
			var cName = '';
			var cols = '';
			var _jsCode = '';
			
			if (NOT IsBoolean(bool_asJScode)) {
				bool_asJScode = false;
			}
	
			if (IsQuery(q)) {
				cols = q.ColumnList;
				if (NOT bool_asJScode) _jsCode = _jsCode & begin_javascript();
				if (NOT bool_asJScode) {
					_jsCode = _jsCode & _jsapi_init_js_(qObjName, cols, 2);
				} else {
					_jsCode = _jsCode & qObjName & " = QObj.get$('#cols#');";
				}
				for (i = 1; i lte q.recordCount; i = i + 1) {
					_jsCode = _jsCode & "if (#Request.parentKeyword##qObjName# != null) { #Request.parentKeyword##qObjName#.QueryAddRow(); } " & Request.const_Cr;
					for (k = 1; k lte ListLen(cols, ','); k = k + 1) {
						cName = Trim(_GetToken(cols, k, ','));
						vVal = q[cName][i];
						if (IsCustomFunction(aFunc)) {
							vVal = Trim(aFunc(vVal));
						}
						vVal = URLEncodedFormat(vVal); // the consumer of the data has the responsability of decoding the data stream as-needed...
						js_vVal = "'#vVal#'";
	
						_jsCode = _jsCode & "if (#Request.parentKeyword##qObjName# != null) { #Request.parentKeyword##qObjName#.QuerySetCell('#cName#', #js_vVal#, #i#); } " & Request.const_Cr;
					}
					_jsCode = _jsCode & '' & Request.const_Cr;
				}
				if (NOT bool_asJScode) _jsCode = _jsCode & end_javascript();
			}
			return _jsCode;
		}
	
		function populate_JS_queryObj(q, qObjName, bool_asJScode) {
			return _populate_JS_queryObj(q, qObjName, _dummy_func, bool_asJScode);
		}

		function blue_formattedModuleName(_ex) {
			var _html = '<font color="blue"><b>' & _GetToken("#_ex#", ListLen("#_ex#", "/"), "/") & '</b></font>';
			
			return _html;
		}

		function initQryObj(col_list) {
			return QueryNew(col_list);
		}

		function indexForNamedQueryColumn(qQ, colName, findName) {
			var i = -1;
			var j = -1;

			if (IsQuery(qQ)) {
				for (j = 1; j lte qQ.recordCount; j = j + 1) {
					if (UCASE(qQ[colName][j]) eq UCASE(findName)) {
						i = j;
						break;
					}
				}
			}
			return i;
		}

		function _dummy_func(val) {
			return val;
		}
	</cfscript>

	<cfscript>
		function registerQueryFromAJAX(qObj) {
			var tObj = -1;

			if (NOT IsDefined("Request.qryData")) {
				Request.qryData = ArrayNew(1);
				Request.qryData[ArrayLen(Request.qryData) + 1] = qObj;
			} else {
				if (IsArray(Request.qryData)) {
					Request.qryData[ArrayLen(Request.qryData) + 1] = qObj;
				} else {
					tObj = ArrayNew(1);
					tObj[ArrayLen(tObj) + 1] = Request.qryData;
					tObj[ArrayLen(tObj) + 1] = qObj;
					Request.qryData = qObj;
				}
			}
		}
	</cfscript>
</cfcomponent>
