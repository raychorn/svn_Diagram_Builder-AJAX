var _global_clientWidth = clientWid$();
var global_allow_loading_data_message = true;

function window_onload() {
	initAJAXEngine();
	
	_global_clientWidth = clientWid$();

	global_allow_loading_data_message = true;
	
	register_AJAX_function("showAJAXEnds();");

	while (_stack_AJAX_functions.length) {
		handle_next_AJAX_function(); // kick-start the process of fetching HTML from the server...
	}

	try {
		if (!!windowOnLoadCallback) {
			if (typeof windowOnLoadCallback == const_function_symbol) windowOnLoadCallback();
		}
	} catch(e) { } finally { };
}
	
