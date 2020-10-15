<cftry>
	<cfscript>
		Request.DSN = 'THEDB';
		
		Request.salesEmailAddress = 'sales@ez-ajax.com';
	
		Request._urlParentPrefix = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/');
		if (Right(Request._urlParentPrefix, 1) eq '/') {
			Request._urlParentPrefix = Left(Request._urlParentPrefix, Len(Request._urlParentPrefix) - 1);
		}
	
		_copyrightNotice = '&copy; 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.';

		_prefix = ListDeleteAt(CGI.SCRIPT_NAME, ListLen(CGI.SCRIPT_NAME, '/'), '/');
		Request._cfm_path = _prefix & "/ajax/";
		Request.cfm_gateway_process_html = "#Request._cfm_path#AJAX_functions.cfm";
	</cfscript>
	
	<cfsavecontent variable="Request.documentHeadContent">
		<cfoutput>
			<title>AJAX Blog - #_copyrightNotice#</title>
			<link href="#Request._urlParentPrefix#/includes/style.css" rel="stylesheet" type="text/css"> 
		</cfoutput>
	</cfsavecontent>
	
	<cfparam name="URL.mode" type="string" default="">
	<cfparam name="URL.entry" type="string" default="">
	
	<cfscript>
		_site_menu_background_color = "##3081e4";
		_site_menu_text_color = "white";
		
		if ( (URL.mode IS 'BLOGNAME') AND (Len(URL.entry) gt 0) ) {
			errorMsg = '';
			bool_isError = false;
			try {
				application.blog = application.blog.init(URL.entry);
			} catch (Any e) {
				bool_isError = true;
				errorMsg = explainError(e, false);
			}
			if (NOT bool_isError) {
				Session.persistData.blogname = URL.entry;
				Request.commonCode.commitSessionToDb();
			}
		}
	</cfscript>

	<cfcatch type="Any">
		<cfdump var="#cfcatch#" label="CF Error in (#CGI.SCRIPT_NAME#)" expand="No">
	</cfcatch>
</cftry>
		
<cfif 0>
	<cfdump var="#CGI#" label="CGI Scope" expand="No">
</cfif>

