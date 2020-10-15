<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>AJAX onError Handler</title>
</head>

<body>

  <cfscript>
	var errorExplanation = '';
	var cAR = -1;
	var n = -1;
	var errorMsg = '';

	err_ajaxCode = false;
	err_ajaxCodeMsg = '';
	try {
		Request.commonCode = CreateObject("component", "cfc.ajaxCode");
	} catch(Any e) {
		Request.commonCode = -1;
		err_ajaxCode = true;
		err_ajaxCodeMsg = '(1) The ajaxCode component has NOT been created.';
		writeOutput('<font color="red"><b>#err_ajaxCodeMsg#</b></font><br>');
		writeOutput(explainErrorWithStack(e, false));
	}

	if (IsStruct(Request.commonCode)) errorExplanation = Request.commonCode.explainErrorWithStack(Exception, false);
  </cfscript>
  
<cfscript>
	arList = 'error.template,error.dateTime,error.mailTo,error.browser,error.remoteAddress,error.HTTPReferer,error.message,error.queryString,error.rootCause,error.diagnostics,error.validationHeader,error.invalidFields,error.validationFooter';

	errorMsg = errorMsg & 'An unexpected error occurred.' & Chr(13);
	ar = ListToArray(arList, ',');
	arN = ArrayLen(ar);
	for (i = 1; i lte arN; i = i + 1) {
		try {
			errorMsg = errorMsg & ar[i] & ': ' & Request.commonCode.compressErrorMsgs(Evaluate(ar[i])) & Chr(13);
		} catch (Any e) {
		}
	}
	errorMsg = errorMsg & 'Error details:' & Chr(13);

	errorMsg = errorMsg & Request.commonCode.compressErrorMsgs(Request.commonCode.explainErrorWithStack(Exception, false));

	qObj = QueryNew('id, errorMsg');
	QueryAddRow(qObj, 1);
	QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
	QuerySetCell(qObj, 'errorMsg', errorMsg, qObj.recordCount);
	Request.commonCode.registerQueryFromAJAX(qObj); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
</cfscript>

<cfinclude template="cfinclude_AJAX_Init.cfm">
<cfinclude template="cfinclude_AJAX_End.cfm">

</body>
</html>
