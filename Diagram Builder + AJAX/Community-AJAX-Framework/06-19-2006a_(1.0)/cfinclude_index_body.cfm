<cfoutput>
	<cfscript>
		cf_REMOTE_ADDR = CGI.REMOTE_ADDR;
		cf_SERVER_NAME = 'http:' & '/' & '/' & CGI.SERVER_NAME & '/' & CGI.SCRIPT_NAME;
		
		logoImage = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/includes/cfcontent_img.cfm?imageName=../images/Yes02b1a187x171.jpg');
		_urlWaferAnalysis = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/samples/semiconductors/wafer-analysis/index.cfm') & '?sessID=#Session.sessID#';

		_urlCommunityEditionLicenseAgreement = Request.commonCode.clusterizeURL('#_urlParentPrefix#/AJAX-Framework/ezAJAX(tm) Community Edition License Agreement.htm');

		ezAJAX_LogoImage = Request.commonCode.clusterizeURL('#_urlParentPrefix#/AJAX-Framework/ezAJAXLogo.cfm');

		ezAJAX_ProductContent = Request.commonCode.clusterizeURL('#_urlParentPrefix#/AJAX-Framework/ezAJAXProductContent.cfm');

		cf_maxEntries = 10;
		
		cf_blogBgColor = '##027FFF';
		cf_const_expandButtonFace = '&nbsp;&lt;&lt;&nbsp;';
		cf_const_contractButtonFace = '&nbsp;&gt;&gt;&nbsp;';
		
		cf_const_div_podContent = 'div_podContent';
		
		searchTitle = application.resourceBundle.getResource("search");
		noRecentEntries = application.resourceBundle.getResource("norecententries");
		recentEntries = application.resourceBundle.getResource("recententries");
		downloadsTitle = application.resourceBundle.getResource("downloads");
		calendarTitle = application.resourceBundle.getResource("calendar");
		archivesBySubjectTitle = application.resourceBundle.getResource("archivesbysubject");
		subscribeTitle = application.resourceBundle.getResource("subscribe");
		subscribeBlog = application.resourceBundle.getResource("subscribeblog");
		commentsText = application.resourceBundle.getResource("comments");
		trackedbyText = application.resourceBundle.getResource("trackedby");
		trackedonText = application.resourceBundle.getResource("trackedon");
		trackbackurlText = application.resourceBundle.getResource("trackbackurl");
		notrackbacksText = application.resourceBundle.getResource("notrackbacks");
		postedbyText = application.resourceBundle.getResource("postedby");
		postedatText = application.resourceBundle.getResource("postedat");
		nocommentsText = application.resourceBundle.getResource("nocomments");
		searchedforText = application.resourceBundle.getResource("searchedfor");
		mainText = application.resourceBundle.getResource("main");
		viewingByEntryText = application.resourceBundle.getResource("viewingbyentry");
		viewingbydayText = application.resourceBundle.getResource("viewingbyday");
		viewingbymonthText = application.resourceBundle.getResource("viewingbymonth");
		viewingbycategoryText = application.resourceBundle.getResource("viewingbycategory");
		printText = application.resourceBundle.getResource("print");
		
		bool_sessionLoggedin = ( (IsDefined("session.persistData.loggedin")) AND (session.persistData.loggedin) AND (IsDefined("Session.persistdata.QAUTHUSER")) AND (IsQuery(Session.persistdata.QAUTHUSER)) );
		cf_CodeDemoWaferAnalysis = "window.open('#_urlWaferAnalysis#','samples1','width=' + clientWid$() + ',height=' + clientHt$() + ',resizeable=yes,scrollbars=1')";
		if (bool_sessionLoggedin) {
			cfBool_sessionLoggedin = 1;
			cf_CodeWaferAnalysis = cf_CodeDemoWaferAnalysis;
		} else {
			cfBool_sessionLoggedin = 0;
			cf_CodeWaferAnalysis = "sampleAppsRequiresLoginBlock()";
		}
		cfBool_isUserAdmin = Request.commonCode.isUserAdmin();
		cfBool_isUserPremium = Request.commonCode.isUserPremium();
		cfBool_isUserNormalUser = Request.commonCode.isUserNormalUser();
		
		cf_currentBlogName = 'default';
		if (IsDefined("Session.persistData.blogname")) {
			cf_currentBlogName = Session.persistData.blogname;
		}
		
		cf_isColdFusionMX7 = application.isColdFusionMX7;

		cf_Session_sessid = -1;
		if (IsDefined("Session.sessid")) {
			cf_Session_sessid = Session.sessid;
		}
		if ( (cf_Session_sessid eq -1) AND (IsDefined("URL.sessid")) ) {
			cf_Session_sessid = URL.sessid;
		}

		cf_Session_sessionid = -1;
		if (IsDefined("Session.sessionid")) {
			cf_Session_sessionid = Session.sessionid;
		}

		printFlashPaperURL_template = Request.commonCode._clusterizeURLForSessionOnly(Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#') & '/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/print/') & '?media=flashpaper';
		printPdfURL_template = Request.commonCode._clusterizeURLForSessionOnly(Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#') & '/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/print/') & '?media=pdf';
	</cfscript>
	
<cfif 0>
	<cfdump var="#Session#" label="Session" expand="No">
	<cfdump var="#CGI#" label="CGI Scope" expand="No">
	<cfdump var="#URL#" label="URL Scope" expand="No">
</cfif>

	<script language="JavaScript1.2" type="text/javascript">
	<!--
		var js_salesEmailAddress = '#Request.salesEmailAddress#';
		
		var js_copyrightNotice = '#_copyrightNotice#';
		
		var js_urlParentPrefix = '#_urlParentPrefix#';
		
		var js_REMOTE_ADDR = '#cf_REMOTE_ADDR#';
		var js_SERVER_NAME = '#cf_SERVER_NAME#';
		
		var js_ezAJAX_LogoImage = '#ezAJAX_LogoImage#';
		
		var js_urlCommunityEditionLicenseAgreement = '#_urlCommunityEditionLicenseAgreement#';
		
		var js_isDebugMode = ( (js_REMOTE_ADDR.indexOf('192.168.1.') > -1) || (js_REMOTE_ADDR.indexOf('127.0.0.1') > -1) );
		
		var js_maxEntries = parseInt('#cf_maxEntries#');
		
		var jsSessID = '#cf_Session_sessid#';
		var jsSessionid = '#cf_Session_sessionid#';

		var jsBool_sessionLoggedin = ((#cfBool_sessionLoggedin#) ? true : false);
		
		var jsBool_isColdFusionMX7 = (('#cf_isColdFusionMX7#'.toUpperCase() == 'YES') ? true : false);
		
		var jsCurrentBlogName = '#cf_currentBlogName#';
		var jsBool_isCurrentBlogDefault = ((jsCurrentBlogName.toUpperCase() == 'DEFAULT') ? true : false);

		var jsBool_isUserAdmin = (('#cfBool_isUserAdmin#'.toUpperCase() == 'NO') ? false : true);
		var jsBool_isUserPremium = (('#cfBool_isUserPremium#'.toUpperCase() == 'NO') ? false : true);
		var jsBool_isUserNormalUser = (('#cfBool_isUserNormalUser#'.toUpperCase() == 'NO') ? false : true);

		var js_searchTitle = '#searchTitle#';
		var js_noRecentEntries = '#noRecentEntries#';
		var js_recentEntries = '#recentEntries#';
		var js_downloadsTitle = '#downloadsTitle#';
		var js_calendarTitle = '#calendarTitle#';
		var js_archivesBySubjectTitle = '#archivesBySubjectTitle#';
		var js_subscribeTitle = '#subscribeTitle#';
		var js_subscribeBlog = '#subscribeBlog#';
		var js_commentsText = '#commentsText#';
		var js_trackedbyText = '#trackedbyText#';
		var js_trackedonText = '#trackedonText#';
		var js_trackbackurlText = '#trackbackurlText#';
		var js_notrackbacksText = '#notrackbacksText#';
		var js_commentsText = '#commentsText#';
		var js_postedbyText = '#postedbyText#';
		var js_postedatText = '#postedatText#';
		var js_nocommentsText = '#nocommentsText#';
		var js_searchedforText = '#searchedforText#';
		var js_mainText = '#mainText#';
		var js_viewingByEntryText = '#viewingByEntryText#';
		var js_viewingbydayText = '#viewingbydayText#';
		var js_viewingbymonthText = '#viewingbymonthText#';
		var js_viewingbycategoryText = '#viewingbycategoryText#';
		var js_printText = '#printText#';
		
		var js_printFlashPaperURL_template = '#printFlashPaperURL_template#';
		var js_printPdfURL_template = '#printPdfURL_template#';
		
		var js_invalidEmailDomains = '#Request.invalidEmailDomains#';

		var jsCodeWaferAnalysis = "#cf_CodeWaferAnalysis#";
		var jsCodeDemoWaferAnalysis = "#cf_CodeDemoWaferAnalysis#";

		var js_ApplicationRootURL = '#application.rooturl#';
		
		var js_blogBgColor = '#cf_blogBgColor#';

		var js_trademarkSymbol = '&##8482';
		
		var js_const_expandButtonFace = '#cf_const_expandButtonFace#';
		var js_const_contractButtonFace = '#cf_const_contractButtonFace#';
		
		var js_const_div_podContent = '#cf_const_div_podContent#';

		var fqServerName = fullyQualifiedAppPrefix();
		
		var registerFormAlreadyPopulated = [];
		
		var bool_isKeywordSearch = false;
		var bool_isEntryMode = false;
		var bool_isByDayMode = false;
		var bool_isByMonthMode = false;
		var bool_isByCategoryMode = false;
		var bool_isByCategoryNameMode = false;
		
		var bool_isScrollLocked = true;
		
		function windowOnReSizeCallback(_width, _height) {
			var oObj = _$('table_outerContentWrapper');
			if (!!oObj) {
				oObj.width = _width;
			}
		}
	
		function performAllowArticleBrowserScroll(bool) {
			bool = ((bool == true) ? bool : false);
			bool_isScrollLocked = bool;
		}
		
		var extraLoginRegisterHeight = 0;
		
		function repositionArticleContent(bool) {
			var dObj = $('div_articleContent');
			bool = ((bool == true) ? bool : false);
			var oAnchorPosTop = AnchorPosition.get$('anchor_articleContentTop');
			if ( (!!dObj) && (!!oAnchorPosTop) ) {
				dObj.style.position = const_absolute_style;
				dObj.style.top = ((bool) ? oAnchorPosTop.y : (document.body.scrollTop + oAnchorPosTop.y + extraLoginRegisterHeight)) + 'px';
				dObj.style.left = 0 + 'px';
				if (!jsBool_isCurrentBlogDefault) {
					var oTD_articleContent = $('td_articleContent');
					var oTD_podContent = $('td_podContent');

					if ( (!!oTD_articleContent) && (!!oTD_podContent) ) {
						var acWidth = parseInt(oTD_articleContent.width);
						var pcWidth = parseInt(oTD_podContent.width);
						if ((acWidth + pcWidth) == 100) {
							dObj.style.width = ((clientWid$() * (acWidth / 100)) - 40) + 'px';
						}
					}
				} else {
					dObj.style.left = 20 + 'px';
				}
			}
			if (!!oAnchorPosTop) AnchorPosition.remove$(oAnchorPosTop.id);
		}
		
		function performOpenLoginRegisterWindow(id, hRef) {
			var oTD = _$('td_loginRegisterFrame'); 
			var oFrame = _$('iframe_loginRegisterFrame'); 
			var oBtn = _$(((id == 'btn_registerButton') ? 'btn_loginButton' : 'btn_registerButton'));
			var oBtn2 = _$(((id == 'btn_forgotPasswordButton') ? 'btn_loginButton' : 'btn_forgotPasswordButton'));
			var oBtn3 = _$(((id == 'btn_purchasePremiumButton') ? 'btn_loginButton' : 'btn_purchasePremiumButton'));
			if ( (!!oTD) && (!!oFrame) && (typeof hRef == const_string_symbol) && (!!oBtn) && (!!oBtn2) ) {
				oTD.style.display = const_inline_style;
				if ( (1) || (registerFormAlreadyPopulated[id] == null) || (registerFormAlreadyPopulated[id] == false) ) {
					var ch = ((hRef.indexOf('?') > -1) ? '&' : '?');
					hRef += ch + 'suppressDebug=1';
		//			hRef += ch + 'suppressDebug=0';
					oBtn.disabled = true;
					oBtn2.disabled = true;
					if (!!oBtn3) oBtn3.disabled = true;
					oFrame.src = hRef;
					registerFormAlreadyPopulated[id] = true;
				}
				extraLoginRegisterHeight += parseInt(oFrame.height) + 20;
				repositionArticleContent();
			}
		}

		function performCloseLoginRegisterWindow() {
			var oTD = _$('td_loginRegisterFrame'); 
			var oBtn = _$('btn_registerButton');
			var oBtn2 = _$('btn_loginButton');
			var oBtn3 = _$('btn_forgotPasswordButton');
			var oBtn4 = _$('btn_closeLoginRegisterFrame');
			var oBtn5 = _$('btn_purchasePremiumButton');
			var oFrame = _$('iframe_loginRegisterFrame'); 
			if ( (!!oTD) && (!!oFrame) && (!!oBtn) && (!!oBtn2) && (!!oBtn3) && (!!oBtn4) ) {
				oTD.style.display = const_none_style;
				extraLoginRegisterHeight -= parseInt(oFrame.height) + 20;
				repositionArticleContent();
				oBtn.disabled = false;
				oBtn2.disabled = false;
				oBtn3.disabled = false;
				oBtn4.disabled = false;
				if (!!oBtn5) oBtn5.disabled = false;
				repositionArticleContent(true);
			};
		}
		
		function windowOnscrollCallback(top, left) {
			var oTD = _$('td_loginRegisterFrame'); 
			var oAnchorPosTop = AnchorPosition.get$('anchor_articleContentTop');
			if ( (!!oTD) && (oTD.style.display == const_inline_style) ) {
				repositionArticleContent();
			}
			var dObj = $(const_div_floating_debug_menu);
			if ( (!!dObj) && (!!oAnchorPosTop) ) {
				if (jsBool_isCurrentBlogDefault) {
					dObj.style.top = document.body.scrollTop + ((bool_isScrollLocked) ? (oAnchorPosTop.y - 20) : 0) + 'px';
				} else {
					dObj.style.top = document.body.scrollTop + (oAnchorPosTop.y - 20) + 'px';
				}
				dObj.style.left = 0 + 'px';
			}
			if (!!oAnchorPosTop) AnchorPosition.remove$(oAnchorPosTop.id);
			var oDiv = _$('iframe_ezAJAX_LogoPod');
			if (!!oDiv) {
				oDiv.src = js_ezAJAX_LogoImage;
			}
		}

		function injectParmsFrom(d, aKey) {
			var _content = '';
			var _ar = d.getValueFor(aKey);
			if ( (!!_ar) && (typeof _ar == const_object_symbol) ) {
				for (var i = 0; i < _ar.length; i++) {
					if ( (!!_ar[i]) && (typeof _ar[i] == const_string_symbol) ) {
						var _ar2 = _ar[i].split(',');
						if ( (!!_ar2) && (typeof _ar2 == const_object_symbol) ) {
							for (var k = 0; k < _ar2.length; k++) {
								_content += ' ' + _ar2[k];
							}
						}
					}
				}
			}
			return _content;
		}

		function podLayoutHTML(contentHTML, title, podName, vararg_params) {
			var _html = '';
			var aDict = DictObj.get$();

			aDict.bool_returnArray = true;
		
			if (arguments.length > 1) {
			    for (var i = 1; i < arguments.length; i++) {
					aDict.fromSpec(arguments[i]);
				}
			}
			podName = ((!!podName) ? podName : 'undefined');

			_html += '<div id="div_podLayoutContainer_' + podName + '" style="width: 400px; overflow: auto;">';
			_html += '<table width="100%" cellpadding="-1" cellspacing="-1" style="border-left: thin solid Blue; border-right: thin solid Blue;">';
			_html += '<tr>';
			_html += ((!!title) ? '<td align="center" valign="top" class="menuTitle"><span class="menuTitle">' + title + '</span></td>' : '');
			_html += '</tr>';
			_html += '<tr>';
			_html += '<td ' + injectParmsFrom(aDict, 'td') + ' valign="middle">';
			_html += contentHTML;
			_html += '</td>';
			_html += '</tr>';
			_html += '</table>';
			_html += '</div>';

			return _html;
		}
		
		function logoPod() {
			var parms = '&td=' + 'align="center"'.URLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').URLEncode();
			var _html = podLayoutHTML('<img src="#logoImage#" width="187" height="171" border="0">', '', 'logoPod', parms);
			return _html;
		}
		
		function ezAJAX_LogoPod() {
			var parms = '&td=' + 'align="center"'.URLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').URLEncode();
			var html = '<iframe id="iframe_ezAJAX_LogoPod" frameborder="0" width="100%" height="200" scrolling="No" src="#ezAJAX_LogoImage#"></iframe>';
			var _html = podLayoutHTML(html, '', 'logoPod', parms);
			return _html;
		}
		
		function clearBlogArticlesContent() {
			var dObj = $('div_articleContent');
			if (!!dObj) {
				dObj.innerHTML = '';
			} else {
				alert('ERROR: Programming Error - Cannot find element named "div_articleContent".');
			}
		}

		function performGetArticleByEntry(id) {
			if (!!id) {
				doAJAX_func('performGetArticleByEntry', 'handleGetDefaultBlogArticles(' + oAJAXEngine.js_global_varName + ')', 'id', id);
			} else {
				alert('ERROR: Programming Error - Missing the id parm from performGetArticleByEntry().');
			}
		}
		
		function _performSearchPodAction(sKeyword) {
			if (!!sKeyword) {
				sKeyword = ((!!sKeyword) ? sKeyword : '');
				doAJAX_func('performSearchPodAction', 'handleGetDefaultBlogArticles(' + oAJAXEngine.js_global_varName + ')', 'keyword', sKeyword);
			} else {
				performDefaultBlogSearch();
			}
		}

		function performSearchPodAction(oObj) {
			var oBtn = _$('btn_searchBlog');
			if ( (!!oObj) && (!!oBtn) && (!!oObj.value) && (oObj.value.length > 0) ) {
				oObj.disabled = true;
				oBtn.disabled = true;
				_performSearchPodAction(oObj.value);
			}
		}
		
		function _performSubscribePodAction(sEmailAddress) {
			if (!!sEmailAddress) {
				sEmailAddress = ((!!sEmailAddress) ? sEmailAddress : '');
				doAJAX_func('performSubscribePodAction', 'handleSubmitRegisterForm(' + oAJAXEngine.js_global_varName + ')', 'emailAddress', sEmailAddress);
			}
		}

		function performSubscribePodAction(oObj) {
			var oBtn = _$('btn_subscribeToBlog');
			if ( (!!oObj) && (!!oBtn) && (!!oObj.value) && (oObj.value.length > 0) ) {
				oObj.disabled = true;
				oBtn.disabled = true;
				_performSubscribePodAction(oObj.value);
			}
		}

		function searchPod() {
			var _html = '';
			_html += '<p align="center">';
			_html += '<input type="text" id="input_searchPod_searchKeyword" name="search" size="40" maxlength="255" onkeydown="if (event.keyCode == 13) { performSearchPodAction(this); }; return true;">';
			_html += '&nbsp;';
			_html += '<button id="btn_searchBlog" class="buttonClass" onclick="var oObj = _$(\'input_searchPod_searchKeyword\'); performSearchPodAction(oObj); return false;">Search</button>';
			_html += '</p>';
			return podLayoutHTML(_html, ((jsBool_isCurrentBlogDefault) ? js_searchTitle : 'SEARCH PRODUCT DATABASE'), 'searchPod', '&td=' + 'align="center"'.URLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').URLEncode());
		}

		function subscribePod() {
			var _html = '';
			_html += js_subscribeBlog;
			_html += '<p align="center">';
			_html += '<input type="text" id="subscribe_user_name" name="email" size="40" maxlength="255" ' + ((jsBool_sessionLoggedin) ? '' : 'disabled title="You may only Subscribe to this Blog when you are a Registered User of this Blog and you have activated your User Account."') + ' onkeyup="if (!!_validateUserAccountName) { _validateUserAccountName($(\'subscribe_user_name\')); }; if (event.keyCode == 13) { performSubscribePodAction(this); };" onkeydown="var sRed = this.style.border; var iRed = sRed.indexOf(\' red\'); iRed = ((iRed == -1) ? sRed.indexOf(\'red \') : iRed); var boolRed = (iRed != -1); var bool = ( (event.keyCode != 13) || ( (event.keyCode == 13) && (boolRed == false) ) ); if ( (boolRed) && (event.keyCode == 13) ) { alert(this.title); }; return bool;">';
			_html += '&nbsp;';
			_html += '<button id="btn_subscribeToBlog" class="buttonClass" onclick="var oObj = _$(\'subscribe_user_name\'); performSubscribePodAction(oObj); return false;">Search</button>';
			_html += '</p>';
			_html += ((jsBool_sessionLoggedin) ? '' : '<span class="redBlogArticleAccessBoldPrompt">You may only Subscribe to this Blog when you are a Registered User of this Blog and you have activated your User Account.</span>');
			return podLayoutHTML(_html, js_subscribeTitle, 'subscribePod', '&td=' + 'align="center"'.URLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').URLEncode());
		}
		
		function recentArticlesPod(content) {
			return podLayoutHTML(content, js_recentEntries, 'recentArticlesPod');
		}

		function paypalPod() {
			var _html = '';
			_html += '<br><form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">';
			_html += '<input type="hidden" name="cmd" value="_s-xclick">';
			_html += '<input type="image" src="https://www.paypal.com/en_US/i/btn/x-click-but21.gif" border="0" name="submit" alt="Make payments with PayPal - it\'s fast, free and secure!">';
			_html += '<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">';
			_html += '<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----MIIHVwYJKoZIhvcNAQcEoIIHSDCCB0QCAQExggEwMIIBLAIBADCBlDCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20CAQAwDQYJKoZIhvcNAQEBBQAEgYBF/FHRK4ERpBG3ZATc9w1YuWD5iF2XU/SkVCYqXX9SZwsGZlVNQpP3kE3iG5Faplikr9VyAwXkpnEkqntC1XiNmphnZjmg7f0g7uAAfcbe5iHk3SJiP2S7V9KPqguTrtSk7KvVOwwcUhV6nYe/oBs5lsrjk8PN+9Wl5NgWym9AWTELMAkGBSsOAwIaBQAwgdQGCSqGSIb3DQEHATAUBggqhkiG9w0DBwQIJBGw+9zS+haAgbAN0ljt+/dLwA9mTU1ZgM3ZRt4jbaAMg68dP7cSwBVURtRjNAzQ8mrcfARmSRYgnIwh+cr93t3iUNlWIm829HiLEgO9VTsGiNvioo3E5g0QmyhPrpzc+//vt2S13xp3I5EOHgnQww6w1RLGLYoZASFGMB7pTLAjVe7VQP0QlkNa1K6gjxTth5hNebZLaXd/qNCuLZKbIjRUdd03NG5tb/xVVfxoP029dUtxAi33+geXz6CCA4cwggODMIIC7KADAgECAgEAMA0GCSqGSIb3DQEBBQUAMIGOMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC1BheVBhbCBJbmMuMRMwEQYDVQQLFApsaXZlX2NlcnRzMREwDwYDVQQDFAhsaXZlX2FwaTEcMBoGCSqGSIb3DQEJARYNcmVAcGF5cGFsLmNvbTAeFw0wNDAyMTMxMDEzMTVaFw0zNTAyMTMxMDEzMTVaMIGOMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC1BheVBhbCBJbmMuMRMwEQYDVQQLFApsaXZlX2NlcnRzMREwDwYDVQQDFAhsaXZlX2FwaTEcMBoGCSqGSIb3DQEJARYNcmVAcGF5cGFsLmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAwUdO3fxEzEtcnI7ZKZL412XvZPugoni7i7D7prCe0AtaHTc97CYgm7NsAtJyxNLixmhLV8pyIEaiHXWAh8fPKW+R017+EmXrr9EaquPmsVvTywAAE1PMNOKqo2kl4Gxiz9zZqIajOm1fZGWcGS0f5JQ2kBqNbvbg2/Za+GJ/qwUCAwEAAaOB7jCB6zAdBgNVHQ4EFgQUlp98u8ZvF71ZP1LXChvsENZklGswgbsGA1UdIwSBszCBsIAUlp98u8ZvF71ZP1LXChvsENZklGuhgZSkgZEwgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tggEAMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADgYEAgV86VpqAWuXvX6Oro4qJ1tYVIT5DgWpE692Ag422H7yRIr/9j/iKG4Thia/Oflx4TdL+IFJBAyPK9v6zZNZtBgPBynXb048hsP16l2vi0k5Q2JKiPDsEfBhGI+HnxLXEaUWAcVfCsQFvd2A1sxRr67ip5y2wwBelUecP3AjJ+YcxggGaMIIBlgIBATCBlDCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20CAQAwCQYFKw4DAhoFAKBdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA2MDMzMTIyNDkyMlowIwYJKoZIhvcNAQkEMRYEFD6b4rgJBzwj5eJNAPmf7l4G39Q5MA0GCSqGSIb3DQEBAQUABIGAt8Ejk3cERePtfvoPQzq+ANQn2VUVC2YyqlU8qdTXkIufg66uHovUkY6wW6KhbI1/TU5bw3nD+rXIOyZtHQKKtlhEi0rjfn/M1mSbSh8O2uv21Q5EyniN/hKsQTkoF7rHrAUjVzZz+QApptdFQRawZDZFU+K8LHwPQg+YhzUUQ84=-----END PKCS7-----">';
			_html += '</form>';
			return podLayoutHTML(_html, 'Support this Blog', 'paypalPod', '&td=' + 'align="center"'.URLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').URLEncode());
		}
		
		function sampleAJAXAppsPod() {
			var _html = '';
			_html += '<a href="" onclick="' + jsCodeWaferAnalysis + '; return false;">Semiconductor Wafer Analysis</a>';
			return podLayoutHTML(_html, 'Sample ezAJAX' + js_trademarkSymbol + ' Apps', 'sampleAJAXAppsPod', '&td=' + 'align="center"'.URLEncode());
		}
		
		function productsPod_ezAJAX_action() {
			doAJAX_func('changeBlogDesignation', 'handleSubmitRegisterForm(' + oAJAXEngine.js_global_varName + ')', 'blogname', 'ezajax');
		}
		
		function productsPod() {
			var _html = '';
			_html += '<a href="" onclick="productsPod_ezAJAX_action(); /*alert(\'Stay tuned...\');*/ return false;">ezAJAX' + js_trademarkSymbol + '</a>';
			return podLayoutHTML(_html, 'Projects', 'productsPod', '&td=' + 'align="center"'.URLEncode());
		}
		
		function defaultBlogPod_ezAJAX_action() {
			doAJAX_func('changeBlogDesignation', 'handleSubmitRegisterForm(' + oAJAXEngine.js_global_varName + ')', 'blogname', 'default');
		}
		
		function defaultBlogPod() {
			var _html = '';
			_html += '<a href="" onclick="defaultBlogPod_ezAJAX_action(); /*alert(\'Stay tuned...\');*/ return false;">ColdFusion/AJAX/JavaScript Blog</a>';
			return podLayoutHTML(_html, 'Sponsors', 'defaultBlogPod', '&td=' + 'align="center"'.URLEncode());
		}
		
		function populatePodContent() {
			var dObj = $(js_const_div_podContent);
			if (!!dObj) {
		//		_alert('jsBool_isCurrentBlogDefault = [' + jsBool_isCurrentBlogDefault + ']' + ', jsCurrentBlogName = [' + jsCurrentBlogName + ']');
				html = ((jsBool_isCurrentBlogDefault) ? logoPod() : ezAJAX_LogoPod()) + ((jsBool_isCurrentBlogDefault) ? productsPod() : defaultBlogPod()) + searchPod();
				doAJAX_func('getRecentArticles', 'handleGetRecentArticles(' + oAJAXEngine.js_global_varName + ')');
				dObj.innerHTML = html;
			}
		}
		
		function queueUpAJAX() {
			populatePodContent();
		}

		function windowOnUnloadCallback() {
			clearInterval(tid_ajax_updateBlogStatsDateTime);
			tid_ajax_updateBlogStatsDateTime = -1;

			clearInterval(tid_updateBlogStatsDateTime);
			tid_updateBlogStatsDateTime = -1;
		}
				
		function populateActualUsersOnline() {
			doAJAX_func('getActualUsersOnline', 'handleSubmitRegisterForm(' + oAJAXEngine.js_global_varName + ')');
		}
		
		register_AJAX_function("queueUpAJAX();");

		function updateBlogStatsDateTime() {
			try {
				var tObj = _$('div_actualUsersOnlineStats0');
				if (!!tObj) {
					var i = -1;
					var ar = tObj.innerHTML.split(',');
					for (i = 0; i < ar.length; i++) {
						ar[i] = ar[i].split(' ');
					}
					var dt = new Date(tObj.innerHTML);
					if (!isNaN(dt)) {
						dt.setSeconds(dt.getSeconds() + 1);
						tObj.innerHTML = dt.toLocaleString() + ' ' + ar[2][ar[2].length - 1];
					} else {
					//	window.status = dt.toUTCString() + '| ' + dt.toLocaleString() + ' [' + ar.join('|') + ']' + ' (' + ar[2][ar[2].length - 1] + ')';
					}
				}
			} catch(e) {
	//			jsErrorExplainer(e, '111', true);
			} finally {
			}
		}
	
		function ajax_updateBlogStatsDateTime() {
			if (oAJAXEngine.isIdle()) {
				populateActualUsersOnline();
			}
		}

		var tid_updateBlogStatsDateTime = ((js_isDebugMode) ? -1 : setInterval("updateBlogStatsDateTime()", 1000));
		var tid_ajax_updateBlogStatsDateTime = ((js_isDebugMode) ? -1 : setInterval("ajax_updateBlogStatsDateTime()", 1000 * 30));
		
		function handleSubmitRegisterForm(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = DictObj.get$();
			var aDict = -1;
			var html = '';

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			function searchForStatusRecs(_ri, _dict, _rowCntName) {
				var _ISVALID = _dict.getValueFor('ISVALID');
				var _LOGGEDIN = _dict.getValueFor('LOGGEDIN');
				var _ISFORGOTPASSWORD = _dict.getValueFor('ISFORGOTPASSWORD');
				var _ISBLOGSUBSCRIBED = _dict.getValueFor('ISBLOGSUBSCRIBED');
				var _ACTUALUSERSONLINE = _dict.getValueFor('ACTUALUSERSONLINE');
				var _BLOGNAME = _dict.getValueFor('BLOGNAME');
				if ( (aDict == -1) && ( ( (!!_ISVALID) && (!!_LOGGEDIN) ) || (!!_ISFORGOTPASSWORD) || (!!_ISBLOGSUBSCRIBED) || (!!_ACTUALUSERSONLINE) || (!!_BLOGNAME) ) ) {
					aDict = DictObj.get$(_dict.asQueryString(','));
				}
			};

//	_alert('qObj = [' + qObj + ']')
			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) { // at present only the first data record is consumed...
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();
							
							qData1.iterateRecObjs(searchForStatusRecs);
//	_alert('aDict = [' + aDict + ']')
							if (aDict != -1) {
								var _ISVALID = aDict.getValueFor('ISVALID');
								var _LOGGEDIN = aDict.getValueFor('LOGGEDIN');
								var _ISFORGOTPASSWORD = aDict.getValueFor('ISFORGOTPASSWORD');
								var _ISBLOGSUBSCRIBED = aDict.getValueFor('ISBLOGSUBSCRIBED');
								var _ACTUALUSERSONLINE = aDict.getValueFor('ACTUALUSERSONLINE');
								var _BLOGNAME = aDict.getValueFor('BLOGNAME');
	
								if (_ACTUALUSERSONLINE == null) {
									performCloseLoginRegisterWindow();
								}
	
								if ( (!!_ISVALID) && (!!_LOGGEDIN) ) {
									_ISVALID = parseInt(_ISVALID);
									_LOGGEDIN = parseInt(_LOGGEDIN);
									if ( (_ISVALID == 1) && (_LOGGEDIN == 1) ) {
										alert('Your Login Request was Successful.');
										window.location.href = window.location.href;
									} else if ( (_ISVALID == 0) && (_LOGGEDIN == 0) ) {
										alert('Your Logoff Request was Successful.');
										window.location.href = window.location.href;
									}
								} else if (!!_ISFORGOTPASSWORD) {
									alert('An Email was sent to you with your password.');
								} else if (!!_ISBLOGSUBSCRIBED) {
									var oInput = _$('subscribe_user_name');
									if (!!oInput) {
										oInput.disabled = false;
										oInput.value = '';
									}
									var oBtn = _$('btn_subscribeToBlog');
									if (!!oBtn) {
										oBtn.disabled = false;
									}
									alert('You are now a subscriber to this Blog.');
								} else if (!!_ACTUALUSERSONLINE) {
									var oDiv = _$('div_actualUsersOnlineStats');
									if (!!oDiv) {
										oDiv.innerHTML = _ACTUALUSERSONLINE;
									}
								} else if (!!_BLOGNAME) {
									var sMsg = ((_BLOGNAME.toUpperCase() == 'DEFAULT') ? 'ColdFusion/AJAX/JavaScript Blog' : 'ezAJAX(tm) Commercial Product Site');
								//	alert('Welcome to the ' + sMsg + '.');
									var ar = window.location.href.split('?');
									if (ar.length > 1) {
										var pDict = DictObj.get$(ar[1]);
										var _mode = pDict.getValueFor('mode');
										if (_mode != null) {
											pDict.drop('mode');
										}
										var _entry = pDict.getValueFor('entry');
										if (_entry != null) {
											pDict.drop('entry');
										}
										ar[1] = pDict.asQueryString();
									}
									window.location.href = ar.join('?');
								}
							}
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
		
		function handleSearchPodActionResponse(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = DictObj.get$();
			var html = '';

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) { // at present only the first data record is consumed...
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();

							var oObj = _$('input_searchPod_searchKeyword');
							if (!!oObj) {
								oObj.disabled = false;
							}

							var oObj = _$('btn_searchBlog');
							if (!!oObj) {
								oObj.disabled = false;
							}
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
		
		function handleGetRecentArticles(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = DictObj.get$();
			var html = '';
			var articleNum = 0;

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			function searchForRecentArticles(_ri, _dict, _rowCntName) {
				var _ID = _dict.getValueFor('ID');
				var _TITLE = _dict.getValueFor('TITLE');
				var _URL = _dict.getValueFor('URL');
				if ( (!!_ID) && (!!_TITLE) ) {
					bgColor = (((articleNum % 2) == 0) ? "##FFFFA8" : "##BFFFFF");
					html += '<tr>';
					html += '<td bgcolor="' + bgColor + '">';
					html += '&nbsp;&nbsp;<small><NOBR><a href="" name="' + _ID + '" onclick="performGetArticleByEntry(this.name); return false;">' + _TITLE + '</a></NOBR></small>';
					html += '</td>';
					html += '</tr>';
					articleNum++;
				}
			};
//	_alert('qObj = [' + qObj + ']');
			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) { // at present only the first data record is consumed...
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();
							
							qData1.iterateRecObjs(searchForRecentArticles);
							
							var _html = '';
							_html += '<table width="100%" height="100%" cellpadding="-1" cellspacing="-1">';
							_html += html;
							_html += '</table>';

							var dObj = $(js_const_div_podContent);
							if (!!dObj) {
								dObj.innerHTML += recentArticlesPod(_html) + ((jsBool_isCurrentBlogDefault) ? paypalPod() : '') + sampleAJAXAppsPod();
								doAJAX_func('getDownloadsMetaData', 'handleGetDownloadsMetaData(' + oAJAXEngine.js_global_varName + ')');
							}
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
		
		function handleGetDownloadsMetaData(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = DictObj.get$();
			var dirDict = -1;
			var html = '';

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			function searchForDirData(_ri, _dict, _rowCntName) {
				var _NAME = _dict.getValueFor('NAME');
				var _DIRECTORY = _dict.getValueFor('DIRECTORY');
				if ( (dirDict == -1) && (!!_NAME) && (!!_DIRECTORY) ) {
					dirDict = DictObj.get$(_dict.asQueryString());
				}
			};

			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) { // at present only the first data record is consumed...
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();
							
							qData1.iterateRecObjs(searchForDirData);
	//	_alert('dirDict = [' + dirDict + ']');							
							doAJAX_func('getDownloadsFolder', 'handleGetDownloadsFolder(' + oAJAXEngine.js_global_varName + ')', 'folderName', dirDict.getValueFor('DIRECTORY') + '\\' + dirDict.getValueFor('NAME'));
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
		
		function performOpenDownloadsFile(oBtn) {
			var hRef = window.location.href;
			if (!!oBtn) {
				var cFolder = firstFolderAfterDomainNameFromHref(hRef);
				var _hRef = filePath2HrefUsingCommonFolder(oBtn.name, hRef, cFolder) + '?sessid=' + jsSessID;
				if ( (jsBool_sessionLoggedin) && (jsBool_isUserPremium) ) {
					if (_hRef.toUpperCase().indexOf('.ZIP') > -1) {
						var oForm = _$('form_downloadFile');
						if (!!oForm) {
							oForm.action = _hRef;
							oForm.submit();
						}
					} else if (_hRef.toUpperCase().indexOf('.HTML') > -1) {
						var _pURL = fullyQualifiedAppUrl();
						var pURL = _pURL + '/blog/cfcontent_html.cfm?sessid=' + jsSessID + '&_sessionid=' + jsSessionid + '&href=' + _hRef.URLEncode();
						window.open(pURL,'downloadFile','width=800,height=600,resizeable=yes,scrollbars=1');
					} else {
						var _pURL = fullyQualifiedAppUrl();
						var pURL = _pURL + '/blog/cfcontent_html.cfm?sessid=' + jsSessID + '&href=' + _hRef.URLEncode();
						window.open(pURL,'downloadFile','width=800,height=600,resizeable=yes,scrollbars=1');
					}
				} else {
					downloadsRequiresPremiumBlock();
				}
			}
		}
		
		function performOpenDownloadsObject(oBtn) {
			var ar = -1;
			var imgAR = -1;
			var sName = '';
			var iLevel = -1;
			if (!!oBtn) {
				var ar = oBtn.id.split('|');
				if (ar.length == 3) {
					iLevel = ar[1];
					sName = ar[ar.length - 1];
				}
				var boolFireButtonAction = false;
				var dName = 'div_downloadsChild_' + iLevel + '_' + sName;
				var oDiv = _$(dName);
				if (!!oDiv) {
					boolFireButtonAction = (oDiv.innerHTML.length == 0);
					var oBtnImg = _$('img_downloadsButton_' + iLevel + '_' + sName);
					if (!boolFireButtonAction) {
						var oDiv2 = _$('div_downloadsChildContainer_' + iLevel + '_' + sName);
						if (!!oDiv2) {
							oDiv2.style.display = const_none_style
						}
						oDiv.innerHTML = '';
					}
					if (!!oBtnImg) {
						imgAR = oBtnImg.src.split('/');
						imgAR[imgAR.length - 1] = ((boolFireButtonAction) ? 'FolderOpen.gif' : 'FolderClosed.gif');
						oBtnImg.src = imgAR.join('/');
					}
				}
				if (boolFireButtonAction) {
					oBtn.disabled = true;
					doAJAX_func('getDirectoryContents', 'handleGetDownloadsFolder(' + oAJAXEngine.js_global_varName + ')', 'levelNum', iLevel, 'buttonID', oBtn.id, 'folderName', oBtn.name);
				}
			}
		}
		
		function handleGetDownloadsFolder(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = DictObj.get$();
			var html = '';
			var _indentLevel = 1;
			var iLevel = -1;
			var sBtnID = '';
			var isLevelZero = false;

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			function searchForDirData(_ri, _dict, _rowCntName) {
				var isTypeDir = false;
				var _NAME = _dict.getValueFor('NAME');
				var _DIRECTORY = _dict.getValueFor('DIRECTORY');
				var _TYPE = _dict.getValueFor('TYPE');
				if ( (!!_NAME) && (!!_DIRECTORY) && (!!_TYPE) ) {
					isTypeDir =  (_TYPE.toUpperCase() == 'Dir'.toUpperCase());
					html += '<tr>';
					html += '<td>';
					html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
					html += '<tr>';
					html += '<td valign="top" align="left">';
					html += '<button type="button" id="btn_downloads|' + _indentLevel + '|' + _NAME + '" name="' + _DIRECTORY + '\\' + _NAME + '" class="buttonDirectoryClass" onclick="' + ((isTypeDir) ? 'performOpenDownloadsObject(this)' : 'performOpenDownloadsFile(this)') + '; return false;">' + ((isTypeDir) ? '&nbsp;<img id="img_downloadsButton_' + _indentLevel + '_' + _NAME + '" src="' + fqServerName + '/images/FolderClosed.gif" width="16" height="16" border="0">&nbsp;' : '&nbsp;<img src="' + fqServerName + '/images/Link.gif" width="18" height="18" border="0">&nbsp;') + _NAME + '</button>';
					html += '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td>';

					html += '<div id="div_downloadsChildContainer_' + _indentLevel + '_' + _NAME + '" style="display: none;">';
					html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
					html += '<tr>';
					html += '<td width="' + (_indentLevel * 20) + '">&nbsp;</td>';
					html += '<td width="*">';
					html += '<div id="div_downloadsChild_' + _indentLevel + '_' + _NAME + '"></div>';
					html += '</td>';
					html += '</tr>';
					html += '</table>';
					html += '</div>';

					html += '</td>';
					html += '</tr>';
					html += '</table>';
					html += '</td>';
					html += '</tr>';
				}
			};

			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) { // at present only the first data record is consumed...
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();
							
							iLevel = argsDict.getValueFor('levelNum');
							sBtnID = argsDict.getValueFor('buttonID');
							isLevelZero = ( (iLevel == null) && (sBtnID == null) );
							
							if ( (!isLevelZero) && (iLevel != null) ) {
								iLevel = parseInt(iLevel);
								_indentLevel = iLevel + 1;
							}
							
							html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
							qData1.iterateRecObjs(searchForDirData);
							html += '</table>';

							var dObj = $(js_const_div_podContent);
							if (!!dObj) {
								var oBtn = _$(sBtnID);
								if (!!oBtn) {
									oBtn.disabled = false;
								}
								if (isLevelZero) {
									dObj.innerHTML += podLayoutHTML(html, js_downloadsTitle, 'downloadsPod', '&td=' + 'align="center"'.URLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').URLEncode());
								} else {
									var ar = sBtnID.split('|');
									var _name = ar[ar.length - 1];
									var dObj2 = _$('div_downloadsChild_' + iLevel + '_' + _name);
									if (!!dObj2) {
										dObj2.innerHTML = html;
									}
									var dObj2a = _$('div_downloadsChildContainer_' + iLevel + '_' + _name);
									if (!!dObj2a) {
										dObj2a.style.display = const_inline_style;
									}
								}
							}
							if (isLevelZero) {
								doAJAX_func('getCalendarMetaData', 'handleGetCalendarMetaData(' + oAJAXEngine.js_global_varName + ')');
							}
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
		
		function performCalendarPrevMonth(qStr) {
			var dict = DictObj.get$(qStr);
			dict.URLDecode();
			var lastMonth = dict.getValueFor('LASTMONTH');
			if (!!lastMonth) {
				_dt = new Date(lastMonth);
			}
			doAJAX_func('getCalendarMetaData', 'handleGetCalendarMetaData(' + oAJAXEngine.js_global_varName + ')', 'month', _dt.getMonth(), 'year', _dt.getFullYear());
		}
		
		function performCalendarNextMonth(qStr) {
			var dict = DictObj.get$(qStr);
			dict.URLDecode();
			var nextMonth = dict.getValueFor('NEXTMONTH');
			if (!!nextMonth) {
				_dt = new Date(nextMonth);
			}
			doAJAX_func('getCalendarMetaData', 'handleGetCalendarMetaData(' + oAJAXEngine.js_global_varName + ')', 'month', _dt.getMonth(), 'year', _dt.getFullYear());
		}
		
		function performViewingArticlesByDay(id) {
			if (!!id) {
				var ar = id.split('_');
				if (ar.length > 3) {
					doAJAX_func('getBlogArticlesByDay', 'handleGetDefaultBlogArticles(' + oAJAXEngine.js_global_varName + ')', 'month', parseInt(ar[ar.length - 3]) - 1, 'day', ar[ar.length - 2], 'year', ar[ar.length - 1]);
				}
			}
		}
		
		var currentCategoryName = '';
		var currentCategoryID = '';
		
		function performViewingArticlesByCategoryName(catName) {
			if (!!catName) {
				currentCategoryName = catName;
				currentCategoryID = '';
				doAJAX_func('getBlogArticlesByCategory', 'handleGetDefaultBlogArticles(' + oAJAXEngine.js_global_varName + ')', 'catName', catName);
			}
		}
		
		function performViewingArticlesByCategoryID(catID, catName) {
			if (!!catID) {
				currentCategoryID = catID;
				currentCategoryName = catName;
				doAJAX_func('getBlogArticlesByCategory', 'handleGetDefaultBlogArticles(' + oAJAXEngine.js_global_varName + ')', 'catid', catID);
			}
		}
		
		function performViewingArticlesByCategory(oBtn, catID) {
			if ( (!!oBtn) && (!!catID) ) {
				var ar = oBtn.id.toString().split('_');
				currentCategoryName = ar[ar.length - 1];
				doAJAX_func('getBlogArticlesByCategory', 'handleGetDefaultBlogArticles(' + oAJAXEngine.js_global_varName + ')', 'catid', catID);
			}
		}
		
		function performViewingArticlesByMonth(qStr) {
			var dict = DictObj.get$(qStr);
			dict.URLDecode();
			var firstDay = dict.getValueFor('FIRSTDAY');
			if (!!firstDay) {
				_dt = new Date(firstDay);
			}
			doAJAX_func('getBlogArticlesByDay', 'handleGetDefaultBlogArticles(' + oAJAXEngine.js_global_varName + ')', 'month', _dt.getMonth(), 'year', _dt.getFullYear());
		}
		
		function handleGetCalendarMetaData(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = DictObj.get$();
			var aDict = -1;
			var html = '';

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			function searchForCalendarMetaData(_ri, _dict, _rowCntName) {
				var _DAYSINMONTH = _dict.getValueFor('DAYSINMONTH');
				if ( (aDict == -1) && (!!_DAYSINMONTH) ) {
					aDict = DictObj.get$(_dict.asQueryString(','));
				}
			};

			function calendarContent() {
				var _ISBIDI = aDict.getValueFor('ISBIDI');
				var _LOCALIZEDMONTH = aDict.getValueFor('LOCALIZEDMONTH');
				var _LOCALIZEDYEAR = aDict.getValueFor('LOCALIZEDYEAR');
				var _LOCALIZEDDAYS = aDict.getValueFor('LOCALIZEDDAYS');
				var _FIRSTWEEKPAD = aDict.getValueFor('FIRSTWEEKPAD');
				var _DAYCOUNTER = aDict.getValueFor('DAYCOUNTER');
				var _DIM = aDict.getValueFor('DIM');
				var _ROWCOUNTER = aDict.getValueFor('ROWCOUNTER');
				var _DAYLIST = aDict.getValueFor('DAYLIST');
				var _FIRSTDAY = aDict.getValueFor('FIRSTDAY');
				
				if ( (_ISBIDI != null) && (_LOCALIZEDMONTH != null) && (_LOCALIZEDYEAR != null) && (_LOCALIZEDDAYS != null) && (_FIRSTWEEKPAD != null) && (_DAYCOUNTER != null) && (_DIM != null) && (_ROWCOUNTER != null) && (_DAYLIST != null) && (_FIRSTDAY != null) ) {
					_DAYCOUNTER = parseInt(_DAYCOUNTER);
					_FIRSTWEEKPAD = parseInt(_FIRSTWEEKPAD);
					_DIM = parseInt(_DIM);
					_ROWCOUNTER = parseInt(_ROWCOUNTER);
					
					var _FIRSTDAYdt = new Date(_FIRSTDAY);
					
					var _f = -1;
					var _DAYLISTar = _DAYLIST.split(',');
					for (k = 0; k < _DAYLISTar.length; k++) {
						_DAYLISTar[k] = parseInt(_DAYLISTar[k]);
					}
					
					html += '<tr><td>';
					html += '<div class="header">';
			
					if (_ISBIDI) {
						html += '<button type="button" id="btn_calendar_prev" class="buttonClass" onclick="performCalendarPrevMonth(\'' + aDict.asQueryString(',') + '\'); return false;">' + '&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;' + '</button>';
						html += '<button type="button" id="btn_calendar_this" class="buttonClass" onclick="performViewingArticlesByMonth(\'' + aDict.asQueryString(',') + '\'); return false;">' + '&nbsp;&nbsp;' + _LOCALIZEDMONTH + '&nbsp;' + _LOCALIZEDYEAR + '&nbsp;&nbsp;' + '</button>';
						html += '<button type="button" id="btn_calendar_next" class="buttonClass" onclick="performCalendarNextMonth(\'' + aDict.asQueryString(',') + '\'); return false;">' + '&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;' + '</button>';
					} else {
						html += '<button type="button" id="btn_calendar_prev" class="buttonClass" onclick="performCalendarPrevMonth(\'' + aDict.asQueryString(',') + '\'); return false;">' + '&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;' + '</button>';
						html += '<button type="button" id="btn_calendar_this" class="buttonClass" onclick="performViewingArticlesByMonth(\'' + aDict.asQueryString(',') + '\'); return false;">' + '&nbsp;&nbsp;' + _LOCALIZEDMONTH + '&nbsp;' + _LOCALIZEDYEAR + '&nbsp;&nbsp;' + '</button>';
						html += '<button type="button" id="btn_calendar_next" class="buttonClass" onclick="performCalendarNextMonth(\'' + aDict.asQueryString(',') + '\'); return false;">' + '&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;' + '</button>';
					}
	
					html += '</div>';
					html += '</td></tr>';
	
					html += '<tr><td>';
					html += '<center><table border=0 class="calendar_table" width="100%">';
					html += '<tr>';
					var ar = _LOCALIZEDDAYS.split(',');
					for (var i = 0; i < ar.length; i++) {
						html += '<td>' + ar[i] + '</td>';
					}
					html += '</tr>';
					html += '</td></tr>';
		
					html += '<tr>';
					for (i = 1; i <= _FIRSTWEEKPAD; i++) {
						html += '<td>&nbsp;</td>';
					}
					for (i = _FIRSTWEEKPAD + 1; i <= 7; i++) {
			//			html += '<td>' +  _DAYCOUNTER + '</td>';
						_f = locateArrayItems(_DAYLISTar, _DAYCOUNTER);
						html += '<td>' + ((_f > -1) ? '<button id="btn_calendarDay_' + (_FIRSTDAYdt.getMonth() + 1) + '_' + _DAYCOUNTER + '_' + _FIRSTDAYdt.getYear() + '" class="buttonClass" onclick="performViewingArticlesByDay(this.id); return false;">' : '') + _DAYCOUNTER + ((_f > -1) ? '</button>' : '') + '</td>';
						_DAYCOUNTER++;
					}
					html += '</tr>';
					for (i = _DAYCOUNTER; i <= _DIM; i++) {
						if (_ROWCOUNTER == 1) {
							html += '<tr>';
						}
			//			html += '<td>' +  i + '</td>';
						_f = locateArrayItems(_DAYLISTar, i);
						html += '<td>' + ((_f > -1) ? '<button id="btn_calendarDay_' + (_FIRSTDAYdt.getMonth() + 1) + '_' + i + '_' + _FIRSTDAYdt.getYear() + '" class="buttonClass" onclick="performViewingArticlesByDay(this.id); return false;">' : '') + i + ((_f > -1) ? '</button>' : '') + '</td>';
						_ROWCOUNTER++;
						if (_ROWCOUNTER == 8) {
							html += '</tr>';
							_ROWCOUNTER = 1;
						}
					}
					if (_ROWCOUNTER > 1) {
						for (i = _DAYCOUNTER; i <= 7; i++) {
							html += '<td>&nbsp;</td>';
						}
						html += '</tr>';
					}
					html += '</table></center>';
				}
			}

			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) { // at present only the first data record is consumed...
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();
							
							var oCalDiv = _$('div_calendarContent');
							var bool_isContentContainer = ( (!!oCalDiv) && (oCalDiv.innerHTML.length > 0) );

							if (!bool_isContentContainer) {
								html += '<div id="div_calendarContent">';
							}

							html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
							qData1.iterateRecObjs(searchForCalendarMetaData);
	//	_alert('qData1 = [' + qData1 + ']');
							calendarContent();
							html += '</table>';

							if (!bool_isContentContainer) {
								html += '</div>';
							}
							
							if (!bool_isContentContainer) {
								var dObj = $(js_const_div_podContent);
								if (!!dObj) {
									dObj.innerHTML += podLayoutHTML(html, js_calendarTitle, 'calendarPod', '&td=' + 'align="center"'.URLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').URLEncode());
								}
								doAJAX_func('getBlogArchives', 'handleGetBlogArchives(' + oAJAXEngine.js_global_varName + ')');
							} else {
								oCalDiv.innerHTML = html;
							}
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
		
		function disableEnableButtonNamed(btnName, bool) {
			var oBtn = _$(btnName);
			if (!!oBtn) {
				oBtn.disabled = ((bool == true) ? bool : false);
			}
		}
		
		function popUpWindowForURL(aURL, winName) {
			window.open(aURL,winName,'width=' + (clientWid$() - 450) + ',height=' + (clientHt$() - 100) + ',resizeable=yes,scrollbars=1');
		}
		
		function getEzAJAXProductContent() {
			var html = '';
			
			html += '<table width="100%">';
	//		html += '<tr>';
	//		html += '<td>';
	//		html += '<h4>ezAJAX' + js_trademarkSymbol + ' >> More than 10,000 Lines of ColdFusion and JavaScript in a Reusable Application Framework</h3>';
	//		html += '</td>';
	//		html += '</tr>';

	//		_alert('window.location.href = [' + window.location.href + ']');
			var ar = window.location.href.split('?');
			var ar2 = ar[0].split('/');
	//		ar2[ar2.length - 1] = 'images/DiagramBuilder/h_blue.gif';
			
	//		html += '<tr>';
	//		html += '<td background="' + ar2.join('/') + '" height="20">';
	//		html += '</td>';
	//		html += '</tr>';

			html += '<tr>';
			html += '<td>';
			html += '<span class="normalx11StatusBoldClass"><p align="justify">With the ezAJAX' + js_trademarkSymbol + ' Framework, developers can create AJAX Applications faster and easier than ever before.<br><br>The ezAJAX' + js_trademarkSymbol + ' Framework has more than 10,000 lines of 100% reusable and redistributable ColdFusion and JavaScript code you can use to quickly build and deploy your AJAX Web Apps.<br><br>The ezAJAX' + js_trademarkSymbol + ' Framework has a unique and powerful JavaScript Compiler that compresses and encrypts your JavaScript code to better protect your Intellectual Property Rights.<br><br>The ezAJAX' + js_trademarkSymbol + ' Framework has a unique Runtime Licensing System that allows you to sell your AJAX Apps with the ability to deploy fully functional Demo versions that can easily be turned into fully functional Production versions.  You can pick and choose the features and functions you wish to limit the use of at runtime.  This gives your customers an easy upgrade path that also enhances your profitability.<br><br></p></span>';
			html += '</td>';
			html += '</tr>';

			html += '<tr>';
			html += '<td style="border-top: thin solid Blue;">';

			html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';

			ar2[ar2.length - 1] = 'images/downloadCommunityEdition.gif';

			html += '<td align="center" valign="top">';
			html += '<span class="normalx11StatusBoldClass"><a href="" onclick="return false;"><img border="0" src="' + ar2.join('/') + '"><br>Community Edition FREE Download</a></span>';
			html += '</td>';

			ar2[ar2.length - 1] = 'images/downloadTrialEdition.gif';

			html += '<td align="center" valign="top">';
			html += '<span class="normalx11StatusBoldClass"><a href="" onclick="return false;"><img border="0" src="' + ar2.join('/') + '"><br>Enterprise Trial Edition FREE Download</a></span>';
			html += '</td>';

			html += '</tr>';
			html += '</table>';

			html += '</td>';
			html += '</tr>';

			html += '<tr>';
			html += '<td style="border-bottom: thin solid Blue;">';

			html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';

			html += '<td align="center" valign="top" style="border-top: thin solid Blue;">';

			html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';
// +++
			html += '<td width="70%" align="left" valign="top">';
			html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';
			html += '<td style="margin-bottom: 15px;">';
			html += '<span class="titlex14BoldClass">Product Info</span>';
			html += '&nbsp;&nbsp;&nbsp;&nbsp;';
			html += '<span class="normalx11TextClass">There are 2 ezAJAX' + js_trademarkSymbol + ' Framework Editions you may use.</span>';
			html += '</td>';
			html += '</tr>';

			html += '<tr>';
			html += '<td>';
			html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';
			html += '<td>';
			html += '<span class="titlex12GreenBoldClass">Community Edition:</span>';
			html += '</td>';
			html += '<td>';
			html += '<span class="normalx11TextClass">Free for personal use (<a href="" onclick="popUpWindowForURL(js_urlCommunityEditionLicenseAgreement, \'CommunityEditionLicenseAgreement\'); return false;">license</a>).</span>';
			html += '</td>';
			html += '<td>';
	//		html += '<span class="normalx12StatusBoldClass"><a href="" onclick="alert(\'More Info will be added soon.\'); return false;">More info &gt;&gt;</a></span>';
			html += '</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td>';
			html += '<span class="titlex12GreenBoldClass">Enterprise Edition:</span>';
			html += '</td>';
			html += '<td>';
			html += '<span class="normalx11TextClass">$495/Server&nbsp;<b>&sect;</b></span>';
			html += '</td>';
			html += '<td>';
	//		html += '<span class="normalx12StatusBoldClass"><a href="" onclick="alert(\'More Info will be added soon.\'); return false;">More info &gt;&gt;</a></span>';
			html += '</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td colspan="2">';
			html += '<span class="normalx9TextClass"><b>&sect;</b>&nbsp;OEM, Partner, Educational and Volume Pricing available upon request.</span>';
			html += '</td>';
			html += '</tr>';
			html += '</table>';
			html += '</td>';
			html += '</tr>';

			html += '</table>';
			html += '</td>';

			html += '<td width="*" align="center" valign="top" style="border-left: thin solid Blue;">';
			html += '<span class="titlex14BoldClass">Demos & Tutorials</span>';
			html += '<br>';
			html += '<span class="normalx12StatusBoldClass"><a href="" onclick="' + jsCodeDemoWaferAnalysis + '; return false;">Semiconductor Wafer Analysis Prototype</a></span>';
			html += '</td>';

			html += '</tr>';
			html += '</table>';

			html += '</td>';

			html += '</tr>';

			html += '<tr>';
			
			html += '<td align="left" valign="top" style="border-top: thin solid Blue;">';
			html += '<span class="titlex14BoldClass">Contact Us</span>';
			html += '<br>';
			html += '<span class="normalx12StatusBoldClass"><a href="" onclick="displayContactUsContentIn(\'div_contactUsContent\', \'performContactUsAction\', \'' + js_salesEmailAddress + '\'); return false;">' + js_salesEmailAddress + '</a></span>';
			html += '<div id="div_contactUsContent"></div>';
			html += '</td>';

			html += '</tr>';
			html += '</table>';

			html += '</td>';
			html += '</tr>';

			html += '<tr>';
			html += '<td align="left" valign="top">';
			html += '<span class="normalx9TextClass">' + js_copyrightNotice + '</span>';
			html += '</td>';
			html += '</tr>';

			html += '';
			html += '';
			html += '';
			html += '';
			html += '';

			html += '</table>';
			
			return html;
		}
		
		function performDefaultBlogSearch() {
			if (jsBool_isCurrentBlogDefault) {
				if ( (js_URL_mode.toUpperCase() == 'ENTRY') && ((typeof js_URL_entry) == const_string_symbol) && (js_URL_entry.length > 0) ) {
					performGetArticleByEntry(js_URL_entry);
				} else {
					doAJAX_func('getDefaultBlogArticles', 'handleGetDefaultBlogArticles(' + oAJAXEngine.js_global_varName + ')', 'maxEntries', js_maxEntries);
				}
			} else {
				var dObj = $('div_articleContent');
				if (!!dObj) {
			//		dObj.innerHTML = '<iframe id="iframe_productContent" frameborder="0" width="100%" height="' + clientHt$() + '" scrolling="Auto" src="#ezAJAX_ProductContent#"></iframe>';
					dObj.innerHTML = getEzAJAXProductContent();
				} else {
					alert('ERROR: Programming Error - Cannot find element named "div_articleContent".');
				}
			}
		}
		
		function handleGetBlogArchives(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = DictObj.get$();
			var html = '';

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			function searchForArchives(_ri, _dict, _rowCntName) {
				var i = -1;
				var n = -1;
				var padStr = '';
				var _CATEGORYNAME = _dict.getValueFor('CATEGORYNAME');
				var _CATEGORYID = _dict.getValueFor('CATEGORYID');
				var _ENTRYCOUNT = _dict.getValueFor('ENTRYCOUNT');
				if ( (!!_CATEGORYNAME) && (!!_CATEGORYID) && (!!_ENTRYCOUNT) ) {
					n = Math.abs(5 - _ENTRYCOUNT.length);
					for (i = 1; i <= n; i++) {
						padStr += '&nbsp;';
					}
					html += '<tr>';
					html += '<td>';
					html += '<button type="button" id="btn_archives_' + _CATEGORYNAME + '" class="buttonDirectoryClass" onclick="performViewingArticlesByCategory(this, \'' + _CATEGORYID + '\'); return false;">' + '&nbsp;&nbsp;' + padStr + _ENTRYCOUNT + '&nbsp;&nbsp;' + ':' + '&nbsp;&nbsp;' + _CATEGORYNAME + '&nbsp;' + '</button>';
					html += '</td>';
					html += '</tr>';
				}
			};

			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) { // at present only the first data record is consumed...
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();
							
							html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
							qData1.iterateRecObjs(searchForArchives);
							html += '</table>';

							var dObj = $(js_const_div_podContent);
							if (!!dObj) {
								dObj.innerHTML += podLayoutHTML(html, js_archivesBySubjectTitle, 'archivesPod', '&td=' + 'align="center"'.URLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').URLEncode());
								dObj.innerHTML += subscribePod();
							}
							disableEnableButtonNamed('btn_expandBlogCols', false);
							performDefaultBlogSearch();
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
		
		function handleGetDefaultBlogArticles(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = DictObj.get$();
			var blogSettingsDict = -1;
			var html = '';
			var _html = '';
			var _lastDate = -1;
			var blogRecordCount = -1;

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			function searchForBlogSettings(_ri, _dict, _rowCntName) {
				var _ALLOWTB = _dict.getValueFor('ALLOWTB');
				if ( (blogSettingsDict == -1) && (!!_ALLOWTB) ) {
					blogSettingsDict = DictObj.get$(_dict.asQueryString());
				}
			};
			
			function searchForBlogArticles(_ri, _dict, _rowCntName) {
				var _ALIAS = _dict.getValueFor('ALIAS');
				var _ALLOWCOMMENTS = _dict.getValueFor('ALLOWCOMMENTS');
				var _BODY = _dict.getValueFor('BODY');
				var _CATEGORYIDS = _dict.getValueFor('CATEGORYIDS');
				var _CATEGORYNAMES = _dict.getValueFor('CATEGORYNAMES');
				var _COMMENTCOUNT = _dict.getValueFor('COMMENTCOUNT');
				var _ENCLOSURE = _dict.getValueFor('ENCLOSURE');
				var _FILESIZE = _dict.getValueFor('FILESIZE');
				var _ID = _dict.getValueFor('ID');
				var _MIMETYPE = _dict.getValueFor('MIMETYPE');
				var _MOREBODY = _dict.getValueFor('MOREBODY');
				var _POSTED = _dict.getValueFor('POSTED');
				var _POSTEDLONG = _dict.getValueFor('POSTEDLONG');
				var _TITLE = _dict.getValueFor('TITLE');
				var _TRACKBACKCOUNT = _dict.getValueFor('TRACKBACKCOUNT');
				var _USERNAME = _dict.getValueFor('USERNAME');
				if ( (_ALIAS != null) && (_ALLOWCOMMENTS != null) && (_BODY != null) && (_CATEGORYIDS != null) && (_CATEGORYNAMES != null) && (_COMMENTCOUNT != null) && (_ENCLOSURE != null) && (_FILESIZE != null) && (_ID != null) && (_MIMETYPE != null) && (_MOREBODY != null) && (_POSTED != null) && (_TITLE != null) && (_TRACKBACKCOUNT != null) && (_USERNAME != null) && (_POSTEDLONG != null) ) {

					if (_POSTED != _lastDate) {
						_lastDate = _POSTED;
						html += '<div class="date">' + _POSTED + '</div>';
					} else {
						html += '<hr noshade size=1>';
					}

					html += '<h1>' + '<a href="" name="' + _ID + '" onclick="performGetArticleByEntry(this.name); return false;">' + _TITLE + '</a>' + '</h1>';

					html += '<table width="100%" border="0" cellpadding="1" cellspacing="1">';
					html += '<tr>';
					html += '<td width="120" align="' + ((jsBool_sessionLoggedin) ? 'left' : 'center') + '" valign="top" style="margin-right: 40px;">';
					html += ((jsBool_sessionLoggedin) ? '' : '<span class="redBlogArticleAccessBoldPrompt">[Access to Blog Articles is Restricted to Registered Users]</span>');
					html += '</td>';
					html += '<td align="left" valign="top" width="*" style="margin-left: 40px;">';

					html += '<div class="byline">' + blogSettingsDict.getValueFor('POSTEDAT') + ' : ' + _POSTEDLONG;
					html += ((_USERNAME.length > 0) ? '| ' + blogSettingsDict.getValueFor('POSTEDBY') + ' : ' + _USERNAME : '') + '<br>';
					html += blogSettingsDict.getValueFor('RELATEDCATEGORIES') + '&nbsp;:&nbsp;';
					var isCurrentCategory = false;
					var ar = _CATEGORYNAMES.split(',');
					var _ar = _CATEGORYIDS.split(',');
					for (i = 0; i < _ar.length; i++) {
						isCurrentCategory = ( (ar[i].toUpperCase() == currentCategoryName.toUpperCase()) || (_ar[i] == currentCategoryID) );
						html += ((isCurrentCategory) ? '<span class="currentCategoryBoldClass">' : '<a href="" onclick="performViewingArticlesByCategoryID(\'' + _ar[i] + '\', \'' + ar[i] + '\'); return false;">') + ar[i] + ((isCurrentCategory) ? '</span>' : '</a>') + ((i != (ar.length - 1)) ? ',' : '');
					}
					html += '</div>';

					html += '<div class="body">';
					html += '<table width="100%" border="0" cellpadding="1" cellspacing="1">';
					html += '<tr>';
					html += '<td align="left" width="*">';
					html += ((jsBool_sessionLoggedin) ? _BODY : '&nbsp;');
					html += '</td>';
					html += '</tr>';
					html += '</table>';
					html += '</div>';

					html += '</td>';
					html += '</tr>';
					html += '</table>';

					html += '<div class="byline">';
					html += js_commentsText + ' (' + ((_COMMENTCOUNT == '') ? js_nocommentsText : _COMMENTCOUNT) + ')';
					html += '&nbsp;|&nbsp;';
					html += (((jsBool_isColdFusionMX7) && (jsBool_sessionLoggedin)) ? '<a href="' + js_printFlashPaperURL_template.clipCaselessReplace('+++', _ID) + '" target="_blank">' + js_printText + '</a>' : 'Print');
					html += '&nbsp;|&nbsp;';
					html += (((jsBool_isColdFusionMX7) && (jsBool_sessionLoggedin)) ? '<a href="' + js_printPdfURL_template.clipCaselessReplace('+++', _ID) + '" target="_blank">PDF</a>' : 'PDF');
					html += '</div>';
					
					html += ((jsBool_sessionLoggedin) ? '' : '<span class="redBlogArticleAccessBoldPrompt">Registered users get unlimited access to Blog Articles, Trackbacks, Comments, Downloads and RSS Feeds.</span>');

					if (bool_isEntryMode) {
						doAJAX_func('getBlogArticleTrackbacks', 'handleGetBlogArticleTrackbacks(' + oAJAXEngine.js_global_varName + ')', 'id', _ID);
					}
					
					html += '';
				}
			};
//	_alert('qObj = [' + qObj + ']');
			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) { // at present only the first data record is consumed...
				var qData1 = qObj.named('qData1');
				var qData2 = qObj.named('qData2');

				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);

						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();

							var _keyword = argsDict.getValueFor('keyword');
							var _id = argsDict.getValueFor('id');
							var _catid = argsDict.getValueFor('catid');
							var _catName = argsDict.getValueFor('catName');

							var _day = argsDict.getValueFor('day');
							var _month = argsDict.getValueFor('month');
							var _year = argsDict.getValueFor('year');
							
							bool_isKeywordSearch = ((!!_keyword) ? true : false);
							bool_isEntryMode = ((!!_id) ? true : false);
							bool_isByDayMode = (((_day != null) && (!!_month) && (!!_year)) ? true : false);
							bool_isByMonthMode = (((_day == null) && (!!_month) && (!!_year)) ? true : false);
							bool_isByCategoryMode = ((_catid != null) ? true : false);
							bool_isByCategoryNameMode = ((_catName != null) ? true : false);
							
							if ( (!bool_isByCategoryMode) && (!bool_isByCategoryNameMode) ) {
								currentCategoryName = '';
							}

							var ii = -1;
							var ar = -1;
							var _dt = -1;
							var fmtDateStr = '';
							var fmtDateStrAR = -1;
							if (bool_isByMonthMode) {
								_dt = new Date(_year, _month, 1);
								var fmtDateStrAR = _dt.toLocaleString().split(' ');
								fmtDateStrAR.pop();
								fmtDateStrAR.pop();
								fmtDateStr = fmtDateStrAR.join(' ');
								fmtDateStrAR = fmtDateStr.split(',');
								for (ii = 0; ii < fmtDateStrAR.length; ii++) {
									fmtDateStrAR[ii] = fmtDateStrAR[ii].toString().trim();
								}

								if (fmtDateStrAR.length == 3) {
									ar = fmtDateStrAR[1].split(' ');
									fmtDateStr = ar[0] + ' ' + fmtDateStrAR[fmtDateStrAR.length - 1];
								}
							} else if (bool_isByDayMode) {
								_dt = new Date(_year, _month, _day);
								var fmtDateStrAR = _dt.toLocaleString().split(' ');
								fmtDateStrAR.pop();
								fmtDateStrAR.pop();
								fmtDateStr = fmtDateStrAR.join(' ');
							}

							if (!!qData2) qData2.iterateRecObjs(searchForBlogSettings);
							blogRecordCount = qData1.recordCount();
							qData1.iterateRecObjs(searchForBlogArticles);
							
							var dObj = $('div_articleContent');
							if (!!dObj) {
								if ( (bool_isKeywordSearch) || (bool_isEntryMode) || (bool_isByDayMode) || (bool_isByMonthMode) || (bool_isByCategoryMode) || (bool_isByCategoryNameMode) ) {
									_html = '<div class="blogHeader">' + ((bool_isKeywordSearch) ? js_searchedforText + ' : ' + _keyword + ' / ' : ((bool_isEntryMode) ? js_viewingByEntryText + ' / ' : ((bool_isByDayMode) ? js_viewingbydayText + ((fmtDateStr.length > 0) ? ' : ' + fmtDateStr : '') : ((bool_isByMonthMode) ? js_viewingbymonthText + ((fmtDateStr.length > 0) ? ' : ' + fmtDateStr : '') : (((bool_isByCategoryMode) || (bool_isByCategoryNameMode)) ? js_viewingbycategoryText + ' : ' + currentCategoryName : ''))))) + '&nbsp;&nbsp;<button id="btn_returnToMainBlogArticles" class="buttonClass" onclick="this.disabled = true; clearBlogArticlesContent(); performDefaultBlogSearch(); return false;">' + js_mainText + '</button></div>';
									dObj.innerHTML = _html + html;
								} else {
									dObj.innerHTML += html;
								}
							} else {
								alert('ERROR: Programming Error - Cannot find element named "div_articleContent".');
							}

							if (bool_isKeywordSearch) {
								var oObj = _$('input_searchPod_searchKeyword');
								if (!!oObj) {
									oObj.disabled = false;
								}
	
								var oObj = _$('btn_searchBlog');
								if (!!oObj) {
									oObj.disabled = false;
								}
							}
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
		
		function handleGetBlogArticleComments(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = DictObj.get$();
			var html = '';
			var _html = '';

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			function searchForComments(_ri, _dict, _rowCntName) {
				var _COMMENT = _dict.getValueFor('COMMENT');
				var _EMAIL = _dict.getValueFor('EMAIL');
				var _ID = _dict.getValueFor('ID');
				var _NAME = _dict.getValueFor('NAME');
				var _POSTED = _dict.getValueFor('POSTED');
				var _SUBSCRIBE = _dict.getValueFor('SUBSCRIBE');
				var _WEBSITE = _dict.getValueFor('WEBSITE');
				var _ISURLVALID = _dict.getValueFor('ISURLVALID');
				var _POSTEDSHORT = _dict.getValueFor('POSTEDSHORT');

				if ( (!!_COMMENT) && (!!_EMAIL) && (!!_ID) && (!!_NAME) && (!!_POSTED) && (!!_SUBSCRIBE) && (!!_WEBSITE) && (!!_ISURLVALID) && (!!_POSTEDSHORT) ) {
					_html += '<p>';
					_html += '<div class="body">';
					_html += _COMMENT;
					_html += '</div>';
					_html += '</p>';
					_html += '<p>';
					_html += '<div class="byline">' + js_postedbyText + ' ' + (((_WEBSITE.length > 0) && (_ISURLVALID)) ? '<a href="' + _WEBSITE + '" target="_blank">' + _NAME + '</a>' : _NAME) + ' / ' + js_postedatText + ' ' + _POSTEDSHORT + ' ' + _POSTED + '</div>';
					_html += '</p>';
					_html += '<hr noshade size=1>';
				}
			};

			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) { // at present only the first data record is consumed...
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();
							
							html += '<p>';
							html += '<div class="commentHeader">' + js_commentsText + '</div>';
							html += '</p>';

							qData1.iterateRecObjs(searchForComments);
							
							if (_html.length > 0) {
								html += _html;
							} else {
								html += '<p>' + js_nocommentsText + '</p>';
							}

							var dObj = $('div_articleContent');
							if (!!dObj) {
								dObj.innerHTML += html;
							} else {
								alert('ERROR: Programming Error - Cannot find element named "div_articleContent".');
							}
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
		
		function handleGetBlogArticleTrackbacks(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = DictObj.get$();
			var html = '';
			var _html = '';

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			function searchForTrackbacks(_ri, _dict, _rowCntName) {
				var _BLOGNAME = _dict.getValueFor('BLOGNAME');
				var _CREATED = _dict.getValueFor('CREATED');
				var _CREATEDSHORT = _dict.getValueFor('CREATEDSHORT');
				var _EXCERPT = _dict.getValueFor('EXCERPT');
				var _ID = _dict.getValueFor('ID');
				var _POSTURL = _dict.getValueFor('POSTURL');
				var _TITLE = _dict.getValueFor('TITLE');

				if ( (!!_BLOGNAME) && (!!_CREATED) && (!!_CREATEDSHORT) && (!!_EXCERPT) && (!!_ID) && (!!_POSTURL) && (!!_TITLE) ) {
					_html += '<p>';
					_html += '<div class="body">';
					_html += '<b>' + _TITLE + '</b><br>';
					_html += _EXCERPT;
					_html += '</div>';
					_html += '<div class="byline">' + js_trackedbyText + ' ' + _BLOGNAME + ' / ' + js_trackedonText + ' ' + _CREATEDSHORT + ' ' + _CREATED + '</div>';
					_html += '<hr noshade size=1>';
					_html += '</p>';
				}
			};

			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) { // at present only the first data record is consumed...
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();
							
							html += '<p>';
							html += '<div class="trackbackHeader">TrackBacks</div>';
							html += '</p>';

							qData1.iterateRecObjs(searchForTrackbacks);
							
							if (_html.length > 0) {
								html += _html;
							} else {
								html += '<p>' + js_notrackbacksText + '</p>';
							}

							html += '<p>';
							html += '<div class="body">';
							html += js_trackbackurlText + '<br>';
							html += js_ApplicationRootURL + '/trackback.cfm?' + argsDict.getValueFor('id');
							html += '</div>';
							html += '</p>';

							var dObj = $('div_articleContent');
							if (!!dObj) {
								dObj.innerHTML += html;
							} else {
								alert('ERROR: Programming Error - Cannot find element named "div_articleContent".');
							}

							if (bool_isEntryMode) {
								doAJAX_func('getBlogArticleComments', 'handleGetBlogArticleComments(' + oAJAXEngine.js_global_varName + ')', 'id', argsDict.getValueFor('id'));
							}
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
		
		var global_podNum = 0;
		var global_podsAR = [];
		
		function handleGetPodCount(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = DictObj.get$();
			var podsDict = -1;
			var html = '';

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			function searchForPodsCount(_ri, _dict, _rowCntName) {
				var _PODCOUNT = _dict.getValueFor('PODCOUNT');
				if ( (podsDict == -1) && (!!_PODCOUNT) ) {
					podsDict = DictObj.get$(_dict.asQueryString());
				}
			};

			function searchForPodNames(_ri, _dict, _rowCntName) {
				var _NAME = _dict.getValueFor('NAME');
				if (!!_NAME) {
					global_podsAR.push(_NAME);
				}
			};

			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) { // at present only the first data record is consumed...
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();

							qData1.iterateRecObjs(searchForPodsCount);
							
							if (podsDict != -1) {
								var qData2 = qObj.named('qData2');
								if (!!qData2) {
									qData2.iterateRecObjs(searchForPodNames);
								//	var dObj = $('div_floatingContent');
								//	if (!!dObj) {
								//		html = '<table width="400" border="1" cellpadding="-1" cellspacing="-1">';
								//		html += '<tr>';
								//		html += '<td>';
								//		html += '<div id="div_activityMonitor"></div>';
								//		html += '</td>';
								//		html += '</tr>';
								//		html += '</table>';
								//		dObj.innerHTML = html;
								//		var cW = clientWid$();
								//		dObj.style.position = const_absolute_style;
								//		dObj.style.top = (clientHt$() / 2) + 'px';
								//		dObj.style.left = (cW / 2) - (cW / 4) + 'px';
								//		dObj.style.width = '400px';
								//		dObj.style.height = '50px';
								//		dObj.style.display = const_inline_style;

								//		doAJAX_func('getPodByName', 'handleGetPodByName(' + oAJAXEngine.js_global_varName + ')', 'podNum', global_podNum, 'podName', global_podsAR[global_podNum]);
								//	}
								} else {
									alert('ERROR: Programming Error - Missing the Query object that names the individual Pods.');
								}
							}
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
		
		function handleGetPodByName(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = DictObj.get$();
			var podDict = -1;
			var html = '';

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			function searchForPodData(_ri, _dict, _rowCntName) {
				var _PODNUM = _dict.getValueFor('PODNUM');
				if ( (podDict == -1) && (!!_PODNUM) ) {
					podDict = DictObj.get$(_dict.asQueryString());
				}
			};

			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) { // at present only the first data record is consumed...
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();
							
							qData1.iterateRecObjs(searchForPodData);

							var dObj = _$('div_activityMonitor');
							var _dObj = $('div_floatingContent');
							if ( (!!dObj) && (!!_dObj) ) {
								var pNum = podDict.getValueFor('PODNUM');
								var pTotal = global_podsAR.length;
								if (pNum != null) {
									pNum++;
								}
								var _pCent = Math.ceil((pNum / pTotal) * 100);
								var pCent = (_pCent / 100);
								var pWid = pCent * parseInt(_dObj.style.width);

								dObj.style.width = pWid + 'px';
								dObj.style.backgroundColor = 'lime';
								dObj.innerHTML = '<center><small>' + _pCent + '%</small></center>';

								doAJAX_func('getPodByName', 'handleGetPodByName(' + oAJAXEngine.js_global_varName + ')', 'podNum', pNum, 'podName', global_podsAR[pNum]);
							}
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
		
		function expandBlogRightCol(oBtn) {
			var v = '';
			var b = false;
			var _html = '';
			var oDiv = -1;
			var oDiv2 = -1;
			var oTD_articleContent = $('td_articleContent');
			var oTD_podContent2 = $('td_podContent2');
			var oTD_podContent = $('td_podContent');
			var oDivPodContent = $('div_podContent');
			var oDivPodContent2 = $('div_podContent2');
			if ( (!!oBtn) && (!!oTD_articleContent) && (!!oTD_podContent2) && (!!oTD_podContent) && (!!oDivPodContent) && (!!oDivPodContent2) ) {
				v = oBtn.value;
				b = (v == js_const_expandButtonFace);
				var wid1 = parseInt(oTD_articleContent.width);
				var wid2 = parseInt(oTD_podContent2.width);
				var wid3 = parseInt(oTD_podContent.width);
				if (b) { // expand...
					wid3 = wid2;
					wid1 = 100 - (wid2 + wid3);
					oTD_articleContent.width = wid1 + '%';
					oTD_podContent2.width = wid2 + '%';
					oTD_podContent.width = wid3 + '%';

					var dObj = $('div_articleContent');
					if (!!dObj) {
						dObj.style.width = clientWid$() * (wid1 / 100);
					}

					var _els = [];
					var _els2 = [];
					var els = oTD_podContent.getElementsByTagName("div");
					for (var i = 0; i < els.length; i++) {
						if ( (!!els[i].id) && (els[i].id.trim().length > 0) && (els[i].id.trim().toUpperCase() != js_const_div_podContent.toUpperCase()) && (els[i].id.trim().toUpperCase().indexOf('calendar'.toUpperCase()) == -1) && (els[i].id.trim().toUpperCase().indexOf('subscribe'.toUpperCase()) == -1) ) {
							_els.push(els[i]);
						}
					}
					var iHalf = Math.floor(_els.length / 2);
					for (i = 0; i < iHalf; i++) {
						_els2.push(_els.pop());
					}
					_html = '';
					for (i = _els2.length - 1; i >= 0; i--) {
						oDivPodContent2.innerHTML += '<div id="' + _els2[i].id + '2"></div>';
						oDiv = _$(_els2[i].id + '2');
						if (!!oDiv) {
							oDiv.innerHTML = _els2[i].innerHTML;
						}
						_els2[i].style.display = const_none_style;
						_els2[i].innerHTML = '';
					}
					oTD_podContent2.style.display = const_inline_style;
					oBtn.value = js_const_contractButtonFace;
				} else { // contract...
					wid3 = 30;
					wid1 = 100 - wid3;
					oTD_articleContent.width = wid1 + '%';
					oTD_podContent.width = wid3 + '%';

					var dObj = $('div_articleContent');
					if (!!dObj) {
						dObj.style.width = clientWid$() * (wid1 / 100);
					}

					var els = oDivPodContent2.getElementsByTagName("div");
					for (var i = 0; i < els.length; i++) {
						oDiv2 = _$(els[i].id);
						oDiv = _$(els[i].id.substring(0, els[i].id.length - 1));
						if ( (!!oDiv2) && (!!oDiv) ) {
							oDiv.innerHTML = oDiv2.innerHTML;
							oDiv2.style.display = const_none_style;
							oDiv.style.display = const_inline_style;
						}
					}
					oDivPodContent2.innerHTML = '';
					
					oTD_podContent2.style.display = const_none_style;
					oBtn.value = js_const_expandButtonFace;
				}
			}
		}
	// -->
	</script>

	<cfsavecontent variable="ezClusterLink">
		<cfoutput>
			<a href="#Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#')#/blog/downloads/ezCluster(tm).htm" target="_blank"><span class="normalBoldGreenPrompt">ezCluster</span><SUP><span class="normalBoldGreenTmPrompt">TM</span></SUP></a>
		</cfoutput>
	</cfsavecontent>
	<cfsavecontent variable="ezAJAXLink">
		<cfoutput>
			<span class="normalBoldGreenPrompt">ezAJAX</span><SUP><span class="normalBoldGreenTmPrompt">TM</span></SUP>
		</cfoutput>
	</cfsavecontent>
	<cfsavecontent variable="_poweredHTML">
		<cfoutput>
			<span class="normalBoldGreenPrompt">This Blog is powered by </span>#ezClusterLink#&nbsp;
			#ezClusterLink#<span class="normalBluePrompt"> makes 2 or more of your web servers into a single super-computer web server using cheap off-the-shelf PC's using absolutely <b><u>NO</u></b> expensive Cisco equipment or Windows Load Balancer support.&nbsp;&nbsp;&nbsp;#ezClusterLink# is the lowest cost way to Cluster Web Servers.</span>
			&nbsp;
			<span class="normalBluePrompt">This Blog is powered by #ezAJAXLink#.  #ezAJAXLink# makes it Easy to Create and Publish your AJAX Web Apps.  Let us do all the work for you.</span>
			<br>
			The contents of this Blog are protected under U.S. and International Copyright Laws. &copy 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.
		</cfoutput>
	</cfsavecontent>
	
	<table id="table_outerContentWrapper" width="100%" cellpadding="-1" cellspacing="-1">
		<tr>
			<td valign="top">
				<table width="100%" cellpadding="-1" cellspacing="-1" class="bannerTable">
					<tr>
						<td align="left" valign="top">
							<div id="banner">#application.blog.getProperty("blogTitle")#</div>
							<a id="anchor_bottomOfBlogTitle" name="anchor_bottomOfBlogTitle"></a>
						</td>
						<td align="left" valign="top">
							<div id="div_actualUsersOnlineStats" class="bannerStats"></div>
						</td>
					<cfif (NOT Request.commonCode.isUserPremium()) AND (cf_currentBlogName IS "default")>
						<td align="left" valign="top">
							<cfset _url = Request.commonCode._clusterizeURLForSessionOnly(Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#') & '/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/' & 'agooglead.cfm')>
							<iframe id="iframe_google_ad" name="iframe_google_ad" class="bannerTable" frameborder="0" scrolling="No" width="480" height="75" src="#_url#&enableMetaRefresh=30"></iframe>
							<center><span class="yellowBlogArticleAccessBoldPrompt">Upgrade to a Premium Subscription to remove these Ads.</span></center>
						</td>
					</cfif>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<table width="100%" cellpadding="-1" cellspacing="-1">
					<tr>
						<td background="#_urlParentPrefix#/AJAX-Framework/images/DiagramBuilder/h_blue.gif">&nbsp;</td>
						<td colspan="2" align="left" <cfif (cf_currentBlogName IS 'default') AND 0>bgcolor="#cf_blogBgColor#"<cfelse>background="#_urlParentPrefix#/AJAX-Framework/images/DiagramBuilder/h_blue.gif"</cfif>>
							<cfif (cf_currentBlogName IS 'default')>
								<button id="btn_expandBlogCols" disabled class="buttonClass" onclick="expandBlogRightCol(this); return false;">#cf_const_expandButtonFace#</button>
							</cfif>
						</td>
					</tr>
					<tr>
						<td id="td_articleContent" width="70%" valign="top" align="left" style="border-right: thin dotted Silver;">
							<table width="100%" cellpadding="-1" cellspacing="-1">
								<tr>
									<td width="10" align="left" valign="top">
										&nbsp;
									</td>
									<td width="*" align="left" valign="top">
										<a id="anchor_articleContentTop" name="anchor_articleContentTop"></a>
										<div id="div_articleContent" style="overflow: auto;"></div>
									</td>
								</tr>
							</table>
						</td>
						<td id="td_podContent" width="30%" valign="top" align="left" style="border-left: thin dotted Silver;">
							<div id="div_podContent"></div>
						</td>
						<td id="td_podContent2" width="25%" valign="top" align="left" style="display: none; border-left: thin dotted Silver;">
							<div id="div_podContent2"></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left">
				#_poweredHTML#
			</td>
		</tr>
	</table>

	<form id="form_downloadFile" name="myForm" action="" method="get" target="_blank">
		<input type="Submit" name="btn_submit" value="[Download]" style="display: none;">
	</form>
	
	<div id="div_floatingContent" style="display: none;"></div>
	
</cfoutput>
