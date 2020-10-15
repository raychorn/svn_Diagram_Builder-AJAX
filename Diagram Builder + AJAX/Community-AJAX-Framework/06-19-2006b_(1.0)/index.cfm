<cfsetting showdebugoutput="No">

<cfscript>
	_urlPrefix = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/' & ListDeleteAt(CGI.SCRIPT_NAME, ListLen(CGI.SCRIPT_NAME, '/'), '/') & '/');
	if (Right(_urlPrefix, 1) eq '/') {
		_urlPrefix = Left(_urlPrefix, Len(_urlPrefix) - 1);
	}
</cfscript>

<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<LINK rel="STYLESHEET" type="text/css" href="#_urlPrefix#/StyleSheet.css"> 
		<cfif (IsDefined("Request.documentHeadContent"))>#Request.documentHeadContent#</cfif>
		
		<cfset debugJavaScriptPackager = true>
		<cfscript>
			jsCodeList = '../js/433511201010924803.dat';
			jsCodeAR = ListToArray(jsCodeList, ',');
			jsExpandedPath = ExpandPath('js');
			
			bool_recompileJavaScript = false;
			if (debugJavaScriptPackager) writeOutput('jsExpandedPath = [#jsExpandedPath#], DirectoryExists(jsExpandedPath) = [#DirectoryExists(jsExpandedPath)#]<br>');
			if (DirectoryExists(jsExpandedPath)) {
				Request.commonCode.cf_directory('Request.qDir', jsExpandedPath, '*.js', true);
				if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) AND (Request.qDir.recordCount gt 0) ) {
					_sql_statement = "SELECT * FROM Request.qDir WHERE (TYPE = 'File') AND (SIZE > 0) ORDER BY DATELASTMODIFIED DESC";
					Request.commonCode.safely_execSQL('Request.qDir2', '', _sql_statement);
					if (NOT Request.dbError) {
		
						_path = GetDirectoryFromPath(GetCurrentTemplatePath());
						Request.commonCode.cf_directory('Request.qDirH', _path, cfJavaScriptSourceCodeFName, false);
						if ( (NOT Request.directoryError) AND (IsQuery(Request.qDirH)) AND (Request.qDirH.recordCount gt 0) ) {
							bool_recompileJavaScript = (DateCompare(Request.qDir2.DATELASTMODIFIED[1], Request.qDirH.DATELASTMODIFIED[1]) gt 0);
						}
					}

					if (debugJavaScriptPackager) writeOutput('bool_recompileJavaScript = [#bool_recompileJavaScript#]<br>');
					
					_sql_statement = "SELECT * FROM Request.qDir2 WHERE (TYPE = 'File') AND (SIZE > 0) ORDER BY NAME, DIRECTORY";
					Request.commonCode.safely_execSQL('Request.qDir3', '', _sql_statement);
					if (NOT Request.dbError) {
						fPath = GetCurrentTemplatePath();
						pName = ListDeleteAt(fPath, ListLen(fPath, '\'), '\') & '\';
						for (i = 1; i lte Request.qDir3.recordCount; i = i + 1) {
							aFolderName = Replace(ReplaceNoCase(Request.qDir3.DIRECTORY[i], pName, ''), '\', '/', 'all');
							if (debugJavaScriptPackager) writeOutput(aFolderName & "/" & TRIM(Request.qDir3.NAME[i]) & '<br>');
							jsCodeAR[ArrayLen(jsCodeAR) + 1] = aFolderName & "/" & TRIM(Request.qDir3.NAME[i]);
						}
					}
				}
			}
		</cfscript>
		
		<cfif (debugJavaScriptPackager)>
			<cfdump var="#jsCodeAR#" label="jsCodeAR" expand="No">
		</cfif>

		<cfset fullyQualified_cfJavaScriptSourceCodeFName = ExpandPath(cfJavaScriptSourceCodeFName)>
		<cfset bool_rebuildCfJavaScriptSourceCodeFile = (bool_recompileJavaScript) OR (NOT FileExists(fullyQualified_cfJavaScriptSourceCodeFName))>

		<cfif (bool_rebuildCfJavaScriptSourceCodeFile)>
			<cfset xxAR = ArrayNew(1)>
			<cfsavecontent variable="someContent">
				<cfoutput>
					<cfset Request.jsCodeObfuscationIndex = 1>
					<cfset Request.jsCodeObfuscationDecoderAR = ArrayNew(1)>
					<cfset _jsCodeList = "decontextmenu.js,initAJAXEngine.js,doAJAX_func.js,ajaxSupport.js,AJaxContextObj.js,AJAXObj.js,AJAXEngine.js">
					<cfset nItems = ArrayLen(jsCodeAR)>
					<cfloop index="_i" from="1" to="#nItems#">
						<cfscript>
							anItem = jsCodeAR[_i];
							_listLast = ListLast(ListLast(anItem, '/'), '_');
							boolFlag = (ListFindNoCase(_jsCodeList, _listLast, ",") gt 0);
							boolFlag = false;
						</cfscript>
						<cfsavecontent variable="_jscode"><cfoutput>#Trim(Request.commonCode.readAndObfuscateJSCode(anItem, boolFlag))#</cfoutput></cfsavecontent>
						<cfif (debugJavaScriptPackager)>
							<cfset xxAR[ArrayLen(xxAR) + 1] = "boolFlag = [#boolFlag#], anItem = [#anItem#], _listLast = [#_listLast#], [#_jscode#]">
						</cfif>
						#_jscode#
					</cfloop>
					<cfloop index="_i" from="1" to="#ArrayLen(Request.jsCodeObfuscationDecoderAR)#">
						<cfif (Len(Trim(Request.jsCodeObfuscationDecoderAR[_i])) gt 0)>#Request.jsCodeObfuscationDecoderAR[_i]#</cfif>
					</cfloop>
				</cfoutput>
			</cfsavecontent>

			<cfif (debugJavaScriptPackager)>
				<cfdump var="#xxAR#" label="xxAR" expand="No">
				<cfdump var="#Request.jsCodeObfuscationDecoderAR#" label="Request.jsCodeObfuscationDecoderAR" expand="No">
				<cfif 0>
					<textarea readonly rows="15" class="textClass" cols="120">#someContent#</textarea>
				</cfif>
			</cfif>			
			
			<cfif (FileExists(fullyQualified_cfJavaScriptSourceCodeFName))>
				<cffile action="DELETE" file="#fullyQualified_cfJavaScriptSourceCodeFName#">
			</cfif>
			<cffile action="WRITE" file="#fullyQualified_cfJavaScriptSourceCodeFName#" output="#Request.commonCode.jsMinifier(someContent)#" addnewline="No" fixnewline="No">
		</cfif>

		<script language="JavaScript1.2" type="text/javascript" src="#_urlPrefix#/#cfJavaScriptSourceCodeFName#"></script>
	</head>

	<body onload="window_onload()" onunload="window_onUnload()">
<cfif (NOT debugJavaScriptPackager)>
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

			oAJAXEngine.hideFrameCallback = function () { var dObj = $('div_articleContent'); if (!!dObj) { dObj.style.display = const_inline_style; }; };
			oAJAXEngine.showFrameCallback = function () { var dObj = $('div_articleContent'); if (!!dObj) { dObj.style.display = const_none_style; }; };
			
			oAJAXEngine.createAJAXEngineCallback = function () { this.top = '100px'; /* this.setDebugMode(); alert('isDebugMode() = [' + this.isDebugMode() + ']'); */ };
			
			var global_echo_AJAX_commands = false;
			
			var js_URL_mode = '#URL.mode#';
			var js_URL_entry = '#URL.entry#';
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
		
		<cfif (FileExists(ExpandPath("AJAXApp/index.cfm")))>
			<cfinclude template="AJAXApp/index.cfm">
		</cfif>

		<div id="#Request.cf_div_floating_debug_menu#" style="display: inline;">
			<table width="*" bgcolor="##80FFFF" border="1" cellpadding="-1" cellspacing="-1">
				<tr>
					<td align="left" style="display: inline;">
						<table width="100%" cellpadding="-1" cellspacing="-1">
							<tr>
	<cfif (Request.commonCode.isServerLocal())>
								<td align="left">
									<span class="onholdStatusBoldClass">AJAX:</span>&nbsp;<button name="btn_helperPanel" id="btn_helperPanel" class="buttonMenuClass" title="Click this button to open the AJAX Debug Panel" onclick="var cObj = $('td_ajaxHelperPanel'); var bObj = $('btn_helperPanel'); var tbObj = $('table_ajaxHelperPanel'); if ( (!!cObj) && (!!bObj) && (!!tbObj) ) { cObj.style.display = ((cObj.style.display == const_none_style) ? const_inline_style : const_none_style); bObj.value = ((cObj.style.display == const_inline_style) ? '[<<]' : '[>>]'); if (cObj.style.display == const_inline_style) { tbObj.style.width = _global_clientWidth; repositionBasedOnFloatingDebugPanel(tbObj); oAJAXEngine.setDebugMode(); } else { oAJAXEngine.setReleaseMode(); }; }; return false;">[>>]</button>&nbsp;
								</td>
								<td align="left">
									<span class="onholdStatusBoldClass">Scopes:</span>&nbsp;<button name="btn_helperPanel2" id="btn_helperPanel2" class="buttonMenuClass" title="Click this button to open the Scopes Debug Panel" onclick="handle_ajaxHelper2_onClick(); return false;">[>>]</button>
								</td>
	</cfif>
	<cfif 0>
								<td>
									<input id="radioBtn_allowArticleBrowserScroll" name="controlArticleBrowserScroll" type="radio" onclick="performAllowArticleBrowserScroll(false); return true;">&nbsp;<span class="normalSmallStatusBoldClass">Articles Scroll</span>
									&nbsp;|&nbsp;
									<input id="radioBtn_disallowArticleBrowserScroll" name="controlArticleBrowserScroll" type="radio" checked onclick="performAllowArticleBrowserScroll(true); return true;">&nbsp;<span class="normalSmallStatusBoldClass">Articles No-Scroll</span>
								</td>
			</cfif>
			<cfif (1)>
				<cfif (NOT Request.bool_sessionLoggedin)>
									<td>
				<cfif (Request.commonCode.isServerLocal())>
										&nbsp;|&nbsp;
				</cfif>
										<cfset _url = Request.commonCode._clusterizeURLForSessionOnly(Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#') & '/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/register.cfm')>
										<cfif 0>
											<cfset _urlImg = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#') & '/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/images/registerButton88x25.gif'>
											<button name="btn_registerButton" id="btn_registerButton" type="button" class="registerButtonClass3" onclick="this.disabled = true; var oTD = _$('td_loginRegisterFrame'); var oFrame = _$('iframe_loginRegisterFrame'); if ( (!!oTD) && (!!oFrame) ) {  oTD.style.display = const_inline_style; oFrame.src = '#_url#'; }; return false;"><img src="#_urlImg#" height="20" border="0"></button>
										<cfelse>
											<button name="btn_registerButton" id="btn_registerButton" type="button" class="registerButtonClass" onclick="this.disabled = true; performOpenLoginRegisterWindow(this.id, '#_url#'); return false;">Register</button>
										</cfif>
									</td>
				</cfif>
									<td>
										&nbsp;|&nbsp;
										<cfif (NOT Request.bool_sessionLoggedin)>
											<cfset _url = Request.commonCode._clusterizeURLForSessionOnly(Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#') & '/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/login.cfm')>
											<button name="btn_loginButton" id="btn_loginButton" type="button" class="loginButtonClass" onclick="this.disabled = true; performOpenLoginRegisterWindow(this.id, '#_url#'); return false;">Login</button>
										<cfelse>
											<cfset _usersFullName = Request.commonCode.loggedInUsersFullName()>
											<span class="normalPrompt"><NOBR>Welcome back <u>#_usersFullName#</u>.</NOBR>&nbsp;</span>
											<button name="btn_logoffButton" id="btn_logoffButton" type="button" class="loginButtonClass" onkeydown="if (event.keyCode == 13) { return true; };" onclick="this.disabled = true; performUserLogoffAction(); return false;">Logoff</button>
											<span class="normalPrompt">&nbsp;<NOBR>Kindly Logoff if you are not <u>#_usersFullName#</u>.</NOBR></span>
										</cfif>
									</td>
				<cfif (NOT Request.bool_sessionLoggedin)>
									<td>
										&nbsp;|&nbsp;
										<cfset _url = Request.commonCode._clusterizeURLForSessionOnly(Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#') & '/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/login.cfm') & '&mode=forgotPassword'>
										<button name="btn_forgotPasswordButton" id="btn_forgotPasswordButton" type="button" class="forgotPasswordButtonClass" onclick="this.disabled = true; performOpenLoginRegisterWindow(this.id, '#_url#'); return false;">Forgot Password</button>
									</td>
				</cfif>
				<cfif (Request.bool_sessionLoggedin)>
									<td>
										&nbsp;|&nbsp;
										<cfset _url = Request.commonCode._clusterizeURLForSessionOnly(Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#') & '/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/premium.cfm')>
										<button name="btn_purchasePremiumButton" id="btn_purchasePremiumButton" type="button" <cfif NOT (Session.persistData.blogname is 'default')>style="display: none;"</cfif> class="premiumButtonClass" onclick="this.disabled = true; performOpenLoginRegisterWindow(this.id, '#_url#'); return false;">Premium Account</button>
									</td>
				</cfif>
			</cfif>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td id="td_loginRegisterFrame" align="left" style="display: none;">
						<table width="100%" cellpadding="-1" cellspacing="-1">
							<tr>
								<td valign="top" align="right">
									<button id="btn_closeLoginRegisterFrame" class="buttonClass" onclick="this.disabled = true; performCloseLoginRegisterWindow(); return false;">[X]</button>
								</td>
							</tr>
							<tr>
								<td valign="top" align="left">
									<iframe id="iframe_loginRegisterFrame" frameborder="1" width="700" height="320" scrolling="Auto"></iframe>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
				
		<table id="table_menuHelperPanel" width="100%" bgcolor="##80FFFF" border="1" cellpadding="-1" cellspacing="-1">
			<tr>
				<td id="td_menuHelperPanel" style="display: none;" align="left" valign="top">
					<textarea id="ta_menuHelperPanel" readonly rows="5" cols="175" class="textClass"></textarea>
				</td>
			</tr>
		</table>
				
		<table width="100%" cellpadding="-1" cellspacing="-1">
			<tr>
				<td align="center" id="td_ajaxHelperPanel" style="display: none;">
					<table width="100%" bgcolor="##80FFFF" border="1" bordercolor="silver" cellspacing="-1" cellpadding="-1" id="table_ajaxHelperPanel" style="width: 800px;">
						<tr>
							<td>
								<table width="100%" cellpadding="-1" cellspacing="-1">
									<tr>
										<td align="center">
											<button name="btn_useDebugMode" id="btn_useDebugMode" class="buttonMenuClass" onclick="var s = this.value; if (s.toUpperCase().indexOf('DEBUG') != -1) { oAJAXEngine.setReleaseMode(); this.value = this.value.clipCaselessReplace('Debug', 'Release'); } else { oAJAXEngine.setDebugMode(); this.value = this.value.clipCaselessReplace('Release', 'Debug'); }; return false;">[Debug Mode]</button>
										</td>
										<td align="center">
											<button name="btn_useXmlHttpRequest" id="btn_useXmlHttpRequest" class="buttonMenuClass" onclick="var s = this.value; if (s.toUpperCase().indexOf('XMLHTTPREQUEST') == -1) { oAJAXEngine.isXmlHttpPreferred = false; this.value = this.value.clipCaselessReplace('iFRAME', 'XmlHttpRequest'); } else { oAJAXEngine.isXmlHttpPreferred = true; this.value = this.value.clipCaselessReplace('XMLHTTPREQUEST', 'iFRAME'); }; return false;">[Use iFrame]</button>
										</td>
										<td align="center">
											<button name="btn_useMethodGetOrPost" id="btn_useMethodGetOrPost" class="buttonMenuClass" onclick="var s = this.value; if (s.toUpperCase().indexOf('GET') != -1) { oAJAXEngine.setMethodGet(); this.value = this.value.clipCaselessReplace('GET', 'Post'); } else { oAJAXEngine.setMethodPost(); this.value = this.value.clipCaselessReplace('POST', 'Get'); }; return false;">[Use Get]</button>
										</td>
										<td align="center">
											<button name="btn_hideShow_iFrame" id="btn_hideShow_iFrame" class="buttonMenuClass" onclick="var s = this.value; if (s.toUpperCase().indexOf('SHOW') != -1) { oAJAXEngine.showFrame(); this.value = this.value.clipCaselessReplace('show', 'Hide'); } else { oAJAXEngine.hideFrame(); this.value = this.value.clipCaselessReplace('hide', 'Show'); }; return false;">[Show iFrame]</button>
										</td>
										<td align="center">
											<input type="checkbox" id="cb_debugPanel_toggle_AJAX_echo" onclick="global_echo_AJAX_commands = ((global_echo_AJAX_commands) ? false : true); return true;">&nbsp;<a href="" onclick="simulateCheckBoxClick('cb_debugPanel_toggle_AJAX_echo'); return false;"><span class="textClass">Echo AJAX Commands</span></a>
										</td>
										<td align="center">
											<button name="btn_1" id="btn_1" class="buttonMenuClass" onclick="doAJAX_func('getTopLevelMenuNames'); return false;">[Test]</button>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
				
		<cfif (Request.commonCode.isServerLocal())>
			<cfsavecontent variable="content_application_debug_panel">
				<cfoutput>
					#Request.commonCode.scopesDebugPanelContentLayout()#
				</cfoutput>
			</cfsavecontent>		
			
			<table id="table_ajaxHelperPanel2" style="width: 800px;" cellpadding="-1" cellspacing="-1">
				<tr>
					<td id="td_ajaxHelperPanel2" align="center" style="display: none;">
						<table border="1" cellspacing="-1" cellpadding="-1">
							<tr>
								<td align="center">
									#content_application_debug_panel#
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</cfif>
		
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

		<cfinclude template="cfinclude_index_body.cfm">
		
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
		
</cfif>
	</body>

	</html>
</cfoutput>
