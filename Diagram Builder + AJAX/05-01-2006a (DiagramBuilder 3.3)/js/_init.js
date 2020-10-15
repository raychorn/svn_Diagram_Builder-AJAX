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
jsFiles.push( ((document.layers) ? 'DiagramBuilder3.3/diagram_nav.js' : 'DiagramBuilder3.3/diagram_dom.js'));
jsFiles.push('DiagramBuilder3.3/diagram.js');
jsFiles.push('waferPoint.js');
//jsFiles.push('DiagramBuilder3.3/evalsafe.js'); // this file seems to be crap so we just use the built-in JavaScript eval() function...

var href = document.location.href;

for (var i = 0; i < jsFiles.length; i++) {
	document.write('<scr' + 'ipt language="JavaScript1.2" type="text/javascript" src="' + href + 'js/' + jsFiles[i] + '"></scr' + 'ipt>');
}
