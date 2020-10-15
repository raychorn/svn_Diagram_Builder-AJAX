<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">

	<cfset bool_sessionLoggedin = ( (IsDefined("session.persistData.loggedin")) AND (session.persistData.loggedin) AND (IsDefined("Session.persistdata.QAUTHUSER")) AND (IsQuery(Session.persistdata.QAUTHUSER)) )>

	<cfoutput>
		
<cfif (1)>
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
		<cfif (NOT bool_sessionLoggedin)>
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
										<cfif (NOT bool_sessionLoggedin)>
											<cfset _url = Request.commonCode._clusterizeURLForSessionOnly(Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#') & '/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/login.cfm')>
											<button name="btn_loginButton" id="btn_loginButton" type="button" class="loginButtonClass" onclick="this.disabled = true; performOpenLoginRegisterWindow(this.id, '#_url#'); return false;">Login</button>
										<cfelse>
											<cfset _usersFullName = Request.commonCode.loggedInUsersFullName()>
											<span class="normalPrompt"><NOBR>Welcome back <u>#_usersFullName#</u>.</NOBR>&nbsp;</span>
											<button name="btn_logoffButton" id="btn_logoffButton" type="button" class="loginButtonClass" onkeydown="if (event.keyCode == 13) { return true; };" onclick="this.disabled = true; performUserLogoffAction(); return false;">Logoff</button>
											<span class="normalPrompt">&nbsp;<NOBR>Kindly Logoff if you are not <u>#_usersFullName#</u>.</NOBR></span>
										</cfif>
									</td>
		<cfif (NOT bool_sessionLoggedin)>
									<td>
										&nbsp;|&nbsp;
										<cfset _url = Request.commonCode._clusterizeURLForSessionOnly(Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#') & '/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/login.cfm') & '&mode=forgotPassword'>
										<button name="btn_forgotPasswordButton" id="btn_forgotPasswordButton" type="button" class="forgotPasswordButtonClass" onclick="this.disabled = true; performOpenLoginRegisterWindow(this.id, '#_url#'); return false;">Forgot Password</button>
									</td>
		</cfif>
		<cfif (bool_sessionLoggedin)>
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
</cfif>
</cfoutput>

