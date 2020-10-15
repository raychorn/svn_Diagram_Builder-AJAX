<cfapplication name="DiagramBuilder_App_001" clientmanagement="Yes" sessionmanagement="Yes" clientstorage="clientvars" setclientcookies="No" setdomaincookies="No" scriptprotect="All" sessiontimeout="#CreateTimeSpan(0,1,0,0)#" applicationtimeout="#CreateTimeSpan(1,0,0,0)#" loginstorage="Session">

<cffunction name="cf_log" access="public">
	<cfargument name="_someText_" type="string" required="yes">
	
	<cflog file="#Application.applicationName#" type="Information" text="#_someText_#">
</cffunction>

<cfset Request.RuntimeLicenseStatus = "">
<cfset runtimeLicenseExpirationDate = CreateDateTime(2006, 6, 2, 23, 59, 59)>
<cfif (DateCompare(Now(), runtimeLicenseExpirationDate) gt 0)>
	<cfset Request.RuntimeLicenseStatus = '<br><br><br><h2 style="color: red">The Runtime License for this Prototype has Expired.  Kindly contact Ray Horn (<a href="mailto:raychorn@hotmail.com">raychorn@hotmail.com</a>) to get a new Runtime License.<br><br>Be advised that this Prototype CANNOT be used for any commercial purposes whatsoever because it contains code that is Copyrighted by &copy; 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.<br><br>The AJAX Server will now cease to function until a new Runtime License has been obtained and installed.</h2>'>
</cfif>

<cfinclude template="AJAX/cfinclude_explainError.cfm">
<cfinclude template="AJAX/cfinclude_cfdump.cfm">

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
	
	Request.AUTH_USER = 'admin';

	err_ajaxCode = false;
	err_ajaxCodeMsg = '';
	try {
	   Request.commonCode = CreateObject("component", ListFirst(CGI.SCRIPT_NAME, '/') & ".ajax.cfc.ajaxCode");
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
	   Request.pythonCode = CreateObject("component", ListFirst(CGI.SCRIPT_NAME, '/') & ".cfc.pythonInterpreter");
	} catch(Any e) {
		err_someCode = true;
		err_someCodeMsg = '(1) The pythonInterpreter component has NOT been created.';
		writeOutput('<font color="red"><b>#err_someCodeMsg# | Reason: [#e.message#] [#e.detail#]</b></font><br>');
	}
	if (err_someCode) {
		Request.cf_log(Application.applicationname, 'Error', '[#err_someCodeMsg#]');
	}

	Request._cfm_path = '/' & ListFirst(CGI.SCRIPT_NAME, '/') & "/ajax/";
	Request.cfm_gateway_process_html = "#Request._cfm_path#AJAX_functions.cfm";
</cfscript>
