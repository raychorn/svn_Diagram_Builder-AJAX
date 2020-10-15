window.onresize = function () {
	_global_clientWidth = clientWid$();

	try {
		if (!!windowOnReSizeCallback) {
			if (typeof windowOnReSizeCallback == const_function_symbol) windowOnReSizeCallback();
		}
	} catch(e) { } finally { };
}

