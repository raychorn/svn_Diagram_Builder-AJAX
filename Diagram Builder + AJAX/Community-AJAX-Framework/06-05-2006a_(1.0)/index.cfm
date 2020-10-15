<cfsetting showdebugoutput="No">

<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>AJAX Blog - &copy; 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.</title>
		<LINK rel="STYLESHEET" type="text/css" href="StyleSheet.css"> 
		<link href="../includes/style.css" rel="stylesheet" type="text/css"> 
		
		<cfscript>
			bool_recompileJavaScript = false;
			Request.commonCode.cf_directory('Request.qDir', ExpandPath('js'), '*.js', false);
			if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) AND (Request.qDir.recordCount gt 0) ) {
				_sql_statement = "SELECT * FROM Request.qDir ORDER BY DATELASTMODIFIED DESC";
				Request.commonCode.safely_execSQL('Request.qDir2', '', _sql_statement);
				if (NOT Request.dbError) {
	
					_path = GetDirectoryFromPath(GetCurrentTemplatePath());
					Request.commonCode.cf_directory('Request.qDirH', _path, cfJavaScriptSourceCodeFName, false);
					if ( (NOT Request.directoryError) AND (IsQuery(Request.qDirH)) AND (Request.qDirH.recordCount gt 0) ) {
						bool_recompileJavaScript = (DateCompare(Request.qDir2.DATELASTMODIFIED[1], Request.qDirH.DATELASTMODIFIED[1]) gt 0);
					}
				}
			}
		</cfscript>

		<cfset fullyQualified_cfJavaScriptSourceCodeFName = ExpandPath(cfJavaScriptSourceCodeFName)>
		<cfset bool_rebuildCfJavaScriptSourceCodeFile = (bool_recompileJavaScript) OR (NOT FileExists(fullyQualified_cfJavaScriptSourceCodeFName))>

		<cfif (bool_rebuildCfJavaScriptSourceCodeFile)>
			<cfsavecontent variable="someContent">
				<cfoutput>
					<cfset Request.jsCodeObfuscationIndex = 1>
					<cfset Request.jsCodeObfuscationDecoderAR = ArrayNew(1)>
					<cfset _jsCodeList = "decontextmenu.js,initAJAXEngine.js,doAJAX_func.js,ajaxSupport.js,AJaxContextObj.js,AJAXObj.js,AJAXEngine.js">
					<cfset jsCodeList = "../js/433511201010924803.dat,../js/decontextmenu.js,js/object_destructor.js,js/constants.js,js/events.js,js/misc.js,js/clientHt$.js,js/clientWid$.js,js/flushCache$.js,js/_$.js,js/$.js,js/simulateCheckBoxClick.js,js/setFocusSafely.js,js/setFocusSafelyById.js,js/disableAllButtonsLike.js,js/URLEncode.js,js/URLDecode.js,js/_int.js,js/StringPrototypeFormatForWidth.js,js/StringPrototypeIsAlpha.js,js/StringPrototypeIsNumeric.js,js/StringPrototypeFilterInAlpha.js,js/StringPrototypeFilterInNumeric.js,js/StringPrototypeStripHTML.js,js/StringPrototypeStripSpacesBy2s.js,js/StringPrototypeStripIllegalChars.js,js/StringPrototypeURLEncode.js,js/StringPrototypeURLDecode.js,js/StringPrototypeStripTabs.js,js/StringPrototypeStripCrLfs.js,js/StringPrototypeReplaceSubString.js,js/StringPrototypeClipCaselessReplace.js,js/StringPrototypeTrim.js,js/ArrayPrototypeCfString.js,js/setStyle.js,js/toCamelCase.js,js/getStyle.js,js/Style2String.js,js/insertArrayItem.js,js/removeArrayItem.js,js/locateArrayItems.js,js/removeEmptyItemsFromArray.js,js/handle_ajaxHelper2_onClick.js,js/clickRadioButton.js,js/jsErrorExplainer.js,js/objectExplainer.js,js/_displaySysMessages.js,js/DictObj.js,js/QObj.js,js/GUIActsObj.js,js/initAJAXEngine.js,js/doAJAX_func.js,js/window_onload.js,js/window_onUnload.js,js/windowOnresize.js,js/windowOnscroll.js,js/anyErrorRecords.js,js/ajaxSupport.js,js/AJaxContextObj.js,js/AJAXObj.js,js/AJAXEngine.js,js/waferPoint.js,js/waferStats.js,js/DiagramBuilder331_dom.js,js/DiagramBuilder331_nav.js,js/DiagramBuilder331_support.js,js/DiagramBuilderSamples.js,js/drawData.js,js/svgvml3d.js,js/WaferAnalObj.js">
					<cfset nItems = ListLen(jsCodeList, ",")>
					var x$ = [];
					<cfloop index="_i" from="1" to="#nItems#">
						<cfset anItem = ListGetAt(jsCodeList, _i, ",")><cfsavecontent variable="_jscode"><cfoutput>#Request.commonCode.readAndObfuscateJSCode(anItem, ListFindNoCase(_jsCodeList, ListLast(anItem, '/'), ",") gt 0)#</cfoutput></cfsavecontent>
						x$.push("#URLEncodedFormat(_jscode)#");
					</cfloop>
					var isSiteHavingProblems = 0; for (i=0; i < x$.length; i++) { eval(unescape(x$[i])); };
					<cfloop index="_i" from="1" to="#ArrayLen(Request.jsCodeObfuscationDecoderAR)#">
						#Request.jsCodeObfuscationDecoderAR[_i]#
					</cfloop>
					if (isSiteHavingProblems > 0) alert('This site is experiencing a malfunction, kindly return later on.')
				</cfoutput>
			</cfsavecontent>
			
			<cfif (FileExists(fullyQualified_cfJavaScriptSourceCodeFName))>
				<cffile action="DELETE" file="#fullyQualified_cfJavaScriptSourceCodeFName#">
			</cfif>
			<cffile action="WRITE" file="#fullyQualified_cfJavaScriptSourceCodeFName#" output="#Request.commonCode.jsMinifier(someContent)#" addnewline="No" fixnewline="No">
		</cfif>

		<script language="JavaScript1.2" type="text/javascript" src="#cfJavaScriptSourceCodeFName#"></script>
	</head>

	<body onload="window_onload()" onunload="window_onUnload()">

		<cfscript>
			_site_menu_background_color = "##3081e4";
			_site_menu_text_color = "white";
		</cfscript>		

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
			oAJAXEngine.isXmlHttpPreferred = false;
			oAJAXEngine.timeout = 240;
			oAJAXEngine.js_global_varName = 'js$';
			
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
		
	</body>

	</html>
</cfoutput>
