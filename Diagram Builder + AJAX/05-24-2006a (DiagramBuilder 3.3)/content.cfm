<cfsetting enablecfoutputonly="No" showdebugoutput="No">
<cfscript>
	_serverName = ListDeleteAt(CGI.SERVER_NAME, 1, '.');
	while (ListLen(_serverName, '.') gt 2) {
		_serverName = ListDeleteAt(_serverName, 1, '.');
	}
</cfscript>

<cfsavecontent variable="jsCode">
function object_destructor(oO){var rV=-1;try{rV=oO.destructor();}catch(e){rV=null;}finally{rV=null;};return rV;}
const_inline_style='inline';const_none_style='none';$cache=[];const_function_symbol='function';const_object_symbol='object';const_number_symbol='number';const_string_symbol='string';const_paper_color_light_yellow='#FFFFBF';const_jsapi_width_value=200;const_debug_symbol='DEBUG';const_events_list='Abort,AfterUpdate,BeforeUnload,BeforeUpdate,Blur,Bounce,Click,Change,DataAvailable,DataSetChanged,DataSetComplete,DblClick,DragDrop,Error,ErrorUpdate,FilterChange,Focus,Help,KeyDown,KeyPress,KeyUp,Load,MouseDown,MouseMove,MouseOut,MouseOver,MouseUp,MouseWheel,Move,ReadyStateChange,Reset,Resize,RowEnter,RowExit,Scroll,Select,SelectStart,Start,Submit,Unload';function events_unHookAllEventHandlers(anObj){function recursive_delete(object){if(!object||object.delete_in_progress){return;}
try{object.delete_in_progress=true;var a=const_events_list.split(',');for(var i=0;i<a.length;i++){var selector='on'+a[i];if(Eval('object.selector')){Eval('object.selector = null')}}
for(var name in object){if(name!='delete_in_progress'){recursive_delete(object[name]);object[name]=null;}}}
catch(e){}}}
function uuid$(){return(new Date().getTime()+""+Math.floor(65535*Math.random()));}
function _asHex(ch){var HEX="0123456789ABCDEF";function _intAsHex(i){if(i!=null){var ii=i&0xFF;return HEX.charAt((ii>>4)&0xF)+HEX.charAt(ii&0xF);}
return'';};if(typeof ch==const_string_symbol){var charCode=ch.charCodeAt(0)&0xFF;return HEX.charAt((charCode>>4)&0xF)+HEX.charAt(charCode&0xF);}else if(typeof ch==const_number_symbol){return _intAsHex(ch);}
return ch;}
function _asColorHex(cVal){var x1=(cVal&0xff0000)>>16;var x2=(cVal&0x00ff00)>>8;var x3=cVal&0x0000ff;return _asHex(x1)+_asHex(x2)+_asHex(x3);}
function clientHt$(){var _clientHt$=-1;var ta=typeof window.innerHeight;if(ta.trim().toUpperCase()==const_number_symbol.trim().toUpperCase()){_clientHt$=window.innerHeight;}else if(document.documentElement&&document.documentElement.clientHeight){_clientHt$=document.documentElement.clientHeight;}else if(document.body&&document.body.clientHeight){_clientHt$=document.body.clientHeight;}
return _clientHt$;}
function clientWid$(){var _clientWid$=-1;var ta=typeof window.innerWidth;if(ta.trim().toUpperCase()==const_number_symbol.trim().toUpperCase()){_clientWid$=window.innerWidth;}else if(document.documentElement&&document.documentElement.clientWidth){_clientWid$=document.documentElement.clientWidth;}else if(document.body&&document.body.clientWidth){_clientWid$=document.body.clientWidth;}
return _clientWid$;}
function flushCache$(oO){if(!!oO){var els=oO.getElementsByTagName("*");events_unHookAllEventHandlers(oO);for(var i=0;i<els.length;i++){if(els[i].id){$cache[els[i].id]=null;}}}}
function _$(id,_frame){return((!!_frame)?((_frame.document.getElementById)?_frame.document.getElementById(id):null):((document.getElementById)?document.getElementById(id):null));}
function $(id,_frame){var oO=-1;id=((!!_frame)?_frame+'.'+id:id);if($cache[id]==null){oO=_$(id,_frame);$cache[id]=oO;}else{oO=$cache[id];}
return oO;}
function simulateCheckBoxClick(id){var cObj=$(id);if(!!cObj){cObj.checked=((cObj.checked)?false:true);window.status='typeof cObj.onclick = ['+(typeof cObj.onclick)+']';if(typeof cObj.onclick==const_function_symbol)cObj.onclick();}}
function setFocusSafely(pObj){if(!!pObj){try{if(pObj.focus){if((pObj.disabled==null)||(pObj.disabled==false)){pObj.focus();}}}catch(e){}finally{};}}
function setFocusSafelyById(id){var pObj=$(id);return setFocusSafely(pObj);}
function disableAllButtonsLike(aName){var els=document.getElementsByTagName("BUTTON");for(var i=0;i<els.length;i++){if(els[i].id.toUpperCase().indexOf(aName.toUpperCase())!=-1){els[i].disabled=true;}}}
function URLEncode(plaintext){var SAFECHARS="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_.!~*'()";var HEX="0123456789ABCDEF";var encoded="";if(!!plaintext){for(var i=0;i<plaintext.length;i++){var ch=plaintext.charAt(i);if(ch==" "){encoded+="+";}else if(SAFECHARS.indexOf(ch)!=-1){encoded+=ch;}else{var charCode=ch.charCodeAt(0);if(charCode>255){encoded+="+";}else{encoded+="%";encoded+=HEX.charAt((charCode>>4)&0xF);encoded+=HEX.charAt(charCode&0xF);}}}}
return encoded;}
function URLDecode(encoded){var HEXCHARS="0123456789ABCDEFabcdef";var plaintext="";var i=0;while(i<encoded.length){var ch=encoded.charAt(i);if(ch=="+"){plaintext+=" ";i++;}else if(ch=="%"){if(i<(encoded.length-2)&&(HEXCHARS.indexOf(encoded.charAt(i+1))!=-1)&&(HEXCHARS.indexOf(encoded.charAt(i+2))!=-1)){plaintext+=unescape(encoded.substr(i,3));i+=3;}else{plaintext+="%[ERROR]";i++;}}else{plaintext+=ch;i++;}}
return plaintext;}
function _int(i){var _s=i.toString().split(".");return eval(_s[0]);};function formatForWidth(iWidth){var s='';var ss='';var t=this;var i=-1;var ar=this.split(',');var n=ar.length;if((this.length>iWidth)&&(ar.length>1)){t='';for(i=0;i<n;i++){ss=ar[i]+((i<(n-1))?',':'');if((s.length+ss.length)>=iWidth){t+=s+'\n'+ss;s='';}else{s+=ss;}}
t+=s;}
return t;}
String.prototype.formatForWidth=formatForWidth;function isAlpha(iLoc){iLoc=((!!iLoc)?iLoc:0);iLoc=((iLoc<0)?0:iLoc);iLoc=((iLoc>(this.length-1))?this.length:iLoc);var _ch=this.substr(iLoc,1);return((_ch.toLowerCase()>='a')&&(_ch.toLowerCase()<='z'));}
String.prototype.isAlpha=isAlpha;function isNumeric(iLoc){iLoc=((!!iLoc)?iLoc:0);iLoc=((iLoc<0)?0:iLoc);iLoc=((iLoc>(this.length-1))?this.length:iLoc);var _ch=this.substr(iLoc,1);return((_ch>='0')&&(_ch<='9'));}
String.prototype.isNumeric=isNumeric;function filterInAlpha(){var t='';var _ch='';for(var i=0;i<this.length;i++){_ch=this.substr(i,1);if(_ch.isAlpha()){t+=_ch;}}
return t;}
String.prototype.filterInAlpha=filterInAlpha;function filterInNumeric(){var _ch='';var t='';for(var i=0;i<this.length;i++){_ch=this.substr(i,1);if(_ch.isNumeric()){t+=_ch;}}
return t;}
String.prototype.filterInNumeric=filterInNumeric;function stripHTML(){var s=null;s=this.replace(/(<([^>]+)>)/ig,"");s=s.replace(/(&([^;]+);)/ig,"");return s;}
String.prototype.stripHTML=stripHTML;function stripSpacesBy2s(){return this.replace(/\  /ig,"");}
String.prototype.stripSpacesBy2s=stripSpacesBy2s;function stripIllegalChars(){return this.URLEncode();}
String.prototype.stripIllegalChars=stripIllegalChars;function _URLEncode(){return URLEncode(this);}
String.prototype.URLEncode=_URLEncode;function _URLDecode(){return URLDecode(this);}
String.prototype.URLDecode=_URLDecode;function stripTabs(s){s=((!s)?'':s);return this.replace(/\t/ig,s);}
String.prototype.stripTabs=stripTabs;function stripCrLfs(){return this.replace(/\n/ig,"").replace(/\r/ig,"");}
String.prototype.stripCrLfs=stripCrLfs;function replaceSubString(i,j,s){var s=this.substring(0,i)+s+this.substring(j,this.length);return s;}
String.prototype.replaceSubString=replaceSubString;function clipCaselessReplace(keyword,sText){var _ff=this.toUpperCase().indexOf(keyword.toUpperCase());if(_ff!=-1){return this.replaceSubString(_ff,_ff+keyword.length,sText);}
return this;}
String.prototype.clipCaselessReplace=clipCaselessReplace;function trim(){var s=this.replace(/^[\s]+/,"");s=s.replace(/[\s]+$/,"");return s;}
String.prototype.trim=trim;function cfString(){var s='';var b=true;for(var i=0;i<this.length;i++){if(b){s+="'"+this[i]+"'";b=false;}else{s+=', '+"'"+this[i]+"'";}}
return s;}
Array.prototype.cfString=cfString;function setStyle(aStyle,styles){try{var a=styles.split(';');for(var i=0;i<a.length;i++){var b=a[i].trim().split(':');if(b.length==2){aStyle[b[0].trim()]=b[1].trim();}}}catch(e){}finally{}}
function toCamelCase(sInput){var sArray=sInput.split('-');if(sArray.length==1){return sArray[0];}
var ret='';var s='';var len=sArray.length
for(var i=0;i<len;i++){s=sArray[i];ret+=s.charAt(0).toUpperCase()+s.substring(1)}
return ret;}
function getStyle(el,style){var value='';if(!!el){try{value=el.style[toCamelCase(style)];}catch(e){}finally{};if(!value){if(typeof document.defaultView=="object"){value=document.defaultView.getComputedStyle(el,"").getPropertyValue(style);}
else if(el.currentStyle){value=el.currentStyle[toCamelCase(style)];}}}
return value||"";}
function Style2String(aStyle){var st='';try{var i=0;for(var s in aStyle){if(aStyle[s].length>0){i++;}}
var j=0;for(var s in aStyle){if(aStyle[s].length>0){st+=s+'='+aStyle[s]+((j<i)?',':'');j++;}}}catch(e){}finally{}
return st;}
function insertArrayItem(a,newValue,position){if(position&&position>-1){a.splice(position,0,newValue);}
else{a.unshift(newValue);}}
function removeArrayItem(a,i){var j=a.length;for(;i<j;i++){if(a[i]==null){break;}
a[i]=a[i+1];}
a[i]=null;}
function locateArrayItems(a,what,start){var f=0;if(start){startWhere=start}
else{startWhere=0;}
for(f=startWhere;f<a.length;f++){if(a[f].toString().substr(0,what.length)==what.toString()){return f;}}
return-1;}
function removeEmptyItemsFromArray(ar){var ar2=[];if(typeof ar==const_object_symbol){for(var i=0;i<ar.length;i++){if((!!ar[i])&&(ar[i].trim().length>0))ar2[ar2.length]=ar[i];}
return ar2;}
return ar;}
function handle_ajaxHelper2_onClick(){var cObj=$('td_ajaxHelperPanel2');var bObj=$('btn_helperPanel2');var tbObj=$('table_ajaxHelperPanel2');if((!!cObj)&&(!!bObj)&&(!!tbObj)){cObj.style.display=((cObj.style.display==const_none_style)?const_inline_style:const_none_style);bObj.value=((cObj.style.display==const_inline_style)?'[<<]':'[>>]');if(cObj.style.display==const_inline_style){tbObj.style.width=_global_clientWidth;}else{};};}
function clickRadioButton(id){var oObj=$(id);if(!!oObj){oObj.checked=true;}}
function jsErrorExplainer(errObj,funcName,bool_useAlert){var _db='';var msg='';if(!!errObj){_db+="errObj.number is: ["+(errObj.number&0xFFFF)+']\n';_db+="errObj.description is: ["+errObj.description+']\n';_db+="errObj.name is: ["+errObj.name+']\n';_db+="errObj.message is: ["+errObj.message+']\n';msg=((!!funcName)?funcName+'\n':'')+errObj.toString()+'\n'+_db;}
if(bool_useAlert=((bool_useAlert==true)?bool_useAlert:false)){if(!!_alert)_alert(msg);else alert(msg);}
return msg;}
function objectExplainer(obj){var _db='';var m=-1;var i=-1;var a=[];_db='[';if((!!obj)&&(typeof obj==const_object_symbol)){if(!!obj.length){for(i=0;i<obj.length;i++){a.push('obj['+i+'] = ['+obj[i]+']');}}else{for(m in obj){a.push(m+' = ['+obj[m]+']');}}
_db+=a.join(', ');}else{_db+=obj;}
_db+=']';return _db;}
function _displaySysMessages(s,t,bool_hideShow,taName){var cObj=$('div_sysMessages');var tObj=$('span_sysMessages_title');var sObj=$('span_sysMessages_body');var tbObj=$('div_sysMessages_titleBar_tr');var taObj=_$(taName);var s_ta='';s=((s==null)?'':s);t=((t==null)?'':t);if((!!cObj)&&(!!sObj)&&(!!tObj)&&(!!tbObj)){bool_hideShow=((bool_hideShow==true)?bool_hideShow:false);s_ta=((!!taObj)?taObj.value:'');tbObj.bgColor=((t.trim().toUpperCase()!=const_debug_symbol.trim().toUpperCase())?'red':'silver');flushCache$(sObj);sObj.innerHTML='<textarea id="'+taName+'" class="codeSmaller" cols="150" rows="30" readonly>'+((s.length>0)?s_ta+'\n':'')+s+'</textarea>';flushCache$(tObj);tObj.innerHTML=t;cObj.style.display=((bool_hideShow)?const_inline_style:const_none_style);cObj.style.position='absolute';cObj.style.left=10+'px';cObj.style.top=document.body.scrollTop+15+'px';cObj.style.width=(clientWid$()-10)+'px';cObj.style.height=(clientHt$()-10)+'px';}else{alert('Programming Error: Missing one of the following - '+'cObj = ['+cObj+']'+', sObj = ['+sObj+']'+', tObj = ['+tObj+']'+', tbObj = ['+tbObj+']');}}
function dispaySysMessages(s,t){return _displaySysMessages(s,t,true,'textarea_sysMessages_body');}
function _alert(s){return dispaySysMessages(s,'DEBUG');}
function dismissSysMessages(){return _displaySysMessages('','',false,'textarea_sysMessages_body');}
function _alertError(s){return dispaySysMessages(s,'ERROR');}
DictObj=function(id){this.id=id;this.keys=[];this.cache=[];};DictObj.$=[];DictObj.get$=function(aSpec){var instance=DictObj.$[DictObj.$.length];if(instance==null){instance=DictObj.$[DictObj.$.length]=new DictObj(DictObj.$.length);}
instance.fromSpec(aSpec);return instance;};DictObj.remove$=function(id){var ret_val=false;if((id>-1)&&(id<DictObj.$.length)){var instance=DictObj.$[id];if(!!instance){DictObj.$[id]=object_destructor(instance);ret_val=(DictObj.$[id]==null);}}
return ret_val;};DictObj.remove$s=function(){var ret_val=true;for(var i=0;i<DictObj.$.length;i++){DictObj.remove$(i);}
return ret_val;};DictObj.prototype={id:-1,bool_returnArray:false,keys:[],cache:[],toString:function(){var aKey=-1;var aVal=-1;var s='DictObj('+this.id+') :: (';if(this.id!=null){s+='\n';for(var i=0;i<this.keys.length;i++){aKey=this.keys[i];aVal=this.getValueFor(aKey);s+='{'+aKey+'} = [';if(typeof aVal==const_object_symbol){for(var j=0;j<aVal.length;j++){s+='\n\t[';s+=aVal[j];s+=']';}}else{s+=aVal;}
s+=']'+'\n';}}
s+=')';return s;},fromSpec:function(aSpec){var i=-1;var ar=[];var ar2=[];if(!!aSpec){ar=aSpec.split(',');if(ar.length==1){ar=aSpec.split('&');}
for(i=0;i<ar.length;i++){if(ar[i].length>0){ar2=ar[i].split('=');if(ar2.length==2){this.push(ar2[0],ar2[1]);}else{this.push(ar[i],ar[i+1]);i++;}}}}},asQueryString:function(ch_delim){var aKey=-1;var s='';for(var i=0;i<this.keys.length;i++){aKey=this.keys[i];if(!!ch_delim){s+=aKey+'='+this.getValueFor(aKey)+((i<(this.keys.length-1))?ch_delim:'');}else{s+='&'+aKey+'='+this.getValueFor(aKey);}}
return s;},push:function(key,value){var _f=-1;var _key=key.trim().toUpperCase();for(var i=0;i<this.keys.length;i++){if(this.keys[i].trim().toUpperCase()==_key){_f=i;break;}}
if(_f==-1){this.keys.push(key);this.cache[key]=value;return true;}else{if(typeof this.cache[key]!=const_object_symbol){var a=[];a.push(this.cache[key]);this.cache[key]=a;}
this.cache[key].push(value);}
return false;},put:function(key,value){if(!!this.cache[key]){this.cache[key]=value;}else{alert('WARNING - Programming Error: The key ('+key+') does not appear in the dictionary... Are you sure you didn\'t really mean to use the push method instead ?');}},drop:function(key){if(!!this.cache[key]){this.cache[key]=null;var ar=this.keys;this.keys=[];for(var i=0;i<ar.length;i++){if(ar[i]!=key){this.keys.push(ar[i]);}}}else{alert('WARNING - Programming Error: The key ('+key+') does not appear in the dictionary... Are you sure you didn\'t really mean to use the push method instead ?');}},getValueFor:function(key){var _retVal=this.cache[key];if(!!_retVal){this.bool_returnArray=((this.bool_returnArray==true)?this.bool_returnArray:false);if((this.bool_returnArray)&&(typeof _retVal!=const_object_symbol)){var _ar=[];_ar.push(_retVal);_retVal=_ar;}}
return(_retVal);},getKeysMatching:function(aFunc){var a=[];for(var i=0;i<this.keys.length;i++){if((!!aFunc)&&(typeof aFunc==const_function_symbol)&&(aFunc(this.keys[i],this.getValueFor(this.keys[i])))){a.push(this.keys[i]);}}
return(a);},getKeys:function(){return(this.keys);},adjustKeyNames:function(func){var k=this.keys;if((!!func)&&(typeof func==const_function_symbol)){k=[];for(var i=0;i<this.keys.length;i++){k.push(func(this.keys[i]));}}
return(k);},length:function(){return(this.keys.length);},keyForLargestValue:function(){var i=-1;var maxValue=-2^31;for(i=0;i<this.keys.length;i++){maxValue=Math.max(maxValue,this.cache[this.keys[i]]);}
for(i=0;i<this.keys.length;i++){if(this.cache[this.keys[i]]==maxValue){return this.keys[i];}}
return null;},intoNamedArgs:function(){var _newKey=-1;var _newVal=-1;var key1=-1;var key2=-1;var argCnt=this.getValueFor('argCnt');if(!!argCnt){for(var i=1;i<=argCnt;i+=2){key1='arg'+i;key2='arg'+(i+1);_newKey=this.getValueFor(key1);_newVal=this.getValueFor(key2);this.push(_newKey,_newVal);this.drop(key1);this.drop(key2);}
this.drop('argCnt');}
return this;},init:function(){this.keys=[];this.cache=[];return this;},destructor:function(){return(this.id=DictObj.$[this.id]=this.keys=this.cache=null);}};QObj=function(id,_colNames){this.id=id;this.colNames=_colNames;this.dataRec=[];var a=_colNames.URLDecode().trim().split(',');this.dataRec.push(a);};QObj.$=[];QObj.get$=function(_colNames){var instance=QObj.$[QObj.$.length];if(instance==null){instance=QObj.$[QObj.$.length]=new QObj(QObj.$.length,_colNames);}
return instance;};QObj.remove$=function(id){var ret_val=false;if((id>-1)&&(id<QObj.$.length)){var instance=QObj.$[id];if(!!instance){QObj.$[id]=object_destructor(instance);ret_val=(QObj.$[id]==null);}}
return ret_val;};QObj.remove$s=function(){var ret_val=true;for(var i=0;i<QObj.$.length;i++){QObj.remove$(i);}
return ret_val;};QObj.prototype={id:-1,s_toString:'',colNames:'',dataRec:[],rowCntName:'rowCnt',_toString:function(_aRec,_ri,_cols){s_toString+=((_ri>1)?'\n':'')+'['+_ri+'] :: ';for(var i=0;i<_aRec.length;i++){if(_aRec[i].trim().length>0){s_toString+='{'+_cols[i]+'}=<'+_aRec[i]+'>';if(i<(_aRec.length-1)){s_toString+=', ';}}}
return s_toString+='';},toString:function(){s_toString='QObj('+this.id+') :: \ncolumnList = ('+this.columnList()+'), recordCount = '+this.recordCount()+'\n'+'dataRec = ('+this.dataRec.toString()+')\n\n';this.iterate(this._toString);return s_toString;},recordCount:function(){return(this.dataRec.length-1);},columnList:function(){return((this.dataRec.length>0)?this.dataRec[0]:[]);},data:function(){return(this.dataRec.slice(1,this.dataRec.length));},iterate:function(func){var _cols=this.columnList();if((!!func)&&(typeof func==const_function_symbol)){for(var ri=1;ri<this.dataRec.length;ri++){func(this.dataRec[ri],ri,_cols);}}},iterateRecObjs:function(func){var i=-1;var _f=-1;var rN=this.dataRec.length;var rowArray=[];var oDict=DictObj.get$();var _cols=this.columnList();if((!!func)&&(typeof func==const_function_symbol)){for(var ri=1;ri<rN;ri++){rowArray=this.dataRec[ri];for(i=0;i<_cols.length;i++){oDict.push(_cols[i],rowArray[i]);}
oDict.push(this.rowCntName,rN-1);_f=func(ri,oDict,this.rowCntName,this);_f=((!!_f)?_f:-1);if(_f!=-1){break;}
oDict.init();}}
DictObj.remove$(oDict.id);},QueryAddRow:function(){var d=[];this.dataRec.push(d);},getColNumFromColName:function(colName){var colNum=-1;for(var i=0;i<this.dataRec[0].length;i++){if(colName.trim().toUpperCase()==this.dataRec[0][i].trim().toUpperCase()){colNum=i;break;}}
return colNum;},QuerySetCell:function(cName,vVal,rowNum){var d=[];var ci=-1;var colNum=this.getColNumFromColName(cName);if(colNum!=-1){if(rowNum<=this.recordCount()){d=this.dataRec[rowNum];for(ci=0;ci<this.dataRec[0].length;ci++){if(ci==colNum){d[ci]=vVal.URLDecode();break;}}
this.dataRec[rowNum]=d;}}
return false;},getValueFromName:function(cName,colName,valName){var row=[];var ri=-1;var colNum=this.getColNumFromColName(colName);var valNum=this.getColNumFromColName(valName);if((colNum!=-1)&&(valNum!=-1)){for(ri=1;ri<this.dataRec.length;ri++){row=this.dataRec[ri];if(row[colNum].trim().toUpperCase()==cName.trim().toUpperCase()){return row[valNum];}}}
return'';},getValueFromNameAtRow:function(cName,colName,valName,iRow){var row=[];var ri=-1;var colNum=this.getColNumFromColName(colName);var valNum=this.getColNumFromColName(valName);if((colNum!=-1)&&(valNum!=-1)){if((iRow>0)&&(iRow<this.dataRec.length)){row=this.dataRec[iRow];if(row[colNum].trim().toUpperCase()==cName.trim().toUpperCase()){return row[valNum];}}}
return'';},as_JS_array_source:function(cName){var _parms=URLDecode(this.getValueFromName(cName,'name','val'));var _pa=_parms.split(',');var _pb=[];var _pc=[];var aa='[[]]';if(_pa.length>1){aa='[';for(var i=0;i<_pa.length;i++){_pb=_pa[i].split('=');if(_pb.length==2){_pc=[];_pc.push(_pb[0]);_pc.push(_pb[1]);aa+='['+_pc.cfString()+']';if(i<(_pa.length-1)){aa+=', ';}}}
aa+=']';}
return aa;},destructor:function(){return(this.id=QObj.$[this.id]=this.s_toString=this.colNames=this.dataRec=null);}};GUIActsObj=function(id){this.id=id;this.stack=[];this.ooStack=[];this.ooStateCache=[];this.aspectStack=[];this.stylesStack=[];};GUIActsObj.$=[];GUIActsObj.get$=function(){var instance=GUIActsObj.$[GUIActsObj.$.length];if(instance==null){instance=GUIActsObj.$[GUIActsObj.$.length]=new GUIActsObj(GUIActsObj.$.length);}
return instance;};GUIActsObj.remove$=function(id){var ret_val=false;if((id>-1)&&(id<GUIActsObj.$.length)){var instance=GUIActsObj.$[id];if(!!instance){GUIActsObj.$[id]=object_destructor(instance);ret_val=(GUIActsObj.$[id]==null);}}
return ret_val;};GUIActsObj.remove$s=function(){var ret_val=true;for(var i=0;i<GUIActsObj.$.length;i++){GUIActsObj.remove$(i);}
return ret_val;};GUIActsObj.prototype={id:-1,stack:[],ooStack:[],ooStateCache:[],aspectStack:[],stylesStack:[],toString:function(){var s='id = ('+this.id+') :: (';s+='\n';for(var i=0;i<this.stack.length;i++){s+=i+' = ['+this.stack[i]+']'+((i<(this.stack.length-1))?', ':'');}
s+=')';return s;},pushButton:function(id){var aHandle=-1;var oo=$(id);if(!!oo){this.stack.push(id);this.ooStack.push(oo);this.ooStateCache[id]=oo.disabled;oo.disabled=true;aHandle=this.stack.length-1;}
return aHandle;},push:function(id){var aHandle=-1;var oo=$(id);if(!!oo){this.stack.push(id);this.ooStack.push(oo);this.aspectStack.push(DictObj.get$());this.stylesStack.push(DictObj.get$());aHandle=this.stack.length-1;}
return aHandle;},revertAspectsDict:function(aDict,oo){var i=-1;if((!!aDict)&&(!!oo)){var keys=aDict.getKeys();for(i=0;i<keys.length;i++){var aVal=aDict.getValueFor(keys[i]);oo[keys[i]]=aVal;}}},revertStylesDict:function(aDict,oo){var i=-1;if((!!aDict)&&(!!oo)){var keys=aDict.getKeys();for(i=0;i<keys.length;i++){setStyle(oo.style,keys[i]+': '+aDict.getValueFor(keys[i])+';');}}},pop:function(aHandle){var oo=-1;if((aHandle>-1)&&(aHandle==(this.ooStack.length-1))){oo=this.ooStack.pop();if(!!oo){this.iterateDicts(this.aspectStack.pop(),this.revertAspectsDict,oo);this.iterateDicts(this.stylesStack.pop(),this.revertStylesDict,oo);}
this.destructDicts();return this.stack.pop();}else{alert('WARNING: Programming Error - Cannot pop from anywhere but the end of the stack towards beginning of the stack - the stack is a LIFO buffer...');}
return-1;},popBtn:function(aHandle){var oo=-1;if((aHandle>-1)&&(aHandle<=(this.ooStack.length-1))){oo=this.ooStack.pop();if(!!oo){oo.disabled=this.ooStateCache[oo.id];}
return this.stack.pop();}else{alert('WARNING: Programming Error - Cannot pop from anywhere but the end of the stack towards beginning of the stack - the stack is a LIFO buffer...');}
return-1;},popAll:function(){var i=-1;for(i=this.stack.length-1;i>=0;i--){this.pop(i);}},replaceAspectNamedFor:function(aHandle,aName,aVal){var oo=-1;if((aHandle>-1)&&(aHandle<this.ooStack.length)){oo=this.ooStack[aHandle];if(!!oo){if(!!aName){var aDict=this.aspectStack[aHandle];aDict.push(aName,oo[aName]);oo[aName]=aVal;return aHandle;}}}
return-1;},replaceStyleNamedFor:function(aHandle,aName,aVal){var oo=-1;if((aHandle>-1)&&(aHandle<this.ooStack.length)){oo=this.ooStack[aHandle];if(!!oo){if(!!aName){var aa=aVal.split(';');if((aVal.indexOf(':')!=-1)&&(aa.length==2)){var aStyle=getStyle(oo,aName);var aDict=this.stylesStack[aHandle];aDict.push(aName,aStyle);setStyle(oo.style,aVal+((aVal.indexOf(';')==-1)?';':''));return aHandle;}else{alert('WARNING: Programming Error - the style of ('+aVal+', '+aa.length+') is not properly formed or has too many styles specified - kindly modify your code to make ('+aVal+') into a properly formed style spec that specifies a single style (hint: properly formed style specs are just like the ones you would normally code into a style="font-size: 10px;" block however you may leave-off the final ";" in case you are passing in a single style spec).');}}}}
return-1;},length:function(){return(this.stack.length);},iterateDicts:function(anArrayOrDict,func,oO){var i=-1;var aDict=-1;if((!!anArrayOrDict)&&(!!oO)){if(typeof anArrayOrDict==const_object_symbol){if((!!anArrayOrDict.length)&&(typeof anArrayOrDict.length!=const_function_symbol)){for(i=0;i<anArrayOrDict.length;i++){aDict=anArrayOrDict[i];if((!!aDict)&&(!!func)&&(typeof func==const_function_symbol)){func(aDict,oO);}}}else{if((!!func)&&(typeof func==const_function_symbol)){func(anArrayOrDict,oO);}}}}},destructDict:function(aDict){if(!!aDict){DictObj.remove$(aDict.id);}},destructDicts:function(){this.iterateDicts(this.aspectStack,this.destructDict);this.iterateDicts(this.stylesStack,this.destructDict);},init:function(){this.stack=[];this.ooStack=[];this.destructDicts();this.aspectStack=[];this.stylesStack=[];return this;},destructor:function(){this.destructDicts();return(this.id=GUIActsObj.$[this.id]=this.aspectStack=this.stylesStack=this.stylesDict=this.aspectDict=this.ooStack=this.stack=null);}};_stack_AJAX_functions=[];function initAJAXEngine(){oAJAXEngine.onSend=function(){if(global_allow_loading_data_message==true){showAJAXBegins();}
window.status='';};oAJAXEngine.onReceive=function(){var _db='';showAJAXEnds();var byteCount=0;try{if(this.isReceivedFromCFAjax()){byteCount+=this.received.length;eval(this.received);}else{try{for(var i=0;i<this.received.length;i++){byteCount+=this.received[i].length;eval(this.received[i]);}}catch(ee){_alertError(jsErrorExplainer(ee,'1.0'+', this.received['+i+'] = ['+this.received[i]+']'));}finally{}}}catch(e){_alertError(jsErrorExplainer(ee,'1.1'));}finally{}
window.status=byteCount+' bytes received from AJAX Server.';if(this.isDebugMode())alert('oAJAXEngine.mode = ['+oAJAXEngine.mode+']'+'\n'+this.received);handle_next_AJAX_function();};oAJAXEngine.onTimeout=function(){this.throwError("The current request has timed out.\nPlease try your request again.");showAJAXEnds();handle_next_AJAX_function();};}
function doAJAX_func(cmd,callBackFuncName,vararg_params){var j=-1;var j2=-1;var ar=[];var ar2=[];var ampersand_i=-1;var equals_i=-1;var _argCnt=0;var anArg='';var iArg=0;var s_argSpec='';var isObject=false;var sValue='&cfm='+cmd+'&AUTH_USER='+((!!cf_AUTH_USER)?cf_AUTH_USER:'')+'&callBack='+callBackFuncName;var _db='';iArg=0;for(var i=0;i<arguments.length-2;i++){anArg=arguments[i+2];isObject=false;_db+=', (typeof anArg) = ['+(typeof anArg)+']';if((typeof anArg).toUpperCase()==const_object_symbol.toUpperCase()){var k=-1;for(k=0;k<anArg.length;k++){if(anArg[k].trim().length>0){if((typeof anArg[k]).toUpperCase()!=const_string_symbol.toUpperCase()){try{anArg[k]=anArg[k].toString();}catch(e){anArg[k]='';}finally{}}
s_argSpec+='&arg'+(iArg+1)+'='+anArg[k].URLEncode();_argCnt++;iArg++;}}
isObject=true;}else if((typeof anArg).toUpperCase()!=const_string_symbol.toUpperCase()){try{anArg=anArg.toString();}catch(e){anArg='';}finally{}}
_db+=', isObject = ['+isObject+']';if(isObject==false){ampersand_i=anArg.indexOf('&');equals_i=anArg.indexOf('=');if((ampersand_i!=-1)&&(equals_i!=-1)&&(ampersand_i<equals_i)){s_argSpec+=anArg.toString().URLEncode();_argCnt++;iArg++;}else if(anArg.indexOf(',')!=-1){ar=anArg.split(',');for(j=0;j<ar.length;j++){if(ar[j].indexOf('=')!=-1){ar2=ar[j].split('=');j2=(j*2);s_argSpec+='&arg'+(j2-1)+'='+ar2[0].toString().URLEncode();_argCnt++;iArg++;s_argSpec+='&arg'+j2+'='+ar2[1].toString().URLEncode();_argCnt++;iArg++;}else{s_argSpec+='&arg'+(j+1)+'='+ar[j].toString().URLEncode();_argCnt++;iArg++;}}}else{s_argSpec+='&arg'+(iArg+1)+'='+anArg.toString().URLEncode();_argCnt++;iArg++;}}}
sValue+='&argCnt='+_argCnt+s_argSpec;window.status='';if(global_echo_AJAX_commands){_alert('doAJAX_func(cmd = ['+cmd+'], callBackFuncName = ['+callBackFuncName+']) = ['+sValue+']');}else{if(oAJAXEngine.isXmlHttpPreferred==false){oAJAXEngine.setMethodGet();}
oAJAXEngine.sendPacket(sValue);}}
var _global_clientWidth=clientWid$();var global_allow_loading_data_message=true;function window_onload(){initAJAXEngine();_global_clientWidth=clientWid$();global_allow_loading_data_message=true;register_AJAX_function("showAJAXEnds();");handle_next_AJAX_function();}
function window_onUnload(){AJaxContextObj.remove$s();AJAXObj.remove$s();QObj.remove$s();GUIActsObj.remove$s();DictObj.remove$s();AJAXEngine.remove$s();var bodyObj=document.getElementsByTagName('body')[0];if(!!bodyObj){var a=bodyObj.getElementsByTagName('div');for(var i=0;i<a.length;i++){flushCache$(a[i]);}
flushCache$(bodyObj);}}
window.onresize=function(){_global_clientWidth=clientWid$();}
var global_reposition_stack=[];var global_reposition_cache=[];function repositionBasedOnFloatingDebugPanel(oObj){var dObj=$(const_div_floating_debug_menu);if(!!dObj){oObj.style.position=dObj.style.position;oObj.style.top=((dObj.style.top.length==0)?0:parseInt(dObj.style.top))+((oObj.id=='table_menuHelperPanel')?20:0)+'px';oObj.style.left='100px';oObj.style.width=(clientWid$()-175)+'px';if(global_reposition_cache[oObj.id]==null){global_reposition_cache[oObj.id]=oObj;global_reposition_stack.push(oObj.id);}}}
window.onscroll=function(){var dObj=$(const_div_floating_debug_menu);if(!!dObj){dObj.style.position='absolute';dObj.style.top=document.body.scrollTop+15+'px';dObj.style.left=0+'px';var i=-1;var oo=-1;for(i=0;i<global_reposition_stack.length;i++){oo=global_reposition_cache[global_reposition_stack[i]];if(!!oo){repositionBasedOnFloatingDebugPanel(oo);}}}
var cObj=$('div_sysMessages');if(!!cObj){cObj.style.position='absolute';cObj.style.top=document.body.scrollTop+15+'px';}
var cObj=$('iframe_showAJAXBegins');if(!!cObj){cObj.style.position='absolute';cObj.style.top=document.body.scrollTop+0+'px';}}
var bool_isAnyErrorRecords=false;var bool_isAnyPKErrorRecords=false;function anyErrorRecords(_ri,_dict,_rowCntName){var errorMsg='';var isPKerror='';try{errorMsg=_dict.getValueFor('ERRORMSG');isPKerror=_dict.getValueFor('ISPKVIOLATION');}catch(e){}finally{}
bool_isAnyErrorRecords=((!!errorMsg)&&(errorMsg.length>0));bool_isAnyPKErrorRecords=((!!isPKerror)&&(isPKerror.length>0));s_explainError='';if((bool_isAnyErrorRecords)||(bool_isAnyPKErrorRecords)){try{s_explainError+=_dict.getValueFor('ERRORMSG').stripHTML().stripSpacesBy2s().stripCrLfs().stripTabs(' ');}catch(e){}finally{}
try{s_explainError+='\n'+_dict.getValueFor('MOREERRORMSG').stripHTML().stripSpacesBy2s().stripCrLfs().stripTabs(' ');}catch(e){}finally{}}}
function register_AJAX_function(f){_stack_AJAX_functions.push(f);}
function handle_next_AJAX_function(){var f=_stack_AJAX_functions.pop();if(!!f){eval(f);}}
function ajaxBegins(width){var resp='';if(width==null){width=const_jsapi_width_value;}
resp='<table width="'+parseInt(width)+'px" bgcolor="'+const_paper_color_light_yellow+'" border="1" cellpadding="-1" cellspacing="-1">';resp+='<tr>';resp+='<td height="25px">';return resp;}
function ajaxEnds(){var resp='';resp+='</td>';resp+='</tr>';resp+='</table>';return resp;}
function showAJAXBegins(sMsg,sImage,imageHeight){var resp='';var frameCode='';var divName=const_cf_html_container_symbol;var cObj=$(divName);if(!!cObj){imageHeight=((!!imageHeight)?imageHeight:'55%');resp='<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">';resp+='<html><head><title>System Activity Display</title>';resp+='<link rel=stylesheet type="text/css" href="'+document.location.href+((document.location.href.charAt(document.location.href.length-1)!='/')?'/':'')+'AJAX/ajaxStyles.css">';resp+='</head>';resp+='<body>';resp+=ajaxBegins();resp+='<b>'+((!!sMsg)?sMsg:const_loading_data_message_symbol)+'</b>';resp+='&nbsp;&nbsp;<img height="'+imageHeight+'" src="'+((!!sImage)?sImage:const_jsapi_loading_image)+'" border="0">';resp+=ajaxEnds();resp+='</body></html>';frameCode='<iframe id="iframe_showAJAXBegins" frameborder="0" marginwidth="0" marginheight="0" scrolling="No" style="display: none;"></iframe>';if(cObj.innerHTML.length>0){flushCache$(cObj);}
cObj.innerHTML=frameCode;var frObj=$('iframe_showAJAXBegins');if(!!frObj){frObj.contentWindow.document.writeln(resp);frObj.style.display=const_inline_style;cObj.style.position='absolute';cObj.style.top='0px';cObj.style.left=(clientWid$()-const_jsapi_width_value-1)+'px';cObj.style.height='30px';cObj.style.width=const_jsapi_width_value+'px';frObj.style.position='absolute';frObj.style.top=document.body.scrollTop+'px';frObj.style.left='0px';frObj.style.height='30px';frObj.style.width=const_jsapi_width_value+'px';}
var dObj=$(const_div_floating_debug_menu);if(!!dObj){dObj.style.position=cObj.style.position;}}}
function showAJAXEnds(){var frObj=$('iframe_showAJAXBegins');if(!!frObj){if(frObj.style.display!=const_none_style){frObj.style.display=const_none_style;}}}
function clearAJAXEnds(){var resp='';var divName=const_cf_html_container_symbol;var cObj=$(divName);if(!!cObj){if(cObj.innerHTML.length>0){flushCache$(cObj);}
resp=ajaxBegins();resp+='<b>'+const_system_ready_message_symbol+'</b>';resp+=ajaxEnds();cObj.innerHTML=resp;}}
function initJSQ(qryObjName,columnList){var s_code=qryObjName+' = -1;';var qryObj=eval(s_code);try{eval(qryObjName+' = (('+qryObjName+') ? object_destructor('+qryObjName+') : null)');}catch(e){}finally{};eval(qryObjName+" = QObj.get$((columnList) ? columnList : '')");}
AJaxContextObj=function(id){this.id=id;this.queryString='';this.parmsDict=-1;this.argsDict=-1;};AJaxContextObj.$=[];AJaxContextObj.get$=function(){var instance=AJaxContextObj.$[AJaxContextObj.$.length];if(instance==null){instance=AJaxContextObj.$[AJaxContextObj.$.length]=new AJaxContextObj(AJaxContextObj.$.length);}
return instance;};AJaxContextObj.remove$=function(id){var ret_val=false;if((id>-1)&&(id<AJaxContextObj.$.length)){var instance=AJaxContextObj.$[id];if(!!instance){AJaxContextObj.$[id]=object_destructor(instance);ret_val=(AJaxContextObj.$[id]==null);}}
return ret_val;};AJaxContextObj.remove$s=function(){var ret_val=true;for(var i=0;i<AJaxContextObj.$.length;i++){AJaxContextObj.remove$(i);}
return ret_val;};AJaxContextObj.prototype={id:-1,queryString:'',parmsDict:-1,argsDict:-1,toString:function(){var aKey=-1;var s='\nAJaxContextObj('+this.id+') :: (\n';s+='queryString = ['+this.queryString+']'+'\n';s+='parmsDict = ['+this.parmsDict+']'+'\n';s+='argsDict = ['+this.argsDict+']'+'\n';s+=')';return s;},init:function(){this.queryString='';try{this.parmsDict.destructor();}catch(e){}finally{};this.parmsDict=-1;try{this.argsDict.destructor();}catch(e){}finally{};this.argsDict=-1;return this;},destructor:function(){try{this.parmsDict.destructor();}catch(e){}finally{};this.parmsDict=-1;try{this.argsDict.destructor();}catch(e){}finally{};return(this.id=AJaxContextObj.$[this.id]=this.queryString=this.parmsDict=this.argsDict=null);}};AJAXObj=function(id){this.id=id;};AJAXObj.$=[];AJAXObj.get$=function(){var instance=AJAXObj.$[AJAXObj.$.length];if(instance==null){instance=AJAXObj.$[AJAXObj.$.length]=new AJAXObj(AJAXObj.$.length);}
return instance;};AJAXObj.remove$=function(id){var ret_val=false;if((id>-1)&&(id<AJAXObj.$.length)){var instance=AJAXObj.$[id];if(!!instance){AJAXObj.$[id]=object_destructor(instance);ret_val=(AJAXObj.$[id]==null);}}
return ret_val;};AJAXObj.remove$s=function(){var ret_val=true;for(var i=0;i<AJAXObj.$.length;i++){AJAXObj.remove$(i);}
return ret_val;};AJAXObj.prototype={id:-1,data:[],names:[],toString:function(){function toStr(a,d){var s='[';var i=-1;var aName='';try{var n=a.length;for(i=0;i<n;i++){aName=a[i];s+=aName+" = \{"+d[aName].toString()+"\}"+'\n';}}catch(e){}finally{}
s+=']';return s;}
var s='id = ['+this.id+'], '+toStr(this.names,this.data);return s;},init:function(){this.names=[];this.data=[];return this;},push:function(aName,datum){this.names.push(aName);this.data[aName]=datum;},pop:function(){var aName=this.names.pop();return this.data[aName];},named:function(aName){return this.data[aName];},destructor:function(){return(this.id=AJAXObj.$[this.id]=this.data=this.names=null);}};AJAXEngine=function(id,u,_d){this.id=id;if(!u)this.throwError("No server-side AJAX Event Handler was specified.",true);if(!(!!document.getElementById))this.throwError("Your browser does not meet the minimum requirements. \nPortions of the page have been disabled and therefore \nthe page may not work as expected.",true);this.url=u;this.mode=((!!_d&&_d==true)?this.debug_mode_symbol:this.release_mode_symbol);this.ajaxID='id_'+AJAXEngine.releaseNumber+'_AJAX_'+AJAXEngine.items.length;this.formID='id_'+AJAXEngine.releaseNumber+'_AJAX_Form_'+AJAXEngine.items.length;};AJAXEngine.releaseNumber='AJAXEngine';AJAXEngine.$=[];AJAXEngine.get$=function(_url,_debugFlag){var instance=AJAXEngine.$[AJAXEngine.$.length];if(instance==null){instance=AJAXEngine.$[AJAXEngine.$.length]=new AJAXEngine(AJAXEngine.$.length,_url,_debugFlag);}
return instance;};AJAXEngine.remove$=function(id){var ret_val=false;if((id>-1)&&(id<AJAXEngine.$.length)){var instance=AJAXEngine.$[id];if(!!instance){AJAXEngine.$[id]=object_destructor(instance);ret_val=(AJAXEngine.$[id]==null);}}
return ret_val;};AJAXEngine.remove$s=function(){var ret_val=true;for(var i=0;i<AJAXEngine.$.length;i++){AJAXEngine.remove$(i);}
return ret_val;};AJAXEngine._cacheCounters=[];AJAXEngine.xmlHttp_reqObject=function(){var oXmlHttpReqObj=new Object();if(!!oXmlHttpReqObj){oXmlHttpReqObj.oRequest=false;oXmlHttpReqObj.oGateway=-1;}
return oXmlHttpReqObj;};AJAXEngine.transmitPacket=function(ajaxObj){return((!!ajaxObj)?ajaxObj._transmitPacket():alert('ERROR: Programming Error - Undefined Objects ajaxObj is ('+ajaxObj+') in function known as AJAXEngine.transmitPacket().'));};AJAXEngine.serverTimeout=function(id,ajaxObj){return((!!ajaxObj)?ajaxObj._serverTimeout(id):alert('ERROR: Programming Error - Undefined Objects ajaxObj is ('+ajaxObj+') in function known as AJAXEngine.serverTimeout().'));};AJAXEngine.resetStatus=function(ajaxObj){return((!!ajaxObj)?ajaxObj._resetStatus():alert('ERROR: Programming Error - Undefined Objects ajaxObj is ('+ajaxObj+') in function known as AJAXEngine.resetStatus().'));};AJAXEngine.processXmlHttpRequestStateChange=function(ajaxObj){return((!!ajaxObj)?ajaxObj.processXmlHttpRequestStateChange():alert('ERROR: Programming Error - Undefined Objects ajaxObj is ('+ajaxObj+') in function known as AJAXEngine.processXmlHttpRequestStateChange().'));};AJAXEngine.bof_cfajax_comment_symbol='\/* BOF CFAJAX *\/';AJAXEngine.eof_cfajax_comment_symbol='\/* EOF CFAJAX *\/';AJAXEngine._xmlHttp_reqObject=AJAXEngine.xmlHttp_reqObject();AJAXEngine.items=[];AJAXEngine.prototype={id:-1,errors:[],iframeSrc:'',sent:null,received:null,counter:0,multithreaded:true,delay:1,timeout:10,statusReset:3,statusdelay:333,statusID:null,delayID:null,timeoutID:null,statusResetID:null,Get_symbol:'get',method:this.Get_symbol,Idle_symbol:'idle',status:this.Idle_symbol,Post_symbol:'post',Received_symbol:'received',Sending_symbol:'sending',release_mode_symbol:"release",debug_mode_symbol:"debug",isFrameShown:false,isXmlHttpPreferred:false,js_global_varName:'qObj',myHTML:'',currentContextName:'',namedContextCache:[],namedContextStack:[],toString:function(){var s='id = ['+this.id+']';return s;},onReceive:function(){},onSend:function(){},onTimeout:function(){this.throwError("(Warning) The current request has timed out. Please \ntry your request again.");},setMethodGet:function(){this.method=this.Get_symbol;return(this.method);},setMethodPost:function(){this.method=this.Post_symbol;return(this.method);},isMethodGet:function(){return(this.method==this.Get_symbol);},isMethodPost:function(){return(this.method==this.Post_symbol);},getUrl:function(){return this.url+((this.url.indexOf("?")==-1)?"?":"&")+"uuid="+uuid$();},isReleaseMode:function(){return(this.mode==this.release_mode_symbol);},isDebugMode:function(){return(this.mode==this.debug_mode_symbol);},setReleaseMode:function(){this.mode=this.release_mode_symbol;},setDebugMode:function(){this.mode=this.debug_mode_symbol;},create:function(){this.setDebugMode();this.top=((this.isReleaseMode())?"0":"600")+'px';this.left=((this.isReleaseMode())?"0":"0")+'px';this.width=((this.isReleaseMode())?"1":"990")+'px';this.height=((this.isReleaseMode())?"1":"475")+'px';this.bgcolor=(this.isReleaseMode())?"#ffffff":"#FFFFBF";this.setReleaseMode();this.visibility=(this.isReleaseMode())?"hidden":"visible";document.write(this.html());},hideFrame:function(){if(this.isDebugMode()){var oo=$(this.ajaxID);if(!!oo){oo.style.visibility="hidden";this.visibility=oo.style.visibility;this.isFrameShown=false;}
var ooTable=$('table_'+this.ajaxID);if(!!ooTable){ooTable.style.visibility="hidden";}}},showFrame:function(){if(this.isDebugMode()){var oo=$(this.ajaxID);if(!!oo){oo.style.visibility="visible";this.visibility=oo.style.visibility;this.isFrameShown=true;}
var ooTable=$('table_'+this.ajaxID);if(!!ooTable){ooTable.style.visibility="visible";}}},throwError:function(error){this.errors[this.errors.length++]=error;if(this.status==this.Sending_symbol)this.receivePacket(null,false);this.showFrame();alert(error);},html:function(){var html='';html+="<style type=\"text\/css\">\n";html+="#"+this.ajaxID+" {width: "+this.width+"; height: "+this.height+"; left: "+this.left+" visibility: "+this.visibility+"; background: cyan; }\n";html+="#table_"+this.ajaxID+" {position:absolute; width: "+this.width+"; top: "+(parseInt(this.top)-20)+"px; left: "+this.left+" visibility: "+this.visibility+"; background: "+this.bgcolor+"; }\n";html+="</style>\n";var sSrc=((typeof this.iframeSrc=="string")?"src=\""+this.iframeSrc+"\" ":"");html+='<table id="'+'table_'+this.ajaxID+'" border="1" bgcolor="'+this.bgcolor+'" cellpadding="-1" cellspacing="-1" style="visibility: '+this.visibility+'">';html+='<tr>';html+='<td>';html+="<iframe "+sSrc+"width=\""+this.width+"\" height=\""+this.height+"\" name=\""+this.ajaxID+"\" id=\""+this.ajaxID+"\" frameBorder=\"1\" frameSpacing=\"0\" marginWidth=\"0\" marginHeight=\"0\" scrolling=\"Auto\" src=\"/include/ajax/ajaxDriver.cfm\"></iframe>\n";html+='</td>';html+='</tr>';html+='</table>';html+="<form name=\""+this.formID+"\" action=\""+this.url+"\" target=\""+this.ajaxID+"\" method=\"post\" style=\"width:0px; height:0px; margin:0px 0px 0px 0px;\">\n";html+="<input type=\"Hidden\" name=\"packet\" value=\"\">";html+="</form>\n";this.myHTML=html;return html;},_serverTimeout:function(id){if((this.status==this.Sending_symbol)&&(this.counter==id)){this.status="timedout";clearInterval(this.statusID);if(this.isDebugMode())window.status="";this.timeoutID=null;this.onTimeout();}},_resetStatus:function(){this.status=this.Idle_symbol;this.statusResetID=null;},receivePacket:function(packet,_bRunEvent){if(this.status=="timedout")return false;var b=(typeof _bRunEvent!="boolean")?true:_b;clearInterval(this.statusID);if(this.isDebugMode())window.status="";this.received=packet;if(b)this.onReceive();clearInterval(this.statusID);this.statusID=null;this.status=this.Received_symbol;var js='AJAXEngine.resetStatus(AJAXEngine.$['+this.id+'])';this.statusResetID=setTimeout(js,this.statusReset*1000);},sendPacket:function(packet){this.onSend();if((!this.multithreaded)&&(this.status==this.Sending_symbol))return false;if(!!this.delayID)clearTimeout(this.delayID);if(!!this.statusResetID)clearTimeout(this.statusResetID);this.sent='&___jsName___='+this.js_global_varName+packet;var js='AJAXEngine.transmitPacket(AJAXEngine.$['+this.id+'])';this.delayID=setTimeout(js,this.delay);},isReceivedFromCFAjax:function(){if((!!this.received)&&(typeof this.received!=const_object_symbol)){var bof_f=this.received.toUpperCase().indexOf(AJAXEngine.bof_cfajax_comment_symbol.toUpperCase());var eof_f=this.received.toUpperCase().indexOf(AJAXEngine.eof_cfajax_comment_symbol.toUpperCase());return((bof_f>=0)&&(eof_f>=0)&&(bof_f<eof_f));}else{return false;}},processXmlHttpRequestStateChange:function(){window.status=AJAXEngine._xmlHttp_reqObject.oRequest.readyState+', '+AJAXEngine._xmlHttp_reqObject.oRequest.status;if((!!AJAXEngine._xmlHttp_reqObject.oRequest)&&(AJAXEngine._xmlHttp_reqObject.oRequest.readyState==4)){try{if(AJAXEngine._xmlHttp_reqObject.oRequest.status&&AJAXEngine._xmlHttp_reqObject.oRequest.status==200){var response=AJAXEngine._xmlHttp_reqObject.oRequest.responseText;response=response.stripCrLfs();var bof_f=response.toUpperCase().indexOf(AJAXEngine.bof_cfajax_comment_symbol.toUpperCase());var eof_f=response.toUpperCase().indexOf(AJAXEngine.eof_cfajax_comment_symbol.toUpperCase());if(eof_f>0){eof_f+=AJAXEngine.eof_cfajax_comment_symbol.length;}
if(bof_f>0){response=response.substring(Math.min(bof_f,eof_f),Math.max(bof_f,eof_f));}
if(!!AJAXEngine._xmlHttp_reqObject.oGateway){AJAXEngine._xmlHttp_reqObject.oGateway.receivePacket(response);}}else{var response=AJAXEngine._xmlHttp_reqObject.oRequest.responseText;alert('ERROR - AJAXEngine Error:\n'+response.stripCrLfs());}}catch(ex){_alertError(jsErrorExplainer(ex,'(processXmlHttpRequestStateChange) :: processXmlHttpRequestStateChange threw an error.'));}}},initXmlHttpRequest:function(url){var bool=false;if(window.XMLHttpRequest){try{AJAXEngine._xmlHttp_reqObject.oRequest=new XMLHttpRequest();bool=true;}catch(e){AJAXEngine._xmlHttp_reqObject.oRequest=false;bool=false;}}else if(window.ActiveXObject){try{AJAXEngine._xmlHttp_reqObject.oRequest=new ActiveXObject("Msxml2.XMLHTTP");bool=true;}catch(e){try{AJAXEngine._xmlHttp_reqObject.oRequest=new ActiveXObject("Microsoft.XMLHTTP");bool=true;}catch(e){AJAXEngine._xmlHttp_reqObject.oRequest=false;bool=false;}}}
try{switch(this.method){case this.Post_symbol:if(AJAXEngine._xmlHttp_reqObject.oRequest){AJAXEngine._xmlHttp_reqObject.oRequest.onreadystatechange=AJAXEngine.processXmlHttpRequestStateChange(this);AJAXEngine._xmlHttp_reqObject.oGateway=this;var a=url.split('?');if(a.length==2){AJAXEngine._xmlHttp_reqObject.oRequest.open("POST",a[0],true);AJAXEngine._xmlHttp_reqObject.oRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");AJAXEngine._xmlHttp_reqObject.oRequest.send('QUERY_STRING='+a[1].URLEncode());}else{bool=false;}}
break;case this.Get_symbol:if(AJAXEngine._xmlHttp_reqObject.oRequest){AJAXEngine._xmlHttp_reqObject.oRequest.onreadystatechange=AJAXEngine.processXmlHttpRequestStateChange(this);AJAXEngine._xmlHttp_reqObject.oGateway=this;AJAXEngine._xmlHttp_reqObject.oRequest.open("GET",url,true);AJAXEngine._xmlHttp_reqObject.oRequest.send(null);}
break;}}catch(e){bool=false;}
return bool;},_transmitPacket:function(){this.counter++;this.delayID=null;this.received=null;this.status=this.Sending_symbol;if(this.isDebugMode())window.status="Sending.";AJAXEngine._cacheCounters[this.counter]=0;if(!!this.statusID)clearInterval(this.statusID);var s_ticker="AJAXEngine._cacheCounters["+this.counter+"]++;";if(this.isDebugMode()){s_ticker+=" window.status = window.status + (((AJAXEngine._cacheCounters["+this.counter+"] % "+parseInt((1000/this.statusdelay).toString())+") == 0) ? (AJAXEngine._cacheCounters["+this.counter+"] / "+parseInt((1000/this.statusdelay).toString())+").toString() : '.')";}
this.statusID=setInterval(s_ticker,this.statusdelay);var js='AJAXEngine.serverTimeout('+this.counter+', AJAXEngine.$['+this.id+'])';this.timeoutID=setTimeout(js,this.timeout*1000);if(this.isCurrentContextValid()){var argCnt=-1;var keys=[];var isContextShifted=false;var aDict=DictObj.get$(this.sent);var tDict=this.namedContextCache[this.currentContextName].argsDict;var oDict=tDict;argCnt=this.namedContextCache[this.currentContextName].argsDict.length();var apparentArgCnt=parseInt(aDict.getValueFor('argCnt'));if(!apparentArgCnt){apparentArgCnt=0;aDict.push('argCnt',apparentArgCnt);}
if(apparentArgCnt>0){tDict=DictObj.get$();function adjustAndStoreEachKey(aKey){var newKey=aKey.filterInAlpha()+(parseInt(aKey.filterInNumeric())+apparentArgCnt);tDict.push(newKey,oDict.getValueFor(aKey));return newKey;}
keys=this.namedContextCache[this.currentContextName].argsDict.adjustKeyNames(adjustAndStoreEachKey);isContextShifted=true;}
apparentArgCnt+=argCnt;aDict.put('argCnt',apparentArgCnt);this.sent=aDict.asQueryString();argCnt=apparentArgCnt;this.sent+=tDict.asQueryString();DictObj.remove$(aDict.id);if(isContextShifted)DictObj.remove$(tDict.id);}
var formattedPacket=this.formatPacket(this.sent);if(this.isXmlHttpPreferred==false){if(formattedPacket.length>2000){this.setMethodPost();}else{this.setMethodGet();}}
switch(this.method){case this.Post_symbol:if(this.isXmlHttpPreferred){var bool=this.initXmlHttpRequest(this.getUrl()+'&cfajax=1'+'&'+this.sent);if(bool==false){this.methodPost(this.sent);}}else{this.methodPost(this.sent);}
break;case this.Get_symbol:if(this.isXmlHttpPreferred){var bool=this.initXmlHttpRequest(this.getUrl()+'&cfajax=1'+'&'+this.sent);if(bool==false){this.methodGet(formattedPacket);}}else{this.methodGet(formattedPacket);}
break;}},formatPacket:function(packet){if(typeof packet=="string"){return packet;}
else if(typeof packet=="object"){var p=[];for(var k in packet)p[p.length]=k+"="+escape(packet[k]);return"&"+p.join("&");}},methodPost:function(packet){if((/msie/i.test(navigator.userAgent))==false){return alert("The post method is currently unsupported for the browser you are currently using.");}
oForm=_$(this.formID);if(!!oForm){oForm.packet.value=packet;oForm.submit();}},methodGet:function(sPacket){var sUrl=this.getUrl()+sPacket;this.packetString=sPacket;aObj=_$(this.ajaxID);if(!!aObj){aObj.src=sUrl;}},iterateNamedContexts:function(func){var i=-1;if((!!func)&&(typeof func==const_function_symbol)){for(i=1;i<this.namedContextStack.length;i++){func(this.namedContextStack[i]);}}},addNamedContext:function(aName,parmsQueryString){var aDict=-1;var oDict=-1;var pDict=-1;var argCnt=-1;var keys='';var i=-1;var j=-1;var v='';if(!this.namedContextCache[aName]){aDict=DictObj.get$(parmsQueryString);oDict=DictObj.get$();pDict=DictObj.get$();argCnt=aDict.length();keys=aDict.getKeys();for(i=0,j=1;i<keys.length;i++,j+=2){oDict.push('arg'+j,keys[i]);v=aDict.getValueFor(keys[i]);oDict.push('arg'+(j+1),v);pDict.push(keys[i],v);}
DictObj.remove$(aDict.id);this.namedContextCache[aName]=AJaxContextObj.get$();this.namedContextCache[aName].queryString=parmsQueryString;this.namedContextCache[aName].parmsDict=pDict;this.namedContextCache[aName].argsDict=oDict;this.namedContextStack.push(aName);this.currentContextName=aName;}},setContextName:function(aName){if(!!this.namedContextCache[aName]){this.currentContextName=aName;}else{alert('ERROR: Programming Error - Context Name ('+aName+') is not valid at this time - the list of valid Context Names is ('+this.namedContextStack+').');}},isCurrentContextValid:function(){return(!!this.namedContextCache[this.currentContextName]);},isIdle:function(){return((this.status.trim().toUpperCase()==this.Idle_symbol.trim().toUpperCase())||((this.status.trim().toUpperCase()!=this.Received_symbol.trim().toUpperCase())&&(this.status.trim().toUpperCase()!=this.Sending_symbol.trim().toUpperCase())));},init:function(){return this;},destructor:function(){return(this.id=AJAXEngine.$[this.id]=this.data=this.names=null);}};waferPoint=function(id){this.id=id;};waferPoint.$=[];waferPoint.get$=function(){var instance=waferPoint.$[waferPoint.$.length];if(instance==null){instance=waferPoint.$[waferPoint.$.length]=new waferPoint(waferPoint.$.length);}
return instance;};waferPoint.remove$=function(id){var ret_val=false;if((id>-1)&&(id<waferPoint.$.length)){var instance=waferPoint.$[id];if(!!instance){waferPoint.$[id]=object_destructor(instance);ret_val=(waferPoint.$[id]==null);}}
return ret_val;};waferPoint.remove$s=function(){var ret_val=true;for(var i=0;i<waferPoint.$.length;i++){waferPoint.remove$(i);}
return ret_val;};waferPoint.prototype={id:-1,DieX:-1,DieY:-1,ImageX:-1,ImageY:-1,OriginX:-1,OriginY:-1,value:-1,scaleFactor:-1,toString:function(){var s='waferPoint('+this.id+') :: \n';s+='DieX/DieY = ['+this.DieX+','+this.DieY+']'+'\n';s+='OriginX/OriginY = ['+this.OriginX+','+this.OriginY+']'+((this.scaleFactor!=-1)?', OriginX/OriginY = ['+Math.ceil(this.OriginX*this.scaleFactor)+','+Math.ceil(this.OriginY*this.scaleFactor)+']':'')+'\n';s+='ImageX/ImageY = ['+this.ImageX+','+this.ImageY+']'+((this.scaleFactor!=-1)?', ImageX/ImageY = ['+Math.ceil(this.ImageX*this.scaleFactor)+','+Math.ceil(this.ImageY*this.scaleFactor)+']':'')+'\n';s+='value = ['+this.value+']\n';s+='scaleFactor = ['+this.scaleFactor+']\n\n';return s;},destructor:function(){return(this.id=waferPoint.$[this.id]=this.DieX=this.DieY=this.ImageX=this.ImageY=this.OriginX=this.OriginY=this.value=this.scaleFactor=null);}};waferStats=function(id){this.id=id;};waferStats.$=[];waferStats.get$=function(){var instance=waferStats.$[waferStats.$.length];if(instance==null){instance=waferStats.$[waferStats.$.length]=new waferStats(waferStats.$.length);}
return instance;};waferStats.remove$=function(id){var ret_val=false;if((id>-1)&&(id<waferStats.$.length)){var instance=waferStats.$[id];if(!!instance){waferStats.$[id]=object_destructor(instance);ret_val=(waferStats.$[id]==null);}}
return ret_val;};waferStats.remove$s=function(){var ret_val=true;for(var i=0;i<waferStats.$.length;i++){waferStats.remove$(i);}
return ret_val;};waferStats.prototype={id:-1,minDieX:2^31,maxDieX:-2^31,minDieY:2^31,maxDieY:-2^31,minImageX:2^31,maxImageX:-2^31,minImageY:2^31,maxImageY:-2^31,minOriginX:2^31,maxOriginX:-2^31,minOriginY:2^31,maxOriginY:-2^31,minVal:2^31,maxVal:-2^31,toString:function(){var s='waferStats('+this.id+') :: \n';s+='minDieX/maxDieX = ['+this.minDieX+','+this.maxDieX+']'+'\n';s+='minDieY/maxDieY = ['+this.minDieY+','+this.maxDieY+']'+'\n';s+='minImageX/maxImageX = ['+this.minImageX+','+this.maxImageX+']'+'\n';s+='minImageY/maxImageY = ['+this.minImageY+','+this.maxImageY+']'+'\n';s+='minOriginX/maxOriginX = ['+this.minOriginX+','+this.maxOriginX+']'+'\n';s+='minOriginY/maxOriginY = ['+this.minOriginY+','+this.maxOriginY+']'+'\n';s+='minVal/maxVal = ['+this.minVal+','+this.maxVal+']'+'\n\n';return s;},resetStats:function(){this.minDieX=2^31;this.maxDieX=-2^31;this.minDieY=2^31;this.maxDieY=-2^31;this.minImageX=2^31;this.maxImageX=-2^31;this.minImageY=2^31;this.maxImageY=-2^31;this.minOriginX=2^31;this.maxOriginX=-2^31;this.minOriginY=2^31;this.maxOriginY=-2^31;this.minVal=2^31;this.maxVal=-2^31;},destructor:function(){return(this.id=waferStats.$[this.id]=this.minDieX=this.maxDieX=this.minDieY=this.maxDieY=this.minImageX=this.maxImageX=this.minImageY=this.maxImageY=this.minOriginX=this.maxOriginX=this.minOriginY=this.maxOriginY=this.minVal=this.maxVal=null);}};var _N_Dia=0,_N_Bar=0,_N_Box=0,_N_Dot=0,_N_Pix=0,_N_Line=0,_N_Area=0,_N_Arrow=0,_N_Pie=0,_zIndex=0;var _dSize=(navigator.appName=="Microsoft Internet Explorer")?1:-1;if(navigator.userAgent.search("Opera")>=0)_dSize=-1;var _IE=0;if(_dSize==1)
{_IE=1;if(window.document.documentElement.clientHeight)_dSize=-1;}
var _nav4=(document.layers)?1:0;var _DiagramTarget=window;var _BFont="font-family:Verdana;font-weight:bold;font-size:10pt;line-height:13pt;"
function dom_Draw(theDrawColor,theTextColor,isScaleText,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{var x0,y0,i,j,itext,l,x,y,r,u,fn,dx,dy,xr,yr,invdifx,invdify,deltax,deltay,id=this.ID,lay=0,selObj="",divtext="",ii=0,oo,k,sub,sshift;var c151="&#151;",nbsp=(_IE)?"&nbsp;":"";var EventActions="";if(_nvl(theOnClickAction,"")!="")EventActions+="onClick='"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";lay--;if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);if(selObj)lay--;if(lay<-1)
selObj.title=_nvl(theTooltipText,"");else
_DiagramTarget.document.writeln("<div id='"+this.ID+"' title='"+_nvl(theTooltipText,"")+"'>");if(_IsImage(theDrawColor))
divtext="<div id='"+this.ID+"i"+eval(ii++)+"' "+EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute; left:"+eval(this.left)+"px; width:"+eval(this.right-this.left+_dSize)+"px; top:"+eval(this.top)+"px; height:"+eval(this.bottom-this.top+_dSize)+"px; color:"+theTextColor+"; border-style:solid; border-width:1px; z-index:"+this.zIndex+"'><img src='"+_DiagramImagesHref+theDrawColor+"' width="+eval(this.right-this.left-1)+" height="+eval(this.bottom-this.top-1)+"></div>";else
divtext="<div id='"+this.ID+"i"+eval(ii++)+"' "+EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute; left:"+eval(this.left)+"px; width:"+eval(this.right-this.left+_dSize)+"px; top:"+eval(this.top)+"px; height:"+eval(this.bottom-this.top+_dSize)+"px; background-color:"+theDrawColor+"; color:"+theTextColor+"; border-style:solid; border-width:1px; z-index:"+this.zIndex+"'>&nbsp;</div>";if((this.XScale==1)||(isNaN(this.XScale)))
{u="";fn="";if(isNaN(this.XScale))
{if(this.XScale.substr(0,9)=="function ")fn=eval("window."+this.XScale.substr(9));else u=this.XScale;}
dx=(this.xmax-this.xmin);if(Math.abs(dx)>0)
{invdifx=(this.right-this.left)/(this.xmax-this.xmin);r=1;while(Math.abs(dx)>=100){dx/=10;r*=10;}
while(Math.abs(dx)<10){dx*=10;r/=10;}
if(Math.abs(dx)>=50){this.SubGrids=5;deltax=10*r*_sign(dx);}
else
{if(Math.abs(dx)>=20){this.SubGrids=5;deltax=5*r*_sign(dx);}
else{this.SubGrids=4;deltax=2*r*_sign(dx);}}
if(this.XGridDelta!=0)deltax=this.XGridDelta;if(this.XSubGrids!=0)this.SubGrids=this.XSubGrids;sub=deltax*invdifx/this.SubGrids;sshift=0;if((this.XScalePosition=="top-left")||(this.XScalePosition=="bottom-left"))sshift=-Math.abs(deltax*invdifx/2);if((this.XScalePosition=="top-right")||(this.XScalePosition=="bottom-right"))sshift=Math.abs(deltax*invdifx/2);x=Math.floor(this.xmin/deltax)*deltax;itext=0;if(deltax!=0)this.MaxGrids=Math.floor(Math.abs((this.xmax-this.xmin)/deltax))+2;else this.MaxGrids=0;for(j=this.MaxGrids;j>=-1;j--)
{xr=x+j*deltax;x0=Math.round(this.left+(-this.xmin+xr)*invdifx);if(this.XSubGridColor)
{for(k=1;k<this.SubGrids;k++)
{if((x0-k*sub>this.left+1)&&(x0-k*sub<this.right-1))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+Math.round(x0-k*sub)+"px; top:"+eval(this.top+1)+"px; z-index:"+this.zIndex+"; width:1px; height:"+eval(this.bottom-this.top-1)+"px; background-color:"+this.XSubGridColor+"; font-size:1pt'></div>";}
if(this.SubGrids==-1)
for(k=0;k<8;k++)
{if((x0-this.logsub[k]*sub*_sign(deltax)>this.left+1)&&(x0-this.logsub[k]*sub*_sign(deltax)<this.right-1))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+Math.round(x0-this.logsub[k]*sub*_sign(deltax))+"px; top:"+eval(this.top+1)+"px; z-index:"+this.zIndex+"; width:1px; height:"+eval(this.bottom-this.top-1)+"px; background-color:"+this.XSubGridColor+"; font-size:1pt'></div>";}}
if((x0>=this.left)&&(x0<=this.right))
{itext++;if((itext!=2)||(!isScaleText))
{if(r>1)
{if(fn)l=fn(xr)+"";else l=xr+""+u;}
else
{if(fn)l=fn(Math.round(10*xr/r)/Math.round(10/r))+"";else l=Math.round(10*xr/r)/Math.round(10/r)+""+u;}
if(l.charAt(0)==".")l="0"+l;if(l.substr(0,2)=="-.")l="-0"+l.substr(1,100);}
else l=this.xtext;if(this.XScalePosition.substr(0,3)!="top")
{if((x0+sshift>=this.left)&&(x0+sshift<=this.right))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' align=center style='position:absolute; left:"+eval(x0-50+sshift)+"px; width:102px; top:"+eval(this.bottom+8)+"px; color:"+theTextColor+";"+this.Font+" z-index:"+this.zIndex+"'>"+l+"</div>";divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+x0+"px; top:"+eval(this.bottom-5)+"px; z-index:"+this.zIndex+"; width:1px; height:12px; background-color:"+theTextColor+"; font-size:1pt'></div>";}
else
{if((x0+sshift>=this.left)&&(x0+sshift<=this.right))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' align=center style='position:absolute; left:"+eval(x0-50+sshift)+"px; width:102px; top:"+eval(this.top-24)+"px; color:"+theTextColor+";"+this.Font+" z-index:"+this.zIndex+"'>"+l+"</div>";divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+x0+"px; top:"+eval(this.top-5)+"px; z-index:"+this.zIndex+"; width:1px; height:12px; background-color:"+theTextColor+"; font-size:1pt'></div>";}
if((this.XGridColor)&&(x0>this.left)&&(x0<this.right))divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+x0+"px; top:"+eval(this.top+1)+"px; z-index:"+this.zIndex+"; width:1px; height:"+eval(this.bottom-this.top-1)+"px; background-color:"+this.XGridColor+"; font-size:1pt'></div>";}}}}
if((!isNaN(this.XScale))&&(this.XScale>1))
{dx=(this.xmax-this.xmin);if(Math.abs(dx)>0)
{invdifx=(this.right-this.left)/(this.xmax-this.xmin);deltax=this.DateInterval(Math.abs(dx))*_sign(dx);if(this.XGridDelta!=0)deltax=this.XGridDelta;if(this.XSubGrids!=0)this.SubGrids=this.XSubGrids;sub=deltax*invdifx/this.SubGrids;sshift=0;if((this.XScalePosition=="top-left")||(this.XScalePosition=="bottom-left"))sshift=-Math.abs(deltax*invdifx/2);if((this.XScalePosition=="top-right")||(this.XScalePosition=="bottom-right"))sshift=Math.abs(deltax*invdifx/2);x=Math.floor(this.xmin/deltax)*deltax;itext=0;if(deltax!=0)this.MaxGrids=Math.floor(Math.abs((this.xmax-this.xmin)/deltax))+2;else this.MaxGrids=0;for(j=this.MaxGrids;j>=-2;j--)
{xr=x+j*deltax;x0=Math.round(this.left+(-this.xmin+x+j*deltax)*invdifx);if(this.XSubGridColor)
{for(k=1;k<this.SubGrids;k++)
{if((x0-k*sub>this.left+1)&&(x0-k*sub<this.right-1))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+Math.round(x0-k*sub)+"px; top:"+eval(this.top+1)+"px; z-index:"+this.zIndex+"; width:1px; height:"+eval(this.bottom-this.top-1)+"px; background-color:"+this.XSubGridColor+"; font-size:1pt'></div>";}}
if((x0>=this.left)&&(x0<=this.right))
{itext++;if((itext!=2)||(!isScaleText))l=_DateFormat(xr,Math.abs(deltax),this.XScale);else l=this.xtext;if(this.XScalePosition.substr(0,3)!="top")
{if((x0+sshift>=this.left)&&(x0+sshift<=this.right))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' align=center style='position:absolute; left:"+eval(x0-50+sshift)+"px; width:102px; top:"+eval(this.bottom+8)+"px; color:"+theTextColor+";"+this.Font+" z-index:"+this.zIndex+"'>"+l+"</div>";divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+x0+"px; top:"+eval(this.bottom-5)+"px; z-index:"+this.zIndex+"; width:1px; height:12px; background-color:"+theTextColor+"; font-size:1pt'></div>";}
else
{if((x0+sshift>=this.left)&&(x0+sshift<=this.right))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' align=center style='position:absolute; left:"+eval(x0-50+sshift)+"px; width:102px; top:"+eval(this.top-24)+"px; color:"+theTextColor+";"+this.Font+" z-index:"+this.zIndex+"'>"+l+"</div>";divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+x0+"px; top:"+eval(this.top-5)+"px; z-index:"+this.zIndex+"; width:1px; height:12px; background-color:"+theTextColor+"; font-size:1pt'></div>";}
if((this.XGridColor)&&(x0>this.left)&&(x0<this.right))divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+x0+"px; top:"+eval(this.top+1)+"px; z-index:"+this.zIndex+"; width:1px; height:"+eval(this.bottom-this.top-1)+"px; background-color:"+this.XGridColor+"; font-size:1pt'></div>";}}}}
if((this.YScale==1)||(isNaN(this.YScale)))
{u="";fn="";if(isNaN(this.YScale))
{if(this.YScale.substr(0,9)=="function ")fn=eval("window."+this.YScale.substr(9));else u=this.YScale;}
dy=this.ymax-this.ymin;if(Math.abs(dy)>0)
{invdify=(this.bottom-this.top)/(this.ymax-this.ymin);r=1;while(Math.abs(dy)>=100){dy/=10;r*=10;}
while(Math.abs(dy)<10){dy*=10;r/=10;}
if(Math.abs(dy)>=50){this.SubGrids=5;deltay=10*r*_sign(dy);}
else
{if(Math.abs(dy)>=20){this.SubGrids=5;deltay=5*r*_sign(dy);}
else{this.SubGrids=4;deltay=2*r*_sign(dy);}}
if(this.YGridDelta!=0)deltay=this.YGridDelta;if(this.YSubGrids!=0)this.SubGrids=this.YSubGrids;sub=deltay*invdify/this.SubGrids;sshift=0;if((this.YScalePosition=="left-top")||(this.YScalePosition=="right-top"))sshift=-Math.abs(deltay*invdify/2);if((this.YScalePosition=="left-bottom")||(this.YScalePosition=="right-bottom"))sshift=Math.abs(deltay*invdify/2);y=Math.floor(this.ymax/deltay)*deltay;itext=0;if(deltay!=0)this.MaxGrids=Math.floor(Math.abs((this.ymax-this.ymin)/deltay))+2;else this.MaxGrids=0;for(j=-1;j<=this.MaxGrids;j++)
{yr=y-j*deltay;y0=Math.round(this.top+(this.ymax-yr)*invdify);if(this.YSubGridColor)
{for(k=1;k<this.SubGrids;k++)
{if((y0+k*sub>this.top+1)&&(y0+k*sub<this.bottom-1))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+eval(this.left+1)+"px; top:"+Math.round(y0+k*sub)+"px; z-index:"+this.zIndex+"; height:1px; width:"+eval(this.right-this.left-1)+"px; background-color:"+this.YSubGridColor+"; font-size:1pt;line-height:1pt'>"+nbsp+"</div>";}
if(this.SubGrids==-1)
{for(k=0;k<8;k++)
{if((y0+this.logsub[k]*sub*_sign(deltay)>this.top+1)&&(y0+this.logsub[k]*sub*_sign(deltay)<this.bottom-1))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+eval(this.left+1)+"px; top:"+Math.round(y0+this.logsub[k]*sub*_sign(deltay))+"px; z-index:"+this.zIndex+"; height:1px; width:"+eval(this.right-this.left-1)+"px; background-color:"+this.YSubGridColor+"; font-size:1pt;line-height:1pt'>"+nbsp+"</div>";}}}
if((y0>=this.top)&&(y0<=this.bottom))
{itext++;if((itext!=2)||(!isScaleText))
{if(r>1)
{if(fn)l=fn(yr)+"";else l=yr+""+u;}
else
{if(fn)l=fn(Math.round(10*yr/r)/Math.round(10/r))+"";else l=Math.round(10*yr/r)/Math.round(10/r)+""+u;}
if(l.charAt(0)==".")l="0"+l;if(l.substr(0,2)=="-.")l="-0"+l.substr(1,100);}
else l=this.ytext;if(this.YScalePosition.substr(0,5)!="right")
{if((y0+sshift>=this.top)&&(y0+sshift<=this.bottom))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' align=right style='position:absolute; left:"+eval(this.left-100)+"px; width:89px; top:"+eval(y0-9+sshift)+"px; color:"+theTextColor+";"+this.Font+" z-index:"+this.zIndex+"'>"+l+"</div>";divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+eval(this.left-5)+"px; top:"+eval(y0)+"px; z-index:"+this.zIndex+"; height:1px; width:11px; background-color:"+theTextColor+"; font-size:1pt;line-height:1pt'>"+nbsp+"</div>";}
else
{if((y0+sshift>=this.top)&&(y0+sshift<=this.bottom))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' align=left style='position:absolute; left:"+eval(this.right+10)+"px; width:89px; top:"+eval(y0-9+sshift)+"px; color:"+theTextColor+";"+this.Font+" z-index:"+this.zIndex+"'>"+l+"</div>";divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+eval(this.right-5)+"px; top:"+eval(y0)+"px; z-index:"+this.zIndex+"; height:1px; width:11px; background-color:"+theTextColor+"; font-size:1pt;line-height:1pt'>"+nbsp+"</div>";}
if((this.YGridColor)&&(y0>this.top)&&(y0<this.bottom))divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+eval(this.left+1)+"px; top:"+eval(y0)+"px; z-index:"+this.zIndex+"; height:1px; width:"+eval(this.right-this.left-1)+"px; background-color:"+this.YGridColor+"; font-size:1pt;line-height:1pt'>"+nbsp+"</div>";}}}}
if((!isNaN(this.YScale))&&(this.YScale>1))
{dy=this.ymax-this.ymin;if(Math.abs(dy)>0)
{invdify=(this.bottom-this.top)/(this.ymax-this.ymin);deltay=this.DateInterval(Math.abs(dy))*_sign(dy);if(this.YGridDelta!=0)deltay=this.YGridDelta;if(this.YSubGrids!=0)this.SubGrids=this.YSubGrids;sub=deltay*invdify/this.SubGrids;sshift=0;if((this.YScalePosition=="left-top")||(this.YScalePosition=="right-top"))sshift=-Math.abs(deltay*invdify/2);if((this.YScalePosition=="left-bottom")||(this.YScalePosition=="right-bottom"))sshift=Math.abs(deltay*invdify/2);y=Math.floor(this.ymax/deltay)*deltay;itext=0;if(deltay!=0)this.MaxGrids=Math.floor(Math.abs((this.ymax-this.ymin)/deltay))+2;else this.MaxGrids=0;for(j=-2;j<=this.MaxGrids;j++)
{yr=y-j*deltay;y0=Math.round(this.top+(this.ymax-y+j*deltay)*invdify);if(this.YSubGridColor)
{for(k=1;k<this.SubGrids;k++)
{if((y0+k*sub>this.top+1)&&(y0+k*sub<this.bottom-1))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+eval(this.left+1)+"px; top:"+Math.round(y0+k*sub)+"px; z-index:"+this.zIndex+"; height:1px; width:"+eval(this.right-this.left-1)+"px; background-color:"+this.YSubGridColor+"; font-size:1pt;line-height:1pt'>"+nbsp+"</div>";}}
if((y0>=this.top)&&(y0<=this.bottom))
{itext++;if((itext!=2)||(!isScaleText))l=_DateFormat(yr,Math.abs(deltay),this.YScale);else l=this.ytext;if(this.YScalePosition.substr(0,5)!="right")
{if((y0+sshift>=this.top)&&(y0+sshift<=this.bottom))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' align=right style='position:absolute; left:"+eval(this.left-100)+"px; width:89px; top:"+eval(y0-9+sshift)+"px; color:"+theTextColor+";"+this.Font+" z-index:"+this.zIndex+"'>"+l+"</div>";divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+eval(this.left-5)+"px; top:"+eval(y0)+"px; z-index:"+this.zIndex+"; height:1px; width:11px; background-color:"+theTextColor+"; font-size:1pt;line-height:1pt'>"+nbsp+"</div>";}
else
{if((y0+sshift>=this.top)&&(y0+sshift<=this.bottom))
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' align=left style='position:absolute; left:"+eval(this.right+10)+"px; width:89px; top:"+eval(y0-9+sshift)+"px; color:"+theTextColor+";"+this.Font+" z-index:"+this.zIndex+"'>"+l+"</div>";divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+eval(this.right-5)+"px; top:"+eval(y0)+"px; z-index:"+this.zIndex+"; height:1px; width:11px; background-color:"+theTextColor+"; font-size:1pt;line-height:1pt'>"+nbsp+"</div>";}
if((this.YGridColor)&&(y0>this.top)&&(y0<this.bottom))divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' style='position:absolute; left:"+eval(this.left+1)+"px; top:"+eval(y0)+"px; z-index:"+this.zIndex+"; height:1px; width:"+eval(this.right-this.left-1)+"px; background-color:"+this.YGridColor+"; font-size:1pt;line-height:1pt'>"+nbsp+"</div>";}}}}
if(this.XScalePosition.substr(0,3)!="top")
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' align=center style='position:absolute; left:"+this.left+"px; width:"+eval(this.right-this.left)+"px; top:"+eval(this.top-20)+"px; color:"+theTextColor+";"+this.Font+" z-index:"+this.zIndex+"'>"+this.title+"</div>";else
divtext+="<div id='"+this.ID+"i"+eval(ii++)+"' align=center style='position:absolute; left:"+this.left+"px; width:"+eval(this.right-this.left)+"px; top:"+eval(this.bottom+4)+"px; color:"+theTextColor+";"+this.Font+" z-index:"+this.zIndex+"'>"+this.title+"</div>";if(lay<-1)
selObj.innerHTML=divtext;else
_DiagramTarget.document.writeln(divtext+"</div>");}
function dom_Bar(theLeft,theTop,theRight,theBottom,theDrawColor,theText,theTextColor,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.ID="Bar"+_N_Bar;_N_Bar++;_zIndex++;this.left=theLeft;this.top=theTop;this.width=theRight-theLeft;this.height=theBottom-theTop;this.DrawColor=theDrawColor;this.Text=String(theText);this.TextColor=theTextColor;this.BorderWidth="";this.BorderColor="";this.Cursor=_cursor(theOnClickAction);this.SetVisibility=_SetVisibility;this.SetColor=_SetBarColor;this.SetText=_SetBarText;this.SetTitle=_SetTitle;this.MoveTo=_MoveTo;this.ResizeTo=_ResizeTo;this.Delete=_Delete;var EventActions="";if(_nvl(theOnClickAction,"")!="")EventActions+="onClick='"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";if(_nvl(theText,"")!="")
{var tt=theText;if(_IsImage(theText))tt="<img src='"+_DiagramImagesHref+theText+"' width="+eval(theRight-theLeft-1)+" height="+eval(theBottom-theTop-1)+">";_DiagramTarget.document.writeln("<div id='"+this.ID+"' "+EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+theLeft+"px;top:"+theTop+"px;width:"+eval(theRight-theLeft)+"px;height:"+eval(theBottom-theTop)+"px;background-color:"+theDrawColor+";color:"+theTextColor+";"+_BFont+"z-index:"+_zIndex+"'; title='"+_nvl(theTooltipText,"")+"' align=center>"+tt+"</div>");}
else
{var vv=(this.height>0)?"":";visibility:hidden";_DiagramTarget.document.writeln("<div id='"+this.ID+"' "+EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+theLeft+"px;top:"+theTop+"px;width:"+eval(theRight-theLeft)+"px;height:"+eval(theBottom-theTop)+"px;background-color:"+theDrawColor+";font-size:1pt;line-height:1pt;font-family:Verdana;font-weight:normal;z-index:"+_zIndex+vv+"'; title='"+_nvl(theTooltipText,"")+"'>&nbsp;</div>");}
return(this);}
var _debug$=false;function dom_Box(theLeft,theTop,theRight,theBottom,theDrawColor,theText,theTextColor,theBorderWidth,theBorderColor,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.ID="Box"+_N_Box;_N_Box++;_zIndex++;this.left=theLeft;this.top=theTop;this.width=Math.abs(theRight-theLeft);this.height=Math.abs(theBottom-theTop);this.DrawColor=theDrawColor;this.Text=String(theText);this.TextColor=theTextColor;this.BorderWidth=theBorderWidth;this.BorderColor=theBorderColor;this.Cursor=_cursor(theOnClickAction);this.SetVisibility=_SetVisibility;this.SetColor=_SetBarColor;this.SetText=_SetBarText;this.SetTitle=_SetTitle;this.MoveTo=_MoveTo;this.ResizeTo=_ResizeTo;this.Delete=_Delete;var EventActions="";if(_nvl(theOnClickAction,"")!="")EventActions+="onClick='"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";var bb="";var ww=theBorderWidth;if(_nvl(theBorderWidth,"")=="")ww=0;if((_nvl(theBorderWidth,"")!="")&&(_nvl(theBorderColor,"")!=""))
bb="border-style:solid;border-width:"+theBorderWidth+"px;border-color:"+theBorderColor+";";if(_nvl(theText,"")!="")
{var tt=theText;if(_IsImage(theText))tt="<img src='"+_DiagramImagesHref+theText+"' width="+eval(this.width-(2*ww))+" height="+eval(this.height-(2*ww))+">";_DiagramTarget.document.writeln("<div id='"+this.ID+"' "+EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+theLeft+"px;top:"+theTop+"px;width:"+eval(this.width-ww+(ww*_dSize))+"px;height:"+eval(this.height-ww+(ww*_dSize))+"px;"+bb+"background-color:"+theDrawColor+";color:"+theTextColor+";"+_BFont+"z-index:"+_zIndex+";' title='"+_nvl(theTooltipText,"")+"' align=center>"+tt+"</div>");}
else
{var vv=(this.height>=2*ww)?"":";visibility:hidden";_DiagramTarget.document.writeln("<div id='"+this.ID+"' "+EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+theLeft+"px;top:"+theTop+"px;width:"+eval(this.width-ww+(ww*_dSize))+"px;height:"+eval(this.height-ww+(ww*_dSize))+"px;"+bb+"background-color:"+theDrawColor+";font-size:1pt;line-height:1pt;font-family:Verdana;font-weight:normal;z-index:"+_zIndex+vv+";' title='"+_nvl(theTooltipText,"")+"'>&nbsp;</div>");}
return(this);}
function dom_SetBarColor(theColor)
{var id=this.ID,selObj;this.DrawColor=theColor;if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);selObj.style.backgroundColor=theColor;}
function dom_SetBarText(theText)
{var id=this.ID,selObj;this.Text=String(theText);if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);var tt=theText;if(_IsImage(theText))
{var ww=0;if(this.BorderWidth)ww=this.BorderWidth;tt="<img src='"+_DiagramImagesHref+theText+"' width="+eval(this.width-2*ww)+" height="+eval(this.height-2*ww)+">";}
selObj.innerHTML=tt;}
function dom_Dot(theX,theY,theSize,theType,theColor,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.Size=theSize;this.ID="Dot"+_N_Dot;_N_Dot++;_zIndex++;this.X=theX;this.Y=theY;this.dX=Math.round(theSize/2);this.dY=Math.round(theSize/2);this.Type=theType;this.Color=theColor;this.Cursor=_cursor(theOnClickAction);this.SetVisibility=_SetVisibility;this.SetColor=_SetDotColor;this.SetTitle=_SetTitle;this.MoveTo=_DotMoveTo;this.Delete=_Delete;var EventActions="";if(_nvl(theOnClickAction,"")!="")EventActions+="onClick='"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";_DiagramTarget.document.write("<div id='"+this.ID+"' "+EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+Math.round(theX-this.Size/2)+"px;top:"+Math.round(theY-this.Size/2)+"px; width:"+this.Size+"px; height:"+this.Size+"px; z-index:"+_zIndex+"' title='"+_nvl(theTooltipText,"")+"'>");if(isNaN(theType))
{_DiagramTarget.document.write("<div style='position:absolute;left:0px;top:0px;width:"+this.Size+"px;height:"+this.Size+"px;background-color:"+theColor+";font-size:1pt;line-height:1pt;'>");_DiagramTarget.document.write("<img src='"+_DiagramImagesHref+theType+"' width="+this.Size+"px height="+this.Size+"px style='vertical-align:bottom'></div>");}
else
{if(theType%6==0)
{_DiagramTarget.document.write("<div style='position:absolute;left:1px;top:"+Math.round(this.Size/4+0.3)+"px;width:"+eval(this.Size-1)+"px;height:"+eval(this.Size+1-2*Math.round(this.Size/4+0.3))+"px;background-color:"+theColor+";font-size:1pt'></div>");_DiagramTarget.document.write("<div style='position:absolute;left:"+Math.round(this.Size/4+0.3)+"px;top:1px;width:"+eval(this.Size+1-2*Math.round(this.Size/4+0.3))+"px;height:"+eval(this.Size-1)+"px;background-color:"+theColor+";font-size:1pt'></div>");}
if(theType%6==1)
{_DiagramTarget.document.write("<div style='position:absolute;left:"+Math.round(this.Size/2-this.Size/8)+"px;top:0px;width:"+Math.round(this.Size/4)+"px;height:"+this.Size+"px;background-color:"+theColor+";font-size:1pt'></div>");_DiagramTarget.document.write("<div style='position:absolute;left:0px;top:"+Math.round(this.Size/2-this.Size/8)+"px;width:"+this.Size+"px;height:"+Math.round(this.Size/4)+"px;background-color:"+theColor+";font-size:1pt'></div>");}
if(theType%6==2)
_DiagramTarget.document.write("<div style='position:absolute;left:0px;top:0px;width:"+this.Size+"px;height:"+this.Size+"px;background-color:"+theColor+";font-size:1pt'></div>");if(theType%6==3)
{_DiagramTarget.document.write("<div style='position:absolute;left:0px;top:"+Math.round(this.Size/4)+"px;width:"+this.Size+"px;height:"+Math.round(this.Size/2)+"px;background-color:"+theColor+";font-size:1pt'></div>");_DiagramTarget.document.write("<div style='position:absolute;left:"+Math.round(this.Size/2-this.Size/8)+"px;top:0px;width:"+Math.round(this.Size/4)+"px;height:"+this.Size+"px;background-color:"+theColor+";font-size:1pt'></div>");}
if(theType%6==4)
{_DiagramTarget.document.write("<div style='position:absolute;left:"+Math.round(this.Size/4)+"px;top:0px;width:"+Math.round(this.Size/2)+"px;height:"+this.Size+"px;background-color:"+theColor+";font-size:1pt'></div>");_DiagramTarget.document.write("<div style='position:absolute;left:0px;top:"+Math.round(this.Size/2-this.Size/8)+"px;width:"+this.Size+"px;height:"+Math.round(this.Size/4)+"px;background-color:"+theColor+";font-size:1pt'></div>");}
if(theType%6==5)
{if(_dSize==1)
_DiagramTarget.document.write("<div style='position:absolute;left:0px;top:0px;width:"+this.Size+"px;height:"+this.Size+"px;border-width:"+Math.round(this.Size/6)+"px; border-style:solid;border-color:"+theColor+";font-size:1pt;line-height:1pt'></div>");else
_DiagramTarget.document.write("<div style='position:absolute;left:0px;top:0px;width:"+Math.round(this.Size-this.Size/4)+"px;height:"+Math.round(this.Size-this.Size/4)+"px;border-width:"+Math.round(this.Size/6)+"px; border-style:solid;border-color:"+theColor+";font-size:1pt;line-height:1pt'></div>");}}
_DiagramTarget.document.writeln("</div>");return(this);}
function dom_SetDotColor(theColor)
{this.Color=theColor;var tt="",selObj;if(document.all)selObj=eval("_DiagramTarget.document.all."+this.ID);else selObj=_DiagramTarget.document.getElementById(this.ID);if(isNaN(this.Type))
{tt+="<div style='position:absolute;left:0px;top:0px;width:"+this.Size+"px;height:"+this.Size+"px;background-color:"+theColor+";font-size:1pt;line-height:1pt;'>";tt+="<img src='"+_DiagramImagesHref+theType+"' width="+this.Size+"px height="+this.Size+"px style='vertical-align:bottom'></div>";}
else
{if(this.Type%6==0)
{tt+="<div style='position:absolute;left:1px;top:"+Math.round(this.Size/4+0.3)+"px;width:"+eval(this.Size-1)+"px;height:"+eval(this.Size+1-2*Math.round(this.Size/4+0.3))+"px;background-color:"+theColor+";font-size:1pt'></div>";tt+="<div style='position:absolute;left:"+Math.round(this.Size/4+0.3)+"px;top:1px;width:"+eval(this.Size+1-2*Math.round(this.Size/4+0.3))+"px;height:"+eval(this.Size-1)+"px;background-color:"+theColor+";font-size:1pt'></div>";}
if(this.Type%6==1)
{tt+="<div style='position:absolute;left:"+Math.round(this.Size/2-this.Size/8)+"px;top:0px;width:"+Math.round(this.Size/4)+"px;height:"+this.Size+"px;background-color:"+theColor+";font-size:1pt'></div>";tt+="<div style='position:absolute;left:0px;top:"+Math.round(this.Size/2-this.Size/8)+"px;width:"+this.Size+"px;height:"+Math.round(this.Size/4)+"px;background-color:"+theColor+";font-size:1pt'></div>";}
if(this.Type%6==2)
tt+="<div style='position:absolute;left:0px;top:0px;width:"+this.Size+"px;height:"+this.Size+"px;background-color:"+theColor+";font-size:1pt'></div>";if(this.Type%6==3)
{tt+="<div style='position:absolute;left:0px;top:"+Math.round(this.Size/4)+"px;width:"+this.Size+"px;height:"+Math.round(this.Size/2)+"px;background-color:"+theColor+";font-size:1pt'></div>";tt+="<div style='position:absolute;left:"+Math.round(this.Size/2-this.Size/8)+"px;top:0px;width:"+Math.round(this.Size/4)+"px;height:"+this.Size+"px;background-color:"+theColor+";font-size:1pt'></div>";}
if(this.Type%6==4)
{tt+="<div style='position:absolute;left:"+Math.round(this.Size/4)+"px;top:0px;width:"+Math.round(this.Size/2)+"px;height:"+this.Size+"px;background-color:"+theColor+";font-size:1pt'></div>";tt+="<div style='position:absolute;left:0px;top:"+Math.round(this.Size/2-this.Size/8)+"px;width:"+this.Size+"px;height:"+Math.round(this.Size/4)+"px;background-color:"+theColor+";font-size:1pt'></div>";}
if(this.Type%6==5)
{if(_dSize==1)
tt+="<div style='position:absolute;left:0px;top:0px;width:"+this.Size+"px;height:"+this.Size+"px;border-width:"+Math.round(this.Size/6)+"px; border-style:solid;border-color:"+theColor+";font-size:1pt;line-height:1pt'></div>";else
tt+="<div style='position:absolute;left:0px;top:0px;width:"+Math.round(this.Size-this.Size/4)+"px;height:"+Math.round(this.Size-this.Size/4)+"px;border-width:"+Math.round(this.Size/6)+"px; border-style:solid;border-color:"+theColor+";font-size:1pt;line-height:1pt'></div>";}}
selObj.innerHTML=tt;}
function dom_DotMoveTo(theX,theY)
{var id=this.ID,selObj;if(!isNaN(parseInt(theX)))this.X=theX;if(!isNaN(parseInt(theY)))this.Y=theY;if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);with(selObj.style)
{if(!isNaN(parseInt(theX)))left=eval(theX-this.dX)+"px";if(!isNaN(parseInt(theY)))top=eval(theY-this.dY)+"px";visibility="visible";}}
var pixel_width=1;var pixel_height=2;function dom_Pixel(theX,theY,theColor)
{this.ID="Pix"+_N_Pix;_N_Pix++;_zIndex++;this.left=theX;this.top=theY;this.dX=0;this.dY=0;this.Color=theColor;this.SetVisibility=_SetVisibility;this.SetColor=_SetPixelColor;this.MoveTo=_DotMoveTo;this.Delete=_Delete;_DiagramTarget.document.writeln("<div id='"+this.ID+"' style='position:absolute;left:"+eval(theX-this.dX)+"px;top:"+eval(theY-this.dY)+"px;width:"+pixel_width+"px;height:"+pixel_height+"px;background-color:"+theColor+";font-size:1pt;z-index:"+_zIndex+"'></div>");return(this);}
function dom_SetPixelColor(theColor)
{var id=this.ID,selObj;this.Color=theColor;if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);selObj.style.backgroundColor=theColor;}
function dom_SetVisibility(isVisible)
{var ll,id=this.ID,selObj;if(document.all)
{selObj=eval("_DiagramTarget.document.all."+id);if(isVisible)selObj.style.visibility="visible";else selObj.style.visibility="hidden";}
else
{selObj=_DiagramTarget.document.getElementById(id);if(isVisible)selObj.style.visibility="visible";else selObj.style.visibility="hidden";if(id.substr(0,3)=='Dia')
{var ii=0;selObj=_DiagramTarget.document.getElementById(id+'i'+eval(ii++));while(selObj!=null)
{if(isVisible)selObj.style.visibility="visible";else selObj.style.visibility="hidden";selObj=_DiagramTarget.document.getElementById(id+'i'+eval(ii++));}}}}
function dom_SetTitle(theTitle)
{var id=this.ID,selObj;if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);selObj.title=theTitle;}
function dom_MoveTo(theLeft,theTop)
{var id=this.ID,selObj,ww=0;if(this.BorderWidth)ww=this.BorderWidth;if(!isNaN(parseInt(theLeft)))this.left=theLeft;if(!isNaN(parseInt(theTop)))this.top=theTop;if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);with(selObj.style)
{if(!isNaN(parseInt(theLeft)))left=theLeft+"px";if(!isNaN(parseInt(theTop)))top=theTop+"px";if(this.height<=2*ww)visibility="hidden";else visibility="visible";}}
function dom_ResizeTo(theLeft,theTop,theWidth,theHeight)
{var id=this.ID,selObj,ww=0;if(this.BorderWidth)ww=this.BorderWidth;if(!isNaN(parseInt(theLeft)))this.left=theLeft;if(!isNaN(parseInt(theTop)))this.top=theTop;if(!isNaN(parseInt(theWidth)))this.width=theWidth;if(!isNaN(parseInt(theHeight)))this.height=theHeight;if(_IsImage(this.Text))this.SetText(this.Text);if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);with(selObj.style)
{if(!isNaN(parseInt(theLeft)))left=theLeft+"px";if(!isNaN(parseInt(theTop)))top=theTop+"px";if(!isNaN(parseInt(theWidth)))width=eval(theWidth-ww+ww*_dSize)+"px";if(!isNaN(parseInt(theHeight)))height=eval(theHeight-ww+ww*_dSize)+"px";if(this.height<=2*ww)visibility="hidden";else visibility="visible";}}
function dom_Delete()
{var id=this.ID,selObj;if(document.all)
{selObj=eval("_DiagramTarget.document.all."+id);selObj.outerHTML="";}
else
{selObj=_DiagramTarget.document.getElementById(id);selObj.parentNode.removeChild(selObj);}}
function dom_SetColor(theColor)
{this.Color=theColor;if((theColor!="")&&(theColor.length<this.Color.length))this.Color="#"+theColor;else this.Color=theColor;this.ResizeTo("","","","");}
function dom_Line(theX0,theY0,theX1,theY1,theColor,theSize,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.ID="Line"+_N_Line;_N_Line++;_zIndex++;this.X0=theX0;this.Y0=theY0;this.X1=theX1;this.Y1=theY1;this.Color=theColor;if((theColor!="")&&(theColor.length==6))this.Color="#"+theColor;this.Size=Number(_nvl(theSize,1));this.Cursor=_cursor(theOnClickAction);this.SetVisibility=_SetVisibility;this.SetColor=_SetColor;this.SetTitle=_SetTitle;this.MoveTo=_LineMoveTo;this.ResizeTo=_LineResizeTo;this.Delete=_Delete;this.EventActions="";if(_nvl(theOnClickAction,"")!="")this.EventActions+="onClick='"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")this.EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")this.EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";var xx0,yy0,xx1,yy1,ll,rr,tt,bb,ww,hh,ccl,ccr,cct,ccb;var ss2=Math.floor(this.Size/2),nbsp="";var ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(theX0<=theX1){ll=theX0;rr=theX1;}
else{ll=theX1;rr=theX0;}
if(theY0<=theY1){tt=theY0;bb=theY1;}
else{tt=theY1;bb=theY0;}
ww=rr-ll;hh=bb-tt;_DiagramTarget.document.write("<div id='"+this.ID+"' style='position:absolute;left:"+eval(ll-ss2)+"px;top:"+eval(tt-ss2)+"px; width:"+eval(ww+this.Size)+"px; height:"+eval(hh+this.Size)+"px; z-index:"+_zIndex+";' title='"+_nvl(theTooltipText,"")+"'>");if((ww==0)||(hh==0))
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:0px;top:0px;width:"+eval(ww+this.Size)+"px;height:"+eval(hh+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+ccl+"px;top:"+cct+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ww-ccr)+"px;top:"+cct+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+ccl+"px;top:"+cct+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ww-ccl)+"px;top:"+cct+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");ccl++;}}}
_DiagramTarget.document.writeln("</div>");return(this);}
function dom_LineResizeTo(theX0,theY0,theX1,theY1)
{var xx0,yy0,xx1,yy1,ll,rr,tt,bb,ww,hh,ccl,ccr,cct,ccb,id=this.ID,selObj="",divtext="";var ss2=Math.floor(this.Size/2),nbsp="";if(!isNaN(parseInt(theX0)))this.X0=theX0;if(!isNaN(parseInt(theY0)))this.Y0=theY0;if(!isNaN(parseInt(theX1)))this.X1=theX1;if(!isNaN(parseInt(theY1)))this.Y1=theY1;var ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);with(selObj.style)
{left=eval(ll-ss2)+"px";top=eval(tt-ss2)+"px";width=eval(ww+this.Size)+"px";height=eval(hh+this.Size)+"px";}
if((ww==0)||(hh==0))
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:0px;top:0px;width:"+eval(ww+this.Size)+"px;height:"+eval(hh+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+ccl+"px;top:"+cct+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ww-ccr)+"px;top:"+cct+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+ccl+"px;top:"+cct+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ww-ccl)+"px;top:"+cct+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";ccl++;}}}
selObj.innerHTML=divtext;}
function dom_LineMoveTo(theLeft,theTop)
{var id=this.ID,selObj;var ss2=Math.floor(this.Size/2);if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);with(selObj.style)
{if(!isNaN(parseInt(theLeft)))left=eval(theLeft-ss2)+"px";if(!isNaN(parseInt(theTop)))top=eval(theTop-ss2)+"px";visibility="visible";}}
function dom_Area(theX0,theY0,theX1,theY1,theColor,theBase,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.ID="Area"+_N_Area;_N_Area++;_zIndex++;this.X0=theX0;this.Y0=theY0;this.X1=theX1;this.Y1=theY1;this.Color=theColor;this.Base=theBase;this.Cursor=_cursor(theOnClickAction);this.SetVisibility=_SetVisibility;this.SetColor=_SetColor;this.SetTitle=_SetTitle;this.MoveTo=_MoveTo;this.ResizeTo=_AreaResizeTo;this.Delete=_Delete;this.EventActions="";if(_nvl(theOnClickAction,"")!="")this.EventActions+="onClick='"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")this.EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")this.EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";var dd,ll,rr,tt,bb,ww,hh;if(theX0<=theX1){ll=theX0;rr=theX1;}
else{ll=theX1;rr=theX0;}
if(theY0<=theY1){tt=theY0;bb=theY1;}
else{tt=theY1;bb=theY0;}
ww=rr-ll;hh=bb-tt;if(theBase<=tt)
_DiagramTarget.document.write("<div id='"+this.ID+"' style='position:absolute;left:"+ll+"px;top:"+theBase+"px; width:"+ww+"px; height:"+hh+"px; z-index:"+_zIndex+"; font-size:1pt; line-height:1pt;' title='"+_nvl(theTooltipText,"")+"'>");else
_DiagramTarget.document.write("<div id='"+this.ID+"' style='position:absolute;left:"+ll+"px;top:"+tt+"px; width:"+ww+"px; height:"+Math.max(hh,theBase-tt)+"px; z-index:"+_zIndex+"; font-size:1pt; line-height:1pt;' title='"+_nvl(theTooltipText,"")+"'>");if(theBase<=tt)
{if((theBase<tt)&&(ww>0))
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:0px;top:0px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"o_"+theColor+".gif' width="+ww+"px height="+eval(tt-theBase)+"px style='vertical-align:bottom'></div>");if(((theY0<theY1)&&(theX0<theX1))||((theY0>theY1)&&(theX0>theX1)))
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:0px;top:"+eval(tt-theBase)+"px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"q_"+theColor+".gif' width="+ww+"px height="+hh+"px style='vertical-align:bottom'></div>");if(((theY0>theY1)&&(theX0<theX1))||((theY0<theY1)&&(theX0>theX1)))
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:0px;top:"+eval(tt-theBase)+"px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"p_"+theColor+".gif' width="+ww+"px height="+hh+"px style='vertical-align:bottom'></div>");}
if((theBase>tt)&&(theBase<bb))
{dd=Math.round((theBase-tt)/hh*ww);if(((theY0<theY1)&&(theX0<theX1))||((theY0>theY1)&&(theX0>theX1)))
{_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:0px;top:0px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"b_"+theColor+".gif' width="+dd+"px height="+eval(theBase-tt)+"px style='vertical-align:bottom'></div>");_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+dd+"px;top:"+eval(theBase-tt)+"px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"q_"+theColor+".gif' width="+eval(ww-dd)+"px height="+eval(bb-theBase)+"px style='vertical-align:bottom'></div>");}
if(((theY0>theY1)&&(theX0<theX1))||((theY0<theY1)&&(theX0>theX1)))
{_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:0px;top:"+eval(theBase-tt)+"px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"p_"+theColor+".gif' width="+eval(ww-dd)+"px height="+eval(bb-theBase)+"px style='vertical-align:bottom'></div>");_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ww-dd)+"px;top:0px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"d_"+theColor+".gif' width="+dd+"px height="+eval(theBase-tt)+"px style='vertical-align:bottom'></div>");}}
if(theBase>=bb)
{if((theBase>bb)&&(ww>0))
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:0px;top:"+hh+"px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"o_"+theColor+".gif' width="+ww+"px height="+eval(theBase-bb)+"px style='vertical-align:bottom'></div>");if(((theY0<theY1)&&(theX0<theX1))||((theY0>theY1)&&(theX0>theX1)))
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:0px;top:0px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"b_"+theColor+".gif' width="+ww+"px height="+hh+"px style='vertical-align:bottom'></div>");if(((theY0>theY1)&&(theX0<theX1))||((theY0<theY1)&&(theX0>theX1)))
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:0px;top:0px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"d_"+theColor+".gif' width="+ww+"px height="+hh+"px style='vertical-align:bottom'></div>");}
_DiagramTarget.document.writeln("</div>");}
function dom_AreaResizeTo(theX0,theY0,theX1,theY1)
{var dd,ll,rr,tt,bb,ww,hh,id=this.ID,selObj="",divtext="";if(!isNaN(parseInt(theX0)))this.X0=theX0;if(!isNaN(parseInt(theY0)))this.Y0=theY0;if(!isNaN(parseInt(theX1)))this.X1=theX1;if(!isNaN(parseInt(theY1)))this.Y1=theY1;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);with(selObj.style)
{if(this.Base<=tt){left=ll+"px";top=this.Base+"px";width=ww+"px";height=hh+"px";}
else{left=ll+"px";top=tt+"px";width=ww+"px";height=Math.max(hh,this.Base-tt)+"px";}}
if(this.Base<=tt)
{if((this.Base<tt)&&(ww>0))
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:0px;top:0px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"o_"+this.Color+".gif' width="+ww+"px height="+eval(tt-this.Base)+"px style='vertical-align:bottom'></div>";if(((this.Y0<this.Y1)&&(this.X0<this.X1))||((this.Y0>this.Y1)&&(this.X0>this.X1)))
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:0px;top:"+eval(tt-this.Base)+"px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"q_"+this.Color+".gif' width="+ww+"px height="+hh+"px style='vertical-align:bottom'></div>";if(((this.Y0>this.Y1)&&(this.X0<this.X1))||((this.Y0<this.Y1)&&(this.X0>this.X1)))
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:0px;top:"+eval(tt-this.Base)+"px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"p_"+this.Color+".gif' width="+ww+"px height="+hh+"px style='vertical-align:bottom'></div>";}
if((this.Base>tt)&&(this.Base<bb))
{dd=Math.round((this.Base-tt)/hh*ww);if(((this.Y0<this.Y1)&&(this.X0<this.X1))||((this.Y0>this.Y1)&&(this.X0>this.X1)))
{divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:0px;top:0px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"b_"+this.Color+".gif' width="+dd+"px height="+eval(this.Base-tt)+"px style='vertical-align:bottom'></div>";divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+dd+"px;top:"+eval(this.Base-tt)+"px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"q_"+this.Color+".gif' width="+eval(ww-dd)+"px height="+eval(bb-this.Base)+"px style='vertical-align:bottom'></div>";}
if(((this.Y0>this.Y1)&&(this.X0<this.X1))||((this.Y0<this.Y1)&&(this.X0>this.X1)))
{divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:0px;top:"+eval(this.Base-tt)+"px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"p_"+this.Color+".gif' width="+eval(ww-dd)+"px height="+eval(bb-this.Base)+"px style='vertical-align:bottom'></div>";divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ww-dd)+"px;top:0px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"d_"+this.Color+".gif' width="+dd+"px height="+eval(this.Base-tt)+"px style='vertical-align:bottom'></div>";}}
if(this.Base>=bb)
{if((this.Base>bb)&&(ww>0))
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:0px;top:"+hh+"px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"o_"+this.Color+".gif' width="+ww+"px height="+eval(this.Base-bb)+"px style='vertical-align:bottom'></div>";if(((this.Y0<this.Y1)&&(this.X0<this.X1))||((this.Y0>this.Y1)&&(this.X0>this.X1)))
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:0px;top:0px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"b_"+this.Color+".gif' width="+ww+"px height="+hh+"px style='vertical-align:bottom'></div>";if(((this.Y0>this.Y1)&&(this.X0<this.X1))||((this.Y0<this.Y1)&&(this.X0>this.X1)))
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:0px;top:0px;font-size:1pt;line-height:1pt;'><img src='"+_DiagramImagesHref+"d_"+this.Color+".gif' width="+ww+"px height="+hh+"px style='vertical-align:bottom'></div>";}
selObj.innerHTML=divtext;}
function dom_Arrow(theX0,theY0,theX1,theY1,theColor,theSize,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.ID="Arrow"+_N_Arrow;_N_Arrow++;_zIndex++;this.X0=theX0;this.Y0=theY0;this.X1=theX1;this.Y1=theY1;this.Color=theColor;if((theColor!="")&&(theColor.length==6))this.Color="#"+theColor;this.Size=Number(_nvl(theSize,1));this.Cursor=_cursor(theOnClickAction);this.Border=8*this.Size;this.SetVisibility=_SetVisibility;this.SetColor=_SetColor;this.SetTitle=_SetTitle;this.MoveTo=_ArrowMoveTo;this.ResizeTo=_ArrowResizeTo;this.Delete=_Delete;this.EventActions="";if(_nvl(theOnClickAction,"")!="")this.EventActions+="onClick='"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")this.EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")this.EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";var xx0,yy0,xx1,yy1,ll,rr,tt,bb,ww,hh,ccl,ccr,cct,ccb;var ddir,ss2=Math.floor(this.Size/2),nbsp="";ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;_DiagramTarget.document.write("<div id='"+this.ID+"' style='position:absolute;left:"+eval(ll-ss2-this.Border)+"px;top:"+eval(tt-ss2-this.Border)+"px; width:"+eval(ww+this.Size+2*this.Border)+"px; height:"+eval(hh+this.Size+2*this.Border)+"px; z-index:"+_zIndex+";' title='"+_nvl(theTooltipText,"")+"'>");if((ww==0)||(hh==0))
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+this.Border+"px;top:"+this.Border+"px;width:"+eval(ww+this.Size)+"px;height:"+eval(hh+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ccl+this.Border)+"px;top:"+eval(cct+this.Border)+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ww-ccr+this.Border)+"px;top:"+eval(cct+this.Border)+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ccl+this.Border)+"px;top:"+eval(cct+this.Border)+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ww-ccl+this.Border)+"px;top:"+eval(cct+this.Border)+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");ccl++;}}}
var LL=1,ll0=ll,tt0=tt;var ccL=8*theSize+4,ccB=2*theSize+1;var DDX=theX1-theX0,DDY=theY1-theY0;if((DDX!=0)||(DDY!=0))LL=Math.sqrt((DDX*DDX)+(DDY*DDY));this.X0=theX1-Math.round(1/LL*(ccL*DDX-ccB*DDY));this.Y0=theY1-Math.round(1/LL*(ccL*DDY+ccB*DDX));ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;if((ww==0)||(hh==0))
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(this.Border+ll-ll0)+"px;top:"+eval(this.Border+tt-tt0)+"px;width:"+eval(ww+this.Size)+"px;height:"+eval(hh+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ccl+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ww-ccr+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ccl+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ww-ccl+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");ccl++;}}}
this.X0=theX1-Math.round(1/LL*(ccL*DDX+ccB*DDY));this.Y0=theY1-Math.round(1/LL*(ccL*DDY-ccB*DDX));ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;if((ww==0)||(hh==0))
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(this.Border+ll-ll0)+"px;top:"+eval(this.Border+tt-tt0)+"px;width:"+eval(ww+this.Size)+"px;height:"+eval(hh+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ccl+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ww-ccr+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ccl+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+_cursor(theOnClickAction)+"position:absolute;left:"+eval(ww-ccl+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");ccl++;}}}
_DiagramTarget.document.writeln("</div>");this.X0=theX0;this.Y0=theY0;return(this);}
function dom_ArrowResizeTo(theX0,theY0,theX1,theY1)
{var xx0,yy0,xx1,yy1,ll,rr,tt,bb,ww,hh,ccl,ccr,cct,ccb,id=this.ID,selObj="",divtext="";var ss2=Math.floor(this.Size/2),nbsp="";if(!isNaN(parseInt(theX0)))this.X0=theX0;if(!isNaN(parseInt(theY0)))this.Y0=theY0;if(!isNaN(parseInt(theX1)))this.X1=theX1;if(!isNaN(parseInt(theY1)))this.Y1=theY1;var tmpX0=this.X0,tmpY0=this.Y0;var ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);with(selObj.style)
{left=eval(ll-ss2-this.Border)+"px";top=eval(tt-ss2-this.Border)+"px";width=eval(ww+this.Size+2*this.Border)+"px";height=eval(hh+this.Size+2*this.Border)+"px";}
if((ww==0)||(hh==0))
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+this.Border+"px;top:"+this.Border+"px;width:"+eval(ww+this.Size)+"px;height:"+eval(hh+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ccl+this.Border)+"px;top:"+eval(cct+this.Border)+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ww-ccr+this.Border)+"px;top:"+eval(cct+this.Border)+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ccl+this.Border)+"px;top:"+eval(cct+this.Border)+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ww-ccl+this.Border)+"px;top:"+eval(cct+this.Border)+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";ccl++;}}}
var LL=1,ll0=ll,tt0=tt;var ccL=8*this.Size+4,ccB=2*this.Size+1;var DDX=this.X1-tmpX0,DDY=this.Y1-tmpY0;if((DDX!=0)||(DDY!=0))LL=Math.sqrt(0+(DDX*DDX)+(DDY*DDY));this.X0=this.X1-Math.round(1/LL*(ccL*DDX-ccB*DDY));this.Y0=this.Y1-Math.round(1/LL*(ccL*DDY+ccB*DDX));ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;if((ww==0)||(hh==0))
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(this.Border+ll-ll0)+"px;top:"+eval(this.Border+tt-tt0)+"px;width:"+eval(ww+this.Size)+"px;height:"+eval(hh+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ccl+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ww-ccr+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ccl+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ww-ccl+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";ccl++;}}}
this.X0=this.X1-Math.round(1/LL*(ccL*DDX+ccB*DDY));this.Y0=this.Y1-Math.round(1/LL*(ccL*DDY-ccB*DDX));ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;if((ww==0)||(hh==0))
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(this.Border+ll-ll0)+"px;top:"+eval(this.Border+tt-tt0)+"px;width:"+eval(ww+this.Size)+"px;height:"+eval(hh+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ccl+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ww-ccr+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+eval(ccr-ccl+this.Size)+"px;height:"+this.Size+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ccl+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+eval(ww-ccl+this.Border+ll-ll0)+"px;top:"+eval(cct+this.Border+tt-tt0)+"px;width:"+this.Size+"px;height:"+eval(ccb-cct+this.Size)+"px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";ccl++;}}}
selObj.innerHTML=divtext;this.X0=tmpX0;this.Y0=tmpY0;}
function dom_ArrowMoveTo(theLeft,theTop)
{var id=this.ID,selObj;var ss2=Math.floor(this.Size/2);if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);with(selObj.style)
{if(!isNaN(parseInt(theLeft)))left=eval(theLeft-ss2-this.Border)+"px";if(!isNaN(parseInt(theTop)))top=eval(theTop-ss2-this.Border)+"px";visibility="visible";}}
function dom_Pie(theXCenter,theYCenter,theOffset,theRadius,theAngle0,theAngle1,theColor,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.ID="Pie"+_N_Pie;_N_Pie++;_zIndex++;this.XCenter=theXCenter;this.YCenter=theYCenter;this.Offset=theOffset;this.Radius=theRadius;this.dX=theRadius;this.dY=theRadius;this.Angle0=theAngle0;this.Angle1=theAngle1;this.Color=theColor;if((theColor!="")&&(theColor.length==6))this.Color="#"+theColor;this.Cursor=_cursor(theOnClickAction);this.SetVisibility=_SetVisibility;this.SetColor=_SetColor;this.SetTitle=_SetTitle;this.MoveTo=_PieMoveTo;this.ResizeTo=_PieResizeTo;this.Delete=_Delete;this.EventActions="";if(_nvl(theOnClickAction,"")!="")this.EventActions+="onClick='"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")this.EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")this.EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";var aa0,aa1,xx,yy,tt,xxo=0,yyo=0,rr2=this.Radius*this.Radius,xx0,yy0,xx1,yy1,pid180=Math.PI/180,ss0,ss1;var nbsp="";aa0=this.Angle0;aa1=this.Angle1;while(aa0>=360)aa0-=360;while(aa0<0)aa0+=360;while(aa1>=360)aa1-=360;while(aa1<0)aa1+=360;if(aa0<aa1)
{xxo=Math.sin((aa0+aa1)*pid180/2)*this.Offset;yyo=-Math.cos((aa0+aa1)*pid180/2)*this.Offset;}
if(aa0>aa1)
{xxo=Math.sin((aa0+aa1+360)*pid180/2)*this.Offset;yyo=-Math.cos((aa0+aa1+360)*pid180/2)*this.Offset;}
_DiagramTarget.document.write("<div id='"+this.ID+"' style='position:absolute;left:"+Math.round(this.XCenter-this.Radius+xxo)+"px;top:"+Math.round(this.YCenter-this.Radius+yyo)+"px; width:"+eval(2*this.Radius)+"px; height:"+eval(2*this.Radius)+"px; z-index:"+_zIndex+"; font-size:1pt; line-height:1pt;' title='"+_nvl(theTooltipText,"")+"'>");if(aa0==aa1)
{if(this.Angle0<this.Angle1)
{for(yy=-this.Radius;yy<this.Radius;yy++)
{xx=Math.round(Math.sqrt(rr2-(yy+0.5)*(yy+0.5)));tt=yy+this.Radius;_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}}}
else
{xx0=Math.sin(aa0*pid180)*this.Radius;yy0=-Math.cos(aa0*pid180)*this.Radius;xx1=Math.sin(aa1*pid180)*this.Radius;yy1=-Math.cos(aa1*pid180)*this.Radius;for(yy=-this.Radius;yy<0;yy++)
{xx=Math.round(Math.sqrt(rr2-(yy+0.5)*(yy+0.5)));tt=yy+this.Radius;if((yy0>=0)&&(yy1>=0))
{if(xx0<xx1)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}
else if((yy0<0)&&(yy1<0))
{if((yy<yy0)&&(yy<yy1))
{if(((xx0<0)&&(xx1>0))||((xx0<0)&&(xx1<=xx0))||((xx1>0)&&(xx0>=xx1)))
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}
else if((yy>=yy0)&&(yy>=yy1))
{ss0=yy*xx0/yy0;ss1=yy*xx1/yy1;if(xx0<xx1)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss0)+"px;top:"+tt+"px;width:"+Math.round(ss1-ss0)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
{_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(ss1+xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss0)+"px;top:"+tt+"px;width:"+Math.round(xx-ss0)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}}
else if(yy>=yy0)
{ss0=yy*xx0/yy0;_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss0)+"px;top:"+tt+"px;width:"+Math.round(xx-ss0)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}
else
{ss1=yy*xx1/yy1;_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(ss1+xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}}
else if(yy0<0)
{if(yy>=yy0)
{ss0=yy*xx0/yy0;_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss0)+"px;top:"+tt+"px;width:"+Math.round(xx-ss0)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}
else if(xx0<0)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}
else
{if(yy>=yy1)
{ss1=yy*xx1/yy1;_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(ss1+xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}
else if(xx1>0)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}}
for(yy=0;yy<this.Radius;yy++)
{xx=Math.round(Math.sqrt(rr2-(yy+0.5)*(yy+0.5)));tt=yy+this.Radius;if((yy0<=0)&&(yy1<=0))
{if(xx0>xx1)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}
else if((yy0>0)&&(yy1>0))
{if((yy>yy0)&&(yy>yy1))
{if(((xx1<0)&&(xx0>0))||((xx1<0)&&(xx0<=xx1))||((xx0>0)&&(xx1>=xx0)))
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}
else if((yy<=yy0)&&(yy<=yy1))
{ss0=yy*xx0/yy0;ss1=yy*xx1/yy1;if(xx0>xx1)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss1)+"px;top:"+tt+"px;width:"+Math.round(ss0-ss1)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");else
{_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(ss0+xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss1)+"px;top:"+tt+"px;width:"+Math.round(xx-ss1)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}}
else if(yy<=yy0)
{ss0=yy*xx0/yy0;_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(ss0+xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}
else
{ss1=yy*xx1/yy1;_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss1)+"px;top:"+tt+"px;width:"+Math.round(xx-ss1)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}}
else if(yy0>0)
{if(yy<=yy0)
{ss0=yy*xx0/yy0;_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(ss0+xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}
else if(xx0>0)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}
else
{if(yy<=yy1)
{ss1=yy*xx1/yy1;_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss1)+"px;top:"+tt+"px;width:"+Math.round(xx-ss1)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}
else if(xx1<0)
_DiagramTarget.document.write("<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>");}}}
_DiagramTarget.document.writeln("</div>");return(this);}
function dom_PieResizeTo(theXCenter,theYCenter,theOffset,theRadius,theAngle0,theAngle1)
{var id=this.ID,selObj="",divtext="";if(!isNaN(parseInt(theXCenter)))this.XCenter=theXCenter;if(!isNaN(parseInt(theYCenter)))this.YCenter=theYCenter;if(!isNaN(parseInt(theOffset)))this.Offset=theOffset;if(!isNaN(parseInt(theRadius)))this.Radius=theRadius;if(!isNaN(parseInt(theAngle0)))this.Angle0=theAngle0;if(!isNaN(parseInt(theAngle1)))this.Angle1=theAngle1;var aa0,aa1,xx,yy,tt,xxo=0,yyo=0,rr2=this.Radius*this.Radius,xx0,yy0,xx1,yy1,pid180=Math.PI/180,ss0,ss1;var nbsp="";aa0=this.Angle0;aa1=this.Angle1;if(aa0<aa1)
{xxo=Math.sin((aa0+aa1)*pid180/2)*this.Offset;yyo=-Math.cos((aa0+aa1)*pid180/2)*this.Offset;}
if(aa0>aa1)
{xxo=Math.sin((aa0+aa1+360)*pid180/2)*this.Offset;yyo=-Math.cos((aa0+aa1+360)*pid180/2)*this.Offset;}
if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);with(selObj.style)
{left=Math.round(this.XCenter-this.Radius+xxo)+"px";top=Math.round(this.YCenter-this.Radius+yyo)+"px";width=eval(2*this.Radius)+"px";height=eval(2*this.Radius)+"px";}
if(aa0==aa1)
{if(this.Angle0<this.Angle1)
{for(yy=-this.Radius;yy<this.Radius;yy++)
{xx=Math.round(Math.sqrt(rr2-(yy+0.5)*(yy+0.5)));tt=yy+this.Radius;divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}}}
else
{xx0=Math.sin(aa0*pid180)*this.Radius;yy0=-Math.cos(aa0*pid180)*this.Radius;xx1=Math.sin(aa1*pid180)*this.Radius;yy1=-Math.cos(aa1*pid180)*this.Radius;for(yy=-this.Radius;yy<0;yy++)
{xx=Math.round(Math.sqrt(rr2-(yy+0.5)*(yy+0.5)));tt=yy+this.Radius;if((yy0>=0)&&(yy1>=0))
{if(xx0<xx1)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}
else if((yy0<0)&&(yy1<0))
{if((yy<yy0)&&(yy<yy1))
{if(((xx0<0)&&(xx1>0))||((xx0<0)&&(xx1<=xx0))||((xx1>0)&&(xx0>=xx1)))
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}
else if((yy>=yy0)&&(yy>=yy1))
{ss0=yy*xx0/yy0;ss1=yy*xx1/yy1;if(xx0<xx1)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss0)+"px;top:"+tt+"px;width:"+Math.round(ss1-ss0)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
{divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(ss1+xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss0)+"px;top:"+tt+"px;width:"+Math.round(xx-ss0)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}}
else if(yy>=yy0)
{ss0=yy*xx0/yy0;divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss0)+"px;top:"+tt+"px;width:"+Math.round(xx-ss0)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}
else
{ss1=yy*xx1/yy1;divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(ss1+xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}}
else if(yy0<0)
{if(yy>=yy0)
{ss0=yy*xx0/yy0;divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss0)+"px;top:"+tt+"px;width:"+Math.round(xx-ss0)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}
else if(xx0<0)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}
else
{if(yy>=yy1)
{ss1=yy*xx1/yy1;divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(ss1+xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}
else if(xx1>0)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}}
for(yy=0;yy<this.Radius;yy++)
{xx=Math.round(Math.sqrt(rr2-(yy+0.5)*(yy+0.5)));tt=yy+this.Radius;if((yy0<=0)&&(yy1<=0))
{if(xx0>xx1)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}
else if((yy0>0)&&(yy1>0))
{if((yy>yy0)&&(yy>yy1))
{if(((xx1<0)&&(xx0>0))||((xx1<0)&&(xx0<=xx1))||((xx0>0)&&(xx1>=xx0)))
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}
else if((yy<=yy0)&&(yy<=yy1))
{ss0=yy*xx0/yy0;ss1=yy*xx1/yy1;if(xx0>xx1)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss1)+"px;top:"+tt+"px;width:"+Math.round(ss0-ss1)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";else
{divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(ss0+xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss1)+"px;top:"+tt+"px;width:"+Math.round(xx-ss1)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}}
else if(yy<=yy0)
{ss0=yy*xx0/yy0;divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(ss0+xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}
else
{ss1=yy*xx1/yy1;divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss1)+"px;top:"+tt+"px;width:"+Math.round(xx-ss1)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}}
else if(yy0>0)
{if(yy<=yy0)
{ss0=yy*xx0/yy0;divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(ss0+xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}
else if(xx0>0)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}
else
{if(yy<=yy1)
{ss1=yy*xx1/yy1;divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius+ss1)+"px;top:"+tt+"px;width:"+Math.round(xx-ss1)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}
else if(xx1<0)
divtext+="<div "+this.EventActions+"style='"+this.Cursor+"position:absolute;left:"+Math.round(this.Radius-xx)+"px;top:"+tt+"px;width:"+Math.round(2*xx)+"px;height:1px;background-color:"+this.Color+";font-size:1pt;line-height:1pt;'>"+nbsp+"</div>";}}}
selObj.innerHTML=divtext;}
function dom_PieMoveTo(theXCenter,theYCenter,theOffset)
{var xxo=0,yyo=0,pid180=Math.PI/180,id=this.ID,selObj;if(!isNaN(parseInt(theXCenter)))this.XCenter=theXCenter;if(!isNaN(parseInt(theYCenter)))this.YCenter=theYCenter;if(!isNaN(parseInt(theOffset)))this.Offset=theOffset;if(this.Angle0<this.Angle1)
{xxo=Math.sin((this.Angle0+this.Angle1)*pid180/2)*this.Offset;yyo=-Math.cos((this.Angle0+this.Angle1)*pid180/2)*this.Offset;}
if(this.Angle0>this.Angle1)
{xxo=Math.sin((this.Angle0+this.Angle1+360)*pid180/2)*this.Offset;yyo=-Math.cos((this.Angle0+this.Angle1+360)*pid180/2)*this.Offset;}
if(document.all)selObj=eval("_DiagramTarget.document.all."+id);else selObj=_DiagramTarget.document.getElementById(id);with(selObj.style)
{left=Math.round(this.XCenter-this.Radius+xxo)+"px";top=Math.round(this.YCenter-this.Radius+yyo)+"px";width=eval(2*this.Radius)+"px";height=eval(2*this.Radius)+"px";visibility="visible";}}
function nav_Draw(theDrawColor,theTextColor,isScaleText,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{var x0,y0,i,j,itext,l,x,y,r,u,fn,dx,dy,xr,yr,invdifx,invdify,deltax,deltay,id=this.ID,lay=0,ii=0,oo,k,sub;var c151="&#151;";var EventActions="";if(_nvl(theOnClickAction,"")!="")EventActions+=" href='javascript:"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";lay++;if(document.layers[id])lay++;var drawCol=(_nvl(theDrawColor,"")=="")?"":"bgcolor="+theDrawColor;var drawImg=_DiagramImagesHref+'transparent.gif';if(_IsImage(theDrawColor)){drawImg=theDrawColor;drawCol="";}
if(lay>1)
{with(_DiagramTarget.document.layers[id])
{top=this.top;left=this.left;document.open();document.writeln("<div style='position:absolute; left:1; top:1;'><table border=1 bordercolor="+theTextColor+" cellpadding=0 cellspacing=0><tr><td "+drawCol+"><a"+EventActions+"><img src='"+drawImg+"' width="+eval(this.right-this.left-2)+" height="+eval(this.bottom-this.top-2)+" border=0 alt='"+_nvl(theTooltipText,"")+"'></a></td></tr></table></div>");}}
else
{_DiagramTarget.document.writeln("<layer id='"+this.ID+"' top="+this.top+" left="+this.left+" z-Index="+this.zIndex+">");_DiagramTarget.document.writeln("<div style='position:absolute; left:1; top:1;'><table border=1 bordercolor="+theTextColor+" cellpadding=0 cellspacing=0><tr><td "+drawCol+"><a"+EventActions+"><img src='"+drawImg+"' width="+eval(this.right-this.left-2)+" height="+eval(this.bottom-this.top-2)+" border=0 alt='"+_nvl(theTooltipText,"")+"'></a></td></tr></table></div>");}
if((this.XScale==1)||(isNaN(this.XScale)))
{u="";fn="";if(isNaN(this.XScale))
{if(this.XScale.substr(0,9)=="function ")fn=eval("window."+this.XScale.substr(9));else u=this.XScale;}
dx=(this.xmax-this.xmin);if(Math.abs(dx)>0)
{invdifx=(this.right-this.left)/(this.xmax-this.xmin);r=1;while(Math.abs(dx)>=100){dx/=10;r*=10;}
while(Math.abs(dx)<10){dx*=10;r/=10;}
if(Math.abs(dx)>=50){this.SubGrids=5;deltax=10*r*_sign(dx);}
else
{if(Math.abs(dx)>=20){this.SubGrids=5;deltax=5*r*_sign(dx);}
else{this.SubGrids=4;deltax=2*r*_sign(dx);}}
if(this.XGridDelta!=0)deltax=this.XGridDelta;if(this.XSubGrids!=0)this.SubGrids=this.XSubGrids;sub=deltax*invdifx/this.SubGrids;sshift=0;if((this.XScalePosition=="top-left")||(this.XScalePosition=="bottom-left"))sshift=-Math.abs(deltax*invdifx/2);if((this.XScalePosition=="top-right")||(this.XScalePosition=="bottom-right"))sshift=Math.abs(deltax*invdifx/2);x=Math.floor(this.xmin/deltax)*deltax;itext=0;if(deltax!=0)this.MaxGrids=Math.floor(Math.abs((this.xmax-this.xmin)/deltax))+2;else this.MaxGrids=0;for(j=this.MaxGrids;j>=-1;j--)
{xr=x+j*deltax;x0=Math.round(this.left+(-this.xmin+xr)*invdifx);if(lay>1)oo=_DiagramTarget.document.layers[id];else oo=_DiagramTarget;with(oo.document)
{if(this.XSubGridColor)
{for(k=1;k<this.SubGrids;k++)
{if((x0+k*sub>this.left+1)&&(x0+k*sub<this.right-1))
writeln("<div style='position:absolute; left:"+Math.round(x0-this.left+k*sub)+"; top:1; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.XSubGridColor+"><img src='"+_DiagramImagesHref+"transparent.gif' width=1 height="+eval(this.bottom-this.top-1)+"></td></tr></table></div>");}
if(this.SubGrids==-1)
{for(k=0;k<8;k++)
{if((x0-this.logsub[k]*sub*_sign(deltax)>this.left+1)&&(x0-this.logsub[k]*sub*_sign(deltax)<this.right-1))
writeln("<div style='position:absolute; left:"+Math.round(x0-this.left-this.logsub[k]*sub*_sign(deltax))+"; top:1; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.XSubGridColor+"><img src='"+_DiagramImagesHref+"transparent.gif' width=1 height="+eval(this.bottom-this.top-1)+"></td></tr></table></div>");}}}}
if((x0>=this.left)&&(x0<=this.right))
{itext++;if((itext!=2)||(!isScaleText))
{if(r>1)
{if(fn)l=fn(xr)+"";else l=xr+""+u;}
else
{if(fn)l=fn(Math.round(10*xr/r)/Math.round(10/r))+"";else l=Math.round(10*xr/r)/Math.round(10/r)+""+u;}
if(l.charAt(0)==".")l="0"+l;if(l.substr(0,2)=="-.")l="-0"+l.substr(1,100);}
else l=this.xtext;if(lay>1)oo=_DiagramTarget.document.layers[id];else oo=_DiagramTarget;with(oo.document)
{if(this.XScalePosition.substr(0,3)!="top")
{if((x0+sshift>=this.left)&&(x0+sshift<=this.right))
writeln("<div style='position:absolute; left:"+eval(x0-50-this.left+sshift)+"; top:"+eval(this.bottom+8-this.top)+";'><table noborder cellpadding=0 cellspacing=0><tr><td width=102 align=center><div style='color:"+theTextColor+";"+this.Font+"'>"+l+"</div></td></tr></table></div>");writeln("<div style='position:absolute; left:"+eval(x0-this.left)+"; top:"+eval(this.bottom-5-this.top)+"; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theTextColor+"><img src='"+_DiagramImagesHref+"transparent.gif' width=1 height=12></td></tr></table></div>");}
else
{if((x0+sshift>=this.left)&&(x0+sshift<=this.right))
writeln("<div style='position:absolute; left:"+eval(x0-50-this.left+sshift)+"; top:-24;'><table noborder cellpadding=0 cellspacing=0><tr><td width=102 align=center><div style='color:"+theTextColor+";"+this.Font+"'>"+l+"</div></td></tr></table></div>");writeln("<div style='position:absolute; left:"+eval(x0-this.left)+"; top:-5; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theTextColor+"><img src='"+_DiagramImagesHref+"transparent.gif' width=1 height=12></td></tr></table></div>");}
if((this.XGridColor)&&(x0>this.left)&&(x0<this.right))writeln("<div style='position:absolute; left:"+eval(x0-this.left)+"; top:1; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.XGridColor+"><img src='"+_DiagramImagesHref+"transparent.gif' width=1 height="+eval(this.bottom-this.top-1)+"></td></tr></table></div>");}}}}}
if((!isNaN(this.XScale))&&(this.XScale>1))
{dx=(this.xmax-this.xmin);if(Math.abs(dx)>0)
{invdifx=(this.right-this.left)/(this.xmax-this.xmin);deltax=this.DateInterval(Math.abs(dx))*_sign(dx);if(this.XGridDelta!=0)deltax=this.XGridDelta;if(this.XSubGrids!=0)this.SubGrids=this.XSubGrids;sub=deltax*invdifx/this.SubGrids;sshift=0;if((this.XScalePosition=="top-left")||(this.XScalePosition=="bottom-left"))sshift=-Math.abs(deltax*invdifx/2);if((this.XScalePosition=="top-right")||(this.XScalePosition=="bottom-right"))sshift=Math.abs(deltax*invdifx/2);x=Math.floor(this.xmin/deltax)*deltax;itext=0;if(deltax!=0)this.MaxGrids=Math.floor(Math.abs((this.xmax-this.xmin)/deltax))+2;else this.MaxGrids=0;for(j=this.MaxGrids;j>=-2;j--)
{xr=x+j*deltax;x0=Math.round(this.left+(-this.xmin+x+j*deltax)*invdifx);if(lay>1)oo=_DiagramTarget.document.layers[id];else oo=_DiagramTarget;with(oo.document)
{if(this.XSubGridColor)
{for(k=1;k<this.SubGrids;k++)
{if((x0+k*sub>this.left+1)&&(x0+k*sub<this.right-1))
writeln("<div style='position:absolute; left:"+Math.round(x0-this.left+k*sub)+"; top:1; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.XSubGridColor+"><img src='"+_DiagramImagesHref+"transparent.gif' width=1 height="+eval(this.bottom-this.top-1)+"></td></tr></table></div>");}}}
if((x0>=this.left)&&(x0<=this.right))
{itext++;if((itext!=2)||(!isScaleText))l=_DateFormat(xr,Math.abs(deltax),this.XScale);else l=this.xtext;if(lay>1)oo=_DiagramTarget.document.layers[id];else oo=_DiagramTarget;with(oo.document)
{if(this.XScalePosition.substr(0,3)!="top")
{if((x0+sshift>=this.left)&&(x0+sshift<=this.right))
writeln("<div style='position:absolute; left:"+eval(x0-50-this.left+sshift)+"; top:"+eval(this.bottom+8-this.top)+";'><table noborder cellpadding=0 cellspacing=0><tr><td width=102 align=center><div style='color:"+theTextColor+";"+this.Font+"'>"+l+"</div></td></tr></table></div>");writeln("<div style='position:absolute; left:"+eval(x0-this.left)+"; top:"+eval(this.bottom-5-this.top)+"; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theTextColor+"><img src='"+_DiagramImagesHref+"transparent.gif' width=1 height=12></td></tr></table></div>");}
else
{if((x0+sshift>=this.left)&&(x0+sshift<=this.right))
writeln("<div style='position:absolute; left:"+eval(x0-50-this.left+sshift)+"; top:-24;'><table noborder cellpadding=0 cellspacing=0><tr><td width=102 align=center><div style='color:"+theTextColor+";"+this.Font+"'>"+l+"</div></td></tr></table></div>");writeln("<div style='position:absolute; left:"+eval(x0-this.left)+"; top:-5; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theTextColor+"><img src='"+_DiagramImagesHref+"transparent.gif' width=1 height=12></td></tr></table></div>");}
if((this.XGridColor)&&(x0>this.left)&&(x0<this.right))writeln("<div style='position:absolute; left:"+eval(x0-this.left)+"; top:1; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.XGridColor+"><img src='"+_DiagramImagesHref+"transparent.gif' width=1 height="+eval(this.bottom-this.top-1)+"></td></tr></table></div>");}}}}}
if((this.YScale==1)||(isNaN(this.YScale)))
{u="";fn="";if(isNaN(this.YScale))
{if(this.YScale.substr(0,9)=="function ")fn=eval("window."+this.YScale.substr(9));else u=this.YScale;}
dy=this.ymax-this.ymin;if(Math.abs(dy)>0)
{invdify=(this.bottom-this.top)/(this.ymax-this.ymin);r=1;while(Math.abs(dy)>=100){dy/=10;r*=10;}
while(Math.abs(dy)<10){dy*=10;r/=10;}
if(Math.abs(dy)>=50){this.SubGrids=5;deltay=10*r*_sign(dy);}
else
{if(Math.abs(dy)>=20){this.SubGrids=5;deltay=5*r*_sign(dy);}
else{this.SubGrids=4;deltay=2*r*_sign(dy);}}
if(this.YGridDelta!=0)deltay=this.YGridDelta;if(this.YSubGrids!=0)this.SubGrids=this.YSubGrids;sub=deltay*invdify/this.SubGrids;sshift=0;if((this.YScalePosition=="left-top")||(this.YScalePosition=="right-top"))sshift=-Math.abs(deltay*invdify/2);if((this.YScalePosition=="left-bottom")||(this.YScalePosition=="right-bottom"))sshift=Math.abs(deltay*invdify/2);y=Math.floor(this.ymax/deltay)*deltay;itext=0;if(deltay!=0)this.MaxGrids=Math.floor(Math.abs((this.ymax-this.ymin)/deltay))+2;else this.MaxGrids=0;for(j=-1;j<=this.MaxGrids;j++)
{yr=y-j*deltay;y0=Math.round(this.top+(this.ymax-yr)*invdify);if(lay>1)oo=_DiagramTarget.document.layers[id];else oo=_DiagramTarget;with(oo.document)
{if(this.YSubGridColor)
{for(k=1;k<this.SubGrids;k++)
{if((y0+k*sub>this.top+1)&&(y0+k*sub<this.bottom-1))
writeln("<div style='position:absolute; left:1; top:"+Math.round(y0-this.top+k*sub)+"; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.YSubGridColor+" valign=top><img src='"+_DiagramImagesHref+"transparent.gif' height=1 width="+eval(this.right-this.left-1)+"></td></tr></table></div>");}
if(this.SubGrids==-1)
{for(k=0;k<8;k++)
{if((y0+this.logsub[k]*sub*_sign(deltay)>this.top+1)&&(y0+this.logsub[k]*sub*_sign(deltay)<this.bottom-1))
writeln("<div style='position:absolute; left:1; top:"+Math.round(y0-this.top+this.logsub[k]*sub*_sign(deltay))+"; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.YSubGridColor+" valign=top><img src='"+_DiagramImagesHref+"transparent.gif' height=1 width="+eval(this.right-this.left-1)+"></td></tr></table></div>");}}}}
if((y0>=this.top)&&(y0<=this.bottom))
{itext++;if((itext!=2)||(!isScaleText))
{if(r>1)
{if(fn)l=fn(yr)+"";else l=yr+""+u;}
else
{if(fn)l=fn(Math.round(10*yr/r)/Math.round(10/r))+"";else l=Math.round(10*yr/r)/Math.round(10/r)+""+u;}
if(l.charAt(0)==".")l="0"+l;if(l.substr(0,2)=="-.")l="-0"+l.substr(1,100);}
else l=this.ytext;if(lay>1)oo=_DiagramTarget.document.layers[id];else oo=_DiagramTarget;with(oo.document)
{if(this.YScalePosition.substr(0,5)!="right")
{if((y0+sshift>=this.top)&&(y0+sshift<=this.bottom))
writeln("<div style='position:absolute; left:-100; top:"+eval(y0-9-this.top+sshift)+";'><table noborder cellpadding=0 cellspacing=0><tr><td width=89 align=right><div style='color:"+theTextColor+";"+this.Font+"'>"+l+"</div></td></tr></table></div>");writeln("<div style='position:absolute; left:-5; top:"+eval(y0-this.top)+"; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theTextColor+" valign=top><img src='"+_DiagramImagesHref+"transparent.gif' height=1 width=11></td></tr></table></div>");}
else
{if((y0+sshift>=this.top)&&(y0+sshift<=this.bottom))
writeln("<div style='position:absolute; left:"+eval(this.right-this.left+10)+"; top:"+eval(y0-9-this.top+sshift)+";'><table noborder cellpadding=0 cellspacing=0><tr><td width=89 align=left><div style='color:"+theTextColor+";"+this.Font+"'>"+l+"</div></td></tr></table></div>");writeln("<div style='position:absolute; left:"+eval(this.right-this.left-5)+"; top:"+eval(y0-this.top)+"; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theTextColor+" valign=top><img src='"+_DiagramImagesHref+"transparent.gif' height=1 width=11></td></tr></table></div>");}
if((this.YGridColor)&&(y0>this.top)&&(y0<this.bottom))writeln("<div style='position:absolute; left:1; top:"+eval(y0-this.top)+"; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.YGridColor+" valign=top><img src='"+_DiagramImagesHref+"transparent.gif' height=1 width="+eval(this.right-this.left-1)+"></td></tr></table></div>");}}}}}
if((!isNaN(this.YScale))&&(this.YScale>1))
{dy=this.ymax-this.ymin;if(Math.abs(dy)>0)
{invdify=(this.bottom-this.top)/(this.ymax-this.ymin);deltay=this.DateInterval(Math.abs(dy))*_sign(dy);if(this.YGridDelta!=0)deltay=this.YGridDelta;if(this.YSubGrids!=0)this.SubGrids=this.YSubGrids;sub=deltay*invdify/this.SubGrids;sshift=0;if((this.YScalePosition=="left-top")||(this.YScalePosition=="right-top"))sshift=-Math.abs(deltay*invdify/2);if((this.YScalePosition=="left-bottom")||(this.YScalePosition=="right-bottom"))sshift=Math.abs(deltay*invdify/2);y=Math.floor(this.ymax/deltay)*deltay;itext=0;if(deltay!=0)this.MaxGrids=Math.floor(Math.abs((this.ymax-this.ymin)/deltay))+2;else this.MaxGrids=0;for(j=-2;j<=this.MaxGrids;j++)
{yr=y-j*deltay;y0=Math.round(this.top+(this.ymax-y+j*deltay)*invdify);if(lay>1)oo=_DiagramTarget.document.layers[id];else oo=_DiagramTarget;with(oo.document)
{if(this.YSubGridColor)
{for(k=1;k<this.SubGrids;k++)
{if((y0+k*sub>this.top+1)&&(y0+k*sub<this.bottom-1))
writeln("<div style='position:absolute; left:1; top:"+Math.round(y0-this.top+k*sub)+"; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.YSubGridColor+" valign=top><img src='"+_DiagramImagesHref+"transparent.gif' height=1 width="+eval(this.right-this.left-1)+"></td></tr></table></div>");}}}
if((y0>=this.top)&&(y0<=this.bottom))
{itext++;if((itext!=2)||(!isScaleText))l=_DateFormat(yr,Math.abs(deltay),this.YScale);else l=this.ytext;if(lay>1)oo=_DiagramTarget.document.layers[id];else oo=_DiagramTarget;with(oo.document)
{if(this.YScalePosition.substr(0,5)!="right")
{if((y0+sshift>=this.top)&&(y0+sshift<=this.bottom))
writeln("<div style='position:absolute; left:-100; top:"+eval(y0-9-this.top+sshift)+";'><table noborder cellpadding=0 cellspacing=0><tr><td width=89 align=right><div style='color:"+theTextColor+";"+this.Font+"'>"+l+"</div></td></tr></table></div>");writeln("<div style='position:absolute; left:-5; top:"+eval(y0-this.top)+"; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theTextColor+" valign=top><img src='"+_DiagramImagesHref+"transparent.gif' height=1 width=11></td></tr></table></div>");}
else
{if((y0+sshift>=this.top)&&(y0+sshift<=this.bottom))
writeln("<div style='position:absolute; left:"+eval(this.right-this.left+10)+"; top:"+eval(y0-9-this.top+sshift)+";'><table noborder cellpadding=0 cellspacing=0><tr><td width=89 align=left><div style='color:"+theTextColor+";"+this.Font+"'>"+l+"</div></td></tr></table></div>");writeln("<div style='position:absolute; left:"+eval(this.right-this.left-5)+"; top:"+eval(y0-this.top)+"; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theTextColor+" valign=top><img src='"+_DiagramImagesHref+"transparent.gif' height=1 width=11></td></tr></table></div>");}
if((this.YGridColor)&&(y0>this.top)&&(y0<this.bottom))writeln("<div style='position:absolute; left:1; top:"+eval(y0-this.top)+"; font-size:1pt; line-height:1pt'><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.YGridColor+" valign=top><img src='"+_DiagramImagesHref+"transparent.gif' height=1 width="+eval(this.right-this.left-1)+"></td></tr></table></div>");}}}}}
if(lay>1)
{with(_DiagramTarget.document.layers[id])
{if(this.XScalePosition.substr(0,3)!="top")
document.writeln("<div style='position:absolute; left:0; top:-20;'><table noborder cellpadding=0 cellspacing=0><tr><td width="+eval(this.right-this.left)+" align=center><div style=' color:"+theTextColor+";"+this.Font+"'>"+this.title+"</div></td></tr></table></div>");else
document.writeln("<div style='position:absolute; left:0; top:"+eval(this.bottom+4-this.top)+";'><table noborder cellpadding=0 cellspacing=0><tr><td width="+eval(this.right-this.left)+" align=center><div style=' color:"+theTextColor+";"+this.Font+"'>"+this.title+"</div></td></tr></table></div>");document.close();}}
else
{if(this.XScalePosition.substr(0,3)!="top")
_DiagramTarget.document.writeln("<div style='position:absolute; left:0; top:-20;'><table noborder cellpadding=0 cellspacing=0><tr><td width="+eval(this.right-this.left)+" align=center><div style=' color:"+theTextColor+";"+this.Font+"'>"+this.title+"</div></td></tr></table></div>");else
_DiagramTarget.document.writeln("<div style='position:absolute; left:0; top:"+eval(this.bottom+4-this.top)+";'><table noborder cellpadding=0 cellspacing=0><tr><td width="+eval(this.right-this.left)+" align=center><div style=' color:"+theTextColor+";"+this.Font+"'>"+this.title+"</div></td></tr></table></div>");_DiagramTarget.document.writeln("</layer>");}}
function nav_Bar(theLeft,theTop,theRight,theBottom,theDrawColor,theText,theTextColor,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.ID="Bar"+_N_Bar;_N_Bar++;_zIndex++;this.left=theLeft;this.top=theTop;this.width=theRight-theLeft;this.height=theBottom-theTop;this.DrawColor=theDrawColor;this.Text=String(theText);this.TextColor=theTextColor;this.BorderWidth=0;this.BorderColor="";this.TooltipText=theTooltipText;this.SetVisibility=_SetVisibility;this.SetColor=_SetBarColor;this.SetText=_SetBarText;this.SetTitle=_SetBarTitle;this.MoveTo=_MoveTo;this.ResizeTo=_ResizeTo;this.Delete=_Delete;this.EventActions="";if(_nvl(theOnClickAction,"")!="")this.EventActions+=" href='javascript:"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")this.EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")this.EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";var tt="";while(tt.length<this.Text.length)tt=tt+" ";if((tt=="")||(tt==this.Text))tt="<img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(this.width-1)+" height="+eval(this.height-1)+" border=0 alt='"+_nvl(theTooltipText,"")+"'>";else tt=this.Text;if(_IsImage(this.Text))tt="<img src='"+_DiagramImagesHref+this.Text+"' width="+eval(this.width-1)+" height="+eval(this.height-1)+" border=0 alt='"+_nvl(theTooltipText,"")+"'>";var drawCol=(_nvl(theDrawColor,"")=="")?"":"bgcolor="+theDrawColor;var textCol=(_nvl(theTextColor,"")=="")?"":"color:"+theTextColor+";";var vv=(this.height>1)?"":" visibility=hide";_DiagramTarget.document.writeln("<layer id='"+this.ID+"' left="+theLeft+" top="+theTop+" z-Index="+_zIndex+vv+">");_DiagramTarget.document.writeln("<layer style='position:absolute;left:0;top:0;'><table noborder cellpadding=0 cellspacing=0><tr><td "+drawCol+" width="+eval(theRight-theLeft)+" height="+eval(theBottom-theTop)+" align=center valign=top><a style='"+textCol+"text-decoration:none;"+_BFont+"'"+this.EventActions+">"+tt+"</a></td></tr></table></layer>");_DiagramTarget.document.writeln("</layer>");return(this);}
function nav_Box(theLeft,theTop,theRight,theBottom,theDrawColor,theText,theTextColor,theBorderWidth,theBorderColor,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.ID="Box"+_N_Box;_N_Box++;_zIndex++;this.left=theLeft;this.top=theTop;this.width=Math.abs(theRight-theLeft);this.height=Math.abs(theBottom-theTop);this.DrawColor=theDrawColor;this.Text=String(theText);this.TextColor=theTextColor;this.BorderWidth=theBorderWidth;this.BorderColor=theBorderColor;this.SetVisibility=_SetVisibility;this.SetColor=_SetBarColor;this.SetText=_SetBarText;this.SetTitle=_SetBarTitle;this.MoveTo=_MoveTo;this.ResizeTo=_ResizeTo;this.Delete=_Delete;this.EventActions="";if(_nvl(theOnClickAction,"")!="")this.EventActions+=" href='javascript:"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")this.EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")this.EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";var bb="";var ww=theBorderWidth;if(_nvl(theBorderWidth,"")=="")ww=0;if((_nvl(theBorderWidth,"")!="")&&(_nvl(theBorderColor,"")!=""))
bb="bordercolor="+theBorderColor;var tt="";while(tt.length<this.Text.length)tt=tt+" ";if((tt=="")||(tt==this.Text))tt="<img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(this.width-(2*ww))+" height="+eval(this.height-(2*ww))+" border=0 alt='"+_nvl(theTooltipText,"")+"'>";else tt=this.Text;if(_IsImage(this.Text))tt="<img src='"+_DiagramImagesHref+this.Text+"' width="+eval(this.width-(2*ww))+" height="+eval(this.height-(2*ww))+" border=0 alt='"+_nvl(theTooltipText,"")+"'>";var drawCol=(_nvl(theDrawColor,"")=="")?"":"bgcolor="+theDrawColor;var textCol=(_nvl(theTextColor,"")=="")?"":"color:"+theTextColor+";";var vv=(this.height>2*ww+1)?"":" visibility=hide";_DiagramTarget.document.writeln("<layer id='"+this.ID+"' left="+theLeft+" top="+theTop+" z-Index="+_zIndex+vv+">");_DiagramTarget.document.writeln("<layer style='position:absolute;left:1;top:1;'><table border="+ww+" "+bb+" cellpadding=0 cellspacing=0><tr><td "+drawCol+" width="+eval(theRight-theLeft-(2*ww))+" height="+eval(theBottom-theTop-(2*ww))+" align=center valign=top><a style='"+textCol+"text-decoration:none;"+_BFont+"'"+this.EventActions+">"+tt+"</a></td></tr></table></layer>");_DiagramTarget.document.writeln("</layer>");return(this);}
function nav_SetBarColor(theColor)
{var id=this.ID;this.DrawColor=theColor;var ww=this.BorderWidth;if(_nvl(this.BorderWidth,"")=="")ww=0;var tt="";while(tt.length<this.Text.length)tt=tt+" ";if((tt=="")||(this.Text==tt))tt="<img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(this.width-2*ww)+" height="+eval(this.height-2*ww)+" border=0 alt='"+_nvl(this.TooltipText,"")+"'>";else tt=this.Text;if(_IsImage(this.Text))tt="<img src='"+_DiagramImagesHref+this.Text+"' width="+eval(this.width-2*ww)+" height="+eval(this.height-2*ww)+" border=0 alt='"+_nvl(this.TooltipText,"")+"'>";var drawCol=(_nvl(this.DrawColor,"")=="")?"":"bgcolor="+this.DrawColor;var textCol=(_nvl(this.TextColor,"")=="")?"":"color:"+this.TextColor+";";with(_DiagramTarget.document.layers[id])
{document.open();if((_nvl(this.BorderWidth,"")!="")&&(_nvl(this.BorderColor,"")!=""))
document.writeln("<layer style='position:absolute;left:1;top:1;'><table border="+ww+" bordercolor="+this.BorderColor+" cellpadding=0 cellspacing=0><tr><td "+drawCol+" width="+eval(this.width-2*ww)+" height="+eval(this.height-2*ww)+" align=center valign=top><a style='"+textCol+"text-decoration:none;"+_BFont+"'"+this.EventActions+">"+tt+"</a></td></tr></table></layer>");else
document.writeln("<layer style='position:absolute;left:0;top:0;'><table noborder cellpadding=0 cellspacing=0><tr><td "+drawCol+" width="+this.width+" height="+this.height+" align=center valign=top><a style='"+textCol+"text-decoration:none;"+_BFont+"'"+this.EventActions+">"+tt+"</a></td></tr></table></layer>");document.close();}}
function nav_SetBarTitle(theTitle)
{this.TooltipText=theTitle;this.SetColor(this.DrawColor);}
function nav_SetBarText(theText)
{var id=this.ID;this.Text=String(theText);var ww=this.BorderWidth;if(_nvl(this.BorderWidth,"")=="")ww=0;var tt="";while(tt.length<this.Text.length)tt=tt+" ";if((tt=="")||(this.Text==tt))tt="<img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(this.width-2*ww)+" height="+eval(this.height-2*ww)+" border=0 alt='"+_nvl(this.TooltipText,"")+"'>";else tt=this.Text;if(_IsImage(this.Text))tt="<img src='"+_DiagramImagesHref+this.Text+"' width="+eval(this.width-2*ww)+" height="+eval(this.height-2*ww)+" border=0 alt='"+_nvl(this.TooltipText,"")+"'>";var drawCol=(_nvl(this.DrawColor,"")=="")?"":"bgcolor="+this.DrawColor;var textCol=(_nvl(this.TextColor,"")=="")?"":"color:"+this.TextColor+";";with(_DiagramTarget.document.layers[id])
{document.open();if((_nvl(this.BorderWidth,"")!="")&&(_nvl(this.BorderColor,"")!=""))
document.writeln("<layer style='position:absolute;left:1;top:1;'><table border="+ww+" bordercolor="+this.BorderColor+" cellpadding=0 cellspacing=0><tr><td "+drawCol+" width="+eval(this.width-2*ww)+" height="+eval(this.height-2*ww)+" align=center valign=top><a style='"+textCol+"text-decoration:none;"+_BFont+"'"+this.EventActions+">"+tt+"</a></td></tr></table></layer>");else
document.writeln("<layer style='position:absolute;left:0;top:0;'><table noborder cellpadding=0 cellspacing=0><tr><td "+drawCol+" width="+this.width+" height="+this.height+" align=center valign=top><a style='"+textCol+"text-decoration:none;"+_BFont+"'"+this.EventActions+">"+tt+"</a></td></tr></table></layer>");document.close();}}
function nav_Dot(theX,theY,theSize,theType,theColor,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.Size=theSize;this.ID="Dot"+_N_Dot;_N_Dot++;_zIndex++;this.X=theX;this.Y=theY;this.dX=Math.round(theSize/2);this.dY=Math.round(theSize/2);this.Type=theType;this.Color=theColor;this.TooltipText=theTooltipText;this.SetVisibility=_SetVisibility;this.SetColor=_SetDotColor;this.SetTitle=_SetDotTitle;this.MoveTo=_DotMoveTo;this.Delete=_Delete;this.EventActions="";if(_nvl(theOnClickAction,"")!="")this.EventActions+=" href='javascript:"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")this.EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")this.EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";_DiagramTarget.document.writeln("<layer id='"+this.ID+"' left="+Math.round(theX-this.Size/2)+" top="+Math.round(theY-this.Size/2)+" z-index="+_zIndex+">");if(isNaN(theType))
{var cc=(_nvl(theColor,"")=="")?"":" bgcolor="+theColor;_DiagramTarget.document.writeln("<layer left=0 top=0><table noborder cellpadding=0 cellspacing=0><tr><td"+cc+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+theType+"' width="+this.Size+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></dt></tr></table></layer>");}
else
{if(theType%6==0)
{_DiagramTarget.document.writeln("<layer left=1 top="+Math.round(this.Size/4+0.3)+"><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theColor+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(this.Size-1)+" height="+eval(this.Size+1-2*Math.round(this.Size/4+0.3))+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></dt></tr></table></layer>");_DiagramTarget.document.writeln("<layer left="+Math.round(this.Size/4+0.3)+" top=1><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theColor+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(this.Size+1-2*Math.round(this.Size/4+0.3))+" height="+eval(this.Size-1)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></dt></tr></table></layer>");}
if(theType%6==1)
{_DiagramTarget.document.writeln("<layer left="+Math.round(this.Size/2-this.Size/8)+" top=0><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theColor+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(this.Size/4)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></dt></tr></table></layer>");_DiagramTarget.document.writeln("<layer left=0 top="+Math.round(this.Size/2-this.Size/8)+"><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theColor+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+Math.round(this.Size/4)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></dt></tr></table></layer>");}
if(theType%6==2)
_DiagramTarget.document.writeln("<layer left=0 top=0><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theColor+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+this.Size+" border=0 align=top valign=left></a></dt></tr></table></layer>");if(theType%6==3)
{_DiagramTarget.document.writeln("<layer left=0 top="+Math.round(this.Size/4)+"><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theColor+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+Math.round(this.Size/2)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></dt></tr></table></layer>");_DiagramTarget.document.writeln("<layer left="+Math.round(this.Size/2-this.Size/8)+" top=0><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theColor+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(this.Size/4)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></dt></tr></table></layer>");}
if(theType%6==4)
{_DiagramTarget.document.writeln("<layer left=0 top="+Math.round(this.Size/2-this.Size/8)+"><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theColor+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+Math.round(this.Size/4)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></dt></tr></table></layer>");_DiagramTarget.document.writeln("<layer left="+Math.round(this.Size/4)+" top=0><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+theColor+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(this.Size/2)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></dt></tr></table></layer>");}
if(theType%6==5)
_DiagramTarget.document.writeln("<layer left="+Math.round(1+this.Size/12)+" top="+Math.round(1+this.Size/12)+"><a"+this.EventActions+" style='color:"+theColor+"'><img src='"+_DiagramImagesHref+"transparent.gif' border="+Math.round(this.Size/6)+" width="+Math.round(this.Size-this.Size/3)+" height="+Math.round(this.Size-this.Size/3)+" align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
_DiagramTarget.document.writeln("</layer>");return(this);}
function nav_SetDotColor(theColor)
{if(theColor!="")this.Color=theColor;with(_DiagramTarget.document.layers[this.ID])
{document.open();if(isNaN(this.Type))
{var cc=(_nvl(this.Color,"")=="")?"":" bgcolor="+this.Color;document.writeln("<layer left=0 top=0><table noborder cellpadding=0 cellspacing=0><tr><td"+cc+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+theType+"' width="+this.Size+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></dt></tr></table></layer>");}
else
{if(this.Type%6==0)
{document.writeln("<layer left=1 top="+Math.round(this.Size/4+0.3)+"><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(this.Size-1)+" height="+eval(this.Size+1-2*Math.round(this.Size/4+0.3))+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></dt></tr></table></layer>");document.writeln("<layer left="+Math.round(this.Size/4+0.3)+" top=1><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(this.Size+1-2*Math.round(this.Size/4+0.3))+" height="+eval(this.Size-1)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></dt></tr></table></layer>");}
if(this.Type%6==1)
{document.writeln("<layer left="+Math.round(this.Size/2-this.Size/8)+" top=0><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(this.Size/4)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></dt></tr></table></layer>");document.writeln("<layer left=0 top="+Math.round(this.Size/2-this.Size/8)+"><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+Math.round(this.Size/4)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></dt></tr></table></layer>");}
if(this.Type%6==2)
document.writeln("<layer left=0 top=0><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></dt></tr></table></layer>");if(this.Type%6==3)
{document.writeln("<layer left=0 top="+Math.round(this.Size/4)+"><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+Math.round(this.Size/2)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></dt></tr></table></layer>");document.writeln("<layer left="+Math.round(this.Size/2-this.Size/8)+" top=0><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(this.Size/4)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></dt></tr></table></layer>");}
if(this.Type%6==4)
{document.writeln("<layer left=0 top="+Math.round(this.Size/2-this.Size/8)+"><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+Math.round(this.Size/4)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></dt></tr></table></layer>");document.writeln("<layer left="+Math.round(this.Size/4)+" top=0><table noborder cellpadding=0 cellspacing=0><tr><td bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(this.Size/2)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></dt></tr></table></layer>");}
if(this.Type%6==5)
document.writeln("<layer left="+Math.round(1+this.Size/12)+" top="+Math.round(1+this.Size/12)+"><a"+this.EventActions+" style='color:"+this.Color+"'><img src='"+_DiagramImagesHref+"transparent.gif' border="+Math.round(this.Size/6)+" width="+Math.round(this.Size-this.Size/3)+" height="+Math.round(this.Size-this.Size/3)+" align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
document.close();}}
function nav_SetDotTitle(theTitle)
{this.TooltipText=theTitle;this.SetColor("");}
function nav_DotMoveTo(theX,theY)
{var id=this.ID;if(!isNaN(parseInt(theX)))this.X=theX;if(!isNaN(parseInt(theY)))this.Y=theY;with(_DiagramTarget.document.layers[id])
{if(!isNaN(parseInt(theX)))left=eval(theX-this.dX);if(!isNaN(parseInt(theY)))top=eval(theY-this.dY);visibility="show";}}
var pixel_width=1;var pixel_height=2;function nav_Pixel(theX,theY,theColor)
{this.ID="Pix"+_N_Pix;_N_Pix++;_zIndex++;this.left=theX;this.top=theY;this.dX=2;this.dY=2;this.Color=theColor;this.SetVisibility=_SetVisibility;this.SetColor=_SetPixelColor;this.MoveTo=_DotMoveTo;this.Delete=_Delete;_DiagramTarget.document.writeln("<layer id='"+this.ID+"' left="+eval(theX+this.dX)+" top="+eval(theY+this.dY)+" z-Index="+_zIndex+"><layer left=0 top=0 width="+pixel_width+" height="+pixel_height+" bgcolor="+theColor+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+pixel_width+" height="+pixel_height+"></layer></layer>");return(this);}
function nav_SetPixelColor(theColor)
{this.Color=theColor;with(_DiagramTarget.document.layers[this.ID])
{document.open();document.writeln("<layer left=0 top=0 width=1 height=2 bgcolor="+theColor+"><img src='"+_DiagramImagesHref+"transparent.gif' width=1 height=2></layer>");document.close();}}
function nav_SetVisibility(isVisible)
{var ll,id=this.ID;with(_DiagramTarget.document.layers[id])
{if(isVisible)visibility="show";else visibility="hide";}}
function nav_SetTitle(theTitle)
{this.TooltipText=theTitle;if(this.ResizeTo)this.ResizeTo("","","","");}
function nav_MoveTo(theLeft,theTop)
{var id=this.ID;if(!isNaN(parseInt(theLeft)))this.left=theLeft;if(!isNaN(parseInt(theTop)))this.top=theTop;var ww=this.BorderWidth;if(_nvl(this.BorderWidth,"")=="")ww=0;with(_DiagramTarget.document.layers[id])
{if(!isNaN(parseInt(theLeft)))left=theLeft;if(!isNaN(parseInt(theTop)))top=theTop;if(this.height<=2*ww+1)visibility="hide";else visibility="show";}}
function nav_ResizeTo(theLeft,theTop,theWidth,theHeight)
{var id=this.ID;if(!isNaN(parseInt(theLeft)))this.left=theLeft;if(!isNaN(parseInt(theTop)))this.top=theTop;if(!isNaN(parseInt(theWidth)))this.width=theWidth;if(!isNaN(parseInt(theHeight)))this.height=theHeight;var ww=this.BorderWidth;if(_nvl(this.BorderWidth,"")=="")ww=0;var tt="";while(tt.length<this.Text.length)tt=tt+" ";if((tt=="")||(this.Text==tt))tt="<img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(this.width-2*ww)+" height="+eval(this.height-2*ww)+" border=0 alt='"+_nvl(this.TooltipText,"")+"'>";else tt=this.Text;if(_IsImage(this.Text))tt="<img src='"+_DiagramImagesHref+this.Text+"' width="+eval(this.width-2*ww)+" height="+eval(this.height-2*ww)+" border=0 alt='"+_nvl(this.TooltipText,"")+"'>";var drawCol=(_nvl(this.DrawColor,"")=="")?"":"bgcolor="+this.DrawColor;var textCol=(_nvl(this.TextColor,"")=="")?"":"color:"+this.TextColor+";";with(_DiagramTarget.document.layers[id])
{top=this.top;left=this.left;if(this.height<=2*ww+1)visibility="hide";else visibility="show";document.open();if((_nvl(this.BorderWidth,"")!="")&&(_nvl(this.BorderColor,"")!=""))
document.writeln("<layer style='position:absolute;left:1;top:1;'><table border="+ww+" bordercolor="+this.BorderColor+" cellpadding=0 cellspacing=0><tr><td "+drawCol+" width="+eval(this.width-2*ww)+" height="+eval(this.height-2*ww)+" align=center valign=top><a style='"+textCol+"text-decoration:none;"+_BFont+"'"+this.EventActions+">"+tt+"</a></td></tr></table></layer>");else
document.writeln("<layer style='position:absolute;left:0;top:0;'><table noborder cellpadding=0 cellspacing=0><tr><td "+drawCol+" width="+this.width+" height="+this.height+" align=center valign=top><a style='"+textCol+"text-decoration:none;"+_BFont+"'"+this.EventActions+">"+tt+"</a></td></tr></table></layer>");document.close();}}
function nav_Delete()
{var id=this.ID;with(_DiagramTarget.document.layers[id])
{document.open();document.close();}}
function nav_theColor()
{this.Color=theColor;if((theColor!="")&&(theColor.length<this.Color.length))this.Color="#"+theColor;else this.Color=theColor;this.ResizeTo("","","","");}
function nav_Line(theX0,theY0,theX1,theY1,theColor,theSize,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.ID="Line"+_N_Line;_N_Line++;_zIndex++;this.X0=theX0;this.Y0=theY0;this.X1=theX1;this.Y1=theY1;this.Color=theColor;if((theColor!="")&&(theColor.length==6))this.Color="#"+theColor;this.Size=Number(_nvl(theSize,1));this.TooltipText=theTooltipText;this.SetVisibility=_SetVisibility;this.SetColor=_SetColor;this.SetTitle=_SetTitle;this.MoveTo=_LineMoveTo;this.ResizeTo=_LineResizeTo;this.Delete=_Delete;this.EventActions="";if(_nvl(theOnClickAction,"")!="")this.EventActions+=" href='javascript:"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")this.EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")this.EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";var xx0,yy0,xx1,yy1,ll,rr,tt,bb,ww,hh,ccl,ccr,cct,ccb;var ss2=Math.floor(this.Size/2);var ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(theX0<=theX1){ll=theX0;rr=theX1;}
else{ll=theX1;rr=theX0;}
if(theY0<=theY1){tt=theY0;bb=theY1;}
else{tt=theY1;bb=theY0;}
ww=rr-ll;hh=bb-tt;_DiagramTarget.document.writeln("<layer left="+eval(ll-ss2)+" top="+eval(tt-ss2)+" id='"+this.ID+"' z-Index="+_zIndex+">");if((ww==0)||(hh==0))
_DiagramTarget.document.writeln("<layer left=2 top=2 width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
_DiagramTarget.document.writeln("<layer left="+eval(ccl+2)+" top="+eval(cct+2)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");else
_DiagramTarget.document.writeln("<layer left="+eval(ww-ccr+2)+" top="+eval(cct+2)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");_DiagramTarget.document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
_DiagramTarget.document.writeln("<layer left="+eval(ccl+2)+" top="+eval(cct+2)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");else
_DiagramTarget.document.writeln("<layer left="+eval(ww-ccl+2)+" top="+eval(cct+2)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");_DiagramTarget.document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+eval(ccb-cct+this.Size)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");ccl++;}}}
_DiagramTarget.document.writeln("</layer>");return(this);}
function nav_LineResizeTo(theX0,theY0,theX1,theY1)
{var xx0,yy0,xx1,yy1,ll,rr,tt,bb,ww,hh,ccl,ccr,cct,ccb,id=this.ID;var ss2=Math.floor(this.Size/2);if(!isNaN(parseInt(theX0)))this.X0=theX0;if(!isNaN(parseInt(theY0)))this.Y0=theY0;if(!isNaN(parseInt(theX1)))this.X1=theX1;if(!isNaN(parseInt(theY1)))this.Y1=theY1;var ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;with(_DiagramTarget.document.layers[id])
{top=tt-ss2;left=ll-ss2;document.open();if((ww==0)||(hh==0))
document.writeln("<layer left=2 top=2 width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
document.writeln("<layer left="+eval(ccl+2)+" top="+eval(cct+2)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");else
document.writeln("<layer left="+eval(ww-ccr+2)+" top="+eval(cct+2)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
document.writeln("<layer left="+eval(ccl+2)+" top="+eval(cct+2)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");else
document.writeln("<layer left="+eval(ww-ccl+2)+" top="+eval(cct+2)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+eval(ccb-cct+this.Size)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");ccl++;}}}
document.close();}}
function nav_LineMoveTo(theLeft,theTop)
{var id=this.ID;var ss2=Math.floor(this.Size/2);if(!isNaN(parseInt(theLeft)))this.left=theLeft;if(!isNaN(parseInt(theTop)))this.top=theTop;with(_DiagramTarget.document.layers[id])
{if(!isNaN(parseInt(theLeft)))left=theLeft-ss2;if(!isNaN(parseInt(theTop)))top=theTop-ss2;visibility="show";}}
function nav_Area(theX0,theY0,theX1,theY1,theColor,theBase,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.ID="Area"+_N_Area;_N_Area++;_zIndex++;this.X0=theX0;this.Y0=theY0;this.X1=theX1;this.Y1=theY1;this.Color=theColor;this.Base=theBase;this.TooltipText=theTooltipText;this.SetVisibility=_SetVisibility;this.SetColor=_SetColor;this.SetTitle=_SetTitle;this.MoveTo=_MoveTo;this.ResizeTo=_AreaResizeTo;this.Delete=_Delete;this.EventActions="";if(_nvl(theOnClickAction,"")!="")this.EventActions+=" href='javascript:"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")this.EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")this.EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";var dd,ll,rr,tt,bb,ww,hh;if(theX0<=theX1){ll=theX0;rr=theX1;}
else{ll=theX1;rr=theX0;}
if(theY0<=theY1){tt=theY0;bb=theY1;}
else{tt=theY1;bb=theY0;}
ww=rr-ll;hh=bb-tt;if(theBase<=tt)
_DiagramTarget.document.writeln("<layer left="+ll+" top="+theBase+" id='"+this.ID+"' z-index="+_zIndex+">");else
_DiagramTarget.document.writeln("<layer left="+ll+" top="+tt+" id='"+this.ID+"' z-index="+_zIndex+">");if(theBase<=tt)
{if((theBase<tt)&&(ww>0))
_DiagramTarget.document.writeln("<layer left=2 top=2><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"o_"+theColor+".gif' width="+ww+" height="+eval(tt-theBase)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");if(((theY0<theY1)&&(theX0<theX1))||((theY0>theY1)&&(theX0>theX1)))
_DiagramTarget.document.writeln("<layer left=2 top="+eval(tt-theBase+2)+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"q_"+theColor+".gif' width="+ww+" height="+hh+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");if(((theY0>theY1)&&(theX0<theX1))||((theY0<theY1)&&(theX0>theX1)))
_DiagramTarget.document.writeln("<layer left=2 top="+eval(tt-theBase+2)+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"p_"+theColor+".gif' width="+ww+" height="+hh+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
if((theBase>tt)&&(theBase<bb))
{dd=Math.round((theBase-tt)/hh*ww);if(((theY0<theY1)&&(theX0<theX1))||((theY0>theY1)&&(theX0>theX1)))
{_DiagramTarget.document.writeln("<layer left=2 top=2><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"b_"+theColor+".gif' width="+dd+" height="+eval(theBase-tt)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");_DiagramTarget.document.writeln("<layer left="+eval(dd+2)+" top="+eval(theBase-tt+2)+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"q_"+theColor+".gif' width="+eval(ww-dd)+" height="+eval(bb-theBase)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
if(((theY0>theY1)&&(theX0<theX1))||((theY0<theY1)&&(theX0>theX1)))
{_DiagramTarget.document.writeln("<layer left=2 top="+eval(theBase-tt+2)+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"p_"+theColor+".gif' width="+eval(ww-dd)+" height="+eval(bb-theBase)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");_DiagramTarget.document.writeln("<layer left="+eval(ww-dd+2)+" top=2><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"d_"+theColor+".gif' width="+dd+" height="+eval(theBase-tt)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}}
if(theBase>=bb)
{if((theBase>bb)&&(ww>0))
_DiagramTarget.document.writeln("<layer left=2 top="+eval(hh+2)+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"o_"+theColor+".gif' width="+ww+" height="+eval(theBase-bb)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");if(((theY0<theY1)&&(theX0<theX1))||((theY0>theY1)&&(theX0>theX1)))
_DiagramTarget.document.writeln("<layer left=2 top=2><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"b_"+theColor+".gif' width="+ww+" height="+hh+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");if(((theY0>theY1)&&(theX0<theX1))||((theY0<theY1)&&(theX0>theX1)))
_DiagramTarget.document.writeln("<layer left=2 top=2><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"d_"+theColor+".gif' width="+ww+" height="+hh+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
_DiagramTarget.document.writeln("</layer>");}
function nav_AreaResizeTo(theX0,theY0,theX1,theY1)
{var dd,ll,rr,tt,bb,ww,hh,id=this.ID;if(!isNaN(parseInt(theX0)))this.X0=theX0;if(!isNaN(parseInt(theY0)))this.Y0=theY0;if(!isNaN(parseInt(theX1)))this.X1=theX1;if(!isNaN(parseInt(theY1)))this.Y1=theY1;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;with(_DiagramTarget.document.layers[id])
{if(this.Base<=tt){left=ll;top=this.Base;}
else{left=ll;top=tt;}
document.open();if(this.Base<=tt)
{if((this.Base<tt)&&(ww>0))
document.writeln("<layer left=2 top=2><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"o_"+this.Color+".gif' width="+ww+" height="+eval(tt-this.Base)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");if(((this.Y0<this.Y1)&&(this.X0<this.X1))||((this.Y0>this.Y1)&&(this.X0>this.X1)))
document.writeln("<layer left=2 top="+eval(tt-this.Base+2)+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"q_"+this.Color+".gif' width="+ww+" height="+hh+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");if(((this.Y0>this.Y1)&&(this.X0<this.X1))||((this.Y0<this.Y1)&&(this.X0>this.X1)))
document.writeln("<layer left=2 top="+eval(tt-this.Base+2)+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"p_"+this.Color+".gif' width="+ww+" height="+hh+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
if((this.Base>tt)&&(this.Base<bb))
{dd=Math.round((this.Base-tt)/hh*ww);if(((this.Y0<this.Y1)&&(this.X0<this.X1))||((this.Y0>this.Y1)&&(this.X0>this.X1)))
{document.writeln("<layer left=2 top=2><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"b_"+this.Color+".gif' width="+dd+" height="+eval(this.Base-tt)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");document.writeln("<layer left="+eval(dd+2)+" top="+eval(this.Base-tt+2)+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"q_"+this.Color+".gif' width="+eval(ww-dd)+" height="+eval(bb-this.Base)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
if(((this.Y0>this.Y1)&&(this.X0<this.X1))||((this.Y0<this.Y1)&&(this.X0>this.X1)))
{document.writeln("<layer left=2 top="+eval(this.Base-tt+2)+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"p_"+this.Color+".gif' width="+eval(ww-dd)+" height="+eval(bb-this.Base)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");document.writeln("<layer left="+eval(ww-dd+2)+" top=2><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"d_"+this.Color+".gif' width="+dd+" height="+eval(this.Base-tt)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}}
if(this.Base>=bb)
{if((this.Base>bb)&&(ww>0))
document.writeln("<layer left=2 top="+eval(hh+2)+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"o_"+this.Color+".gif' width="+ww+" height="+eval(this.Base-bb)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");if(((this.Y0<this.Y1)&&(this.X0<this.X1))||((this.Y0>this.Y1)&&(this.X0>this.X1)))
document.writeln("<layer left=2 top=2><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"b_"+this.Color+".gif' width="+ww+" height="+hh+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");if(((this.Y0>this.Y1)&&(this.X0<this.X1))||((this.Y0<this.Y1)&&(this.X0>this.X1)))
document.writeln("<layer left=2 top=2><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"d_"+this.Color+".gif' width="+ww+" height="+hh+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
document.close();}}
function nav_Arrow(theX0,theY0,theX1,theY1,theColor,theSize,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.ID="Arrow"+_N_Arrow;_N_Arrow++;_zIndex++;this.X0=theX0;this.Y0=theY0;this.X1=theX1;this.Y1=theY1;this.Color=theColor;if((theColor!="")&&(theColor.length==6))this.Color="#"+theColor;this.Size=Number(_nvl(theSize,1));this.TooltipText=theTooltipText;this.Border=8*this.Size;this.SetVisibility=_SetVisibility;this.SetColor=_SetColor;this.SetTitle=_SetTitle;this.MoveTo=_ArrowMoveTo;this.ResizeTo=_ArrowResizeTo;this.Delete=_Delete;this.EventActions="";if(_nvl(theOnClickAction,"")!="")this.EventActions+=" href='javascript:"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")this.EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")this.EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";var xx0,yy0,xx1,yy1,ll,rr,tt,bb,ww,hh,ccl,ccr,cct,ccb;var ss2=Math.floor(this.Size/2);var ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(theX0<=theX1){ll=theX0;rr=theX1;}
else{ll=theX1;rr=theX0;}
if(theY0<=theY1){tt=theY0;bb=theY1;}
else{tt=theY1;bb=theY0;}
ww=rr-ll;hh=bb-tt;_DiagramTarget.document.writeln("<layer left="+eval(ll-ss2-this.Border)+" top="+eval(tt-ss2-this.Border)+" id='"+this.ID+"' z-Index="+_zIndex+">");if((ww==0)||(hh==0))
_DiagramTarget.document.writeln("<layer left="+eval(2+this.Border)+" top="+eval(2+this.Border)+" width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
_DiagramTarget.document.writeln("<layer left="+eval(ccl+2+this.Border)+" top="+eval(cct+2+this.Border)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");else
_DiagramTarget.document.writeln("<layer left="+eval(ww-ccr+2+this.Border)+" top="+eval(cct+2+this.Border)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");_DiagramTarget.document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
_DiagramTarget.document.writeln("<layer left="+eval(ccl+2+this.Border)+" top="+eval(cct+2+this.Border)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");else
_DiagramTarget.document.writeln("<layer left="+eval(ww-ccl+2+this.Border)+" top="+eval(cct+2+this.Border)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");_DiagramTarget.document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+eval(ccb-cct+this.Size)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");ccl++;}}}
var LL=1,ll0=ll,tt0=tt;var ccL=8*theSize+4,ccB=2*theSize+1;var DDX=theX1-theX0,DDY=theY1-theY0;if((DDX!=0)||(DDY!=0))LL=Math.sqrt((DDX*DDX)+(DDY*DDY));this.X0=theX1-Math.round(1/LL*(ccL*DDX-ccB*DDY));this.Y0=theY1-Math.round(1/LL*(ccL*DDY+ccB*DDX));ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;if((ww==0)||(hh==0))
_DiagramTarget.document.writeln("<layer left="+eval(2+this.Border+ll-ll0)+" top="+eval(2+this.Border+tt-tt0)+" width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
_DiagramTarget.document.writeln("<layer left="+eval(ccl+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");else
_DiagramTarget.document.writeln("<layer left="+eval(ww-ccr+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");_DiagramTarget.document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
_DiagramTarget.document.writeln("<layer left="+eval(ccl+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");else
_DiagramTarget.document.writeln("<layer left="+eval(ww-ccl+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");_DiagramTarget.document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+eval(ccb-cct+this.Size)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");ccl++;}}}
this.X0=theX1-Math.round(1/LL*(ccL*DDX+ccB*DDY));this.Y0=theY1-Math.round(1/LL*(ccL*DDY-ccB*DDX));ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;if((ww==0)||(hh==0))
_DiagramTarget.document.writeln("<layer left="+eval(2+this.Border+ll-ll0)+" top="+eval(2+this.Border+tt-tt0)+" width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
_DiagramTarget.document.writeln("<layer left="+eval(ccl+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");else
_DiagramTarget.document.writeln("<layer left="+eval(ww-ccr+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");_DiagramTarget.document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
_DiagramTarget.document.writeln("<layer left="+eval(ccl+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");else
_DiagramTarget.document.writeln("<layer left="+eval(ww-ccl+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");_DiagramTarget.document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+eval(ccb-cct+this.Size)+" border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");ccl++;}}}
_DiagramTarget.document.writeln("</layer>");this.X0=theX0;this.Y0=theY0;return(this);}
function nav_ArrowResizeTo(theX0,theY0,theX1,theY1)
{var xx0,yy0,xx1,yy1,ll,rr,tt,bb,ww,hh,ccl,ccr,cct,ccb,id=this.ID;var ss2=Math.floor(this.Size/2);if(!isNaN(parseInt(theX0)))this.X0=theX0;if(!isNaN(parseInt(theY0)))this.Y0=theY0;if(!isNaN(parseInt(theX1)))this.X1=theX1;if(!isNaN(parseInt(theY1)))this.Y1=theY1;var tmpX0=this.X0,tmpY0=this.Y0;var ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;with(_DiagramTarget.document.layers[id])
{top=tt-ss2-this.Border;left=ll-ss2-this.Border;document.open();if((ww==0)||(hh==0))
document.writeln("<layer left="+eval(2+this.Border)+" top="+eval(2+this.Border)+" width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
document.writeln("<layer left="+eval(ccl+2+this.Border)+" top="+eval(cct+2+this.Border)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");else
document.writeln("<layer left="+eval(ww-ccr+2+this.Border)+" top="+eval(cct+2+this.Border)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
document.writeln("<layer left="+eval(ccl+2+this.Border)+" top="+eval(cct+2+this.Border)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");else
document.writeln("<layer left="+eval(ww-ccl+2+this.Border)+" top="+eval(cct+2+this.Border)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+eval(ccb-cct+this.Size)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");ccl++;}}}
var LL=1,ll0=ll,tt0=tt;var ccL=8*this.Size+4,ccB=2*this.Size+1;var DDX=this.X1-tmpX0,DDY=this.Y1-tmpY0;if((DDX!=0)||(DDY!=0))LL=Math.sqrt(0+(DDX*DDX)+(DDY*DDY));this.X0=this.X1-Math.round(1/LL*(ccL*DDX-ccB*DDY));this.Y0=this.Y1-Math.round(1/LL*(ccL*DDY+ccB*DDX));ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;if((ww==0)||(hh==0))
document.writeln("<layer left="+eval(2+this.Border+ll-ll0)+" top="+eval(2+this.Border+tt-tt0)+" width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
document.writeln("<layer left="+eval(ccl+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");else
document.writeln("<layer left="+eval(ww-ccr+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
document.writeln("<layer left="+eval(ccl+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");else
document.writeln("<layer left="+eval(ww-ccl+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+eval(ccb-cct+this.Size)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");ccl++;}}}
this.X0=this.X1-Math.round(1/LL*(ccL*DDX+ccB*DDY));this.Y0=this.Y1-Math.round(1/LL*(ccL*DDY-ccB*DDX));ddir=(((this.Y1>this.Y0)&&(this.X1>this.X0))||((this.Y1<this.Y0)&&(this.X1<this.X0)))?true:false;if(this.X0<=this.X1){ll=this.X0;rr=this.X1;}
else{ll=this.X1;rr=this.X0;}
if(this.Y0<=this.Y1){tt=this.Y0;bb=this.Y1;}
else{tt=this.Y1;bb=this.Y0;}
ww=rr-ll;hh=bb-tt;if((ww==0)||(hh==0))
document.writeln("<layer left="+eval(2+this.Border+ll-ll0)+" top="+eval(2+this.Border+tt-tt0)+" width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ww+this.Size)+" height="+eval(hh+this.Size)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");else
{if(ww>hh)
{ccr=0;cct=0;while(ccr<ww)
{ccl=ccr;while((2*ccr*hh<=(2*cct+1)*ww)&&(ccr<=ww))ccr++;if(ddir)
document.writeln("<layer left="+eval(ccl+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");else
document.writeln("<layer left="+eval(ww-ccr+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" bgcolor="+this.Color+">");document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+eval(ccr-ccl+this.Size)+" height="+this.Size+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");cct++;}}
else
{ccb=0;ccl=0;while(ccb<hh)
{cct=ccb;while((2*ccb*ww<=(2*ccl+1)*hh)&&(ccb<hh))ccb++;if(ddir)
document.writeln("<layer left="+eval(ccl+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");else
document.writeln("<layer left="+eval(ww-ccl+2+this.Border+ll-ll0)+" top="+eval(cct+2+this.Border+tt-tt0)+" width="+this.Size+" height="+eval(ccb-cct+this.Size)+" bgcolor="+this.Color+">");document.writeln("<a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+this.Size+" height="+eval(ccb-cct+this.Size)+" border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");ccl++;}}}
document.close();}
this.X0=tmpX0;this.Y0=tmpY0;}
function nav_ArrowMoveTo(theLeft,theTop)
{var id=this.ID;var ss2=Math.floor(this.Size/2);if(!isNaN(parseInt(theLeft)))this.left=theLeft;if(!isNaN(parseInt(theTop)))this.top=theTop;with(_DiagramTarget.document.layers[id])
{if(!isNaN(parseInt(theLeft)))left=theLeft-ss2-this.Border;if(!isNaN(parseInt(theTop)))top=theTop-ss2-this.Border;visibility="show";}}
function nav_Pie(theXCenter,theYCenter,theOffset,theRadius,theAngle0,theAngle1,theColor,theTooltipText,theOnClickAction,theOnMouseoverAction,theOnMouseoutAction)
{this.ID="Pie"+_N_Pie;_N_Pie++;_zIndex++;this.XCenter=theXCenter;this.YCenter=theYCenter;this.Offset=theOffset;this.Radius=theRadius;this.dX=theRadius;this.dY=theRadius;this.Angle0=theAngle0;this.Angle1=theAngle1;this.Color=theColor;if((theColor!="")&&(theColor.length==6))this.Color="#"+theColor;this.TooltipText=theTooltipText;this.Cursor=_cursor(theOnClickAction);this.SetVisibility=_SetVisibility;this.SetColor=_SetColor;this.SetTitle=_SetTitle;this.MoveTo=_PieMoveTo;this.ResizeTo=_PieResizeTo;this.Delete=_Delete;this.EventActions="";if(_nvl(theOnClickAction,"")!="")this.EventActions+=" href='javascript:"+_nvl(theOnClickAction,"")+"' ";if(_nvl(theOnMouseoverAction,"")!="")this.EventActions+="onMouseover='"+_nvl(theOnMouseoverAction,"")+"' ";if(_nvl(theOnMouseoutAction,"")!="")this.EventActions+="onMouseout='"+_nvl(theOnMouseoutAction,"")+"' ";var aa0,aa1,xx,yy,tt,xxo=0,yyo=0,rr2=this.Radius*this.Radius,xx0,yy0,xx1,yy1,pid180=Math.PI/180,ss0,ss1;var nbsp="";aa0=this.Angle0;aa1=this.Angle1;while(aa0>=360)aa0-=360;while(aa0<0)aa0+=360;while(aa1>=360)aa1-=360;while(aa1<0)aa1+=360;if(aa0<aa1)
{xxo=Math.sin((aa0+aa1)*pid180/2)*this.Offset;yyo=-Math.cos((aa0+aa1)*pid180/2)*this.Offset;}
if(aa0>aa1)
{xxo=Math.sin((aa0+aa1+360)*pid180/2)*this.Offset;yyo=-Math.cos((aa0+aa1+360)*pid180/2)*this.Offset;}
_DiagramTarget.document.writeln("<layer left="+Math.round(this.XCenter-this.Radius+xxo)+" top="+Math.round(this.YCenter-this.Radius+yyo)+" id='"+this.ID+"' z-Index="+_zIndex+">");if(aa0==aa1)
{if(this.Angle0<this.Angle1)
{for(yy=-this.Radius;yy<this.Radius;yy++)
{xx=Math.round(Math.sqrt(rr2-(yy+0.5)*(yy+0.5)));tt=yy+this.Radius+2;_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}}}
else
{xx0=Math.sin(aa0*pid180)*this.Radius;yy0=-Math.cos(aa0*pid180)*this.Radius;xx1=Math.sin(aa1*pid180)*this.Radius;yy1=-Math.cos(aa1*pid180)*this.Radius;for(yy=-this.Radius;yy<0;yy++)
{xx=Math.round(Math.sqrt(rr2-(yy+0.5)*(yy+0.5)));tt=yy+this.Radius+2;if((yy0>=0)&&(yy1>=0))
{if(xx0<xx1)
_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
else if((yy0<0)&&(yy1<0))
{if((yy<yy0)&&(yy<yy1))
{if(((xx0<0)&&(xx1>0))||((xx0<0)&&(xx1<=xx0))||((xx1>0)&&(xx0>=xx1)))
_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
else if((yy>=yy0)&&(yy>=yy1))
{ss0=yy*xx0/yy0;ss1=yy*xx1/yy1;if(xx0<xx1)
_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2+ss0)+" top="+tt+" width="+Math.round(ss1-ss0)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss1-ss0)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");else
{_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(ss1+xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss1+xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2+ss0)+" top="+tt+" width="+Math.round(xx-ss0)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(xx-ss0)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}}
else if(yy>=yy0)
{ss0=yy*xx0/yy0;_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2+ss0)+" top="+tt+" width="+Math.round(xx-ss0)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(xx-ss0)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
else
{ss1=yy*xx1/yy1;_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(ss1+xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss1+xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}}
else if(yy0<0)
{if(yy>=yy0)
{ss0=yy*xx0/yy0;_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2+ss0)+" top="+tt+" width="+Math.round(xx-ss0)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(xx-ss0)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
else if(xx0<0)
_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
else
{if(yy>=yy1)
{ss1=yy*xx1/yy1;_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(ss1+xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss1+xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
else if(xx1>0)
_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}}
for(yy=0;yy<this.Radius;yy++)
{xx=Math.round(Math.sqrt(rr2-(yy+0.5)*(yy+0.5)));tt=yy+this.Radius+2;if((yy0<=0)&&(yy1<=0))
{if(xx0>xx1)
_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
else if((yy0>0)&&(yy1>0))
{if((yy>yy0)&&(yy>yy1))
{if(((xx1<0)&&(xx0>0))||((xx1<0)&&(xx0<=xx1))||((xx0>0)&&(xx1>=xx0)))
_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
else if((yy<=yy0)&&(yy<=yy1))
{ss0=yy*xx0/yy0;ss1=yy*xx1/yy1;if(xx0>xx1)
_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2+ss1)+" top="+tt+" width="+Math.round(ss0-ss1)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss0-ss1)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");else
{_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(ss0+xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss0+xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2+ss1)+" top="+tt+" width="+Math.round(xx-ss1)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(xx-ss1)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}}
else if(yy<=yy0)
{ss0=yy*xx0/yy0;_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(ss0+xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss0+xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
else
{ss1=yy*xx1/yy1;_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2+ss1)+" top="+tt+" width="+Math.round(xx-ss1)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(xx-ss1)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}}
else if(yy0>0)
{if(yy<=yy0)
{ss0=yy*xx0/yy0;_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(ss0+xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss0+xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
else if(xx0>0)
_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
else
{if(yy<=yy1)
{ss1=yy*xx1/yy1;_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2+ss1)+" top="+tt+" width="+Math.round(xx-ss1)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(xx-ss1)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}
else if(xx1<0)
_DiagramTarget.document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(theTooltipText,"")+"'></a></layer>");}}}
_DiagramTarget.document.writeln("</layer>");return(this);}
function nav_PieResizeTo(theXCenter,theYCenter,theOffset,theRadius,theAngle0,theAngle1)
{var id=this.ID;if(!isNaN(parseInt(theXCenter)))this.XCenter=theXCenter;if(!isNaN(parseInt(theYCenter)))this.YCenter=theYCenter;if(!isNaN(parseInt(theOffset)))this.Offset=theOffset;if(!isNaN(parseInt(theRadius)))this.Radius=theRadius;if(!isNaN(parseInt(theAngle0)))this.Angle0=theAngle0;if(!isNaN(parseInt(theAngle1)))this.Angle1=theAngle1;var aa0,aa1,xx,yy,xxo=0,yyo=0,rr2=this.Radius*this.Radius,xx0,yy0,xx1,yy1,pid180=Math.PI/180,ss0,ss1;var nbsp="";aa0=this.Angle0;aa1=this.Angle1;if(aa0<aa1)
{xxo=Math.sin((aa0+aa1)*pid180/2)*this.Offset;yyo=-Math.cos((aa0+aa1)*pid180/2)*this.Offset;}
if(aa0>aa1)
{xxo=Math.sin((aa0+aa1+360)*pid180/2)*this.Offset;yyo=-Math.cos((aa0+aa1+360)*pid180/2)*this.Offset;}
with(_DiagramTarget.document.layers[id])
{top=Math.round(this.YCenter-this.Radius+yyo);left=Math.round(this.XCenter-this.Radius+xxo);document.open();if(aa0==aa1)
{if(this.Angle0<this.Angle1)
{for(yy=-this.Radius;yy<this.Radius;yy++)
{xx=Math.round(Math.sqrt(rr2-(yy+0.5)*(yy+0.5)));tt=yy+this.Radius+2;document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}}}
else
{xx0=Math.sin(aa0*pid180)*this.Radius;yy0=-Math.cos(aa0*pid180)*this.Radius;xx1=Math.sin(aa1*pid180)*this.Radius;yy1=-Math.cos(aa1*pid180)*this.Radius;for(yy=-this.Radius;yy<0;yy++)
{xx=Math.round(Math.sqrt(rr2-(yy+0.5)*(yy+0.5)));tt=yy+this.Radius+2;if((yy0>=0)&&(yy1>=0))
{if(xx0<xx1)
document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
else if((yy0<0)&&(yy1<0))
{if((yy<yy0)&&(yy<yy1))
{if(((xx0<0)&&(xx1>0))||((xx0<0)&&(xx1<=xx0))||((xx1>0)&&(xx0>=xx1)))
document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
else if((yy>=yy0)&&(yy>=yy1))
{ss0=yy*xx0/yy0;ss1=yy*xx1/yy1;if(xx0<xx1)
document.writeln("<layer left="+Math.round(this.Radius+2+ss0)+" top="+tt+" width="+Math.round(ss1-ss0)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss1-ss0)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");else
{document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(ss1+xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss1+xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");document.writeln("<layer left="+Math.round(this.Radius+2+ss0)+" top="+tt+" width="+Math.round(xx-ss0)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(xx-ss0)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}}
else if(yy>=yy0)
{ss0=yy*xx0/yy0;document.writeln("<layer left="+Math.round(this.Radius+2+ss0)+" top="+tt+" width="+Math.round(xx-ss0)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(xx-ss0)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
else
{ss1=yy*xx1/yy1;document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(ss1+xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss1+xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}}
else if(yy0<0)
{if(yy>=yy0)
{ss0=yy*xx0/yy0;document.writeln("<layer left="+Math.round(this.Radius+2+ss0)+" top="+tt+" width="+Math.round(xx-ss0)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(xx-ss0)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
else if(xx0<0)
document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
else
{if(yy>=yy1)
{ss1=yy*xx1/yy1;document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(ss1+xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss1+xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
else if(xx1>0)
document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}}
for(yy=0;yy<this.Radius;yy++)
{xx=Math.round(Math.sqrt(rr2-(yy+0.5)*(yy+0.5)));tt=yy+this.Radius+2;if((yy0<=0)&&(yy1<=0))
{if(xx0>xx1)
document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
else if((yy0>0)&&(yy1>0))
{if((yy>yy0)&&(yy>yy1))
{if(((xx1<0)&&(xx0>0))||((xx1<0)&&(xx0<=xx1))||((xx0>0)&&(xx1>=xx0)))
document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
else if((yy<=yy0)&&(yy<=yy1))
{ss0=yy*xx0/yy0;ss1=yy*xx1/yy1;if(xx0>xx1)
document.writeln("<layer left="+Math.round(this.Radius+2+ss1)+" top="+tt+" width="+Math.round(ss0-ss1)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss0-ss1)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");else
{document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(ss0+xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss0+xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");document.writeln("<layer left="+Math.round(this.Radius+2+ss1)+" top="+tt+" width="+Math.round(xx-ss1)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(xx-ss1)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}}
else if(yy<=yy0)
{ss0=yy*xx0/yy0;document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(ss0+xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss0+xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
else
{ss1=yy*xx1/yy1;document.writeln("<layer left="+Math.round(this.Radius+2+ss1)+" top="+tt+" width="+Math.round(xx-ss1)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(xx-ss1)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}}
else if(yy0>0)
{if(yy<=yy0)
{ss0=yy*xx0/yy0;document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(ss0+xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(ss0+xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
else if(xx0>0)
document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
else
{if(yy<=yy1)
{ss1=yy*xx1/yy1;document.writeln("<layer left="+Math.round(this.Radius+2+ss1)+" top="+tt+" width="+Math.round(xx-ss1)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(xx-ss1)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}
else if(xx1<0)
document.writeln("<layer left="+Math.round(this.Radius+2-xx)+" top="+tt+" width="+Math.round(2*xx)+" height=1 bgcolor="+this.Color+"><a"+this.EventActions+"><img src='"+_DiagramImagesHref+"transparent.gif' width="+Math.round(2*xx)+" height=1 border=0 align=top valign=left alt='"+_nvl(this.TooltipText,"")+"'></a></layer>");}}}
document.close();}}
function nav_PieMoveTo(theXCenter,theYCenter,theOffset)
{var xxo=0,yyo=0,pid180=Math.PI/180,id=this.ID;if(!isNaN(parseInt(theXCenter)))this.XCenter=theXCenter;if(!isNaN(parseInt(theYCenter)))this.YCenter=theYCenter;if(!isNaN(parseInt(theOffset)))this.Offset=theOffset;if(this.Angle0<this.Angle1)
{xxo=Math.sin((this.Angle0+this.Angle1)*pid180/2)*this.Offset;yyo=-Math.cos((this.Angle0+this.Angle1)*pid180/2)*this.Offset;}
if(this.Angle0>this.Angle1)
{xxo=Math.sin((this.Angle0+this.Angle1+360)*pid180/2)*this.Offset;yyo=-Math.cos((this.Angle0+this.Angle1+360)*pid180/2)*this.Offset;}
with(_DiagramTarget.document.layers[id])
{left=Math.round(this.XCenter-this.Radius+xxo);top=Math.round(this.YCenter-this.Radius+yyo);visibility="show";}}
if(_nav4){_Draw=nav_Draw;Bar=nav_Bar;Box=nav_Box;_SetBarColor=nav_SetBarColor;_SetBarText=nav_SetBarText;Dot=nav_Dot;_SetDotColor=nav_SetDotColor;_DotMoveTo=nav_DotMoveTo;Pixel=nav_Pixel;_SetPixelColor=nav_SetPixelColor;_SetVisibility=nav_SetVisibility;_SetTitle=nav_SetTitle;_MoveTo=nav_MoveTo;_ResizeTo=nav_ResizeTo;_Delete=nav_Delete;_SetColor=nav_SetColor;Line=nav_Line;_LineResizeTo=nav_LineResizeTo;_LineMoveTo=nav_LineMoveTo;Area=nav_Area;_AreaResizeTo=nav_AreaResizeTo;Arrow=nav_Arrow;_ArrowResizeTo=nav_ArrowResizeTo;_ArrowMoveTo=nav_ArrowMoveTo;Pie=nav_Pie;_PieResizeTo=nav_PieResizeTo;_PieMoveTo=nav_PieMoveTo;}else{_Draw=dom_Draw;Bar=dom_Bar;Box=dom_Box;_SetBarColor=dom_SetBarColor;_SetBarText=dom_SetBarText;Dot=dom_Dot;_SetDotColor=dom_SetDotColor;_DotMoveTo=dom_DotMoveTo;Pixel=dom_Pixel;_SetPixelColor=dom_SetPixelColor;_SetVisibility=dom_SetVisibility;_SetTitle=dom_SetTitle;_MoveTo=dom_MoveTo;_ResizeTo=dom_ResizeTo;_Delete=dom_Delete;_SetColor=dom_SetColor;Line=dom_Line;_LineResizeTo=dom_LineResizeTo;_LineMoveTo=dom_LineMoveTo;Area=dom_Area;_AreaResizeTo=dom_AreaResizeTo;Arrow=dom_Arrow;_ArrowResizeTo=dom_ArrowResizeTo;_ArrowMoveTo=dom_ArrowMoveTo;Pie=dom_Pie;_PieResizeTo=dom_PieResizeTo;_PieMoveTo=dom_PieMoveTo;}
var _DiagramImagesHref='';function Diagram()
{this.xtext="";this.ytext="";this.title="";this.XScale=1;this.YScale=1;this.XScalePosition="bottom";this.YScalePosition="left";this.Font="font-family:Verdana;font-weight:normal;font-size:10pt;line-height:13pt;";this.ID="Dia"+_N_Dia;_N_Dia++;_zIndex++;this.zIndex=_zIndex;this.logsub=new Array(0.301,0.477,0.602,0.699,0.778,0.845,0.903,0.954);this.SetFrame=_SetFrame;this.SetBorder=_SetBorder;this.SetText=_SetText;this.SetGridColor=_SetGridColor;this.SetXGridColor=_SetXGridColor;this.SetYGridColor=_SetYGridColor;this.ScreenX=_ScreenX;this.ScreenY=_ScreenY;this.RealX=_RealX;this.RealY=_RealY;this.XGrid=new Array(3);this.GetXGrid=_GetXGrid;this.YGrid=new Array(3);this.GetYGrid=_GetYGrid;this.XGridDelta=0;this.YGridDelta=0;this.XSubGrids=0;this.YSubGrids=0;this.SubGrids=0;this.XGridColor="";this.YGridColor="";this.XSubGridColor="";this.YSubGridColor="";this.MaxGrids=0;this.DateInterval=_DateInterval;this.Draw=_Draw;this.SetVisibility=_SetVisibility;this.SetTitle=_SetTitle;this.Delete=_Delete;return(this);}
function _SetFrame(theLeft,theTop,theRight,theBottom)
{this.left=theLeft;this.right=theRight;this.top=theTop;this.bottom=theBottom;}
function _SetBorder(theLeftX,theRightX,theBottomY,theTopY)
{this.xmin=theLeftX;this.xmax=theRightX;this.ymin=theBottomY;this.ymax=theTopY;}
function _SetText(theScaleX,theScaleY,theTitle)
{this.xtext=theScaleX;this.ytext=theScaleY;this.title=theTitle;}
function _SetGridColor(theGridColor,theSubGridColor)
{this.XGridColor=theGridColor;this.YGridColor=theGridColor;if((theSubGridColor)||(theSubGridColor==""))
{this.XSubGridColor=theSubGridColor;this.YSubGridColor=theSubGridColor;}}
function _SetXGridColor(theGridColor,theSubGridColor)
{this.XGridColor=theGridColor;if((theSubGridColor)||(theSubGridColor==""))
this.XSubGridColor=theSubGridColor;}
function _SetYGridColor(theGridColor,theSubGridColor)
{this.YGridColor=theGridColor;if((theSubGridColor)||(theSubGridColor==""))
this.YSubGridColor=theSubGridColor;}
function _ScreenX(theRealX)
{return(Math.round((theRealX-this.xmin)/(this.xmax-this.xmin)*(this.right-this.left)+this.left));}
function _ScreenY(theRealY)
{return(Math.round((this.ymax-theRealY)/(this.ymax-this.ymin)*(this.bottom-this.top)+this.top));}
function _RealX(theScreenX)
{return(this.xmin+(this.xmax-this.xmin)*(theScreenX-this.left)/(this.right-this.left));}
function _RealY(theScreenY)
{return(this.ymax-(this.ymax-this.ymin)*(theScreenY-this.top)/(this.bottom-this.top));}
function _sign(rr)
{if(rr<0)return(-1);else return(1);}
function _DateInterval(vv)
{var bb=140*24*60*60*1000;this.SubGrids=4;if(vv>=bb)
{bb=8766*60*60*1000;if(vv<bb)
return(bb/12);if(vv<bb*2)
return(bb/6);if(vv<bb*5/2)
{this.SubGrids=6;return(bb/4);}
if(vv<bb*5)
{this.SubGrids=6;return(bb/2);}
if(vv<bb*10)
return(bb);if(vv<bb*20)
return(bb*2);if(vv<bb*50)
{this.SubGrids=5;return(bb*5);}
if(vv<bb*100)
{this.SubGrids=5;return(bb*10);}
if(vv<bb*200)
return(bb*20);if(vv<bb*500)
{this.SubGrids=5;return(bb*50);}
this.SubGrids=5;return(bb*100);}
bb/=2;if(vv>=bb){this.SubGrids=7;return(bb/5);}
bb/=2;if(vv>=bb){this.SubGrids=7;return(bb/5);}
bb/=7;bb*=4;if(vv>=bb)return(bb/5);bb/=2;if(vv>=bb)return(bb/5);bb/=2;if(vv>=bb)return(bb/5);bb/=2;if(vv>=bb)return(bb/5);bb*=3;bb/=5;if(vv>=bb){this.SubGrids=6;return(bb/6);}
bb/=2;if(vv>=bb){this.SubGrids=6;return(bb/6);}
bb*=2;bb/=3;if(vv>=bb)return(bb/6);bb/=2;if(vv>=bb)return(bb/6);bb/=2;if(vv>=bb){this.SubGrids=6;return(bb/6);}
bb/=2;if(vv>=bb){this.SubGrids=5;return(bb/6);}
bb*=2;bb/=3;if(vv>=bb){this.SubGrids=5;return(bb/6);}
bb/=3;if(vv>=bb){this.SubGrids=5;return(bb/4);}
bb/=2;if(vv>=bb)return(bb/5);bb/=2;if(vv>=bb)return(bb/5);bb*=3;bb/=2;if(vv>=bb){this.SubGrids=6;return(bb/6);}
bb/=2;if(vv>=bb){this.SubGrids=5;return(bb/6);}
bb*=2;bb/=3;if(vv>=bb){this.SubGrids=5;return(bb/6);}
bb/=3;if(vv>=bb){this.SubGrids=5;return(bb/4);}
bb/=2;if(vv>=bb)return(bb/5);return(bb/10);}
function _DayOfYear(dd,mm,yy)
{DOM=new Array(31,28,31,30,31,30,31,31,30,31,30,31);var ii,nn=dd;for(ii=0;ii<mm-1;ii++)nn+=DOM[ii];if((mm>2)&&(yy%4==0))nn++;return(nn);}
function _GetKWT(dd,mm,yy)
{var ss=new Date(yy,0,1);var ww=ss.getDay();ww=(ww+2)%7-3;ww+=(_DayOfYear(dd,mm,yy)-1);if(ww<0)return(_GetKWT(24+dd,12,yy-1));if((mm==12)&&(dd>28))
{if(ww%7+29<=dd)return("01/"+eval(ww%7+1));}
ss=Math.floor(ww/7+1);if(ss<10)ss="0"+ss;return(ss+"/"+eval(ww%7+1));}
function _DateFormat(vv,ii,ttype)
{var yy,mm,dd,hh,nn,ss,vv_date=new Date(vv);Month=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");Weekday=new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat");if(ii>15*24*60*60*1000)
{if(ii<365*24*60*60*1000)
{vv_date.setTime(vv+15*24*60*60*1000);yy=vv_date.getUTCFullYear()%100;if(yy<10)yy="0"+yy;mm=vv_date.getUTCMonth()+1;if(ttype==5);if(ttype==4)return(Month[mm-1]);if(ttype==3)return(Month[mm-1]+" "+yy);return(mm+"/"+yy);}
vv_date.setTime(vv+183*24*60*60*1000);yy=vv_date.getUTCFullYear();return(yy);}
vv_date.setTime(vv);yy=vv_date.getUTCFullYear();mm=vv_date.getUTCMonth()+1;dd=vv_date.getUTCDate();ww=vv_date.getUTCDay();hh=vv_date.getUTCHours();nn=vv_date.getUTCMinutes();ss=vv_date.getUTCSeconds();if(ii>=86400000)
{if(ttype==5);if(ttype==4)return(Weekday[ww]);if(ttype==3)return(mm+"/"+dd);return(dd+"."+mm+".");}
if(ii>=21600000)
{if(hh==0)
{if(ttype==5);if(ttype==4)return(Weekday[ww]);if(ttype==3)return(mm+"/"+dd);return(dd+"."+mm+".");}
else
{if(ttype==5);if(ttype==4)return((hh<=12)?hh+"am":hh%12+"pm");if(ttype==3)return((hh<=12)?hh+"am":hh%12+"pm");return(hh+":00");}}
if(ii>=60000)
{if(nn<10)nn="0"+nn;if(ttype==5);if(ttype==4)return((hh<=12)?hh+"."+nn+"am":hh%12+"."+nn+"pm");if(nn=="00")nn="";else nn=":"+nn;if(ttype==3)return((hh<=12)?hh+nn+"am":hh%12+nn+"pm");if(nn=="")nn=":00";return(hh+nn);}
if(ss<10)ss="0"+ss;return(nn+":"+ss);}
function _GetXGrid()
{var x0,i,j,l,x,r,dx,xr,invdifx,deltax;dx=(this.xmax-this.xmin);if(Math.abs(dx)>0)
{invdifx=(this.right-this.left)/(this.xmax-this.xmin);if((this.XScale==1)||(isNaN(this.XScale)))
{r=1;while(Math.abs(dx)>=100){dx/=10;r*=10;}
while(Math.abs(dx)<10){dx*=10;r/=10;}
if(Math.abs(dx)>=50){this.SubGrids=5;deltax=10*r*_sign(dx);}
else
{if(Math.abs(dx)>=20){this.SubGrids=5;deltax=5*r*_sign(dx);}
else{this.SubGrids=4;deltax=2*r*_sign(dx);}}}
else deltax=this.DateInterval(Math.abs(dx))*_sign(dx);if(this.XGridDelta!=0)deltax=this.XGridDelta;if(this.XSubGrids!=0)this.SubGrids=this.XSubGrids;x=Math.floor(this.xmin/deltax)*deltax;i=0;this.XGrid[1]=deltax;if(deltax!=0)this.MaxGrids=Math.floor(Math.abs((this.xmax-this.xmin)/deltax))+2;else this.MaxGrids=0;for(j=this.MaxGrids;j>=-1;j--)
{xr=x+j*deltax;x0=Math.round(this.left+(-this.xmin+xr)*invdifx);if((x0>=this.left)&&(x0<=this.right))
{if(i==0)this.XGrid[2]=xr;this.XGrid[0]=xr;i++;}}}
return(this.XGrid);}
function _GetYGrid()
{var y0,i,j,l,y,r,dy,yr,invdify,deltay;dy=this.ymax-this.ymin;if(Math.abs(dy)>0)
{invdify=(this.bottom-this.top)/(this.ymax-this.ymin);if((this.YScale==1)||(isNaN(this.YScale)))
{r=1;while(Math.abs(dy)>=100){dy/=10;r*=10;}
while(Math.abs(dy)<10){dy*=10;r/=10;}
if(Math.abs(dy)>=50){this.SubGrids=5;deltay=10*r*_sign(dy);}
else
{if(Math.abs(dy)>=20){this.SubGrids=5;deltay=5*r*_sign(dy);}
else{this.SubGrids=4;deltay=2*r*_sign(dy);}}}
else deltay=this.DateInterval(Math.abs(dy))*_sign(dy);if(this.YGridDelta!=0)deltay=this.YGridDelta;if(this.YSubGrids!=0)this.SubGrids=this.YSubGrids;y=Math.floor(this.ymax/deltay)*deltay;this.YGrid[1]=deltay;i=0;if(deltay!=0)this.MaxGrids=Math.floor(Math.abs((this.ymax-this.ymin)/deltay))+2;else this.MaxGrids=0;for(j=-1;j<=this.MaxGrids;j++)
{yr=y-j*deltay;y0=Math.round(this.top+(this.ymax-yr)*invdify);if((y0>=this.top)&&(y0<=this.bottom))
{if(i==0)this.YGrid[2]=yr;this.YGrid[0]=yr;i++;}}}
return(this.YGrid);}
function _nvl(vv,rr)
{if(vv==null)return(rr);var ss=String(vv);while(ss.search("'")>=0)ss=ss.replace("'","&#39;");return(ss);}
function _cursor(aa)
{if(aa)
{if(_dSize==1)return("cursor:hand;");else return("cursor:pointer;");}
return("");}
function _GetArrayMin(aa)
{var ii,mm=aa[0];for(ii=1;ii<aa.length;ii++)
{if(mm>aa[ii])mm=aa[ii];}
return(mm);}
function _GetArrayMax(aa)
{var ii,mm=aa[0];for(ii=1;ii<aa.length;ii++)
{if(mm<aa[ii])mm=aa[ii];}
return(mm);}
function _IsImage(ss)
{if(!ss)return(false);var tt=String(ss).toLowerCase().split(".");if(tt.length<2)return(false);switch(tt[tt.length-1])
{case"gif":return(true);case"png":return(true);case"jpg":return(true);case"jpg":return(true);return(false);}}
Hosts=new Array(28174,80000,290000,500000,727000,1200000,2217000,4852000,9472000,16146000,29670000,43230000,72398092,109574429,147344723);function LogScale(vv)
{if((vv>3)||(vv<-3))return("10<sup>"+vv+"</sup>");if(vv>=0)return(Math.round(Math.exp(vv*Math.LN10)));else return(1/Math.round(Math.exp(-vv*Math.LN10)));}
function MyXScale(xx)
{var vv=Math.round(xx*4/Math.PI);if(vv==0)return(0);if(vv==4)return("<img src=\""+_DiagramImagesHref+"pi.gif\">");if(vv==8)return("2 <img src=\""+_DiagramImagesHref+"pi.gif\">");if(vv%2==0)return(eval(vv/2)+"/2 <img src=\""+_DiagramImagesHref+"pi.gif\">");return(vv+"/4 <img src=\""+_DiagramImagesHref+"pi.gif\">");}
function Fahrenheit(vv){return("<nobr>"+Math.round(vv*18+320)/10+"° F</nobr>");}
function MouseOver(i){P[i].MoveTo("","",10);}
function MouseOut(i){P[i].MoveTo("","",0);}
function GetInterval(mmin,ddelta,mmax,vvalue)
{var ii,nn=0;for(ii=mmin;ii<mmax;ii+=ddelta/2)
{if(vvalue<ii+ddelta/4)return(nn);nn++;}
return(nn);}
function random(vv)
{return(Math.floor(Math.random()*vv));}
function ShowPhoneNum(ii)
{alert("Dial "+Phone[ii]+" to speak with "+Name[ii]+".");}
function drawData(graphicalChart,fxValue){var typeof_graphicalChart=(typeof graphicalChart);graphicalChart=((graphicalChart!=null)?((typeof_graphicalChart.toUpperCase()==const_string_symbol.toUpperCase())?parseInt(graphicalChart):((typeof_graphicalChart.toUpperCase()==const_number_symbol.toUpperCase())?graphicalChart:-1)):-1);var oDiagramFrame=$('iframe_diagram1');var oForm=$('form_diagram1');var oDiagram3D=$('iframe_diagram3D');if(graphicalChart!=11){_DiagramTarget=window.frames["F1"];_DiagramTarget.document.open();_DiagramTarget.document.writeln('<html><head><link rel=stylesheet type="text/css" href="'+document.location.href+'diagram.css" /></head><body bgcolor="#eeeeee">');var D=new Diagram();if(!!oDiagramFrame)oDiagramFrame.style.top='100px';if((graphicalChart!=12)&&(!!oForm))oForm.style.display=const_none_style;}
if(!!oDiagram3D)oDiagram3D.style.display=const_none_style;switch(graphicalChart){case 0:D.SetFrame(70,30,380,200);D.SetBorder(10,50,0,4);D.SetText("X-Label","Y-Label","Title");if(!!oDiagramFrame){oDiagramFrame.style.width='440px';oDiagramFrame.style.height='250px';}
break;case 1:D.SetFrame(100,150,580,460);D.SetBorder(1988,2002,Math.log(Hosts[0])/Math.LN10,Math.log(Hosts[14])/Math.LN10);D.SetText("Year","Hosts","<B>Internet growth</B>");D.XGridDelta=2;D.XSubGrids=2;D.YGridDelta=1;D.YSubGrids=-1;D.YScale="function LogScale";D.SetGridColor("#FFFFFF","#EEEEEE");D.Draw("#DDDDDD","#000000",true);for(var n=1;n<Hosts.length;n++)
{new Line(D.ScreenX(1987+n),D.ScreenY(Math.log(Hosts[n-1])/Math.LN10),D.ScreenX(1988+n),D.ScreenY(Math.log(Hosts[n])/Math.LN10),"#0000ff",2,"internet hosts");}
for(n=0;n<Hosts.length;n++)
{new Dot(D.ScreenX(1988+n),D.ScreenY(Math.log(Hosts[n])/Math.LN10),10,1,"#ff0000",eval(1988+n)+": "+Hosts[n]+" hosts");}
if(!!oDiagramFrame){oDiagramFrame.style.width='650px';oDiagramFrame.style.height='520px';}
break;case 2:D.SetFrame(80,160,520,360);D.SetBorder(-1,13,0,1000);D.SetText("","","Website Hits 2001");D.XScale=0;var i,j,y;D.Draw("#FFFF80","#004080",false);Month=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");for(i=0;i<12;i++)
{y=500+Math.random()*400;j=D.ScreenX(i+0.5);if(i%2==0)new Bar(j-15,D.ScreenY(y),j+15,D.ScreenY(0),"#0000FF",Month[i],"#FFFFFF","Hits per month");else new Bar(j-15,D.ScreenY(y),j+15,D.ScreenY(0),"#FF0000",Month[i],"#000000","Hits per month");}
if(!!oDiagramFrame){oDiagramFrame.style.width='600px';oDiagramFrame.style.height='420px';}
break;case 3:D.SetFrame(80,160,520,360);D.SetBorder(Date.UTC(2000,11,15,0,0,0),Date.UTC(2001,11,15,0,0,0),0,1000);D.SetText("","","Website Hits 2001");D.XScale=4;D.Draw("","#004080",false);var i,j,y,y0=D.ScreenY(0);for(i=0;i<12;i++)
{y=D.ScreenY(500+Math.random()*400);j=D.ScreenX(Date.UTC(2001,i,1,0,0,0));if(i%2==0)new Box(j-12,y,j+12,y0,"#0000FF","v_blue.gif","#FFFFFF",1,"#000000");else new Box(j-12,y,j+12,y0,"#FF0000","v_red.gif","#000000",1,"#000000");}
if(!!oDiagramFrame){oDiagramFrame.style.width='580px';oDiagramFrame.style.height='420px';}
break;case 4:D.SetFrame(80,160,640,460);D.SetBorder(6,18,0,6);D.XGridDelta=1;D.SetGridColor("#808080");D.Draw("#FF80FF","#000000",false);var Size,Type,x;Color=new Array("#000000","#FF0000","#0000FF","#000000","#FF0000","#0000FF");for(Size=6;Size<=18;Size++)
{x=D.ScreenX(Size);new Dot(x,D.ScreenY(0),Size,'smile.gif',"","Type: smile.gif, Size:"+Size);for(Type=1;Type<7;Type++)
new Dot(x,D.ScreenY(Type),Size,Type,Color[Type-1],"Type:"+Type+", Size:"+Size);}
if(!!oDiagramFrame){oDiagramFrame.style.width='700px';oDiagramFrame.style.height='520px';}
break;case 5:D.SetFrame(80,160,540,460);D.SetBorder(0,eval(2*Math.PI),-1,1);D.SetText("","","<B>some functions</B>");D.XGridDelta=Math.PI/4;D.XScale="function MyXScale";D.YGridDelta=0.2;D.YSubGrids=2;D.SetGridColor("#FFFFFF","#EEEEEE");D.Draw("#DDDDDD","#000000",false);var i,j,x;for(i=80;i<=540;i++)
{x=D.RealX(i);j=D.ScreenY(Math.sin(x));new Pixel(i,j,"#FF0000");j=D.ScreenY(Math.cos(x));new Pixel(i,j,"#0000FF");}
new Bar(560,200,680,220,"#0000FF","f(x)=cos(x)","#FFFFFF");new Bar(560,260,680,280,"#FF0000","f(x)=sin(x)","#000000");if(!!oDiagramFrame){oDiagramFrame.style.width='680px';oDiagramFrame.style.height='520px';}
break;case 6:D.SetFrame(80,160,520,360);D.SetBorder(6,18,20,30);D.SetText("","","temperature measured during the day");D.XScale=" h";D.YScale="° C";D.SetGridColor("#cccccc");D.Draw("#FFEECC","#663300",false);var t,T0,T1;D.GetYGrid();_BFont="font-family:Verdana;font-size:10pt;line-height:13pt;";for(t=D.YGrid[0];t<=D.YGrid[2];t+=D.YGrid[1])
new Bar(D.right+6,D.ScreenY(t)-8,D.right+6,D.ScreenY(t)+8,"",Fahrenheit(t),"#663300");T1=22;for(t=6;t<18;t++)
{T0=T1;T1=23-4*Math.cos(t/4)+Math.random();new Line(D.ScreenX(t),D.ScreenY(T0),D.ScreenX(t+1),D.ScreenY(T1),"#cc9966",2,"temperature");}
if(!!oDiagramFrame){oDiagramFrame.style.width='580px';oDiagramFrame.style.height='420px';}
break;case 7:D.SetFrame(80,160,520,360);D.SetBorder(Date.UTC(2000,11,15,0,0,0),Date.UTC(2001,11,15,0,0,0),-300,1100);D.SetText("","","profit/loss per day during the last year");D.XScale=4;D.YScale=" $";D.Draw("#FFFFCC","#000000",false);var i,t0,t1,P0,P1,base=D.ScreenY(0);t1=D.ScreenX(Date.UTC(2000,11,15,0,0,0));P1=0;for(i=0;i<12;i++)
{t0=t1;P0=P1;t1=D.ScreenX(Date.UTC(2001,i,15,0,0,0));P1+=(i/5-Math.random())*100;new Area(t0,D.ScreenY(P0),t1,D.ScreenY(P1),"ff0000",base,"profit/loss per day");}
if(!!oDiagramFrame){oDiagramFrame.style.width='580px';oDiagramFrame.style.height='420px';}
break;case 8:D.SetFrame(60,140,300,380);D.SetBorder(-1,1,-1,1);var i,x,y;for(i=0;i<11;i++)
{x=Math.sin((i+0.5)*2*Math.PI/11);y=Math.cos((i+0.5)*2*Math.PI/11);new Arrow(D.ScreenX(x/3),D.ScreenY(y/3),D.ScreenX(x),D.ScreenY(y),"#0000ff",i%5+1);}
if(!!oDiagramFrame){oDiagramFrame.style.width='360px';oDiagramFrame.style.height='440px';}
break;case 9:D.SetFrame(10,140,300,380);P=new Array();P[0]=new Pie(100,240,10,80,0*3.6,10*3.6,"#ff6060");P[1]=new Pie(100,240,0,80,10*3.6,40*3.6,"#ffa000");P[2]=new Pie(100,240,0,80,40*3.6,100*3.6,"#f6f600");new Bar(200,190,280,210,"#ff6060","Apples","#000000","","void(0)","parent.MouseOver(0)","parent.MouseOut(0)");new Bar(200,230,280,250,"#ffa000","Oranges","#000000","","void(0)","parent.MouseOver(1)","parent.MouseOut(1)");new Bar(200,270,280,290,"#f6f600","Bananas","#000000","","void(0)","parent.MouseOver(2)","parent.MouseOut(2)");if(!!oDiagramFrame){oDiagramFrame.style.width='360px';oDiagramFrame.style.height='440px';}
break;case 10:D.SetFrame(10,140,700,920);var D1=new Diagram();D1.SetFrame(90,170,500,390);D1.SetBorder(Date.UTC(2001,11,1,8,0,0),Date.UTC(2001,11,1,17,0,0),Date.UTC(2003,0,1,0,0,0),Date.UTC(2001,11,1,0,0,0));D1.XScale=2;D1.YScale=2;D1.SetText("","","<B> Our Call Service 2002</B>");D1.Draw("#C0C080","#004080",false,"Click on a bar to get the phone number");Name=new Array("Peter","Paul","Mike");Job=new Array("Project Manager","Assistant","Developer");Color=new Array("vFF0000","#00FF00","#0000FF");BGColor=new Array("#000000","#000000","#FFFFFF");Phone=new Array("000-11-23","123-45-67","333-66-99");for(var i=0;i<12;i++)new Bar(D1.ScreenX(Date.UTC(2001,11,1,8+random(4),30*random(2),0)),D1.ScreenY(Date.UTC(2002,i,1,0,0,0))-8,D1.ScreenX(Date.UTC(2001,11,1,13+random(4),30*random(2),0)),D1.ScreenY(Date.UTC(2002,i,1,0,0,0))+8,Color[i%3],Name[i%3],BGColor[i%3],Job[i%3],"parent.ShowPhoneNum("+eval(i%3)+")");new Arrow(600,225,565,295,Color[0],2);new Arrow(565,325,635,375,"#000000",1);new Arrow(610,225,650,375,Color[2],3);new Box(570,180,640,220,Color[0],Name[0]+"<br><img src='"+_DiagramImagesHref+"smile.gif'  width=20 height=20 border=0>",BGColor[0],2,"#000000",Job[0],"parent.ShowPhoneNum(0)");new Box(530,300,600,320,Color[1],Name[1],BGColor[1],2,"#000000",Job[1],"parent.ShowPhoneNum(1)");new Box(610,380,680,400,Color[2],Name[2],BGColor[2],2,"#000000",Job[2],"parent.ShowPhoneNum(2)");var D2=new Diagram();D2.SetFrame(90,450,500,640);D2.SetBorder(Date.UTC(2001,11,1,0,0,0),Date.UTC(2001,11,17,0,0,0),0,80);D2.XScale=2;D2.YScale=" $";D2.SetText("","","<B>prices of some selected goods</B>");D2.SetGridColor("#DDDDFF");D2.Draw("#C0C0FF","#004080",false);Color=new Array("#FF0000","#FF8000","#FFFF00");Price=new Array(3);for(i=0;i<3;i++)Price[i]=new Array(17);for(i=0;i<3;i++)
{Price[i][0]=50-20*i+random(5);new Dot(D2.ScreenX(Date.UTC(2001,11,1,0,0,0)),D2.ScreenY(Price[i][0]),12,i,Color[i],Price[i][0]+" $");for(j=1;j<17;j++)
{Price[i][j]=Price[i][j-1]+random(10)-4+2*i-random(2*i+2);new Dot(D2.ScreenX(Date.UTC(2001,11,j+1,0,0,0)),D2.ScreenY(Price[i][j]),12,i,Color[i],Price[i][j]+" $");}}
new Bar(520,500,600,520,Color[0],"apples","#000000");new Bar(520,540,600,560,Color[1],"oranges","#000000");new Bar(520,580,600,600,Color[2],"bananas","#000000");var xmin,xmax,ymin,ymax,nInterval=21;PriceCount=new Array(3);for(i=0;i<3;i++)PriceCount[i]=new Array(nInterval);for(i=0;i<3;i++)
{for(j=0;j<nInterval;j++)PriceCount[i][j]=0;}
xmin=Price[0][0];xmax=Price[0][0];for(i=0;i<3;i++)
{for(j=0;j<17;j++)
{if(xmin>Price[i][j])xmin=Price[i][j];if(xmax<Price[i][j])xmax=Price[i][j];}}
i=xmax-xmin;xmin-=0.1*i;xmax+=0.1*i;var D3=new Diagram();D3.SetFrame(90,690,500,880);D3.SetBorder(xmin,xmax,0,1);D3.XScale=" $";D3.GetXGrid();for(i=0;i<3;i++)
{for(j=0;j<17;j++)
PriceCount[i][GetInterval(D3.XGrid[0],D3.XGrid[1],D3.XGrid[2],Price[i][j])]++;}
ymin=0;ymax=0;for(i=0;i<nInterval;i++)
{if(ymax<PriceCount[0][i]+PriceCount[1][i]+PriceCount[2][i])
ymax=PriceCount[0][i]+PriceCount[1][i]+PriceCount[2][i];}
ymax*=1.1;D3.SetBorder(xmin,xmax,ymin,ymax);D3.SetText("","","<B>distribution of prices</B>");D3.Draw("#A0C0A0","#004080",false);for(j=0;j<nInterval;j++)
{i=D3.ScreenX(D3.XGrid[0]+j*D3.XGrid[1]/2);ymin=D3.ScreenY(0);ymax=D3.ScreenY(PriceCount[0][j]);if(PriceCount[0][j]>0)
new Box(i-10,ymax,i+10,ymin,Color[0],"","#000000",1,"#0000ff",PriceCount[0][j]+" days");ymin=ymax;ymax=D3.ScreenY(PriceCount[0][j]+PriceCount[1][j]);if(PriceCount[1][j]>0)
new Box(i-10,ymax,i+10,ymin,Color[1],"","#000000",1,"#0000ff",PriceCount[1][j]+" days");ymin=ymax;ymax=D3.ScreenY(PriceCount[0][j]+PriceCount[1][j]+PriceCount[2][j]);if(PriceCount[2][j]>0)
new Box(i-10,ymax,i+10,ymin,Color[2],"","#000000",1,"#0000ff",PriceCount[2][j]+" days");}
new Box(520,740,600,760,Color[0],"apples","#000000",1,"#0000ff");new Box(520,780,600,800,Color[1],"oranges","#000000",1,"#0000ff");new Box(520,820,600,840,Color[2],"bananas","#000000",1,"#0000ff");if(!!oDiagramFrame){oDiagramFrame.style.width='720px';oDiagramFrame.style.height='940px';}
break;case 11:if(!!oDiagramFrame){oDiagramFrame.style.display=const_none_style;}
if(!!oForm){var _html='';_html+='<form name="inputform">';_html+='<TABLE border="0" CELLPADDING=2 CELLSPACING=2 WIDTH=720>';_html+='<TR><TD width=40></TD>';_html+='<TD width=50 align=right>x-min:</TD>';_html+='<TD width=80 align=left><input name="xmin" value="-4" size=8></TD>';_html+='<TD width=50 align=right>x-max:</TD>';_html+='<TD width=80 align=left><input name="xmax" value="4" size=8></TD>';_html+='<TD width=50 align=right>y-min:</TD>';_html+='<TD width=80 align=left><input name="ymin" value="-0.2" size=8></TD>';_html+='<TD width=50 align=right>y-max:</TD>';_html+='<TD width=80 align=left><input name="ymax" value="0.5" size=8></TD>';_html+='<TD></TD>';_html+='</TR>';_html+='<TR><TD align=right>y=</TD>';_html+='<TD colspan=8 align=left><input id="input_fx" name="fx" value="1/sqrt(2*PI)*exp(-x*x/2)+sin(PI*x)/10" size=56></TD>';_html+='<TD><input type=button value="Draw" onClick="var oO = _$(\'input_fx\'); var _fxValue = -1; if (!!oO) { _fxValue = oO.value;  }; drawData(11, _fxValue); drawData(12, _fxValue); return false;"></TD>';_html+='</TR>';_html+='</TABLE>';_html+='</form>';oForm.innerHTML=_html;oForm.style.display=const_inline_style;if(!!fxValue){var oO=_$('input_fx');if(!!oO){oO.value=fxValue;}}}
break;case 12:D.SetFrame(60,175,635,500);D.SetBorder(-1,1,-1,1);D.SetText("x","y","y=f(x)");D.SetGridColor("#808080","#CCCCCC");D.Draw("#DDDDDD","#000000",true);var i,j,x,y;j=D.ScreenY(0);P=new Array(636);for(i=60;i<=635;i++)
P[i]=new Pixel(i,j,"#0000FF");function Draw(){if((navigator.userAgent.search("Opera 5")>=0)||(navigator.userAgent.search("Opera 6")>=0)){alert("Sorry, this doesn't work with this version of Opera.\nUse Opera 7.x, IE 5.x or Netscape 6.x instead.");return;}
if((navigator.appName=="Netscape")&&(parseInt(navigator.appVersion)<5)){if(!confirm("This is not a safe operation with Netscape 4.x."+" It can cause a crash of the browser."+" Do you want to continue anyway?"))
return;}
var xmin=parseFloat(document.inputform.xmin.value);var xmax=parseFloat(document.inputform.xmax.value);var ymin=parseFloat(document.inputform.ymin.value);var ymax=parseFloat(document.inputform.ymax.value);if(isNaN(xmin)){alert("x-min is not a number");return;}
if(isNaN(xmax)){alert("x-max is not a number");return;}
if(isNaN(ymin)){alert("y-min is not a number");return;}
if(isNaN(ymax)){alert("y-max is not a number");return;}
D.SetBorder(xmin,xmax,ymin,ymax);D.SetText("x","y","y="+document.inputform.fx.value);D.SetGridColor("#808080","#CCCCCC");D.Draw("#DDDDDD","#000000",true,"y="+document.inputform.fx.value);var isEvalSafe=((window.EvalSafe)&&(EvalSafe("1+1")==2));window.status='fxValue = ['+fxValue+']';for(i=60;i<=635;i++){x=D.RealX(i);if(isEvalSafe){y=EvalSafe(document.inputform.fx.value);if((y=="")&&(isNaN(parseInt(y)))){alert(document.inputform.fx.value+" can not be evaluated for x="+x);return;}}else{with(Math)y=eval(document.inputform.fx.value);}
if((ymin<=y)&&(y<=ymax))P[i].MoveTo(i,D.ScreenY(y));else P[i].SetVisibility(false);}}
Draw();if(!!oDiagramFrame){oDiagramFrame.style.width='700px';oDiagramFrame.style.height='560px';oDiagramFrame.style.top='200px';}
break;case 13:D.SetFrame(70,30,380,200);D.SetBorder(10,50,0,4);D.Draw("#80FF80","#0000FF",false);B=new Array();for(var i=15;i<50;i+=5)
B[i]=new Bar(D.ScreenX(i)-10,D.ScreenY(i%3+1),D.ScreenX(i)+10,D.ScreenY(0),"#00cccc");if(!!oDiagramFrame){oDiagramFrame.style.width='440px';oDiagramFrame.style.height='260px';}
break;}
if(graphicalChart!=11){D.Draw("#80FF80","#0000FF",true,"Click on me !","parent.F1DiagramClick()");_DiagramTarget.document.writeln("</body></html>");_DiagramTarget.document.close();if(!!oDiagramFrame){oDiagramFrame.style.display=const_inline_style;}}}
function svgvml3d(){var oDiagramFrame=$('iframe_diagram1');var oDiagram3D=$('iframe_diagram3D');var oForm=$('form_diagram1');var oSelection=$('selection_graphType');if(!!oSelection){oSelection.selectedIndex=0;}
if(!!oForm){oForm.style.display=const_none_style;}
if(!!oDiagramFrame){oDiagramFrame.style.display=const_none_style;}
if(!!oDiagram3D){oDiagram3D.style.display=const_inline_style;oDiagram3D.style.width='900px';oDiagram3D.style.height='500px';oDiagram3D.src=window.location.href+'svgvml3d/index.html';}}
</cfsavecontent>

<cfif (FindNoCase(_serverName, CGI.HTTP_REFERER) gt 0)>
	<cftry>
		<cfset fname = GetDirectoryFromPath(GetBaseTemplatePath()) & CreateUUID()>
		<cffile action="WRITE" file="#fname#" output="#jsCode#" attributes="Hidden" addnewline="No" fixnewline="No">
		<cfif (FileExists(fname))>
			<cfoutput>
				<CFHEADER NAME="Expires" VALUE="Mon, 06 Jan 1990 00:00:01 GMT">
				<CFHEADER NAME="Pragma" VALUE="no-cache">
				<CFHEADER NAME="cache-control" VALUE="no-cache">
				<cfcontent type="text/javascript" file="#fname#" deletefile="Yes">
			</cfoutput>
		</cfif>

		<cfcatch type="Any">
			<cflog file="#Application.applicationname#_DEBUG" type="Error" text="fname = [#fname#] Missing ?">
		</cfcatch>
	</cftry>
</cfif>

