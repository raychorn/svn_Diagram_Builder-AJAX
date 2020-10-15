<cfoutput>
	<cfscript>
		logoImage = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/blog/includes/cfcontent_img.cfm?imageName=../images/Yes02b1a187x171.jpg');
		_urlWaferAnalysis = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/samples/semiconductors/wafer-analysis/index.cfm') & '?sessID=#Session.sessID#';
		
		searchTitle = application.resourceBundle.getResource("search");
		noRecentEntries = application.resourceBundle.getResource("norecententries");
		recentEntries = application.resourceBundle.getResource("recententries");
		downloadsTitle = application.resourceBundle.getResource("downloads");
		calendarTitle = application.resourceBundle.getResource("calendar");

		if (session.persistData.loggedin) {
			jsCodeWaferAnalysis = "window.open('#_urlWaferAnalysis#','samples1','width=' + clientWid$() + ',height=' + clientHt$() + ',resizeable=yes,scrollbars=1')";
		} else {
			jsCodeWaferAnalysis = "sampleAppsRequiresLoginBlock()";
		}
	</cfscript>

	<script language="JavaScript1.2" type="text/javascript">
	<!--
		var js_searchTitle = '#searchTitle#';
		var js_noRecentEntries = '#noRecentEntries#';
		var js_recentEntries = '#recentEntries#';
		var js_downloadsTitle = '#downloadsTitle#';
		var js_calendarTitle = '#calendarTitle#';

		var fqServerName = fullyQualifiedAppPrefix();
		
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

		function podLayoutHTML(contentHTML, title, vararg_params) {
			var _html = '';
			var aDict = DictObj.get$();

			aDict.bool_returnArray = true;
		
			if (arguments.length > 1) {
			    for (var i = 1; i < arguments.length; i++) {
					aDict.fromSpec(arguments[i]);
				}
			}

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

			return _html;
		}
		
		function logoPod() {
			return podLayoutHTML('<img src="#logoImage#" width="187" height="171" border="0">', '', '&td=' + 'align="center"'.URLEncode() + '&td=' + 'bgColor="##027FFF"'.URLEncode());
		}
		
		function searchPod() {
			var _html = '';
			_html += '<p align="center">';
			_html += '<input type="text" name="search" size="40" maxlength="255">';
			_html += '&nbsp;';
			_html += '<button id="btn_searchBlog" class="buttonClass" onclick="return false;">Search</button>';
			_html += '</p>';
			return podLayoutHTML(_html, js_searchTitle, '&td=' + 'align="center"'.URLEncode() + '&td=' + 'bgColor="##027FFF"'.URLEncode());
		}
		
		function recentArticlesPod(content) {
			return podLayoutHTML(content, js_recentEntries);
		}

		function paypalPod() {
			var _html = '';
			_html += '<br><form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">';
			_html += '<input type="hidden" name="cmd" value="_s-xclick">';
			_html += '<input type="image" src="https://www.paypal.com/en_US/i/btn/x-click-but21.gif" border="0" name="submit" alt="Make payments with PayPal - it\'s fast, free and secure!">';
			_html += '<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">';
			_html += '<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----">';
			_html += '</form>';
			return podLayoutHTML(_html, 'Support this Blog', '&td=' + 'align="center"'.URLEncode() + '&td=' + 'bgColor="##027FFF"'.URLEncode());
		}
		
		function sampleAJAXAppsPod() {
			var _html = '';
			_html += '<a href="" onclick="#jsCodeWaferAnalysis#; return false;">Semiconductor Wafer Analysis</a>';
			return podLayoutHTML(_html, 'Sample AJAX Apps', '&td=' + 'align="center"'.URLEncode());
		}
		
		function populatePodContent() {
			var dObj = $('div_podContent');
			if (!!dObj) {
				html = logoPod() + searchPod();
				doAJAX_func('getRecentArticles', 'handleGetRecentArticles(' + oAJAXEngine.js_global_varName + ')');
			//	_alert(html);
				dObj.innerHTML = html;
			}
		}
		
		function queueUpAJAX() {
		//	doAJAX_func('getPodCount', 'handleGetPodCount(' + oAJAXEngine.js_global_varName + ')');
			populatePodContent();
		}
		
		register_AJAX_function("queueUpAJAX();");
		
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
					html += '<a href="' + _URL + '">' + _TITLE + '</a>';
					html += '</td>';
					html += '</tr>';
					articleNum++;
				}
			};

//	_alert(qObj);
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

							var dObj = $('div_podContent');
							if (!!dObj) {
								dObj.innerHTML += recentArticlesPod(_html) + paypalPod() + sampleAJAXAppsPod();
								doAJAX_func('getDownloadsMetaData', 'handleGetDownloadsMetaData(' + oAJAXEngine.js_global_varName + ')');
							}
							
			//	_alert(argsDict);
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTML(s_explainError);
							} else {
								_alert(s_explainError);
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

//	_alert(qObj);
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

			//				_alert('dirDict = [' + dirDict + ']');

			//	_alert(argsDict);
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTML(s_explainError);
							} else {
								_alert(s_explainError);
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
//	_alert('qData1 = [' + qData1 + ']');
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();
							
							html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
							qData1.iterateRecObjs(searchForDirData);
							html += '</table>';

							var dObj = $('div_podContent');
							if (!!dObj) {
								dObj.innerHTML += podLayoutHTML(html, js_downloadsTitle, '&td=' + 'align="center"'.URLEncode() + '&td=' + 'bgColor="##027FFF"'.URLEncode());
							}
							doAJAX_func('getCalendarMetaData', 'handleGetCalendarMetaData(' + oAJAXEngine.js_global_varName + ')');
			//	_alert(argsDict);
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTML(s_explainError);
							} else {
								_alert(s_explainError);
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
//	_alert('qData1 = [' + qData1 + ']');
						qData1.iterateRecObjs(anyErrorRecords);
						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();
							
							html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
							qData1.iterateRecObjs(searchForCalendarMetaData);
							html += '</table>';
							
							_alert('aDict = [' + aDict + ']');

							var dObj = $('div_podContent');
							if (!!dObj) {
								dObj.innerHTML += podLayoutHTML(html, js_calendarTitle, '&td=' + 'align="center"'.URLEncode() + '&td=' + 'bgColor="##027FFF"'.URLEncode());
							}
			//				doAJAX_func('getCalendarMetaData', 'handleGetCalendarMetaData(' + oAJAXEngine.js_global_varName + ')');
			//	_alert(argsDict);
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTML(s_explainError);
							} else {
								_alert(s_explainError);
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

//	_alert(qObj);
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
			//	_alert('podsDict = [' + podsDict + ']');
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
			//	_alert('qData2 = [' + qData2 + ']');
								} else {
									alert('ERROR: Programming Error - Missing the Query object that names the individual Pods.');
								}
							}
			//	_alert(argsDict);
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTML(s_explainError);
							} else {
								_alert(s_explainError);
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

//	_alert(qObj);
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
				//	_alert('pNum = [' + pNum + ']' + ', pTotal = [' + pTotal + ']' + ', pCent = [' + pCent + ']' + ', pWid = [' + pWid + ']');
								dObj.style.width = pWid + 'px';
								dObj.style.backgroundColor = 'lime';
								dObj.innerHTML = '<center><small>' + _pCent + '%</small></center>';

								doAJAX_func('getPodByName', 'handleGetPodByName(' + oAJAXEngine.js_global_varName + ')', 'podNum', pNum, 'podName', global_podsAR[pNum]);
							}
			//	_alert(argsDict);
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTML(s_explainError);
							} else {
								_alert(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
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
						<td width="70%" valign="top" style="border-right: thin dotted Silver;">
							<div id="div_articleContent"></div>
						</td>
						<td width="30%" valign="top" style="border-left: thin dotted Silver;">
							<div id="div_podContent"></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<div id="div_floatingContent" style="display: none;"></div>
		
</cfoutput>
