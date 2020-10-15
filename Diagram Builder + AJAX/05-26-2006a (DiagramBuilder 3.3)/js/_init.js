// _init.js

var jsFiles = [];

jsFiles.push('_javascript.js');

var href = document.location.href;

for (var i = 0; i < jsFiles.length; i++) {
	document.write('<scr' + 'ipt language="JavaScript1.2" type="text/javascript" src="' + href + 'js/' + jsFiles[i] + '"></scr' + 'ipt>');
}
