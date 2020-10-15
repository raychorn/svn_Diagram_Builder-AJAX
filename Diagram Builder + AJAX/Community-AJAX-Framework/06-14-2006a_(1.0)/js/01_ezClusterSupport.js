// ezClusterSupport.js
function fullyQualifiedAppUrl() {
	var ar = window.location.href.split('?');
	var ar2 = ar[0].split('/');
	ar2.pop();
	return ar2.join('/');
}

function fullyQualifiedAppPrefix() {
	var ar = window.location.href.split('?');
	var ar2 = ar[0].split('/');
	var _ar = [];
	var sAR = -1;
	var aboutToStop = ar2.length - 1;
	var i = -1;
	for (i = 0; i < ar2.length; i++) {
		sAR = ar2[i].split('.');
		_ar.push(ar2[i]);
		if ( (typeof sAR == const_object_symbol) && (sAR.length > 2) ) {
			aboutToStop = i + 1;
		}
		if (i == aboutToStop) break;
	}
	return _ar.join('/');
}

function firstFolderAfterDomainNameFromHref(hRef) {
	var i = -1;
	var fName = '';
	var domainAR = -1;
	hRef = ((!!hRef) ? hRef : '');
	var hRefAR = hRef.split('/');
	for (i = 0; i < hRefAR.length; i++) {
		domainAR = hRefAR[i].split('.');
		if ( (domainAR.length > 2) && ((i + 1) < hRefAR.length) ) {
			fName = hRefAR[i + 1];
			break;
		}
	}
	return fName;
}

function filePath2HrefUsingCommonFolder(fPath, hRef, commonFolder) {
	fPath = ((!!fPath) ? fPath : '');
	hRef = ((!!hRef) ? hRef : '');
	commonFolder = ((!!commonFolder) ? commonFolder : '');
	var _commonFolderF = '\\' + commonFolder + '\\';
	var _commonFolderH = '/' + commonFolder + '/';
	var newHref = '';
	var newHrefAR = [];
	var i = -1;
	var k = -1;
	if ( (fPath.toUpperCase().indexOf(_commonFolderF.toUpperCase()) > -1) && (hRef.toUpperCase().indexOf(_commonFolderH.toUpperCase()) > -1) ) {
		var hRefAR = hRef.split('/');
		var fPathAR = fPath.split('\\');
		for (i = 0; i < hRefAR.length; i++) {
			newHrefAR.push(hRefAR[i]);
			if (hRefAR[i].toUpperCase() == commonFolder.toUpperCase()) {
				break;
			}
		}
		for (k = 0; k < fPathAR.length; k++) {
			if (fPathAR[k].toUpperCase() == commonFolder.toUpperCase()) {
				k++;
				break;
			}
		}
		for (; k < fPathAR.length; k++) {
			newHrefAR.push(fPathAR[k]);
		}
		newHref = newHrefAR.join('/');
	}
	return newHref;
}
		
