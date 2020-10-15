<cfsetting showdebugoutput="No">

<cfscript>
	_urlPrefix = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/' & ListDeleteAt(CGI.SCRIPT_NAME, ListLen(CGI.SCRIPT_NAME, '/'), '/') & '/');
	if (Right(_urlPrefix, 1) eq '/') {
		_urlPrefix = Left(_urlPrefix, Len(_urlPrefix) - 1);
	}
	_urlParentPrefix = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/');
	if (Right(_urlParentPrefix, 1) eq '/') {
		_urlParentPrefix = Left(_urlParentPrefix, Len(_urlParentPrefix) - 1);
	}
</cfscript>

<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>ezAJAX(tm) &copy; 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.</title>
		<LINK rel="STYLESHEET" type="text/css" href="#_urlPrefix#/StyleSheet.css"> 
		<link href="#_urlParentPrefix#/includes/style.css" rel="stylesheet" type="text/css"> 

		<script language="JavaScript1.2" type="text/javascript" src="#_urlPrefix#/#cfJavaScriptSourceCodeFName#"></script>
	</head>
	
	<body style="background-color: white; margin: -10px -10px -10px -10px;">
	
		<b>ezAJAX Product Content goes here...</b>
	
		<script language="JavaScript1.2" type="text/javascript">
		<!--//
			var global_htmlStream = '';
			
			var const_cf_html_container_symbol = '#Request.cf_html_container_symbol#';
			var const_loading_data_message_symbol = '<span class="ajaxLoadingStatusClass"><NOBR>&nbsp;Server Busy !</NOBR></span>';
			var const_system_ready_message_symbol = '<span class="normalStatusClass">&nbsp;Ready !</span>';
			var const_jsapi_loading_image = '#Request.const_jsapi_loading_image#';
			var const_busy_loading_image = '#Request.const_busy_loading_image#';
			var const_system_busy_message_symbol = '<span class="ajaxLoadingStatusClass"><NOBR>&nbsp;Busy !</NOBR></span>';
			
			var cf_AUTH_USER = '#Request.AUTH_USER#';

			var cf_Session_ID = '';
			<cfif (IsDefined("Session.sessid"))>cf_Session_ID = '#Session.sessid#';</cfif>
			
			var const_div_floating_debug_menu = '#Request.cf_div_floating_debug_menu#';

			var const_paper_color_light_yellow = '#Request.const_paper_color_light_yellow#';
			var const_color_light_blue = '#Request.const_color_light_blue#';

			var const_add_button_symbol = '[+]';
			var const_edit_button_symbol = '[*]';
			var const_delete_button_symbol = '[-]';
			
			var const_jsapi_width_value = 200;

			var global_allow_loading_data_message = false;

			var url_sBasePath = 'http' + (('#CGI.SERVER_PORT#' == '443') ? 's' : '') + ':\/\/#CGI.HTTP_HOST#';

			url_sBasePath += '#Request.cfm_gateway_process_html#';
			
		//	alert('url_sBasePath = [' + url_sBasePath + ']');
			
			// create the gateway object
			var oAJAXEngine = AJAXEngine.get$(url_sBasePath, false);
			oAJAXEngine.setMethodGet();
			oAJAXEngine.setReleaseMode(); // this overrides the oAJAXEngine.set_isServerLocal() setting...
			oAJAXEngine.isXmlHttpPreferred = ((window.location.href.toUpperCase().indexOf('LAPTOP.HALSMALLTALKER.COM') > -1) ? false : true);
			oAJAXEngine.timeout = 120;
			oAJAXEngine.js_global_varName = 'js$';

			oAJAXEngine.hideFrameCallback = function () { };
			oAJAXEngine.showFrameCallback = function () { };
			
			oAJAXEngine.createAJAXEngineCallback = function () { this.top = '100px'; /* this.setDebugMode(); alert('isDebugMode() = [' + this.isDebugMode() + ']'); */ };
			
			var global_echo_AJAX_commands = false;
		//-->
		</script>

		<script language="JavaScript1.2" type="text/javascript">
		<!--
		// place this on the page where you want the gateway to appear
			oAJAXEngine.create();
		//-->
		</script>

		<script language="JavaScript1.2" type="text/javascript">
		<!--
			document.write('<div id="html_container" style="display: inline; position: absolute; top: 0px; left: ' + (clientWid$() - const_jsapi_width_value) + 'px">');
			document.write('</div>');
		// -->
		</script>
		
		<cfinclude template="debugContent.cfm">
		
		<div id="div_activityBalloon" style="display: none;">
			<table width="*" border="1" cellspacing="-1" cellpadding="-1" bgcolor="##FFFF80">
				<tr>
					<td>
						<table width="*" cellspacing="-1" cellpadding="-1">
							<tr>
								<td colspan="2">
									<span id="span_activityBalloon_body" class="textClass"></span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>

		<div id="div_sysMessages" style="display: none;">
			<table width="*" border="1" cellspacing="-1" cellpadding="-1" bgcolor="##FFFF80">
				<tr>
					<td>
						<table width="*" cellspacing="-1" cellpadding="-1">
							<tr id="div_sysMessages_titleBar_tr" bgcolor="silver">
								<td align="center">
									<span id="span_sysMessages_title" class="boldPromptTextClass"></span>
								</td>
								<td align="right">
									<button class="buttonClass" title="Click this button to dismiss this pop-up." onclick="dismissSysMessages(); return false;">[X]</button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span id="span_sysMessages_body" class="textClass"></span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>

		<cfinclude template="../includes/cfinclude_invalidEmailDomains.cfm">

		<script language="JavaScript1.2" type="text/javascript">
		<!--
		// -->
		</script>
		
		<script language="JavaScript1.2" type="text/javascript">
		<!--
			oAJAXEngine.hideFrame();
			var cObj = $('btn_hideShow_iFrame');
			if (!!cObj) {
				if (oAJAXEngine.visibility == 'visible') {
					cObj.value = cObj.value.clipCaselessReplace('show', 'Hide');
				}
			}

			var cObj = $('btn_useXmlHttpRequest');
			if (!!cObj) {
				if (oAJAXEngine.isXmlHttpPreferred == false) {
					cObj.value = cObj.value.clipCaselessReplace('iFRAME', 'XmlHttpRequest');
				}
			}

			var cObj = $('btn_useMethodGetOrPost');
			if (!!cObj) {
				if (oAJAXEngine.isMethodGet()) {
					cObj.value = cObj.value.clipCaselessReplace('GET', 'Post');
				}
			}

			var cObj = $('btn_useDebugMode');
			if (!!cObj) {
				if (oAJAXEngine.isReleaseMode() == true) {
					cObj.value = cObj.value.clipCaselessReplace('Debug', 'Release');
				}
			}

			var cObj = $(const_cf_html_container_symbol);
			var dObj = $(const_div_floating_debug_menu);
			if ( (!!cObj) && (!!dObj) ) {
				if (dObj.style.display == const_none_style) {
					dObj.style.position = cObj.style.position;
					dObj.style.top = parseInt(cObj.style.top) + 25 + 'px';
					dObj.style.left = (clientWid$() - 75) + 'px';
					dObj.style.display = const_inline_style;
				}
			}

			var _msg = '#Request.RuntimeLicenseStatus#';
			if (_msg.length > 0) {
				_alertHTMLError(_msg);
			}
			
			window.onscroll();			
		// -->
		</script>

	</body>

</cfoutput>

</html>
