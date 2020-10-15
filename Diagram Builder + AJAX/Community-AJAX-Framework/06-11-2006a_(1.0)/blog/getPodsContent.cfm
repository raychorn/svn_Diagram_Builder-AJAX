<cfsetting showdebugoutput="No">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfparam name="podsList" type="string" default="">

<cfoutput>
	<html>
	<head>
		#Request.commonCode.html_nocache()#
		<title>#Replace(application.blog.getProperty("blogCopyright"), "YYYY", Year(Now()))#</title>
		<meta name="robots" content="index,follow" />
		<link rel="stylesheet" href="#('http://#CGI.SERVER_NAME#' & '/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/includes/style.css')#" type="text/css" />
		<link rel="shortcut icon" href="#('http://#CGI.SERVER_NAME#' & '/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/favicon.ico')#" type="image/x-icon" />

<cfif 0>
		<script language="JavaScript1.2" type="text/javascript" src="../#cfJavaScriptSourceCodeFName#"></script>
</cfif>		
		<script language="JavaScript1.2" type="text/javascript" src="../js/constants.js"></script>
		<script language="JavaScript1.2" type="text/javascript" src="../js/events.js"></script>
		<script language="JavaScript1.2" type="text/javascript" src="../js/flushCache$.js"></script>
		<script language="JavaScript1.2" type="text/javascript" src="../js/_$.js"></script>
		<script language="JavaScript1.2" type="text/javascript" src="../js/$.js"></script>

		<script language="JavaScript1.2" type="text/javascript">
			var js_podsList = '#podsList#';
			var ar_podsList = js_podsList.split(',');

			function editPodPosition(id, arPodsList) {
				var i = -1;
				var html = '';
				var oObj = $(id);
				alert('oObj = [' + oObj + ']');
				if (!!oObj) {
					html += '<span class="normalBoldPrompt">Display Position:&nbsp;</span>';
					html += '<select id="selection_podPosition" class="textClass" onchange="return false;">';
					html += '<option value="" selected>Choose...</option>';
					for (i = 0; i < arPodsList.length; i++) {
						html += '<option value="' + (i + 1) + '">' + (i + 1) + '</option>';
					}
					html += '</select>';
					oObj.innerHTML = html;
					oObj.style.display = const_inline_style;
				}
			}

		</script>
	</head>
	
	<body>

	<table width="100%" cellpadding="-1" cellspacing="-1">

		<cfset prefix = "/" & ListFirst(CGI.SCRIPT_NAME, "/") & "/includes/pods">
		<cfloop index="_item" list="#podsList#" delimiters=",">
			<cfif (NOT(_item IS "calendar.cfm"))>
				<tr>
					<td bgcolor="silver">
						<small><b>#_item#</b></small><button id="btn_editMark_#_item#" class="buttonClass" onclick="editPodPosition(this.id, ar_podsList); return false;">[*]</button><div id="div_editPosition_#_item#" style="display: none;"></div>
					</td>
				</tr>
				<tr>
					<td>
						<cfinclude template="#prefix#/#_item#">
					</td>
				</tr>
			</cfif>
		</cfloop>

	</table>	
	
	</body>
	</html>
</cfoutput>
