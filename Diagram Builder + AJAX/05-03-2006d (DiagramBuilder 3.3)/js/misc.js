// misc.js

function uuid$() {
	return (new Date().getTime() + "" + Math.floor(65535 * Math.random()));
}

function _asHex(ch) {
	var HEX = "0123456789ABCDEF";

	function _intAsHex(i) {
		if (i != null) {
		    var ii = i & 0xFF;
			return HEX.charAt((ii >> 4) & 0xF) + HEX.charAt(ii & 0xF);
		}
		return '';
	};

	if (typeof ch == const_string_symbol) {
	    var charCode = ch.charCodeAt(0) & 0xFF;
		return HEX.charAt((charCode >> 4) & 0xF) + HEX.charAt(charCode & 0xF);
	} else if (typeof ch == const_number_symbol) {
		return _intAsHex(ch);
	}
	return ch;
}

function _asColorHex(cVal) {
	var x1 = (cVal & 0xff0000) >> 16;
	var x2 = (cVal & 0x00ff00) >> 8;
	var x3 = cVal & 0x0000ff;
	return _asHex(x1) + _asHex(x2) + _asHex(x3);
}

function clientHt$() {
	var _clientHt$ = -1;
	var ta = typeof window.innerHeight;
	if (ta.trim().toUpperCase() == const_number_symbol.trim().toUpperCase()) {
		_clientHt$ = window.innerHeight;
	} else if (document.documentElement && document.documentElement.clientHeight) {
		_clientHt$ = document.documentElement.clientHeight;
	} else if (document.body && document.body.clientHeight) {
		_clientHt$ = document.body.clientHeight;
	}
	return _clientHt$;
}

function clientWid$() {
	var _clientWid$ = -1;
	var ta = typeof window.innerWidth;
	if (ta.trim().toUpperCase() == const_number_symbol.trim().toUpperCase()) {
		_clientWid$ = window.innerWidth;
	} else if (document.documentElement && document.documentElement.clientWidth) {
		_clientWid$ = document.documentElement.clientWidth;
	} else if (document.body && document.body.clientWidth) {
		_clientWid$ = document.body.clientWidth;
	}
	return _clientWid$;
}

function flushCache$(oO) {
	if (!!oO) {
		var els = oO.getElementsByTagName("*");
		for (var i = 0; i < els.length; i++) {
			if (els[i].id) {
				$cache[els[i].id] = null;
			}
		}
	}
}

function _$(id, _frame) {
	return ((!!_frame) ? ((_frame.document.getElementById) ? _frame.document.getElementById(id) : null) : ((document.getElementById) ? document.getElementById(id) : null));
}

function $(id, _frame) {
	var oO = -1;
	id = ((!!_frame) ? _frame + '.' + id : id);
	if ($cache[id] == null) { oO = _$(id, _frame); $cache[id] = oO;} else {oO = $cache[id];}
	return oO;
}

function simulateCheckBoxClick(id) {
	var cObj = $(id);
	if (!!cObj) {
		cObj.checked = ((cObj.checked) ? false : true);
		window.status = 'typeof cObj.onclick = [' + (typeof cObj.onclick) + ']';
		if (typeof cObj.onclick == const_function_symbol) cObj.onclick();
	}
}

function setFocusSafely(pObj) {
	if (!!pObj) {
		try { if (pObj.focus) { if ( (pObj.disabled == null) || (pObj.disabled == false) ) { pObj.focus(); } } } catch(e) { } finally { };
	}
}

function setFocusSafelyById(id) {
	var pObj = $(id);
	return setFocusSafely(pObj);
}

function URLEncode(plaintext) {
	var SAFECHARS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_.!~*'()";					
	var HEX = "0123456789ABCDEF";

	var encoded = "";
	if (!!plaintext) {
		for (var i = 0; i < plaintext.length; i++ ) {
			var ch = plaintext.charAt(i);
		    if (ch == " ") { encoded += "+";} else if (SAFECHARS.indexOf(ch) != -1) {encoded += ch;
			} else {
			    var charCode = ch.charCodeAt(0);
				if (charCode > 255) { encoded += "+";} else {encoded += "%"; encoded += HEX.charAt((charCode >> 4) & 0xF); encoded += HEX.charAt(charCode & 0xF);}
			}
		}
	}

	return encoded;
}

function URLDecode(encoded) {
   var HEXCHARS = "0123456789ABCDEFabcdef"; 
   var plaintext = "";
   var i = 0;
   while (i < encoded.length) {
       var ch = encoded.charAt(i);
	   if (ch == "+") { plaintext += " "; i++;} else if (ch == "%") {
			if (i < (encoded.length-2) && (HEXCHARS.indexOf(encoded.charAt(i+1)) != -1) && (HEXCHARS.indexOf(encoded.charAt(i+2)) != -1) ) {
				plaintext += unescape( encoded.substr(i,3) ); i += 3;
			} else { plaintext += "%[ERROR]"; i++;}
		} else { plaintext += ch; i++;}
	} 
   return plaintext;
}

function _int(i){
	var _s = i.toString().split(".");
	return eval(_s[0]);
};

function formatForWidth(iWidth) {
	var s = '';
	var ss = '';
	var t = this;
	var i = -1;
	var ar = this.split(',');
	var n = ar.length;
	if ( (this.length > iWidth) && (ar.length > 1) ) {
		t = '';
		for (i = 0; i < n; i++) {
			ss = ar[i] + ((i < (n- 1)) ? ',' : '');
			if ((s.length + ss.length) >= iWidth) {
				t += s + '\n' + ss;
				s = '';
			} else {
				s += ss;
			}
		}
		t += s;
	}
	return t;
}

String.prototype.formatForWidth = formatForWidth;

function isAlpha(iLoc) {
	iLoc = ((!!iLoc) ? iLoc : 0);
	iLoc = ((iLoc < 0) ? 0 : iLoc);
	iLoc = ((iLoc > (this.length - 1)) ? this.length : iLoc);
	var _ch = this.substr(iLoc, 1);
	return ( (_ch.toLowerCase() >= 'a') && (_ch.toLowerCase() <= 'z') );
}

String.prototype.isAlpha = isAlpha;

function isNumeric(iLoc) {
	iLoc = ((!!iLoc) ? iLoc : 0);
	iLoc = ((iLoc < 0) ? 0 : iLoc);
	iLoc = ((iLoc > (this.length - 1)) ? this.length : iLoc);
	var _ch = this.substr(iLoc, 1);
	return ( (_ch >= '0') && (_ch <= '9') );
}

String.prototype.isNumeric = isNumeric;

function filterInAlpha() {
	var t = '';
	var _ch = '';
	for (var i = 0; i < this.length; i++) {
		_ch = this.substr(i, 1);
		if (_ch.isAlpha()) {
			t += _ch;
		}
	}
	return t;
}

String.prototype.filterInAlpha = filterInAlpha;

function filterInNumeric() {
	var _ch = '';
	var t = '';
	for (var i = 0; i < this.length; i++) {
		_ch = this.substr(i, 1);
		if (_ch.isNumeric()) {
			t += _ch;
		}
	}
	return t;
}

String.prototype.filterInNumeric = filterInNumeric;

function stripHTML() {
	var s = null;
	s = this.replace(/(<([^>]+)>)/ig,"");
	s = s.replace(/(&([^;]+);)/ig,"");
	return s;
}

String.prototype.stripHTML = stripHTML;

function stripSpacesBy2s() {
	return this.replace(/\  /ig, "");
}

String.prototype.stripSpacesBy2s = stripSpacesBy2s;

function stripIllegalChars() {
	return this.URLEncode(); 
}

String.prototype.stripIllegalChars = stripIllegalChars;

function _URLEncode() {
	return URLEncode(this);
}

String.prototype.URLEncode = _URLEncode;

function _URLDecode() {
	return URLDecode(this);
}

String.prototype.URLDecode = _URLDecode;

function stripTabs(s) {
	s = ((!s) ? '' : s);
	return this.replace(/\t/ig, s);
}

String.prototype.stripTabs = stripTabs;

function stripCrLfs() {
	return this.replace(/\n/ig, "").replace(/\r/ig, "");
}

String.prototype.stripCrLfs = stripCrLfs;

function replaceSubString(i, j, s) {
	var s = this.substring(0, i) + s + this.substring(j, this.length);
	return s;
}

String.prototype.replaceSubString = replaceSubString;

function clipCaselessReplace(keyword, sText) {
	var _ff = this.toUpperCase().indexOf(keyword.toUpperCase());
	if (_ff != -1) {
		return this.replaceSubString(_ff, _ff + keyword.length, sText);
	}

	return this;
}

String.prototype.clipCaselessReplace = clipCaselessReplace;

function trim() {  
	var s = this.replace(/^[\s]+/,"");  
	s = s.replace(/[\s]+$/,"");  
	return s;
}

String.prototype.trim = trim;

function cfString() {
	var s = '';
	var b = true;

	for (var i = 0; i < this.length; i++) {
		if (b) {
			s += "'" + this[i] + "'";
			b = false;
		} else {
			s += ', ' + "'" + this[i] + "'";
		}
	}
	return s;
}

Array.prototype.cfString = cfString;

function setStyle(aStyle, styles) {
	try {
		var a = styles.split(';');
		for (var i = 0; i < a.length; i++) {
			var b = a[i].trim().split(':');
			if (b.length == 2) {
				aStyle[b[0].trim()] = b[1].trim();
			}
		}
	} catch(e) {
	} finally {
	}
}

function toCamelCase( sInput ) {
	var sArray = sInput.split('-');
	if (sArray.length == 1)	{
		return sArray[0];
	}
	var ret = '';
	var s = '';
	var len = sArray.length
	for(var i = 0; i < len; i++) {
		s = sArray[i];
		ret += s.charAt(0).toUpperCase() + s.substring(1)
	}
	return ret;
}

function getStyle(el, style) {
    var value = '';
	if (!!el) {
		try { value = el.style[toCamelCase(style)]; } catch(e) { } finally { };
	   
	    if (!value) {
	        if (typeof document.defaultView == "object") {
	            value = document.defaultView.getComputedStyle(el, "").getPropertyValue(style);
			}
	        else if (el.currentStyle) {
	            value = el.currentStyle[toCamelCase(style)];
			}
		}
	}

	return value || "";
}

function Style2String(aStyle) {
	var st = '';
	try {
		var i = 0;
		for (var s in aStyle) {
			if (aStyle[s].length > 0) {
				i++;
			}
		}
		var j = 0;
		for (var s in aStyle) {
			if (aStyle[s].length > 0) {
				st += s + '=' + aStyle[s] + ((j < i) ? ',' : '');
				j++;
			}
		}
	} catch(e) {
	} finally {
	}
	return st;
}

function insertArrayItem(a,newValue,position) {
	if (position && position > -1) {
		a.splice(position,0,newValue);
	}
	else {
		a.unshift(newValue);
	}
}

function removeArrayItem(a,i) {
	var j = a.length;
	for (; i < j; i++) {
		if (a[i] == null) {
			break;
		}
		a[i] = a[i + 1];
	}
	a[i] = null;
}

function locateArrayItems(a, what, start) {
	var f = 0;
	if (start) {
		startWhere = start 
	}
	else {
		startWhere = 0;
	}
	for(f=startWhere; f<a.length; f++) {
		if (a[f].toString().substr(0,what.length) == what.toString()) {
			return f;
		}
	}
	return -1;
}

function removeEmptyItemsFromArray(ar) {
	var ar2 = [];
	if (typeof ar == const_object_symbol) {
		for (var i = 0; i < ar.length; i++) {
			if ( (!!ar[i]) && (ar[i].trim().length > 0) ) ar2[ar2.length] = ar[i];
		}
		return ar2;
	}
	return ar;
}

function handle_ajaxHelper2_onClick() {
	var cObj = $('td_ajaxHelperPanel2'); 
	var bObj = $('btn_helperPanel2'); 
	var tbObj = $('table_ajaxHelperPanel2');
	if ( (!!cObj) && (!!bObj) && (!!tbObj) ) { 
		cObj.style.display = ((cObj.style.display == const_none_style) ? const_inline_style : const_none_style); 
		bObj.value = ((cObj.style.display == const_inline_style) ? '[<<]' : '[>>]'); 
		if (cObj.style.display == const_inline_style) { 
			tbObj.style.width = _global_clientWidth; 
		} else { 
		}; 
	};
}

function clickRadioButton(id) {
	var oObj = $(id);
	if (!!oObj) {
		oObj.checked = true;
	}
}

