<!--- BEGIN: This block of code sets-up the Request.qryObj which is a ColdFusion Query Object that holds the parms from the AJAX call --->
<!--- Request.qryStruct also contains the variables that were passed-in from the caller... --->
<cfinclude template="cfinclude_AJAX_Begin.cfm">
<!--- END! This block of code sets-up the Request.qryObj which is a ColdFusion Query Object that holds the parms from the AJAX call --->

<!--- This is where you may code your ColdFusion code that processes the AJAX Function --->
<cfif (IsDefined("Request.qryStruct.cfm"))>
	<cfscript>
		bool_onChangeSubMenu = false;
		Request.qryStruct.namedArgs = StructNew();
		if (IsDefined("Request.qryStruct.argCnt")) {
			for (i = 1; i lte Request.qryStruct.argCnt; i = i + 2) {
				argName = Request.qryStruct['arg' & i];
				argVal = Request.qryStruct['arg' & (i + 1)];
				Request.qryStruct.namedArgs[argName] = argVal;
			}
		}
		switch (Request.qryStruct.cfm) {
			case 'processMetricsFile':
				if (IsDefined("Request.qryStruct.namedArgs.metricsFileName")) {
					if (FileExists(Request.qryStruct.namedArgs.metricsFileName)) {
						// read the INI file and the Metrics file and pass data back to caller...
						Request.commonCode.cf_file('READ', Request.qryStruct.namedArgs.metricsFileName, 'Request.metricsData');
						// look for the .INI file and read it...
						arFN = ListToArray(Request.qryStruct.namedArgs.metricsFileName, '\');
						n_arFN = ArrayLen(arFN);
						if (n_arFN gt 1) {
							bool_doneReadingMetricsData = false;
						//	qObj = QueryNew('id, debugContent');

							i = 2;
							tFolderName = arFN[1] & '\' & arFN[2] & '\';
							for (i = i + 1; i lte n_arFN; i = i + 1) {
								if (NOT bool_doneReadingMetricsData) {
									Request.commonCode.cf_directory('Request.qDir', tFolderName, '*.ini', false);
									if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) AND (Request.qDir.recordCount gt 0) ) {
									//	aContentStruct = Request.commonCode.processComplexHTMLContent(Request.commonCode.cfdump(Request.qDir, 'Request.qDir', false));
	
									//	QueryAddRow(qObj, 1);
									//	QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									//	QuerySetCell(qObj, 'debugContent', URLEncodedFormat(aContentStruct.htmlContent), qObj.recordCount);
										
										iniFileName = tFolderName & Request.qDir.name;
										structINI = GetProfileSections(iniFileName);
									//	aContentStruct2 = Request.commonCode.processComplexHTMLContent(Request.commonCode.cfdump(structINI, 'structINI', false));
	
									//	QueryAddRow(qObj, 1);
									//	QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									//	QuerySetCell(qObj, 'debugContent', URLEncodedFormat(aContentStruct2.htmlContent), qObj.recordCount);
										
										metricsStruct = StructNew();
										if (IsStruct(structINI)) {
											mainKeysAR = ListToArray(structINI['main'], ',');
										//	aContentStruct3 = Request.commonCode.processComplexHTMLContent(Request.commonCode.cfdump(mainKeysAR, 'mainKeysAR', false));
	
										//	QueryAddRow(qObj, 1);
										//	QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
										//	QuerySetCell(qObj, 'debugContent', URLEncodedFormat(aContentStruct3.htmlContent), qObj.recordCount);
											
											for (k = 1; k lte ArrayLen(mainKeysAR); k = k + 1) {
												anItem = GetProfileString(iniFileName, 'main', mainKeysAR[k]);
												
												metricsStruct['main'][mainKeysAR[k]] = anItem;
	
											//	QueryAddRow(qObj, 1);
											//	QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
											//	QuerySetCell(qObj, 'debugContent', URLEncodedFormat('anItem (#mainKeysAR[k]#) = [#anItem#]<br>'), qObj.recordCount);
											}
											
											num_dies = metricsStruct['main']['number_of_dies'];
											num_points = metricsStruct['main']['points_per_die'];
											for (dieNum = 0; dieNum lt num_dies; dieNum = dieNum + 1) {
												for (ptNum = 0; ptNum lt num_points; ptNum = ptNum + 1) {
													keysAR = ListToArray(structINI['#dieNum#.#ptNum#'], ',');
													for (k = 1; k lte ArrayLen(keysAR); k = k + 1) {
														anItem = GetProfileString(iniFileName, '#dieNum#.#ptNum#', keysAR[k]);
														metricsStruct['#dieNum#.#ptNum#'][keysAR[k]] = anItem;
													}
												}
											}
										}

									//	aContentStruct4 = Request.commonCode.processComplexHTMLContent(Request.commonCode.cfdump(metricsStruct, 'metricsStruct', false));
	
									//	QueryAddRow(qObj, 1);
									//	QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									//	QuerySetCell(qObj, 'debugContent', URLEncodedFormat(aContentStruct4.htmlContent), qObj.recordCount);
										
									//	Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
										
										bool_doneReadingMetricsData = true;
										break;
									} else {
										Request.metricsData = '(No INI File can be found in [#tFolderName#].) ' & chr(10) & Request.metricsData;
									}
									tFolderName = tFolderName & arFN[i] & '\';
								}
							}
							metricsDataAR = ListToArray(Request.metricsData, Chr(10));
						//	Request.commonCode.cf_dump(metricsDataAR, 'metricsDataAR', false);
							for (i = 1; i lte ArrayLen(metricsDataAR); i = i + 1) {
								newAR = ArrayNew(1);
								ar = ListToArray(Trim(metricsDataAR[i]), ' ');
								chNum = 1;
								for (j = 1; j lte ArrayLen(ar); j = j + 1) {
									ar[j] = Trim(ar[j]);
									if (Len(ar[j]) gt 0) {
										newAR[chNum] = ar[j];
										chNum = chNum + 1;
									}
								}
								metricsDataAR[i] = newAR;
							}
						} else {
							Request.metricsData = '(No INI File can be found.) ' & chr(10) & Request.metricsData;
						}
						if (NOT Request.fileError) {
							keys = StructKeyList(metricsStruct['main'], ',');
							keysAR = ListToArray(keys, ',');
							kiN = ArrayLen(keysAR);
							qObj = QueryNew('id, #keys#');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							for (i = 1; i lte kiN; i = i + 1) {
								QuerySetCell(qObj, keysAR[i], metricsStruct['main'][keysAR[i]], qObj.recordCount);
							}
							Request.commonCode.cf_dump(qObj, 'qObj', false);
							Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
							
							keys = StructKeyList(metricsStruct[0.0], ',');
							keysAR = ListToArray(keys, ',');
							kiN = ArrayLen(keysAR);
							qObj = QueryNew('id, dieNum, ptNum, #keys#, channel1, channel2, channel3, channel4, channel5, channel6, channel7, channel8, channel9');

						//	Request.commonCode.cf_dump(metricsStruct[0.0], 'metricsStruct[0.0]', false);
						//	Request.commonCode.cf_dump(keysAR, 'keysAR', false);
							
							num_dies = metricsStruct['main']['number_of_dies'];
							num_points = metricsStruct['main']['points_per_die'];
							for (dieNum = 0; dieNum lt num_dies; dieNum = dieNum + 1) {
								for (ptNum = 0; ptNum lt num_points; ptNum = ptNum + 1) {
									QueryAddRow(qObj, 1);
									QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									QuerySetCell(qObj, 'dieNum', dieNum, qObj.recordCount);
									QuerySetCell(qObj, 'ptNum', ptNum, qObj.recordCount);
									for (ki = 1; ki lte kiN; ki = ki + 1) {
										try {
											QuerySetCell(qObj, keysAR[ki], metricsStruct['#dieNum#.#ptNum#'][keysAR[ki]], qObj.recordCount);
										} catch (Any e) {
											Request.commonCode.cf_dump(e, 'CF Error [#keysAR[ki]#]', false);
											Request.commonCode.cf_dump(metricsStruct['#dieNum#.#ptNum#'], "metricsStruct['#dieNum#.#ptNum#']", false);
										}
									}

									anAR = metricsDataAR[qObj.recordCount];
									for (chNum = 1; chNum lte ArrayLen(anAR); chNum = chNum + 1) {
										QuerySetCell(qObj, 'channel#chNum#', anAR[chNum], qObj.recordCount);
									}
								}
							}
							Request.commonCode.cf_dump(qObj, 'qObj', false);

							Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', 'Cannot read file named (#Request.qryStruct.namedArgs.metricsFileName#) for #Request.qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
							Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', 'Missing file named (#Request.qryStruct.namedArgs.metricsFileName#) for #Request.qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				} else {
					qObj = QueryNew('id, errorMsg');
					QueryAddRow(qObj, 1);
					QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
					QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (metricsFileName) for #Request.qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
					Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
				}
			break;

			case 'processPythonFile':
				if (IsDefined("Request.qryStruct.namedArgs.pythonFileName")) {
					if (FileExists(Request.qryStruct.namedArgs.pythonFileName)) {
						err_someCode = false;
						err_someCodeMsg = '';
						try {
						   Request.pythonCode = CreateObject("component", ListFirst(CGI.SCRIPT_NAME, '/') & ".cfc.pythonInterpreter").init(Request.qryStruct.namedArgs.pythonFileName);
						} catch(Any e) {
							err_someCode = true;
							err_someCodeMsg = '(1) The pythonInterpreter component has NOT been created. | Reason: [#e.message#] [#e.detail#]';
						}
						if (err_someCode) {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', '(#err_someCodeMsg#) for #Request.qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
							Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
						//	aContentStruct = Request.commonCode.processComplexHTMLContent(Request.commonCode.cfdump(Request.pythonCode.vars, 'Request.pythonCode.vars', false));
						//	data = URLEncodedFormat(aContentStruct.htmlContent);
						
							aContentStruct = Request.commonCode.processComplexHTMLContent(Request.commonCode.cfdump(Request.pythonCode.pythonVars, 'Request.pythonCode.pythonVars', false));
							data = URLEncodedFormat(aContentStruct.htmlContent);
						
						//	data = Request.pythonCode.linesOfCodeAsHTML();

							qObj = QueryNew('id, statusMsg, scopeContents');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'statusMsg', 'Nominal', qObj.recordCount);
							QuerySetCell(qObj, 'scopeContents', data, qObj.recordCount);
							Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', 'Missing file named (#Request.qryStruct.namedArgs.pythonFileName#) for #Request.qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				} else {
					qObj = QueryNew('id, errorMsg');
					QueryAddRow(qObj, 1);
					QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
					QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (pythonFileName) for #Request.qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
					Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
				}
			break;

			case 'getDiskDirectory':
				if (IsDefined("Request.qryStruct.namedArgs.driveLetter")) {
					Request.commonCode.cf_directory('Request.qDir', Request.qryStruct.namedArgs.driveLetter, '*', false);
		
					if (NOT Request.directoryError) {
						SetProfileString(ExpandPath(ReplaceNoCase(CGI.SCRIPT_NAME, '.cfm', '.ini')), 'Defaults', 'driveLetter', Request.qryStruct.namedArgs.driveLetter);
						Request.commonCode.registerQueryFromAJAX(Request.qDir); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', Request.directoryErrorMsg, qObj.recordCount);
						Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				} else {
					qObj = QueryNew('id, errorMsg');
					QueryAddRow(qObj, 1);
					QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
					QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (driveLetter) for #Request.qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
					Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
				}
			break;

			case 'getData':
				Request.dbError = false;
			//	_sql_statement = "sp_columns @table_name = 'AvnLayer', @table_owner = 'dbo'";
			//	Request.commonCode.safely_execSQL('Request.qGetLayerEditorMetaData', Request.DSN, _sql_statement);
	
				if (NOT Request.dbError) {
					qObj = QueryNew('id, status');
					QueryAddRow(qObj, 1);
					QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
					QuerySetCell(qObj, 'status', -1, qObj.recordCount);
					Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
				} else {
					qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
					QueryAddRow(qObj, 1);
					QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
					QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
					QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
					QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
					QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
					Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
				}
			break;
		}
	</cfscript>
<cfelse>
	<cfoutput>
		bool_canDebugHappen = [#bool_canDebugHappen#]<br>
		<cfdump var="#URL#" label="URL Scope" expand="No">
		<cfdump var="#FORM#" label="FORM Scope" expand="No">
		<cfdump var="#CGI#" label="CGI Scope" expand="No">
	</cfoutput>
</cfif>
<!--- the name of the cfm page is stored in the following variable: Request.qryObj.NAME["cfm"] --->

<!--- BEGIN: This block of code passes the Request.qryObj which is a ColdFusion Query Object back to the AJAX caller via a JavaScript object called qObj --->
<cfinclude template="cfinclude_AJAX_End.cfm">
<!--- END! This block of code passes the Request.qryObj which is a ColdFusion Query Object back to the AJAX caller via a JavaScript object called qObj --->
