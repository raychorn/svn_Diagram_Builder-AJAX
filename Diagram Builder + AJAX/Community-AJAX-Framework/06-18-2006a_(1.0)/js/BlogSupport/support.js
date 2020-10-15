function downloadsRequiresPremiumBlock() {
	alert('Access to Downloads requires a Premium Subscription.');
	var oBtn = _$('btn_purchasePremiumButton');
	if (!!oBtn) {
		oBtn.onclick();
	}
}

function sampleAppsRequiresLoginBlock() {
	alert('Access to Sample Apps requires a User Account and the user to be logged-in.');
	var oBtn = _$('btn_loginButton');
	if (!!oBtn) {
		oBtn.onclick();
	}
}

function displayPopUpAtForDiv(oObj, anchorPos) {
	if (!!oObj) {
		oObj.style.position = const_absolute_style;
		if ( (!!anchorPos) && (!!anchorPos.x) ) oObj.style.left = (anchorPos.x - 310) + "px";
		if ( (!!anchorPos) && (!!anchorPos.y) ) oObj.style.top = (anchorPos.y - 165) + "px";
		oObj.style.display = ((oObj.style.display == const_none_style) ? const_inline_style : const_none_style);
	}
	return oObj;
}

function _validateUserAccountName(oObj, btnObj) {
	var i = -1;
	var _f2Any = false;
	if (!!oObj) {
		var _f = oObj.value.search(/^[a-zA-Z0-9._%-]+@[a-zA-Z0-9-]+\.(?:[a-zA-Z]{2}|com|org|net|biz|info|cc|ws|us|tv)$/);
		var ar = js_invalidEmailDomains.split(',');
		for (i = 0; i < ar.length; i++) {
			_f2Any = _f2Any || (oObj.value.indexOf(ar[i]) != -1);
		}
		if (!!btnObj) btnObj.disabled = ( (_f == -1) || (_f2Any) ); 
		if ( (_f == -1) || _f2Any ) {
			oObj.style.border = 'thin solid red';
			oObj.title = 'Your User Name is NOT acceptable because ' + ((_f == -1) ? '"your domain name uses an invalid TLD" ' : '') + ((_f2Any) ? '"your domain name is for an anonymous email service which is a EULA Violation" ' : '') + '.';
		} else {
			oObj.style.border = 'thin solid lime';
			oObj.title = 'Your User Name is acceptable. You may proceed, however this does not mean your email address is necessarily valid unless it can accept in-coming email from our email server(s).';
		}
		return (( (_f == -1) || (_f2Any) ) ? true : false); 
	};
	return false;
}

function validateConactUsUserEmailAddrs() {
	_validateUserAccountName($('input_emailAddress'),$('button_submit_contactUs_panel'));
}

function _displayContactUsContentIn(oObj, actionURL) {
	var _html = '';
	if ( (!!oObj) && (oObj.innerHTML.length == 0) ) {
		_html += '<table width="350px" border="1" bgcolor="#FFFFA8" cellpadding="-1" cellspacing="-1">';
		_html += '<tr bgcolor="silver">';
		_html += '<td>';
		_html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
		_html += '<tr>';
		_html += '<td width="90%" align="center" valign="top">';
		_html += '<span class="normalBoldBluePrompt">Contact Us</span>';
		_html += '</td>';
		_html += '<td width="*" align="center" valign="top">';
		_html += '<input type="Button" id="button_dismiss_contactUs_panel" class="buttonClass" value="[X]" onclick="displayPopUpAtForDiv(_$(\'div_contactUsContent\')); return false;">';
		_html += '</td>';
		_html += '</tr>';
		_html += '</table>';
		_html += '</td>';
		_html += '</tr>';
		_html += '<tr>';
		_html += '<td>';
		_html += '<form name="form_contactUs" action="' + ((!!actionURL) ? actionURL : '') + '" enctype="application/x-www-form-urlencoded">';
		_html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
		_html += '<tr>';
		_html += '<td width="20%" align="left" valign="top">';
		_html += '<span class="normalBoldBluePrompt">Your Email Address:</span>';
		_html += '</td>';
		_html += '<td width="*" align="left" valign="top">';
		_html += '<input name="input_emailAddress" value="yourEmail@yourDomain.com" size="50" maxlength="255" onkeyup="if (!!validateConactUsUserEmailAddrs) { validateConactUsUserEmailAddrs() };">';
		_html += '</td>';
		_html += '</tr>';
		_html += '<tr>';
		_html += '<td>';
		_html += '<span class="normalBoldBluePrompt">Your Message:</span>';
		_html += '</td>';
		_html += '<td>';
		_html += '<textarea name="textarea_yourMessage" cols="50" rows="3"></textarea>';
		_html += '</td>';
		_html += '</tr>';
		_html += '<tr>';
		_html += '<td colspan="2">';
		_html += '<span class="normalBoldBluePrompt">Kindly allow 24-48 hours for a response.</span>';
		_html += '</td>';
		_html += '</tr>';
		_html += '<tr>';
		_html += '<td colspan="2">';
		_html += '<input type="Button" id="button_submit_contactUs_panel" class="buttonClass" value="[Submit]">';
		_html += '</td>';
		_html += '</tr>';
		_html += '</table>';
		_html += '</form>';
		_html += '</td>';
		_html += '</tr>';
		_html += '</table>';
		try {
			flushCache$(oObj);
		} catch(e) {
		} finally {
		}
		oObj.innerHTML = _html;
	} else if (!!oObj) {
		displayPopUpAtForDiv(_$('div_contactUsContent'));
	}
}

function displayContactUsContentIn(id, actionID) {
	var oObj = _$(id);
	return _displayContactUsContentIn(oObj, actionID);
}

function validateLoginUserName() {
	_validateUserAccountName($('login_input_username'),$('button_loginSubmit'));
}

function validateForgotPasswordUserName() {
	_validateUserAccountName($('input_forgot_username'),$('button_forgotPwdSubmit'));
}

function receiveRegisterData(msg) {
	var i = -1;
	var _html = '';
	var ar2 = [];
	var oObj = $('div_register_newUser_status');
	var fObj = $('body_register_newUser');
	if ( (!!oObj) && (!!fObj) ) {
		var ar = msg.split('&');
		for (i = 0; i < ar.length; i++) {
			ar2 = ar[i].split('=');
			if (ar2.length == 2) {
				if (ar2[0].toUpperCase() == 'statusMsg'.toUpperCase()) {
					_html += unescape(ar2[1]);
				} else if (ar2[0].toUpperCase() == 'showForm'.toUpperCase()) {
					fObj.style.display = ((ar2[1].toUpperCase() == 'true'.toUpperCase()) ? const_inline_style : const_none_style);
				}
			}
		}
		oObj.innerHTML = _html;
	}
}

function performSubmitRegisterForm(username, yourname, password, confirmpassword) {
//	alert('username = [' + username + ']' + ', yourname = [' + yourname + ']' + ', password = [' + password + ']' + ', confirmpassword = [' + confirmpassword + ']'); 
	if ( (!!username) && (!!yourname) && (!!password) && (!!confirmpassword) ) {
		doAJAX_func('performSubmitRegisterForm', 'handleSubmitRegisterForm(' + oAJAXEngine.js_global_varName + ')', 'username', username, 'yourname', yourname, 'password', password, 'confirmpassword', confirmpassword);
	}
}

function performSubmitLoginForm(username, password) {
//	alert('username = [' + username + ']' + ', password = [' + password + ']'); 
	if ( (!!username) && (!!password) ) {
		doAJAX_func('performSubmitLoginForm', 'handleSubmitRegisterForm(' + oAJAXEngine.js_global_varName + ')', 'username', username, 'password', password);
	}
}

function performSubmitForgotPasswordForm(username) {
//	alert('username = [' + username + ']'); 
	if (!!username) {
		doAJAX_func('performSubmitForgotPasswordForm', 'handleSubmitRegisterForm(' + oAJAXEngine.js_global_varName + ')', 'username', username);
	}
}

function performUserLogoffAction() {
	doAJAX_func('performUserLogoffAction', 'handleSubmitRegisterForm(' + oAJAXEngine.js_global_varName + ')');
}

function redirectBrowserToUrl(aURL) {
	if (!!aURL) {
		window.location.href = aURL;
	}
}
