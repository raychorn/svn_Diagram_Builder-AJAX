<cfcomponent displayname="userDefinedAJAXFunctions" output="No" extends="ajaxCode">

	<cfinclude template="../../../includes/cfinclude_encryptionSupport.cfm">
	<cfinclude template="../../../includes/cfinclude_invalidEmailDomains.cfm">
	
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
		
		function getCategoryIDFromName(catName) {
			sqlStatement = "select categoryid from tblblogcategories where categoryname = '#catName#' and blog = '#application.blog.instance.name#'";
			safely_execSQL('Request.getCatID', application.blog.instance.dsn, sqlStatement);

			if (NOT Request.dbError) {
				return Request.getCatID.categoryid;
			} else {
				return '';
			}
		}
		
		function getBlogArticles(params, qryStruct) {
			var i = -1;
			var sMsg = '';
			var qObj = -1;
			var allowTB = -1;
			var postedat = -1;
			var postedby = -1;
			var ar_ROWID = -1;
			var maxEntries = -1;
			var sqlStatement = -1;
			var ar_POSTEDLONG = -1;
			var relatedcategories = -1;
			
			if ( (IsStruct(params)) AND (IsStruct(qryStruct)) ) {
				if (IsDefined("params.lastXDays")) {
					try {
						Request.articles = application.blog.getEntries(params);
						while (Request.articles.recordCount eq 0) {
							params.lastXDays = params.lastXDays + 30;
							if (params.lastXDays gt 360) {
								break;
							}
							Request.articles = application.blog.getEntries(params);
						}
					} catch (Any e) {
					}
				} else {
					Request.articles = application.blog.getEntries(params);
				}
				maxEntries = -1;
				if ( (IsDefined("qryStruct.namedArgs.maxEntries")) AND (IsNumeric(qryStruct.namedArgs.maxEntries)) ) {
					maxEntries = qryStruct.namedArgs.maxEntries;
				}
	
				ar_POSTEDLONG = ArrayNew(1);
				for (i = 1; i lte Request.articles.recordCount; i = i + 1) {
					ar_POSTEDLONG[ArrayLen(ar_POSTEDLONG) + 1] = application.localeUtils.datetimeLocaleFormat(Request.articles.POSTED[i], "long", "long");
				}
				QueryAddColumn(Request.articles, 'POSTEDLONG', 'Time', ar_POSTEDLONG);
					
				if ( (maxEntries gt -1) AND (Request.articles.recordCount gt maxEntries) ) {
					ar_ROWID = ArrayNew(1);
					for (i = 1; i lte Request.articles.recordCount; i = i + 1) {
						ar_ROWID[ArrayLen(ar_ROWID) + 1] = i;
					}
					QueryAddColumn(Request.articles, 'ROWID', 'integer', ar_ROWID);
	
					sqlStatement = "SELECT * FROM Request.articles WHERE (ROWID <= #maxEntries#)";
					safely_execSQL('Request.articles2', '', sqlStatement);
	
					if (NOT Request.dbError) {
						for (i = 1; i lte Request.articles2.recordCount; i = i + 1) {
							Request.articles2.posted[i] = application.localeUtils.dateLocaleFormat(Request.articles2.posted[i]);
							Request.articles2.body[i] = application.blog.renderEntry(Request.articles2.body[i]);
						}
						registerQueryFromAJAX(Request.articles2); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
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
					for (i = 1; i lte Request.articles.recordCount; i = i + 1) {
						Request.articles.posted[i] = application.localeUtils.dateLocaleFormat(Request.articles.posted[i]);
						Request.articles.body[i] = application.blog.renderEntry(Request.articles.body[i]);
					}
					registerQueryFromAJAX(Request.articles); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
				}
	
				allowTB = application.blog.getProperty("allowtrackbacks");
				postedat = application.resourceBundle.getResource("postedat");
				postedby = application.resourceBundle.getResource("postedby");
				relatedcategories = application.resourceBundle.getResource("relatedcategories");
	
				qObj = QueryNew('id, allowTB, postedat, postedby, relatedcategories');
				QueryAddRow(qObj, 1);
				QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
				QuerySetCell(qObj, 'allowTB', allowTB, qObj.recordCount);
				QuerySetCell(qObj, 'postedat', postedat, qObj.recordCount);
				QuerySetCell(qObj, 'postedby', postedby, qObj.recordCount);
				QuerySetCell(qObj, 'relatedcategories', relatedcategories, qObj.recordCount);
				registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
			} else {
				qObj = QueryNew('id, errorMsg');
				QueryAddRow(qObj, 1);
				QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
				sMsg = '';
				if (NOT IsStruct(params)) {
					sMsg = sMsg & 'params';
				}
				if (NOT IsStruct(qryStruct)) {
					if (Len(sMsg) gt 0) {
						sMsg = sMsg & ' and ';
					}
					sMsg = sMsg & 'qryStruct';
				}
				QuerySetCell(qObj, 'errorMsg', 'Invalid parm named (#sMsg#) for getBlogArticles() in #CGI.SCRIPT_NAME#.', qObj.recordCount);
				registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
			}
		}
		
		function getBlogArticleComments(id) {
			var i = -1;
			var _http = -1;
			var ar_ISURLVALID = -1;
			var ar_POSTEDSHORT = -1;
			
			Request.comments = application.blog.getComments(id);
			for (i = 1; i lte Request.comments.recordCount; i = i + 1) {
				Request.comments.comment[i] = paragraphFormat2(Request.comments.comment[i]);
				Request.comments.posted[i] = application.localeUtils.timeLocaleFormat(Request.comments.posted[i]);
			}
			ar_ISURLVALID = ArrayNew(1);
			ar_POSTEDSHORT = ArrayNew(1);
			for (i = 1; i lte Request.comments.recordCount; i = i + 1) {
				_http = cf_http(Request.comments.website[i]);
				ar_ISURLVALID[ArrayLen(ar_ISURLVALID) + 1] = (Trim(_http.Statuscode) IS "200 OK");
				ar_POSTEDSHORT[ArrayLen(ar_POSTEDSHORT) + 1] = application.localeUtils.dateLocaleFormat(Request.comments.posted[i],"short");
			}
			QueryAddColumn(Request.comments, 'ISURLVALID', 'Bit', ar_ISURLVALID);
			QueryAddColumn(Request.comments, 'POSTEDSHORT', 'VarChar', ar_POSTEDSHORT);
			registerQueryFromAJAX(Request.comments); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
		}
		
		function getBlogArticleTrackbacks(id) {
			var i = -1;
			var ar_CREATEDSHORT  = -1;
			
			Request.trackbacks = application.blog.getTrackBacks(id);
			for (i = 1; i lte Request.trackbacks.recordCount; i = i + 1) {
				Request.trackbacks.EXCERPT[i] = paragraphFormat2(Request.trackbacks.EXCERPT[i]);
				Request.trackbacks.CREATED[i] = application.localeUtils.timeLocaleFormat(Request.trackbacks.CREATED[i]);
			}
			ar_CREATEDSHORT = ArrayNew(1);
			for (i = 1; i lte Request.trackbacks.recordCount; i = i + 1) {
				ar_CREATEDSHORT[ArrayLen(ar_CREATEDSHORT) + 1] = application.localeUtils.dateLocaleFormat(Request.trackbacks.CREATED[i],"short");
			}
			QueryAddColumn(Request.trackbacks, 'CREATEDSHORT', 'VarChar', ar_CREATEDSHORT);
			registerQueryFromAJAX(Request.trackbacks); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
		}

		function userDefinedAJAXFunctions(qryStruct) {
			if (IsDefined("qryStruct.sessid")) {
			//	Client.sessID = qryStruct.sessid; // force the proper session ID for the AJAX Server...
				super.readSessionFromDb(qryStruct.sessid);
			}

			cf_currentBlogName = 'default';
			if (IsDefined("Session.persistData.blogname")) {
				cf_currentBlogName = Session.persistData.blogname;
			}

			switch (qryStruct.cfm) {
				case 'performContactUsAction':
					if ( (IsDefined("qryStruct.namedArgs.emailAddress")) AND (IsDefined("qryStruct.namedArgs.emailMessage")) AND (IsDefined("qryStruct.namedArgs.toEmailAddrs")) ) { 
						safely_cfmail(qryStruct.namedArgs.toEmailAddrs, qryStruct.namedArgs.emailAddress, 'ezAJAX(tm) Site Visitor EMail from (#qryStruct.namedArgs.emailAddress#)', qryStruct.namedArgs.emailMessage);
						if (NOT Request.anError) {
							qObj = QueryNew('ID, status');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'STATUS', 1, qObj.recordCount);
							registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
							registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						errorDetails = '';
						if (NOT IsDefined("qryStruct.namedArgs.emailAddress")) {
							errorDetails = errorDetails & 'emailAddress';
						}
						if (NOT IsDefined("qryStruct.namedArgs.emailMessage")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'emailMessage';
						}
						if (NOT IsDefined("qryStruct.namedArgs.toEmailAddrs")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'toEmailAddrs';
						}
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm(s) named (#errorDetails#) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;
				
				case 'changeBlogDesignation':
					if (IsDefined("qryStruct.namedArgs.blogname")) { 
						bool_isError = false;
						errorMsg = '';
						try {
							application.blog = application.blog.init(qryStruct.namedArgs.blogname);
						} catch (Any e) {
							bool_isError = true;
							errorMsg = explainError(e, false);
						}
						if (NOT bool_isError) {
							Session.persistData.blogname = qryStruct.namedArgs.blogname;
							commitSessionToDb();

							qObj = QueryNew('ID, BLOGNAME');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'BLOGNAME', qryStruct.namedArgs.blogname, qObj.recordCount);
							registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', errorMsg, qObj.recordCount);
							registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						errorDetails = '';
						if (NOT IsDefined("qryStruct.namedArgs.blogname")) {
							errorDetails = errorDetails & 'blogname';
						}
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm(s) named (#errorDetails#) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;
				
				case 'getActualUsersOnline':
					diffT = 1;
					periodT = (Minute(Now()) / 10);
					if ((periodT MOD 2) eq 0) {
						diffT = -1;
					}
					
					instance = application.blog.instance;
					
					usersNowOnline = 0;
					_sqlStatement = "SELECT COUNT(id) as cnt FROM tblUsersSession";
					safely_execSQL('Request.qCountUsersSessions', instance.dsn, _sqlStatement);

					if ( (NOT Request.dbError) AND (IsQuery(Request.qCountUsersSessions)) AND (Request.qCountUsersSessions.recordCount gt 0) AND (Request.qCountUsersSessions.cnt gt 0) ) {
						usersNowOnline = Request.qCountUsersSessions.cnt;
					}
					
					xx1 = 'There are currently #Ceiling((Hour(Now()) * 60) + ((diffT * 5) * periodT))#/#usersNowOnline# Users Online as of ';
					xx2 = '<div id="div_actualUsersOnlineStats0">#DateFormat(Now(), "full")# #TimeFormat(Now(), "full")#</div>';

					qObj = QueryNew('ID, actualUsersOnline');
					QueryAddRow(qObj, 1);
					QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
					QuerySetCell(qObj, 'actualUsersOnline', xx1 & xx2, qObj.recordCount);
					registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
				break;
				
				case 'performSubmitForgotPasswordForm':
					if (IsDefined("qryStruct.namedArgs.username")) { 
						_bool = performForgotPasswordAction(qryStruct.namedArgs.username);
						bool = 0;
						if (_bool) {
							bool = 1;
						}
						if ( (NOT Request.dbError) AND (NOT Request.anError) ) {
							qObj = QueryNew('ID, ISFORGOTPASSWORD');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'ISFORGOTPASSWORD', bool, qObj.recordCount);
							registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						} else if (Request.dbError) {
							qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
							QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
							registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						} else if (Request.anError) {
							qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
							QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
							QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
							registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						errorDetails = '';
						if (NOT IsDefined("qryStruct.namedArgs.username")) {
							errorDetails = errorDetails & 'username';
						}
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm(s) named (#errorDetails#) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'performUserLogoffAction':
					retireUserSessionUponLogoff();
					structDelete(session,"loggedin");
					StructDelete(Session.persistData, 'qAuthUser');
					Session.persistData.loginFailure = 0;
					session.persistData.loggedin = cf_userlogout();
					commitSessionToDb();
					
					_loggedin = 1;
					if (NOT session.persistData.loggedin) {
						_loggedin = 0;
					}

					qObj = QueryNew('ID, ISVALID, PASSWORD, PREMIUMDATE, RENEWALFEE, UNAME, UROLE, USERNAME, LOGGEDIN');
					QueryAddRow(qObj, 1);
					QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
					QuerySetCell(qObj, 'ISVALID', 0, qObj.recordCount);
					QuerySetCell(qObj, 'PASSWORD', '', qObj.recordCount);
					QuerySetCell(qObj, 'PREMIUMDATE', '', qObj.recordCount);
					QuerySetCell(qObj, 'RENEWALFEE', 0, qObj.recordCount);
					QuerySetCell(qObj, 'UNAME', '', qObj.recordCount);
					QuerySetCell(qObj, 'UROLE', '', qObj.recordCount);
					QuerySetCell(qObj, 'USERNAME', '', qObj.recordCount);
					QuerySetCell(qObj, 'LOGGEDIN', _loggedin, qObj.recordCount);
					registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
				break;

				case 'performSubmitLoginForm':
					if ( (IsDefined("qryStruct.namedArgs.username")) AND (IsDefined("qryStruct.namedArgs.password")) ) { 
						performUserLogin(qryStruct.namedArgs.username, qryStruct.namedArgs.password);

						if (NOT Request.dbError) {
							if (IsDefined("Session.persistdata.QAUTHUSER")) {
								commitSessionToDb();

								sqlStatement = "select *, 0 as LOGGEDIN from Session.persistdata.QAUTHUSER where ISVALID = 1";
								safely_execSQL('Request.QAUTHUSER', '', sqlStatement);
					
								if (NOT Request.dbError) {
									Request.QAUTHUSER.LOGGEDIN[1] = 0;
									if ( (IsDefined("Session.persistdata.LOGGEDIN")) AND (IsBoolean(Session.persistdata.LOGGEDIN)) ) {
										if (Session.persistdata.LOGGEDIN) {
											Request.QAUTHUSER.LOGGEDIN[1] = 1;
										}
									}
									registerQueryFromAJAX(Request.QAUTHUSER); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
								} else {
									qObj = QueryNew('ID, ISVALID, PASSWORD, PREMIUMDATE, RENEWALFEE, UNAME, UROLE, USERNAME, LOGGEDIN');
									QueryAddRow(qObj, 1);
									QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
									QuerySetCell(qObj, 'ISVALID', 0, qObj.recordCount);
									QuerySetCell(qObj, 'PASSWORD', '', qObj.recordCount);
									QuerySetCell(qObj, 'PREMIUMDATE', '', qObj.recordCount);
									QuerySetCell(qObj, 'RENEWALFEE', 0, qObj.recordCount);
									QuerySetCell(qObj, 'UNAME', '', qObj.recordCount);
									QuerySetCell(qObj, 'UROLE', '', qObj.recordCount);
									QuerySetCell(qObj, 'USERNAME', '', qObj.recordCount);
									QuerySetCell(qObj, 'LOGGEDIN', 0, qObj.recordCount);
									registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
								}
							} else {
								qObj = QueryNew('ID, ISVALID, PASSWORD, PREMIUMDATE, RENEWALFEE, UNAME, UROLE, USERNAME, LOGGEDIN');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'ISVALID', 0, qObj.recordCount);
								QuerySetCell(qObj, 'PASSWORD', '', qObj.recordCount);
								QuerySetCell(qObj, 'PREMIUMDATE', '', qObj.recordCount);
								QuerySetCell(qObj, 'RENEWALFEE', 0, qObj.recordCount);
								QuerySetCell(qObj, 'UNAME', '', qObj.recordCount);
								QuerySetCell(qObj, 'UROLE', '', qObj.recordCount);
								QuerySetCell(qObj, 'USERNAME', '', qObj.recordCount);
								QuerySetCell(qObj, 'LOGGEDIN', 0, qObj.recordCount);
								registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
							}
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
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						errorDetails = '';
						if (NOT IsDefined("qryStruct.namedArgs.username")) {
							errorDetails = errorDetails & 'username';
						}
						if (NOT IsDefined("qryStruct.namedArgs.password")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'password';
						}
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm(s) named (#errorDetails#) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'performSubmitRegisterForm':
					if ( (IsDefined("qryStruct.namedArgs.username")) AND (IsDefined("qryStruct.namedArgs.yourname")) AND (IsDefined("qryStruct.namedArgs.password")) AND (IsDefined("qryStruct.namedArgs.confirmpassword")) ) { 
						if (qryStruct.namedArgs.password eq qryStruct.namedArgs.confirmpassword) {
							performUserRegistration(qryStruct.namedArgs.username, qryStruct.namedArgs.yourname, qryStruct.namedArgs.password);
							
							if (NOT Request.dbError) {
								qObj = QueryNew('id, statusMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'statusMsg', 'Your Registration was successful.  You will receive an email from us shortly with additional instructions you must follow.', qObj.recordCount);
								registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
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
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', 'The passwords you entered do not match, kindly try again.', qObj.recordCount);
							registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						errorDetails = '';
						if (NOT IsDefined("qryStruct.namedArgs.username")) {
							errorDetails = errorDetails & 'username';
						}
						if (NOT IsDefined("qryStruct.namedArgs.yourname")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'yourname';
						}
						if (NOT IsDefined("qryStruct.namedArgs.password")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'password';
						}
						if (NOT IsDefined("qryStruct.namedArgs.confirmpassword")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'confirmpassword';
						}
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm(s) named (#errorDetails#) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'getDirectoryContents':
					if ( (IsDefined("qryStruct.namedArgs.levelNum")) AND (IsDefined("qryStruct.namedArgs.buttonID")) AND (IsDefined("qryStruct.namedArgs.folderName")) ) { 

						_folderName = qryStruct.namedArgs.folderName;
						if (FindNoCase('.1.', CGI.SERVER_NAME) gt 0) {
							_folderName = 'D' & ':' & ListLast(_folderName, ':');
						} else if (FindNoCase('.2.', CGI.SERVER_NAME) gt 0) {
							_folderName = 'C' & ':' & ListLast(_folderName, ':');
						}
						cf_directory('Request.qDir', _folderName, '*', false);

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
						errorDetails = '';
						if (NOT IsDefined("qryStruct.namedArgs.levelNum")) {
							errorDetails = errorDetails & 'levelNum';
						}
						if (NOT IsDefined("qryStruct.namedArgs.folderName")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'folderName';
						}
						if (NOT IsDefined("qryStruct.namedArgs.buttonID")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'buttonID';
						}
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (#errorDetails#) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'performGetArticleByEntry':
					if (IsDefined("qryStruct.namedArgs.id")) {
						params = structNew();
						params.byEntry = qryStruct.namedArgs.id;
						getBlogArticles(params, qryStruct);
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (id) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'performSubscribePodAction':
					if ( (IsDefined("qryStruct.namedArgs.emailAddress")) AND (Len(qryStruct.namedArgs.emailAddress) gt 0) ) {
						bool = 1;
						try {
							application.blog.addSubscriber(trim(qryStruct.namedArgs.emailAddress));
						} catch (Any e) {
							bool = 0;
						}

						qObj = QueryNew('ID, ISBLOGSUBSCRIBED');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'ISBLOGSUBSCRIBED', bool, qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (emailAddress) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'performSearchPodAction':
					params = structNew();
					if ( (IsDefined("qryStruct.namedArgs.keyword")) AND (Len(qryStruct.namedArgs.keyword) gt 0) ) {
						params.searchTerms = htmlEditFormat(qryStruct.namedArgs.keyword);
					}
					getBlogArticles(params, qryStruct);
				break;

				case 'getBlogArticleComments':
					if (IsDefined("qryStruct.namedArgs.id")) {
						getBlogArticleComments(qryStruct.namedArgs.id);
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (id) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'getBlogArticleTrackbacks':
					if (IsDefined("qryStruct.namedArgs.id")) {
						getBlogArticleTrackbacks(qryStruct.namedArgs.id);
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (id) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'getBlogArticlesByCategory':
					if ( (IsDefined("qryStruct.namedArgs.catid")) OR (IsDefined("qryStruct.namedArgs.catName")) ) {
						params = structNew();
						if (IsDefined("qryStruct.namedArgs.catid")) {
							params.byCat = qryStruct.namedArgs.catid;
						} else if (IsDefined("qryStruct.namedArgs.catName")) {
							params.byCat = getCategoryIDFromName(qryStruct.namedArgs.catName);
						}
						getBlogArticles(params, qryStruct);
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						errorDetails = '';
						if (NOT IsDefined("qryStruct.namedArgs.catid")) {
							errorDetails = errorDetails & 'catid';
						}
						if (NOT IsDefined("qryStruct.namedArgs.catName")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' OR ';
							}
							errorDetails = errorDetails & 'catName';
						}
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (#errorDetails#) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'getBlogArticlesByDay':
					if ( (IsDefined("qryStruct.namedArgs.month")) AND (IsDefined("qryStruct.namedArgs.year")) ) {
						params = structNew();
						if (IsDefined("qryStruct.namedArgs.day")) {
							params.byDay = val(qryStruct.namedArgs.day);
						}
						params.byMonth = val(qryStruct.namedArgs.month) + 1;
						params.byYear = val(qryStruct.namedArgs.year);
						getBlogArticles(params, qryStruct);
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						errorDetails = '';
				//		if (NOT IsDefined("qryStruct.namedArgs.day")) {
				//			errorDetails = errorDetails & 'day';
				//		}
						if (NOT IsDefined("qryStruct.namedArgs.month")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'month';
						}
						if (NOT IsDefined("qryStruct.namedArgs.year")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'year';
						}
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (#errorDetails#) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'getDefaultBlogArticles':
					if (IsDefined("qryStruct.namedArgs.maxEntries")) {
						params = structNew();
						params.lastXDays = 30;
						getBlogArticles(params, qryStruct);
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', 'Missing AJAX parm named (maxEntries) for #qryStruct.cfm# in #CGI.SCRIPT_NAME#.', qObj.recordCount);
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;

				case 'getBlogArchives':
					Request.cats = application.blog.getCategories();
					sqlStatement = "SELECT * FROM Request.cats ORDER BY CATEGORYNAME, entryCount DESC";
					safely_execSQL('Request.qGetMaxEntryCount', '', sqlStatement);

					if (NOT Request.dbError) {
						registerQueryFromAJAX(Request.qGetMaxEntryCount); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
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

				case 'getCalendarMetaData':
					month = Month(Now());
					if ( (IsDefined("qryStruct.namedArgs.month")) AND (IsNumeric(qryStruct.namedArgs.month)) ) {
						month = Int(qryStruct.namedArgs.month + 1);
					}

					year = Year(Now());
					if ( (IsDefined("qryStruct.namedArgs.year")) AND (IsNumeric(qryStruct.namedArgs.year)) ) {
						year = Int(qryStruct.namedArgs.year);
					}
					
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

					qObj = QueryNew('id, dim, localizedDays, localizedMonth, localizedYear, firstDay, firstDOW, daysInMonth, firstWeekPAD, lastMonth, nextMonth, dayList, dayCounter, rowCounter, isBIDI, statusMsg');
					QueryAddRow(qObj, 1);
					QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
					QuerySetCell(qObj, 'dim', dim, qObj.recordCount);
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
					if ( (IsDefined("Request.sqlResult.sql")) AND (IsDefined("Request.sqlParms")) ) {
						QuerySetCell(qObj, 'statusMsg', Request.sqlResult.sql & ',' & Request.sqlParms, qObj.recordCount);
					} else {
						QuerySetCell(qObj, 'statusMsg', '-1', qObj.recordCount);
					}
					registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
				break;

				case 'getDownloadsFolder':
					if (IsDefined("qryStruct.namedArgs.folderName")) {
						_folderName = qryStruct.namedArgs.folderName;
						if (FindNoCase('.1.', CGI.SERVER_NAME) gt 0) {
							_folderName = 'D' & ':' & ListLast(_folderName, ':');
						} else if (FindNoCase('.2.', CGI.SERVER_NAME) gt 0) {
							_folderName = 'C' & ':' & ListLast(_folderName, ':');
						}
						cf_directory('Request.qDir', _folderName, '*', false);

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
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
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

					fileMask = 'downloads_433511201010924803';
					if (NOT (cf_currentBlogName is 'default')) {	// downloads_433511201010924803 for default
						fileMask = 'downloads_433611211010024813';	// downloads_433611211010024813 for ezajax
					}					
					
					cf_directory('Request.qDir', path, fileMask, false);
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
						registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
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
