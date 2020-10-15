window.onresize = function () {
	var wid = clientWid$();
	var hgt = clientHt$();
	_global_clientWidth = wid;

	try {
		if (!!windowOnReSizeCallback) {
			if (typeof windowOnReSizeCallback == const_function_symbol) windowOnReSizeCallback(wid, hgt);
		}
	} catch(e) { } finally { };
}

