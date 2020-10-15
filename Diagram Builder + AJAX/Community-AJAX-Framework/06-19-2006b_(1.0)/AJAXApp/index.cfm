<cfoutput>
	<cftry>
		<cfset cfinclude_invalidEmailDomainsCFM = "/" & ListFirst(CGI.SCRIPT_NAME, "/") & "/includes/cfinclude_invalidEmailDomains.cfm">
		<cfset fName = ExpandPath(cfinclude_invalidEmailDomainsCFM)>
		<cfif (FileExists(fName))>
			<cfinclude template="#cfinclude_invalidEmailDomainsCFM#">
		</cfif>
		
		<cfscript>
			logoImage = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/includes/cfcontent_img.cfm?imageName=../images/Yes02b1a187x171.jpg');
			_urlWaferAnalysis = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/samples/semiconductors/wafer-analysis/index.cfm') & '?sessID=#Session.sessID#';
	
			_urlCommunityEditionLicenseAgreement = Request.commonCode.clusterizeURL('#Request._urlParentPrefix#/AJAX-Framework/ezAJAX(tm) Community Edition License Agreement.htm');
	
			ezAJAX_LogoImage = Request.commonCode.clusterizeURL('#Request._urlParentPrefix#/AJAX-Framework/ezAJAXLogo.cfm');
	
			ezAJAX_ProductContent = Request.commonCode.clusterizeURL('#Request._urlParentPrefix#/AJAX-Framework/ezAJAXProductContent.cfm');

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
		
			bool_sessionLoggedin = Request.bool_sessionLoggedin;
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
			
			var js_ezAJAX_LogoImage = '#ezAJAX_LogoImage#';
			
			var js_urlCommunityEditionLicenseAgreement = '#_urlCommunityEditionLicenseAgreement#';
			
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
	
			var js_blogBgColor = '#cf_blogBgColor#';
	
			var js_trademarkSymbol = '&##8482';
			
			var js_const_expandButtonFace = '#cf_const_expandButtonFace#';
			var js_const_contractButtonFace = '#cf_const_contractButtonFace#';
			
			var js_const_div_podContent = '#cf_const_div_podContent#';
	
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

		// -->
		</script>

		<cfcatch type="Any">
			<cfdump var="#cfcatch#" label="CF ERROR in (#CGI.SCRIPT_NAME#)" expand="No">
		</cfcatch>
	</cftry>
</cfoutput>
	
