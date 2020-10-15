// _init.js

var jsFiles = [];

jsFiles.push('object_destructor.js');
jsFiles.push('constants.js');
jsFiles.push('xbLibrary.js');
jsFiles.push('misc.js');
jsFiles.push('DictObj.js');
jsFiles.push('QObj.js');
jsFiles.push('GUIActsObj.js');
jsFiles.push('ajaxEngine.js');

var ar = document.location.href.split('/');
//ar[ar.length - 2] = null;
//ar[ar.length - 1] = null;
//ar.pop();
var href = ar.join('/');

alert('ar = [' + ar + ']' + ', href = [' + href + ']');

for (var i = 0; i < jsFiles.length; i++) {
	document.write('<scr' + 'ipt language="JavaScript1.2" type="text/javascript" src="' + href + 'js/' + jsFiles[i] + '"></scr' + 'ipt>');
}
