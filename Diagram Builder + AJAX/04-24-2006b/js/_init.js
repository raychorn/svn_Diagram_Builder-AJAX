// _init.js

var jsFiles = [];

jsFiles.push('object_destructor.js');
jsFiles.push('constants.js');
jsFiles.push('misc.js');
jsFiles.push('DictObj.js');
jsFiles.push('QObj.js');
jsFiles.push('GUIActsObj.js');
jsFiles.push('ajaxEngine.js');

for (var i = 0; i < jsFiles.length; i++) {
	document.write('<scr' + 'ipt language="JavaScript1.2" type="text/javascript" src="' + jsFiles[i] + '"></scr' + 'ipt>');
}
