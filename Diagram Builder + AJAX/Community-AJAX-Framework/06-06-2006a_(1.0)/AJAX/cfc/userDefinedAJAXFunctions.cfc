<cfcomponent displayname="userDefinedAJAXFunctions" output="No" extends="ajaxCode">

	<cffunction name="retrievePodContentByName" access="public" returntype="string">
		<cfargument name="_aPodName_" type="any" required="yes">

		<cfsavecontent variable="_html">
			<cfoutput>
				<cfinclude template="/#ListFirst(CGI.SCRIPT_NAME, '/')#/includes/pods/#_aPodName_#">
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn _html>
	</cffunction>

	<cfscript>
		function getFirstWeekPAD(firstDOW) {
			var firstWeekPad = 0;
			var weekStartsOn = application.localeutils.weekStarts();
			switch (weekStartsON) {
				case 1:
					firstWeekPAD = firstDOW - 1;
				break;
				case 2:
					firstWeekPAD = firstDOW - 2;
					if (firstWeekPAD LT 0) firstWeekPAD = firstWeekPAD + 7; // handle leap years
				break;
				case 7:
					firstWeekPAD = 7 - abs(firstDOW - 7);
					if (firstWeekPAD EQ 7) firstWeekPAD = 0;
				break;
			}
			return firstWeekPAD;
		}

		function userDefinedAJAXFunctions(qryStruct) {
			if (IsDefined("qryStruct.sessid")) {
				Client.sessID = qryStruct.sessid; // force the proper session ID for the AJAX Server...
				super.readSessionFromDb();
			}

			switch (qryStruct.cfm) {
				case 'getCalendarMetaData':
					month = Month(Now());
					year = Year(Now());

					localizedDays = application.localeutils.getLocalizedDays();
					localizedMonth = application.localeutils.getLocalizedMonth(month);
					localizedYear = application.localeutils.getLocalizedYear(year);
					firstDay = createDate(year,month,1);
					firstDOW = dayOfWeek(firstDay);
					dim = daysInMonth(firstDay);
					firstWeekPAD = getFirstWeekPAD(firstDOW);
					lastMonth = dateAdd("m",-1,firstDay);
					nextMonth = dateAdd("m",1,firstDay);	
					dayList = application.blog.getActiveDays(year,month);
					dayCounter = 1;
					rowCounter = 1;

					qObj = QueryNew('id, localizedDays, localizedMonth, localizedYear, firstDay, firstDOW, daysInMonth, firstWeekPAD, lastMonth, nextMonth, dayList, dayCounter, rowCounter, isBIDI');
					QueryAddRow(qObj, 1);
					QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
					QuerySetCell(qObj, 'localizedDays', ArrayToList(localizedDays, ','), qObj.recordCount);
					QuerySetCell(qObj, 'localizedMonth', localizedMonth, qObj.recordCount);
					QuerySetCell(qObj, 'localizedYear', localizedYear, qObj.recordCount);
					QuerySetCell(qObj, 'firstDay', DateFormat(firstDay, 'mmmm d, yyyy') & ' ' & TimeFormat(firstDay, 'HH:mm:ss'), qObj.recordCount); // "December 17, 1995 03:24:00"
					QuerySetCell(qObj, 'firstDOW', firstDOW, qObj.recordCount);
					QuerySetCell(qObj, 'daysInMonth', dim, qObj.recordCount);
					QuerySetCell(qObj, 'firstWeekPAD', firstWeekPAD, qObj.recordCount);
					QuerySetCell(qObj, 'lastMonth', DateFormat(lastMonth, 'mmmm d, yyyy') & ' ' & TimeFormat(lastMonth, 'HH:mm:ss'), qObj.recordCount);
					QuerySetCell(qObj, 'nextMonth', DateFormat(nextMonth, 'mmmm d, yyyy') & ' ' & TimeFormat(nextMonth, 'HH:mm:ss'), qObj.recordCount);
					QuerySetCell(qObj, 'dayList', dayList, qObj.recordCount);
					QuerySetCell(qObj, 'dayCounter', dayCounter, qObj.recordCount);
					QuerySetCell(qObj, 'rowCounter', rowCounter, qObj.recordCount);
					QuerySetCell(qObj, 'isBIDI', application.localeutils.isBIDI(), qObj.recordCount);
					registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
				break;

				case 'getDownloadsFolder':
					if (IsDefined("qryStruct.namedArgs.folderName")) {
						cf_directory('Request.qDir', qryStruct.namedArgs.folderName, '*', false);
			//			writeOutput(cf_dump(Request.qDir, 'Request.qDir [#qryStruct.namedArgs.folderName#]', false));
						if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) ) {
							registerQueryFromAJAX(Request.qDir); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						} else if (Request.directoryError) {
							qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', Request.directoryErrorMsg & ',' & Request.directoryFullErrorMsg & ',' & Request.directoryPlainErrorMsg & ', directoryError = [#Request.directoryError#], folderName = [#qryStruct.namedArgs.folderName#]', qObj.recordCount);
							QuerySetCell(qObj, 'moreErrorMsg', Request.directoryFullErrorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
							QuerySetCell(qObj, 'isPKviolation', false, qObj.recordCount);
							registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (folderName) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'getDownloadsMetaData':
					path = GetDirectoryFromPath(CGI.CF_TEMPLATE_PATH);
					while (NOT (ListLast(path, '\') IS ListFirst(CGI.SCRIPT_NAME, '/'))) {
						path = ListDeleteAt(path, ListLen(path, '\'), '\');
						if (Len(path) eq 0) {
							break;
						}
					}
					
					cf_directory('Request.qDir', path, 'downloads_*', false);
					if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) AND (Request.qDir.recordCount gt 0) ) {
						_sql_statement = "SELECT * FROM Request.qDir WHERE (TYPE = 'Dir') AND (NAME LIKE 'downloads_%')";
						safely_execSQL('Request.qDir2', '', _sql_statement);
						if (NOT Request.dbError) {
							registerQueryFromAJAX(Request.qDir2); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
							QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
							registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					} else {
						qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', Request.directoryErrorMsg & ',' & Request.directoryFullErrorMsg & ', path = [#path#]', qObj.recordCount);
						QuerySetCell(qObj, 'moreErrorMsg', Request.directoryFullErrorMsg, qObj.recordCount);
						QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
						QuerySetCell(qObj, 'isPKviolation', false, qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'getRecentArticles':
					params = structNew();
					params.maxEntries = 10;
					params.lastXDays = 20;
					_i = 1;
					_k = -1;
					recentIDs = "";
					for (_iCount = 1; _iCount lte 15; _iCount = _iCount + 1) {
						Request.entries = application.blog.getEntries(duplicate(params));
						for (_k = 1; _k lte Request.entries.recordCount; _k = _k + 1) {
							if (ListFindNoCase(recentIDs, Request.entries.id[_k], ",") eq 0) {
								recentIDs = ListAppend(recentIDs, Request.entries.id[_k], ",");
								_i = _i + 1;
								if (_i gte params.maxEntries) {
									break;
								}
							}
						}
						if ( (Request.entries.recordCount gt 5) OR (_i gte params.maxEntries) ) {
							break;
						}
						params.lastXDays = params.lastXDays + 20;
					}

					_sql_statement = "SELECT ID, TITLE, '' as URL FROM Request.entries";
					safely_execSQL('Request.entries2', '', _sql_statement);
					if (NOT Request.dbError) {
						for (i = 1; i lte Request.entries2.recordCount; i = i + 1) {
							Request.entries2.URL[i] = application.blog.makeLink(Request.entries2.id[i]);
						}
						registerQueryFromAJAX(Request.entries2); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					} else {
						qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
						QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
						QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
						QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'getPodByName':
					if ( (IsDefined("qryStruct.namedArgs.podNum")) AND (IsDefined("qryStruct.namedArgs.podName")) ) {
						_html = retrievePodContentByName(qryStruct.namedArgs.podName);

						qObj = QueryNew('id, podNum, podName, podContent');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'podNum', qryStruct.namedArgs.podNum, qObj.recordCount);
						QuerySetCell(qObj, 'podName', qryStruct.namedArgs.podName, qObj.recordCount);
						QuerySetCell(qObj, 'podContent', _html, qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						errorDetails = '';
						if (NOT IsDefined("qryStruct.namedArgs.podNum")) {
							errorDetails = errorDetails & 'podNum';
						}
						if (NOT IsDefined("qryStruct.namedArgs.podName")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'podName';
						}
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (#errorDetails#) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'getPodCount':
					pName = GetDirectoryFromPath(ExpandPath('/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/includes/pods/' & '*.*'));
					cf_directory('Request.qDir', pName, '*.cfm', false);
					if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) AND (Request.qDir.recordCount gt 0) ) {
						qObj = QueryNew('id, podCount');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'podCount', Request.qDir.recordCount, qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...

					//	registerQueryFromAJAX(Request.qDir); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...

						_sql_statement = "SELECT NAME FROM Request.qDir ORDER BY NAME";
						safely_execSQL('Request.qDir2', '', _sql_statement);
						if (NOT Request.dbError) {
							registerQueryFromAJAX(Request.qDir2); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
							QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
							registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					} else {
						qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', Request.directoryErrorMsg & ',' & Request.directoryFullErrorMsg & ', pName = [#pName#]', qObj.recordCount);
						QuerySetCell(qObj, 'moreErrorMsg', Request.directoryFullErrorMsg, qObj.recordCount);
						QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
						QuerySetCell(qObj, 'isPKviolation', false, qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

		//		case 'getWaferListFromDb':
		//			_sql_statement = "SELECT id, waferName FROM Wafers ORDER BY waferName";
		//			safely_execSQL('Request.qGetWaferListFromDb', Request.DSN, _sql_statement);
		//			if (NOT Request.dbError) {
		//				registerQueryFromAJAX(Request.qGetWaferListFromDb); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
		//			} else {
		//				qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
		//				QueryAddRow(qObj, 1);
		//				QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
		//				QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
		//				QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
		//				QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
		//				QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
		//				registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
		//			}
		//		break;
			}
		}
	</cfscript>
</cfcomponent>
