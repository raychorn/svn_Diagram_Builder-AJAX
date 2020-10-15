<cfoutput>
	<cfscript>
		logoImage = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/blog/includes/cfcontent_img.cfm?imageName=../images/Yes02b1a187x171.jpg');
		_urlWaferAnalysis = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/samples/semiconductors/wafer-analysis/index.cfm') & '?sessID=#Session.sessID#';

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
		
		bool_sessionLoggedin = session.persistData.loggedin;
		if (bool_sessionLoggedin) {
			cfBool_sessionLoggedin = 1;
			jsCodeWaferAnalysis = "window.open('#_urlWaferAnalysis#','samples1','width=' + clientWid$() + ',height=' + clientHt$() + ',resizeable=yes,scrollbars=1')";
		} else {
			cfBool_sessionLoggedin = 0;
			jsCodeWaferAnalysis = "sampleAppsRequiresLoginBlock()";
		}
	</cfscript>

	<script language="JavaScript1.2" type="text/javascript">
	<!--
		var js_maxEntries = parseInt('#cf_maxEntries#');
		
		var jsBool_sessionLoggedin = ((#cfBool_sessionLoggedin#) ? true : false);
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
		
		var js_ApplicationRootURL = '#application.rooturl#';
		
		var js_blogBgColor = '#cf_blogBgColor#';
		
		var js_const_expandButtonFace = '#cf_const_expandButtonFace#';
		var js_const_contractButtonFace = '#cf_const_contractButtonFace#';
		
		var js_const_div_podContent = '#cf_const_div_podContent#';

		var fqServerName = fullyQualifiedAppPrefix();
		
		var bool_isKeywordSearch = false;
		var bool_isEntryMode = false;

		function injectParmsFrom(d, aKey) {
			var _content = '';
			var _ar = d.getValueFor(aKey);
			if ( (!!_ar) && (typeof _ar == const_object_symbol) ) {
				for (var i = 0; i < _ar.length; i++) {
					if ( (!!_ar[i]) && (typeof _ar[i] == const_string_symbol) ) _content += ' ' + _ar[i].URLDecode();
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

		function searchPod() {
			var _html = '';
			_html += '<p align="center">';
			_html += '<input type="text" id="input_searchPod_searchKeyword" name="search" size="40" maxlength="255" onkeydown="if (event.keyCode == 13) { performSearchPodAction(this); }; return true;">';
			_html += '&nbsp;';
			_html += '<button id="btn_searchBlog" class="buttonClass" onclick="var oObj = _$(\'input_searchPod_searchKeyword\'); performSearchPodAction(oObj); return false;">Search</button>';
			_html += '</p>';
			return podLayoutHTML(_html, js_searchTitle, 'searchPod', '&td=' + 'align="center"'.URLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').URLEncode());
		}
		
		function subscribePod() {
			var _html = '';
			_html += js_subscribeBlog;
			_html += '<p align="center">';
			_html += '<input type="text" id="subscribe_user_name" name="email" size="40" maxlength="255" ' + ((jsBool_sessionLoggedin) ? '' : 'disabled title="You may only Subscribe to this Blog when you are a Registered User of this Blog and you have activated your User Account."') + ' onkeyup="if (!!_validateUserAccountName) { _validateUserAccountName($(\'subscribe_user_name\')); };" onkeydown="var sRed = this.style.border; var iRed = sRed.indexOf(\' red\'); iRed = ((iRed == -1) ? sRed.indexOf(\'red \') : iRed); var boolRed = (iRed != -1); var bool = ( (event.keyCode != 13) || ( (event.keyCode == 13) && (boolRed == false) ) ); if ( (boolRed) && (event.keyCode == 13) ) { alert(this.title); }; return bool;">';
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
			_html += '<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----">';
			_html += '</form>';
			return podLayoutHTML(_html, 'Support this Blog', 'paypalPod', '&td=' + 'align="center"'.URLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').URLEncode());
		}
		
		function sampleAJAXAppsPod() {
			var _html = '';
			_html += '<a href="" onclick="#jsCodeWaferAnalysis#; return false;">Semiconductor Wafer Analysis</a>';
			return podLayoutHTML(_html, 'Sample AJAX Apps', 'sampleAJAXAppsPod', '&td=' + 'align="center"'.URLEncode());
		}
		
		function populatePodContent() {
			var dObj = $(js_const_div_podContent);
			if (!!dObj) {
				html = logoPod() + searchPod();
				doAJAX_func('getRecentArticles', 'handleGetRecentArticles(' + oAJAXEngine.js_global_varName + ')');
				dObj.innerHTML = html;
			}
		}
		
		function queueUpAJAX() {
		//	doAJAX_func('getPodCount', 'handleGetPodCount(' + oAJAXEngine.js_global_varName + ')');
			populatePodContent();
		}
		
		register_AJAX_function("queueUpAJAX();");
		
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
// +++							
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
							_html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
							_html += html;
							_html += '</table>';

							var dObj = $(js_const_div_podContent);
							if (!!dObj) {
								dObj.innerHTML += recentArticlesPod(_html) + paypalPod() + sampleAJAXAppsPod();
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
		
		function handleGetDownloadsFolder(qObj) {
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

			function searchForDirData(_ri, _dict, _rowCntName) {
				var _NAME = _dict.getValueFor('NAME');
				var _DIRECTORY = _dict.getValueFor('DIRECTORY');
				var _TYPE = _dict.getValueFor('TYPE');
				if ( (!!_NAME) && (!!_DIRECTORY) && (!!_TYPE) ) {
					html += '<tr>';
					html += '<td>';
					html += '<button type="button" id="btn_downloads_' + _NAME + '" class="buttonDirectoryClass">' + ((_TYPE.toUpperCase() == 'Dir'.toUpperCase()) ? '&nbsp;<img src="' + fqServerName + '/images/FolderClosed.gif" width="16" height="16" border="0">&nbsp;' : '&nbsp;<img src="' + fqServerName + '/images/Link.gif" width="18" height="18" border="0">&nbsp;') + _NAME + '</button>';
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
							qData1.iterateRecObjs(searchForDirData);
							html += '</table>';

							var dObj = $(js_const_div_podContent);
							if (!!dObj) {
								dObj.innerHTML += podLayoutHTML(html, js_downloadsTitle, 'downloadsPod', '&td=' + 'align="center"'.URLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').URLEncode());
							}
							doAJAX_func('getCalendarMetaData', 'handleGetCalendarMetaData(' + oAJAXEngine.js_global_varName + ')');
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
					try {
						aDict = DictObj.get$(_dict.asQueryString(',', true));
						aDict.URLDecode();
					} catch(e) { jsErrorExplainer(e, '101', true); } finally {	};
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
				
				var today = new Date();

				if ( (!!_ISBIDI) && (!!_LOCALIZEDMONTH) && (!!_LOCALIZEDYEAR) && (!!_LOCALIZEDDAYS) && (!!_FIRSTWEEKPAD) && (!!_DAYCOUNTER) && (!!_DIM) && (!!_ROWCOUNTER) ) {
					html += '<tr><td>';
					html += '<div class="header">';
			
					if (_ISBIDI) {
						html += '<button type="button" id="btn_calendar_prev" class="buttonClass">' + '&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;' + '</button>';
						html += '<button type="button" id="btn_calendar_this" class="buttonClass">' + '&nbsp;&nbsp;' + _LOCALIZEDMONTH + '&nbsp;' + _LOCALIZEDYEAR + '&nbsp;&nbsp;' + '</button>';
						html += '<button type="button" id="btn_calendar_next" class="buttonClass">' + '&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;' + '</button>';
					} else {
						html += '<button type="button" id="btn_calendar_prev" class="buttonClass">' + '&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;' + '</button>';
						html += '<button type="button" id="btn_calendar_this" class="buttonClass">' + '&nbsp;&nbsp;' + _LOCALIZEDMONTH + '&nbsp;' + _LOCALIZEDYEAR + '&nbsp;&nbsp;' + '</button>';
						html += '<button type="button" id="btn_calendar_next" class="buttonClass">' + '&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;' + '</button>';
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
		
					html += '<tr><td>';
					html += '</td></tr>';

					html += '<tr>';
					for (i = 1; i <= _FIRSTWEEKPAD; i++) {
						html += '<td>&nbsp;</td>';
					}
					for (i = _FIRSTWEEKPAD + 1; i <= 7; i++) {
						html += '<td>' + _DAYCOUNTER + '</a>';
						_DAYCOUNTER++;
					}
					html += '</tr>';
					for (i = _DAYCOUNTER; i <= _DIM; i++) {
						if (_ROWCOUNTER == 1) {
							html += '<tr>';
						}
						html += '<td>';
						html += i;
						html += '</td>';
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
							
							html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
							qData1.iterateRecObjs(searchForCalendarMetaData);
							calendarContent();
							html += '</table>';
							
							var dObj = $(js_const_div_podContent);
							if (!!dObj) {
								dObj.innerHTML += podLayoutHTML(html, js_calendarTitle, 'calendarPod', '&td=' + 'align="center"'.URLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').URLEncode());
							}
							doAJAX_func('getBlogArchives', 'handleGetBlogArchives(' + oAJAXEngine.js_global_varName + ')');
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
		
		function performDefaultBlogSearch() {
			doAJAX_func('getDefaultBlogArticles', 'handleGetDefaultBlogArticles(' + oAJAXEngine.js_global_varName + ')', 'maxEntries', js_maxEntries);
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
				var _CATEGORYNAME = _dict.getValueFor('CATEGORYNAME');
				var _CATEGORYID = _dict.getValueFor('CATEGORYID');
				var _ENTRYCOUNT = _dict.getValueFor('ENTRYCOUNT');
				if ( (!!_CATEGORYNAME) && (!!_CATEGORYID) && (!!_ENTRYCOUNT) ) {
					html += '<tr>';
					html += '<td>';
					html += '<button type="button" id="btn_archives_' + _CATEGORYNAME + '" class="buttonDirectoryClass">' + '&nbsp;&nbsp;' + _CATEGORYNAME + '&nbsp;' + '(' + _ENTRYCOUNT + ')' + '</button>';
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
					html += blogSettingsDict.getValueFor('RELATEDCATEGORIES');
					var ar = _CATEGORYNAMES.split(',');
					for (i = 0; i < ar.length; i++) {
						html += ar[i] + ((i != (ar.length - 1)) ? ',' : '');
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

					html += '</div>';
					
					html += ((jsBool_sessionLoggedin) ? '' : '<span class="redBlogArticleAccessBoldPrompt">Registered users get unlimited access to Blog Articles, Trackbacks, Comments, Downloads and RSS Feeds.</span>');

			//		_alert('handleGetDefaultBlogArticles :: bool_isEntryMode = [' + bool_isEntryMode + ']');
					if (bool_isEntryMode) {
						doAJAX_func('getBlogArticleTrackbacks', 'handleGetBlogArticleTrackbacks(' + oAJAXEngine.js_global_varName + ')', 'id', _ID);
					}
					
					html += '';
				}
			};

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
		//		_alert('argsDict = [' + argsDict + ']');
							var _keyword = argsDict.getValueFor('keyword');
							var _id = argsDict.getValueFor('id');
							
							bool_isKeywordSearch = ((!!_keyword) ? true : false);
							bool_isEntryMode = ((!!_id) ? true : false);

							if (!!qData2) qData2.iterateRecObjs(searchForBlogSettings);
							qData1.iterateRecObjs(searchForBlogArticles);
							
							var dObj = $('div_articleContent');
							if (!!dObj) {
								if ( (bool_isKeywordSearch) || (bool_isEntryMode) ) {
									_html = '<div class="blogHeader">' + ((bool_isKeywordSearch) ? js_searchedforText + ' : ' + _keyword + ' / ' : ((bool_isEntryMode) ? js_viewingByEntryText + ' / ' : '')) + '&nbsp;&nbsp;<button id="btn_returnToMainBlogArticles" class="buttonClass" onclick="this.disabled = true; clearBlogArticlesContent(); performDefaultBlogSearch(); return false;">' + js_mainText + '</button></div>';
									dObj.innerHTML = _html + html;
								} else {
									dObj.innerHTML += html;
								}
							} else {
								alert('ERROR: Programming Error - Cannot find element named "div_articleContent".');
							}
// +++
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
// +++
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

	<table width="100%" cellpadding="-1" cellspacing="-1">
		<tr>
			<td valign="top">
				<div id="banner">#application.blog.getProperty("blogTitle")#</div>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<table width="100%" cellpadding="-1" cellspacing="-1">
					<tr>
						<td>&nbsp;</td>
						<td colspan="2" align="left" bgcolor="#cf_blogBgColor#">
							<button id="btn_expandBlogCols" disabled class="buttonClass" onclick="expandBlogRightCol(this); return false;">#cf_const_expandButtonFace#</button>
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
	</table>
	
	<div id="div_floatingContent" style="display: none;"></div>
		
</cfoutput>
