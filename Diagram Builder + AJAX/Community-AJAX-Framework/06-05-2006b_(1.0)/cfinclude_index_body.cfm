<cfoutput>
	<cfscript>
		logoImage = Request.commonCode.clusterizeURL('http://#CGI.SERVER_NAME#/blog/includes/cfcontent_img.cfm?imageName=../images/Yes02b1a187x171.jpg');
		
		searchTitle = application.resourceBundle.getResource("search");
		noRecentEntries = application.resourceBundle.getResource("norecententries");
	</cfscript>

	<script language="JavaScript1.2" type="text/javascript">
	<!--
		var js_searchTitle = '#searchTitle#';
		var js_noRecentEntries = '#noRecentEntries#';
		
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
								dObj.innerHTML += _html;
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
