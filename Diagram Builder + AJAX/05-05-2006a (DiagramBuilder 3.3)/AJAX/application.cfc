<cfcomponent>

	<cfinclude template="cfinclude_explainError.cfm">

	<cffunction name="cf_dump" access="public">
		<cfargument name="_aVar_" type="any" required="yes">
		<cfargument name="_aLabel_" type="string" required="yes">
		<cfargument name="_aBool_" type="boolean" default="False">
		
		<cfif (_aBool_)>
			<cfdump var="#_aVar_#" label="#_aLabel_#" expand="Yes">
		<cfelse>
			<cfdump var="#_aVar_#" label="#_aLabel_#" expand="No">
		</cfif>
	</cffunction>

	<cfscript>
		if (NOT IsDefined("This.name")) {
			aa = ListToArray(CGI.SCRIPT_NAME, '/');
			subName = aa[1];
			if (Len(subName) gt 0) {
				subName = '_' & subName;
			}

			myAppName = right(reReplace(CGI.SERVER_NAME & subName, "[^a-zA-Z]","_","all"), 64);
			myAppName = ArrayToList(ListToArray(myAppName, '_'), '_');
			This.name = UCASE(myAppName);
		}
		This.clientManagement = "Yes";
		This.sessionManagement = "Yes";
		This.sessionTimeout = "#CreateTimeSpan(0,1,0,0)#";
		This.applicationTimeout = "#CreateTimeSpan(1,0,0,0)#";
		This.clientStorage = "clientvars";
		This.loginStorage = "session";
		This.setClientCookies = "Yes";
		This.setDomainCookies = "No";
		This.scriptProtect = "All";
	</cfscript>
	
	<cffunction name="onError">
	   <cfargument name="Exception" required=true/>
	   <cfargument type="String" name="EventName" required=true/>

	   <cfscript>
			var errorExplanation = '';
			var cAR = -1;
			var n = -1;
			var errorMsg = '';

			err_ajaxCode = false;
			err_ajaxCodeMsg = '';
			try {
				Request.commonCode = CreateObject("component", "cfc.ajaxCode");
			} catch(Any e) {
				Request.commonCode = -1;
				err_ajaxCode = true;
				err_ajaxCodeMsg = '(1) The ajaxCode component has NOT been created.';
				writeOutput('<font color="red"><b>#err_ajaxCodeMsg#</b></font><br>');
				writeOutput(explainErrorWithStack(e, false));
			}

			if (IsStruct(Request.commonCode)) errorExplanation = Request.commonCode.explainErrorWithStack(Exception, false);
	   </cfscript>
	   
		<cfif (NOT ( (EventName IS "onSessionEnd") OR (EventName IS "onApplicationEnd") ) )>
			<cfscript>
				errorMsg = errorMsg & 'An unexpected error occurred.' & Chr(13);
				errorMsg = errorMsg & 'Error Event: #EventName#.' & Chr(13);
				errorMsg = errorMsg & 'Error details:' & Chr(13);

				cAR = ListToArray(Replace(Request.commonCode.explainErrorWithStack(Exception, false), Chr(13), '', 'all'), Chr(10));
				n = ArrayLen(cAR);
				if (IsStruct(Request.commonCode)) {
					for (i = 1; i lte n; i = i + 1) {
						errorMsg = errorMsg & cAR[i] & Chr(13);
					}
				}

				qObj = QueryNew('id, errorMsg');
				QueryAddRow(qObj, 1);
				QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
				QuerySetCell(qObj, 'errorMsg', errorMsg, qObj.recordCount);
				Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
			</cfscript>

			<cfinclude template="cfinclude_AJAX_Init.cfm">
			<cfinclude template="cfinclude_AJAX_End.cfm">
		</cfif>
	</cffunction>

	<cffunction name="onRequestStart" access="public">
		<cfargument name = "_targetPage" required=true/>

		<cfset err_ajaxCode = false>
		<cfset err_ajaxCodeMsg = ''>
		<cftry>
			<cfset Request.commonCode = CreateObject("component", "cfc.ajaxCode")>
			<cfcatch type="Any">
				<cfset err_ajaxCode = true>
				<cfdump var="#cfcatch#" label="cfcatch" expand="No">
			</cfcatch>
		</cftry>
		
		<cfscript>
			Request.DSN = 'KLADB';
		
			Request.cf_dump = cf_dump;
			
			Request.const_Cr = Chr(13);
			Request.const_Lf = Chr(10);
			Request.const_Tab = Chr(9);
			Request.const_CrLf = Request.const_Cr & Request.const_Lf;
			Request.parentKeyword = 'parent.';
			Request.cf_html_container_symbol = "html_container";
			Request.const_jsapi_loading_image = "../images/loading.gif";
			Request.const_busy_loading_image = "../images/wait.gif";
			Request.const_paper_color_light_yellow = '##FFFFBF';
			Request.const_color_light_blue = '##80FFFF';
		</cfscript>

		<cfreturn (err_ajaxCode eq false)>
	</cffunction>

	<cffunction name="onRequestEnd" access="public">
		<cfargument name = "_targetPage" required=true/>
	</cffunction>
</cfcomponent>
