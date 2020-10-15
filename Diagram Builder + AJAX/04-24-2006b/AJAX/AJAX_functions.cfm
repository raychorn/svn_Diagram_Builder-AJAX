<!--- BEGIN: This block of code sets-up the Request.qryObj which is a ColdFusion Query Object that holds the parms from the AJAX call --->
<!--- Request.qryStruct also contains the variables that were passed-in from the caller... --->
<cfinclude template="cfinclude_AJAX_Begin.cfm">
<!--- END! This block of code sets-up the Request.qryObj which is a ColdFusion Query Object that holds the parms from the AJAX call --->

<!--- This is where you may code your ColdFusion code that processes the AJAX Function --->
<cfscript>
	bool_onChangeSubMenu = false;
	switch (Request.qryStruct.cfm) {
		case 'getLayerEditorMetaData':
			_sql_statement = "sp_columns @table_name = 'AvnLayer', @table_owner = 'dbo'";
			Request.commonCode.safely_execSQL('Request.qGetLayerEditorMetaData', Request.INTRANET_DS, _sql_statement);

			if (NOT Request.dbError) {
				Request.commonCode.registerQueryFromAJAX(Request.qGetLayerEditorMetaData); // this function is used to tell the AJAX system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
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
<!--- the name of the cfm page is stored in the following variable: Request.qryObj.NAME["cfm"] --->

<!--- BEGIN: This block of code passes the Request.qryObj which is a ColdFusion Query Object back to the AJAX caller via a JavaScript object called qObj --->
<cfinclude template="cfinclude_AJAX_End.cfm">
<!--- END! This block of code passes the Request.qryObj which is a ColdFusion Query Object back to the AJAX caller via a JavaScript object called qObj --->
