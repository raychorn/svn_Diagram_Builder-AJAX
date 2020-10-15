function injectParmsFrom(d, aKey) {
	var _content = '';
	var _ar = d.getValueFor(aKey);
	if ( (!!_ar) && (typeof _ar == const_object_symbol) ) {
		for (var i = 0; i < _ar.length; i++) {
			if ( (!!_ar[i]) && (typeof _ar[i] == const_string_symbol) ) {
				var _ar2 = _ar[i].split(',');
				if ( (!!_ar2) && (typeof _ar2 == const_object_symbol) ) {
					for (var k = 0; k < _ar2.length; k++) {
						_content += ' ' + _ar2[k];
					}
				}
			}
		}
	}
	return _content;
}

