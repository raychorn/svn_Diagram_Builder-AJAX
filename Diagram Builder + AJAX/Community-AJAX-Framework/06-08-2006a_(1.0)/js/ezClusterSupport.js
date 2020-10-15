// ezClusterSupport.js
function fullyQualifiedAppPrefix() {
	var ar = window.location.href.split('?');
	var ar2 = ar[0].split('/');
	var _ar = [];
	var sAR = -1;
	var aboutToStop = ar.length;
	var i = -1;
	for (i = 0; i < ar2.length; i++) {
		sAR = ar2[i].split('.');
		if (sAR.length > 2) {
			aboutToStop = i + 1;
		}
		_ar.push(ar2[i]);
		if (i == aboutToStop) break;
	}
	return _ar.join('/');
};

