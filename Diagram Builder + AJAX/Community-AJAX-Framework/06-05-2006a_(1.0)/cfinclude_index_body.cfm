<cfoutput>
	<script language="JavaScript1.2" type="text/javascript">
	<!--
		function queueUpAJAX() {
			doAJAX_func('getPodCount', 'handleGetPodCount(' + oAJAXEngine.js_global_varName + ')');
		}
		
		register_AJAX_function("queueUpAJAX();");
		
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
									var dObj = $('div_podContent');
									if (!!dObj) {
										var hRef = window.location.href;
										var arP = hRef.split('?');
										var arH = arP[0].split('/');
										arH[arH.length - 1] = 'blog/getPodsContent.cfm';
										arP[0] = arH.join('/');
										var hRef2 = arP.join('?');
										hRef2 += ((arP.length > 1) ? '&' : '?') + 'podsList=' + global_podsAR.toString().URLEncode();
								//		_alert('hRef = [' + hRef + ']');
								//		_alert('hRef2 = [' + hRef2 + ']');
										var cH = clientHt$();
										html = '<iframe id="iframe_podContent" frameborder="1" scrolling="Auto" height="' + (cH - 50) + 'px" width="100%" src="' + hRef2 + '"></iframe>';
										dObj.innerHTML = html;
									}
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
