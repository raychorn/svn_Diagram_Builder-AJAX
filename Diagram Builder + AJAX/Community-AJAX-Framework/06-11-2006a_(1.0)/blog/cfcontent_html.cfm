<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">

<cfif 0>
	<cfscript>
		writeOutput('(IsDefined("URL.sessid")) = [#(IsDefined("URL.sessid"))#] (#URL.sessid#) (#(IsDefined("Session.sessid"))#) [#Session.sessid#] (#(URL.sessid IS Session.sessid)#)<br>');
		writeOutput('URL._sessionid = [#_sessionid#], Session.sessionid = [#Session.sessionid#]<br>');
	</cfscript>
	
	<cfdump var="#Application#" label="App Scope" expand="No">
	<cfdump var="#Session#" label="Session" expand="No">
	<cfdump var="#Request#" label="Request" expand="No">
	<cfdump var="#CGI#" label="CGI Scope" expand="No">
	<cfdump var="#URL#" label="URL Scope" expand="No">
	<cfdump var="#Client#" label="Client Scope" expand="No">
</cfif>

<cfif (IsDefined("URL.sessid")) AND (IsDefined("Session.sessid")) AND (URL.sessid IS Session.sessid) AND (IsDefined("URL.href")) AND (Len(URL.href) gt 0)>
	<cfscript>
		_http = Request.commonCode.cf_http(URLDecode(URL.href));
		bool_isURL_valid = (Trim(_http.Statuscode) IS "200 OK");
		
	//	writeOutput('[#bool_isURL_valid#] (#Len(_http.fileContent)#) [#URLDecode(URL.href)#]<br>');
	</cfscript>
	<cfif (bool_isURL_valid)>
		<cfoutput>
			<CFHEADER NAME="Expires" VALUE="Mon, 06 Jan 1990 00:00:01 GMT">
			<CFHEADER NAME="Pragma" VALUE="no-cache">
			<CFHEADER NAME="cache-control" VALUE="no-cache">
			<cfcontent type="text/html" variable="#ToBinary(ToBase64(_http.fileContent))#">
		</cfoutput>
	<cfelse>
		<cflog file="#Application.applicationName#" type="ERROR" text="[URL.href=#URL.href#] File is Invalid or Missing. (#_http.Statuscode#)">
	</cfif>
</cfif>

