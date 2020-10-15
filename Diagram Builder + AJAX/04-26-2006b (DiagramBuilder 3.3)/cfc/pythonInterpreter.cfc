<cfcomponent extends="kla-tencore.AJAX.cfc.ajaxCode" displayname="pythonInterpreter" output="No">
	<cfscript>
		this.aPathName = '';
		this.theCode = '';
		this.linesOfCode = ArrayNew(1);
		
		function stripCommentBlocks(p) {
			return REReplace(p, "/\*[^##]*##", "", "all");
		}
		
		function stripComments(p) {
			var re = '##.*$';
			return REReplace(p, re, "", "all");
		}

		function init(aPathName) {
			if (FileExists(aPathName)) {
				this.aPathName = aPathName;
				cf_file('READ', this.aPathName, this.theCode);
				if (NOT Request.fileError) {
					this.theCode = stripCommentBlocks(this.theCode);
				}
			}
			return this;
		}
	</cfscript>
</cfcomponent>
