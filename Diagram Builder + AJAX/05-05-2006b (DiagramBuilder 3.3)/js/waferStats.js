// waferStats.js

waferStats = function(id){
	this.id = id;				
};

waferStats.$ = [];

waferStats.get$ = function() {
	var instance = waferStats.$[waferStats.$.length];
	if (instance == null) {
		instance = waferStats.$[waferStats.$.length] = new waferStats(waferStats.$.length);
	}
	return instance;
};

waferStats.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < waferStats.$.length) ) {
		var instance = waferStats.$[id];
		if (!!instance) {
			waferStats.$[id] = object_destructor(instance);
			ret_val = (waferStats.$[id] == null);
		}
	}
	return ret_val;
};

waferStats.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < waferStats.$.length; i++) {
		waferStats.remove$(i);
	}
	return ret_val;
};

waferStats.prototype = {
	id : -1,
	minDieX : 2^31,
	maxDieX : -2^31,
	minDieY : 2^31,
	maxDieY : -2^31,
	minImageX : 2^31,
	maxImageX : -2^31,
	minImageY : 2^31,
	maxImageY : -2^31,
	minOriginX : 2^31,
	maxOriginX : -2^31,
	minOriginY : 2^31,
	maxOriginY : -2^31,
	minVal : 2^31,
	maxVal : -2^31,
	toString : function() {
		var s = 'waferStats(' + this.id + ') :: \n';
		s += 'minDieX/maxDieX = [' + this.minDieX + ',' + this.maxDieX + ']' + '\n';
		s += 'minDieY/maxDieY = [' + this.minDieY + ',' + this.maxDieY + ']' + '\n';
		s += 'minImageX/maxImageX = [' + this.minImageX + ',' + this.maxImageX + ']' + '\n';
		s += 'minImageY/maxImageY = [' + this.minImageY + ',' + this.maxImageY + ']' + '\n';
		s += 'minOriginX/maxOriginX = [' + this.minOriginX + ',' + this.maxOriginX + ']' + '\n';
		s += 'minOriginY/maxOriginY = [' + this.minOriginY + ',' + this.maxOriginY + ']' + '\n';
		s += 'minVal/maxVal = [' + this.minVal + ',' + this.maxVal + ']' + '\n\n';
		return s;
	},
	resetStats : function() {
		this.minDieX = 2^31;
		this.maxDieX = -2^31;
		this.minDieY = 2^31;
		this.maxDieY = -2^31;
		this.minImageX = 2^31;
		this.maxImageX = -2^31;
		this.minImageY = 2^31;
		this.maxImageY = -2^31;
		this.minOriginX = 2^31;
		this.maxOriginX = -2^31;
		this.minOriginY = 2^31;
		this.maxOriginY = -2^31;
		this.minVal = 2^31;
		this.maxVal = -2^31;
	},
	destructor : function() {
		return (this.id = waferStats.$[this.id] = this.minDieX = this.maxDieX = this.minDieY = this.maxDieY = this.minImageX = this.maxImageX = this.minImageY = this.maxImageY = this.minOriginX = this.maxOriginX = this.minOriginY = this.maxOriginY = this.minVal = this.maxVal = null);
	}
};
