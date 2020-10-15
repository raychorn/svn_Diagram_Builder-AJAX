<cfscript>
	if (NOT IsDefined("This.name")) {
		aa = ListToArray('/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/', '/');
		subName = aa[1];
		if (Len(subName) gt 0) {
			subName = '_' & subName;
		}

		myAppName = right(reReplace(CGI.SERVER_NAME & subName, "[^a-zA-Z]","_","all"), 64);
		myAppName = ArrayToList(ListToArray(myAppName, '_'), '_');
		myAppName = UCASE(myAppName);
	}
</cfscript>

<cfapplication name="#myAppName#" clientmanagement="Yes" sessionmanagement="Yes" clientstorage="clientvars" setclientcookies="No" setdomaincookies="No" scriptprotect="All" sessiontimeout="#CreateTimeSpan(0,1,0,0)#" applicationtimeout="#CreateTimeSpan(1,0,0,0)#" loginstorage="Session">

<cffunction name="cf_log" access="public">
	<cfargument name="_someText_" type="string" required="yes">
	
	<cflog file="#Application.applicationName#" type="Information" text="#_someText_#">
</cffunction>

<cfinclude template="AJAX/cfinclude_explainError.cfm">
<cfinclude template="AJAX/cfinclude_cfdump.cfm">

<cffunction name="findAJAXCodeCFC" access="public" returntype="string">
	<cfargument name="_thisName_" type="string" required="Yes">
	
	<cfset var pName = ExpandPath("/" & ListFirst(CGI.SCRIPT_NAME, "/"))>
	<cfset var sPath = "">
	<cfset var mPath = "">
	<cfset var xPath = "">
	<cfset var ar = "">
	<cfset var hitCount = ArrayNew(1)>
	<cfset var iRow = "">
	<cfset var i = "">
	<cfset var nn = "">
	<cfset var iHits = 0>
	<cfset var iRowHitsMax = "">
	<cfset var _keyWord = "">
	<cfset var _f = "">
	<cfset var iMax = -1>

	<cfset Request.directoryError = false>
	<cftry>
		<cfdirectory action="LIST" directory="#pName#" name="Request.qDir" filter="#_thisName_#.cfc" recurse="Yes">

		<cfcatch type="Any">
			<cfset Request.directoryError = true>
			<cfdump var="#cfcatch#" label="cfcatch" expand="No">
		</cfcatch>
	</cftry>
	<cfscript>
		if (NOT Request.directoryError) {
			sPath = ListDeleteAt(CGI.SCRIPT_NAME, ListLen(CGI.SCRIPT_NAME, "/"), "/");
			sPath = Replace(sPath, "/", "\", "all");
			ar = ListToArray(sPath, '\');
			nn = ArrayLen(ar);
			for (iRow = 1; iRow lte Request.qDir.recordCount; iRow = iRow + 1) {
				iHits = 0;
				for (i = 1; i lte nn; i = i + 1) {
					_keyWord = '\' & ar[i] & '\';
					_f = FindNoCase(_keyWord, Request.qDir.DIRECTORY[iRow]);
					if (_f gt 0) {
						iHits = iHits + 1;
					}
				}
				_f = FindNoCase(sPath & '\', Request.qDir.DIRECTORY[iRow]);
				if (_f gt 0) {
					iHits = iHits + 1;
				}
				hitCount[iRow] = iHits;
			}
			nn = ArrayLen(hitCount);
			for (iRow = 1; iRow lte nn; iRow = iRow + 1) {
				iMax = Max(iMax, hitCount[iRow]);
			}
			iRowHitsMax = -1;
			for (iRow = 1; iRow lte nn; iRow = iRow + 1) {
				if (hitCount[iRow] eq iMax) {
					iRowHitsMax = iRow;
					mPath = Request.qDir.DIRECTORY[iRowHitsMax];
					i = FindNoCase(sPath, mPath);
					while (i eq 0) {
						sPath = ListDeleteAt(sPath, ListLen(sPath, '\'), '\');
						i = FindNoCase(sPath, mPath);
					}
					if (i gt 0) {
						xPath = Right(mPath, Len(mPath) - i + 1);
					}
					if (Left(xPath, 1) eq '\') {
						xPath = Right(xPath, Len(xPath) - 1);
					}
					xPath = ReplaceNoCase(xPath, '\', '.', 'all');
					break;
				}
			}
		}
	</cfscript>
	
	<cfreturn xPath>
</cffunction>

<cfscript>
	err_ajaxCode = false;
	err_ajaxCodeMsg = '';
	errorExplanation = '';
</cfscript>

<cfscript>
	Request.cf_log = cf_log;
	Request.cf_dump = cf_dump;
	Request.explainError = explainError;
	Request.explainObject = explainError;
	Request._explainError = _explainError;
	Request.explainErrorWithStack = explainErrorWithStack;
</cfscript>

<cfscript>
	Request.DSN = 'THEDB';
	
	Request.salesEmailAddress = 'sales@ez-ajax.com';
	
	Request.const_Cr = Chr(13);
	Request.const_Lf = Chr(10);
	Request.const_Tab = Chr(9);
	Request.const_CrLf = Request.const_Cr & Request.const_Lf;
	Request.parentKeyword = 'parent.';
	Request.cf_html_container_symbol = "html_container";
	Request.const_jsapi_loading_image = "images/loading.gif";
	Request.const_busy_loading_image = "images/wait.gif";
	Request.const_paper_color_light_yellow = '##FFFFBF';
	Request.const_color_light_blue = '##80FFFF';
	
	temporalIndex = '#GetTickCount()#';
	Randomize(Right(temporalIndex, Min(Len(temporalIndex), 9)), 'SHA1PRNG');
	
	Request.cf_div_floating_debug_menu = 'div_floating_debug_menu';

	cfJavaScriptSourceCodeFName = "javascript.js";
	
	Request.AUTH_USER = 'admin';

	err_ajaxCode = false;
	err_ajaxCodeMsg = '';
	try {
		_prefix = findAJAXCodeCFC('ajaxCode');
		Request.commonCode = CreateObject("component", _prefix & ".ajaxCode");
	} catch(Any e) {
		err_ajaxCode = true;
		err_ajaxCodeMsg = '(1) The ajaxCode component has NOT been created.';
		writeOutput('<font color="red"><b>#err_ajaxCodeMsg# | Reason: [#e.message#] [#e.detail#]</b></font><br>');
	}
	if (err_ajaxCode) {
		Request.cf_log(Application.applicationname, 'Error', '[#err_ajaxCodeMsg#]');
	}
	
	err_someCode = false;
	err_someCodeMsg = '';
	try {
		_prefix = findAJAXCodeCFC('pythonInterpreter');
	   Request.pythonCode = CreateObject("component", _prefix & ".pythonInterpreter");
	} catch(Any e) {
		err_someCode = true;
		err_someCodeMsg = '(1) The pythonInterpreter component has NOT been created.';
		writeOutput('<font color="red"><b>#err_someCodeMsg# | Reason: [#e.message#] [#e.detail#]</b></font><br>');
	}
	if (err_someCode) {
		Request.cf_log(Application.applicationname, 'Error', '[#err_someCodeMsg#]');
	}

	_prefix = ListDeleteAt(CGI.SCRIPT_NAME, ListLen(CGI.SCRIPT_NAME, '/'), '/');
	Request._cfm_path = _prefix & "/ajax/";
	Request.cfm_gateway_process_html = "#Request._cfm_path#AJAX_functions.cfm";
	
//	writeOutput('<br><br><br><br><br><br>Request._cfm_path = [#Request._cfm_path#], Request.cfm_gateway_process_html = [#Request.cfm_gateway_process_html#]<br>');

	Request.RuntimeLicenseStatus = '';
</cfscript>

<cfset makeNewRuntimeLicense = (Request.commonCode.isServerLocal()) AND false>

<!--- BEGIN: Read the Runtime License File --->
<cfif (NOT makeNewRuntimeLicense)>
	<cfscript>
		aStruct = Request.commonCode.readRuntimeLicenseFile();
		Request.RuntimeLicenseStatus = aStruct.RuntimeLicenseStatus;
	</cfscript>
	<cfif 0>
		<br><br><br><br><br><br>
		<cfdump var="#aStruct#" label="aStruct" expand="No">
	</cfif>
</cfif>
<!--- END! Read the Runtime License File --->


<!--- BEGIN: Make a Runtime License File --->
<cfif (makeNewRuntimeLicense)>
	<cfscript>
		Request.commonCode.writeRuntimeLicenseForEndDate(CreateDateTime(2099, 12, 31, 23, 59, 59));
	</cfscript>
</cfif>
<!--- END! Make a Runtime License File --->

<cfset majorVersion = listFirst(server.coldfusion.productversion)>
<cfset minorVersion = listGetAt(server.coldfusion.productversion,2)>
<cfset cfversion = majorVersion & "." & minorVersion>
<cfset application.isColdFusionMX7 = server.coldfusion.productname is "ColdFusion Server" and cfversion gte 7>

<cfscript>
	if (IsDefined("URL.sessid")) {
		Request.commonCode.readSessionFromDb(URL.sessid);
	} else {
		Request.commonCode.readSessionFromDb();
	}
</cfscript>

<cfscript>
	if ( (NOT IsDefined("Session.persistData.loggedin")) OR (NOT Session.persistData.loggedin) ) {
//		Request.RuntimeLicenseStatus = '<br><br><br><h2 style="color: red">101. Use of this Prototype is limited to only those who have valid User Accounts for this site.  Kindly obtain a valid User Account and return to use this Prototype.<br><br>Be advised that this Prototype CANNOT be used for any commercial purposes whatsoever because it contains code that is Copyrighted by &copy; 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.</h2>';
	}
</cfscript>
