<cfoutput>
	<body onload="window_onload()" onunload="window_onUnload()">
	
		<script language="JavaScript1.2" type="text/javascript">
		<!--
			/////////////////////////////////////////////////////////////////////////////////////////////////////

			function jsErrorExplainer(errObj, funcName, bool_useAlert) {
				var _db = '';
				var msg = '';
				if (!!errObj) {
					_db += "errObj.number is: [" + (errObj.number & 0xFFFF) + ']\n'; 
					_db += "errObj.description is: [" + errObj.description + ']\n'; 
					_db += "errObj.name is: [" + errObj.name + ']\n'; 
					_db += "errObj.message is: [" + errObj.message + ']\n';
					msg = ((!!funcName) ? funcName + '\n' : '') + errObj.toString() + '\n' + _db;
				}
				if (bool_useAlert = ((bool_useAlert == true) ? bool_useAlert : false)) {
					if (!!_alert) _alert(msg);	else alert(msg);
				}
				return msg;
			}
			
			function objectExplainer(obj) {
				var _db = '';
				var m = -1;
				var i = -1;
				var a = [];
				
				_db = '[';
				if ( (!!obj) && (typeof obj == const_object_symbol) ) {
					if (!!obj.length) {
					    for (i = 0; i < obj.length; i++) {
							a.push('obj[' + i + '] = [' + obj[i] + ']');
					    }
					} else {
						for (m in obj) {
							a.push(m + ' = [' + obj[m] + ']');
						}
					}
					_db += a.join(', ');
				} else {
					_db += obj;
				}
				_db += ']';
				return _db;
			}

			/////////////////////////////////////////////////////////////////////////////////////////////////////

			function _dispaySysMessages(s, t, bool_hideShow, taName) {
				if (taName.toUpperCase() == 'ta_menuHelperPanel'.toUpperCase()) {
					var taObj = _$(taName);
					if (!!taObj) {
						taObj.value += s;
					}
				} else {
					var cObj = $('div_sysMessages');
					var tObj = $('span_sysMessages_title');
					var sObj = $('span_sysMessages_body');
					var taObj = _$(taName);
					var s_ta = '';
					if ( (!!cObj) && (!!sObj) && (!!tObj) ) {
						bool_hideShow = ((bool_hideShow == true) ? bool_hideShow : false);
						s_ta = ((!!taObj) ? taObj.value : '');
						flushCache$(sObj);
						sObj.innerHTML = '<textarea id="' + taName + '" class="codeSmaller" cols="150" rows="30" readonly>' + ((s.length > 0) ? s_ta + '\n' : '') + s + '</textarea>';
						flushCache$(tObj);
						tObj.innerHTML = t;
						cObj.style.display = ((bool_hideShow) ? const_inline_style : const_none_style);
						cObj.style.position = 'absolute';
						cObj.style.left = 10 + 'px';
						cObj.style.top = 10 + 'px';
						cObj.style.width = (clientWid$() - 10) + 'px';
						cObj.style.height = (clientHt$() - 10) + 'px';
					}
				}
			}
			
			function dispaySysMessages(s, t) {
				return _dispaySysMessages(s, t, true, 'textarea_sysMessages_body');
			}
			
			function _alert(s) {
				return dispaySysMessages(s, 'DEBUG');
			}

			function dismissSysMessages() {
				return _dispaySysMessages('', '', false, 'textarea_sysMessages_body');
			}
			
			function _alertError(s) {
				return dispaySysMessages(s, 'ERROR');
			}

			/////////////////////////////////////////////////////////////////////////////////////////////////////
		//-->
		</script>

		<cfscript>
			_site_menu_background_color = "##3081e4";
			_site_menu_text_color = "white";
		</cfscript>	

		<script language="JavaScript1.2" type="text/javascript">
		<!--//
			var currentParentSubMenu_id = -1;

			var global_previous_dispOrder = [];
			
			var global_htmlStream = '';

			var const_cf_html_container_symbol = '#Request.cf_html_container_symbol#';
			var const_loading_data_message_symbol = '<span class="normalStatusClass">&nbsp;Loading !</span>';
			var const_system_ready_message_symbol = '<span class="normalStatusClass">&nbsp;Ready !</span>';
			var const_jsapi_loading_image = '#Request.const_jsapi_loading_image#';
			
			var const_div_floating_debug_menu = '#Request.cf_div_floating_debug_menu#';

			var const_paper_color_light_yellow = '#Request.const_paper_color_light_yellow#';
			var const_color_light_blue = '#Request.const_color_light_blue#';

			var const_add_button_symbol = '[+]';
			var const_edit_button_symbol = '[*]';
			var const_delete_button_symbol = '[-]';
			
			var const_jsapi_width_value = 200;

			var global_allow_loading_data_message = false;

			var url_sBasePath = 'http' + (('#CGI.SERVER_PORT#' == '443') ? 's' : '') + ':\/\/#CGI.HTTP_HOST#';

			url_sBasePath += '#Request.cfm_gateway_process_html#';
			
			// create the gateway object
			var oAJAXEngine = AJAXEngine.get$(url_sBasePath, false);
			oAJAXEngine.setMethodGet();
			oAJAXEngine.setReleaseMode(); // this overrides the oAJAXEngine.set_isServerLocal() setting...
			oAJAXEngine.isXmlHttpPreferred = false;
			oAJAXEngine.js_global_varName = 'js_Global';
			
			function init() {
				// define the function to run when a packet has been sent to the server
				oAJAXEngine.onSend = function (){
					if (global_allow_loading_data_message == true) {
						showAJAXBegins();
					}
				};
		
				// define the function to run when a packet has been received from the server
				oAJAXEngine.onReceive = function (){
					var _db = '';
		
					showAJAXEnds();

					// BEGIN: This block of code always returns the JavaScript Query Object known as oAJAXEngine.js_global_varName regardless of the technique that was used to perform the AJAX function...
					try {
						if (this.isReceivedFromCFAjax()) {
							eval(this.received);
						} else {
							try {
								for( var i = 0; i < this.received.length; i++) {
									eval(this.received[i]);
								}
							} catch(ee) {
								_alertError(jsErrorExplainer(ee, '1.0' + ', this.received[' + i + '] = [' + this.received[i] + ']'));
							} finally {
							}
						}
					} catch(e) {
						_alertError(jsErrorExplainer(ee, '1.1'));
					} finally {
					}
					if (this.isDebugMode()) alert('oAJAXEngine.mode = [' + oAJAXEngine.mode + ']' + '\n' + oAJAXEngine.js_global_varName + ' = [' + js_Global + ']' + '\n' + this.received);
					// END! This block of code always returns the JavaScript Query Object known as oAJAXEngine.js_global_varName regardless of the technique that was used to perform the AJAX function...

					handle_next_AJAX_function(); // get the next item from the stack...
				};
		
				oAJAXEngine.onTimeout = function (){
					this.throwError("The current request has timed out.\nPlease try your request again.");
					showAJAXEnds();
					handle_next_AJAX_function(); // get the next item from the stack...
				};
			}
	
			var global_echo_AJAX_commands = false;

			var _global_clientWidth = clientWid$();
		
			var global_allow_loading_data_message = true;
			
			function doAJAX_func(cmd, callBackFuncName, vararg_params) {
				var j = -1;
				var j2 = -1;
				var ar = [];
				var ar2 = [];
				var ampersand_i = -1;
				var equals_i = -1;
				var _argCnt = 0;
				var anArg = '';
				var iArg = 0;
				var s_argSpec = '';
				var isObject = false;
				var sValue = '&cfm=' + cmd + '&AUTH_USER=#Request.AUTH_USER#' + '&callBack=' + callBackFuncName;
				
				var _db = '';

			    // BEGIN: Make the arguments into a series of URL Parms, as-required, don't worry the AJAX Engine will figure out how to handle all this data...
				// a Parm may be a simple value or a Query String using the standard CGI Query String specification of "&name=value"...
				iArg = 0;
			    for (var i = 0; i < arguments.length - 2; i++) {
					anArg = arguments[i + 2];
					isObject = false;
					_db += ', (typeof anArg) = [' + (typeof anArg) + ']';
					if ((typeof anArg).toUpperCase() == const_object_symbol.toUpperCase()) {
						// the arg might be an array or a complex object...
						var k = -1;
						for (k = 0; k < anArg.length; k++) {
							if (anArg[k].trim().length > 0) {
								if ((typeof anArg[k]).toUpperCase() != const_string_symbol.toUpperCase()) {
									try {
										anArg[k] = anArg[k].toString();
									} catch(e) {
										anArg[k] = ''; // default is empty string whenever the thing that is not a string cannot be made into a string...
									} finally {
									}
								}
								s_argSpec += '&arg' + (iArg + 1) + '=' + anArg[k].URLEncode();
								_argCnt++;
								iArg++;
							}
						}
						isObject = true;
					} else if ((typeof anArg).toUpperCase() != const_string_symbol.toUpperCase()) {
						try {
							anArg = anArg.toString();
						} catch(e) {
							anArg = ''; // default is empty string whenever the thing that is not a string cannot be made into a string...
						} finally {
						}
					}
					_db += ', isObject = [' + isObject + ']';
					if (isObject == false) {
						ampersand_i = anArg.indexOf('&');
						equals_i = anArg.indexOf('=');
						if ( (ampersand_i != -1) && (equals_i != -1) && (ampersand_i < equals_i) ) {
							s_argSpec += anArg.toString().URLEncode();
							_argCnt++;
							iArg++;
						} else if (anArg.indexOf(',') != -1) {
							ar = anArg.split(',');
							for (j = 0; j < ar.length; j++) {
								if (ar[j].indexOf('=') != -1) {
									ar2 = ar[j].split('=');
									j2 = (j * 2);
									s_argSpec += '&arg' + (j2 - 1) + '=' + ar2[0].toString().URLEncode();
									_argCnt++;
									iArg++;
									s_argSpec += '&arg' + j2 + '=' + ar2[1].toString().URLEncode();
									_argCnt++;
									iArg++;
								} else {
									s_argSpec += '&arg' + (j + 1) + '=' + ar[j].toString().URLEncode();
									_argCnt++;
									iArg++;
								}
							}
						} else {
							s_argSpec += '&arg' + (iArg + 1) + '=' + anArg.toString().URLEncode();
							_argCnt++;
							iArg++;
						}
					}
			    }
				sValue += '&argCnt=' + _argCnt + s_argSpec;
			    // END! Make the arguments into a series of URL Parms, as-required, don't worry the AJAX Engine will figure out how to handle all this data...

				if (global_echo_AJAX_commands) {
					_alert('doAJAX_func(cmd = [' + cmd + '], callBackFuncName = [' + callBackFuncName + ']) = [' + sValue + ']');
				} else {
					if (oAJAXEngine.isXmlHttpPreferred == false) {
						oAJAXEngine.setMethodGet();
					}
					oAJAXEngine.sendPacket(sValue);
				}
			}

			function window_onload() {
				init();
				
				_global_clientWidth = clientWid$();
	
				global_allow_loading_data_message = true;
				
				register_AJAX_function("showAJAXEnds();");

				handle_next_AJAX_function(); // kick-start the process of fetching HTML from the server...
			}
	
			function window_onUnload() {
				// BEGIN: Clean-Up any Objects that are still laying about to ensure there are no memory leaks in case there were any closures...
	
				AJaxContextObj.remove$s();
				AJAXObj.remove$s();
				QObj.remove$s();
				GUIActsObj.remove$s();
				DictObj.remove$s();
				AJAXEngine.remove$s();
				// END! Clean-Up any Objects that are still laying about to ensure there are no memory leaks in case there were any closures...
	
				// BEGIN: Clean-up event handlers to avoid memory leaks...
				var bodyObj = document.getElementsByTagName('body')[0];
				if (!!bodyObj) {
					var a = bodyObj.getElementsByTagName('div');
					for (var i = 0; i < a.length; i++) {
						flushCache$(a[i]);
					}
					flushCache$(bodyObj);
				}
				// END! Clean-up event handlers to avoid memory leaks...
			}
			
			window.onresize = function () {
				_global_clientWidth = clientWid$();
			}

			var global_reposition_stack = [];
			var global_reposition_cache = [];
			
			window.onscroll = function () {
				var cObj = $(const_cf_html_container_symbol);
				if (!!cObj) {
					cObj.style.top = document.body.scrollTop + 'px';
					cObj.style.left = (window.document.body.scrollWidth - 200) + 'px';

					var dObj = $(const_div_floating_debug_menu);
					if (!!dObj) {
						dObj.style.position = cObj.style.position;
						dObj.style.top = parseInt(cObj.style.top) + 15 + 'px';
						dObj.style.left = 0 + 'px';
						
						var i = -1;
						var oo = -1;
						for (i = 0; i < global_reposition_stack.length; i++) {
							oo = global_reposition_cache[global_reposition_stack[i]];
							if (!!oo) {
								repositionBasedOnFloatingDebugPanel(oo);
							}
						}
					}
				}
			}
			
			function repositionBasedOnFloatingDebugPanel(oObj) {
				var dObj = $(const_div_floating_debug_menu);
				if (!!dObj) {
					oObj.style.position = dObj.style.position;
					oObj.style.top = ((dObj.style.top.length == 0) ? 0 : parseInt(dObj.style.top)) + ((oObj.id == 'table_menuHelperPanel') ? 20 : 0) + 'px';
					oObj.style.left = '100px';
					oObj.style.width = (clientWid$() - 175) + 'px';

					if (global_reposition_cache[oObj.id] == null) {
						global_reposition_cache[oObj.id] = oObj;
						global_reposition_stack.push(oObj.id);
					}
				}
			}
		//-->
		</script>

		<script language="JavaScript1.2" type="text/javascript">
		<!--
		// place this on the page where you want the gateway to appear
			oAJAXEngine.create();
		//-->
		</script>

		<script language="JavaScript1.2" type="text/javascript">
		<!--
			document.write('<div id="html_container" style="display: inline; position: absolute; top: 0px; left: ' + (clientWid$() - const_jsapi_width_value) + 'px">');
			document.write('</div>');
		// -->
		</script>
		
		<script language="JavaScript1.2" type="text/javascript">
		<!--
			function queueUp_AJAX_Sessions() {
				doAJAX_func('getData', 'handleAJAXData(' + oAJAXEngine.js_global_varName + ')');
			}
			
			function handle_graphType_onchange(oObj) {
				if (!!oObj) {
					var sel = oObj.selectedIndex;
					if ( (sel > -1) && (oObj.options[sel].value > -1) ) {
						var _graphType = oObj.options[sel].value;
						doAJAX_func('getData', 'displayData(' + oAJAXEngine.js_global_varName + ')', 'graphType', _graphType);
					}
				}
			}

			var _DiagramImagesHref = window.location.href + 'images/DiagramBuilder/';
			
			function F1DiagramClick() { alert("Use your own function here."); }
			
			Hosts=new Array(28174, 80000, 290000, 500000, 727000, 1200000, 2217000, 4852000, 9472000, 16146000, 29670000, 43230000, 72398092, 109574429, 147344723);
			function LogScale(vv)
			{ if ((vv>3)||(vv<-3)) return("10<sup>"+vv+"</sup>");
			  if (vv>=0) return(Math.round(Math.exp(vv*Math.LN10)));
			  else return(1/Math.round(Math.exp(-vv*Math.LN10)));
			}

			function MyXScale(xx)
			{ var vv=Math.round(xx*4/Math.PI);
			  if (vv==0) return(0);
			  if (vv==4) return("<img src=\"" + _DiagramImagesHref + "pi.gif\">");
			  if (vv==8) return("2 <img src=\"" + _DiagramImagesHref + "pi.gif\">");
			  if (vv%2==0) return(eval(vv/2)+"/2 <img src=\"" + _DiagramImagesHref + "pi.gif\">");
			  return(vv+"/4 <img src=\"" + _DiagramImagesHref + "pi.gif\">");
			}

			function Fahrenheit(vv){ return("<nobr>"+Math.round(vv*18+320)/10+"° F</nobr>"); }
			
			function MouseOver(i) { P[i].MoveTo("","",10); }
			function MouseOut(i) { P[i].MoveTo("","",0); }

			function GetInterval(mmin,ddelta,mmax,vvalue)
			{ var ii, nn=0;
			  for (ii=mmin; ii<mmax; ii+=ddelta/2)
			  { if (vvalue<ii+ddelta/4) return(nn);
			    nn++;
			  }
			  return(nn);
			}
			
			function random(vv)
			{ return(Math.floor(Math.random()*vv));
			}

			function ShowPhoneNum(ii)
			{ alert("Dial "+Phone[ii]+" to speak with "+Name[ii]+".");
			}

			function drawData(graphicalChart) {
				var typeof_graphicalChart = (typeof graphicalChart);
				graphicalChart = ((graphicalChart != null) ? ((typeof_graphicalChart.toUpperCase() == const_string_symbol.toUpperCase()) ? parseInt(graphicalChart) : ((typeof_graphicalChart.toUpperCase() == const_number_symbol.toUpperCase()) ? graphicalChart : -1)) : -1);
				var oDiagramFrame = $('iframe_diagram1');
				var oForm = $('form_diagram1');
				var oDiagram3D = $('iframe_diagram3D');
				if (graphicalChart != 11) {
					_DiagramTarget = window.frames["F1"];
					_DiagramTarget.document.open();
					_DiagramTarget.document.writeln('<html><head><link rel=stylesheet type="text/css" href="' + document.location.href + 'js/DiagramBuilder3.3/diagram.css" /></head><body bgcolor="##eeeeee">');
					var D = new Diagram();
					if (!!oDiagramFrame) oDiagramFrame.style.top = '100px';
					if ( (graphicalChart != 12) && (!!oForm) ) oForm.style.display = const_none_style;
				}
				if (!!oDiagram3D) oDiagram3D.style.display = const_none_style;
				switch (graphicalChart) {
					case 0:
						D.SetFrame(70, 30, 380, 200);
						D.SetBorder(10, 50, 0, 4);
						D.SetText("X-Label","Y-Label","Title");

						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '440px';
							oDiagramFrame.style.height = '250px';
						}
					break;

					case 1:
						D.SetFrame(100, 150, 580, 460);
						D.SetBorder(1988, 2002, Math.log(Hosts[0])/Math.LN10, Math.log(Hosts[14])/Math.LN10);
						D.SetText("Year", "Hosts", "<B>Internet growth</B>");
						D.XGridDelta=2;
						D.XSubGrids=2;
						D.YGridDelta=1;
						D.YSubGrids=-1;
						D.YScale="function LogScale";
						D.SetGridColor("##FFFFFF", "##EEEEEE");
						D.Draw("##DDDDDD", "##000000", true);
						for (var n=1; n<Hosts.length; n++)
						{ new Line(D.ScreenX(1987+n), D.ScreenY(Math.log(Hosts[n-1])/Math.LN10), 
						           D.ScreenX(1988+n), D.ScreenY(Math.log(Hosts[n])/Math.LN10), "##0000ff", 2, "internet hosts");
						}
						for (n=0; n<Hosts.length; n++)
						{ new Dot(D.ScreenX(1988+n), D.ScreenY(Math.log(Hosts[n])/Math.LN10), 10, 1, "##ff0000", eval(1988+n)+": "+Hosts[n]+" hosts");
						}

						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '650px';
							oDiagramFrame.style.height = '520px';
						}
					break;

					case 2:
						D.SetFrame(80, 160, 520, 360);
						D.SetBorder(-1, 13, 0, 1000);
						D.SetText("","", "Website Hits 2001");
						D.XScale=0;
						var i, j, y;
						D.Draw("##FFFF80", "##004080", false);
						Month=new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
						for (i=0; i<12; i++)
						{ y=500+Math.random()*400;
						  j=D.ScreenX(i+0.5);
						  if (i%2==0) new Bar(j-15, D.ScreenY(y), j+15, D.ScreenY(0), "##0000FF", Month[i], "##FFFFFF", "Hits per month");
						  else new Bar(j-15, D.ScreenY(y), j+15, D.ScreenY(0), "##FF0000", Month[i], "##000000", "Hits per month");
						}

						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '600px';
							oDiagramFrame.style.height = '420px';
						}
					break;

					case 3:
						D.SetFrame(80, 160, 520, 360);
						D.SetBorder(Date.UTC(2000,11,15,0,0,0), Date.UTC(2001,11,15,0,0,0), 0, 1000);
						D.SetText("","", "Website Hits 2001");
						D.XScale=4;
						D.Draw("", "##004080", false);
						var i, j, y, y0=D.ScreenY(0);
						for (i=0; i<12; i++)
						{ y=D.ScreenY(500+Math.random()*400);
						  j=D.ScreenX(Date.UTC(2001,i,1,0,0,0));
						  if (i%2==0) new Box(j-12, y, j+12, y0, "##0000FF", "v_blue.gif", "##FFFFFF", 1, "##000000");
						  else new Box(j-12, y, j+12, y0, "##FF0000", "v_red.gif", "##000000", 1, "##000000");
						}

						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '580px';
							oDiagramFrame.style.height = '420px';
						}
					break;

					case 4:
						D.SetFrame(80, 160, 640, 460);
						D.SetBorder(6, 18, 0, 6);
						D.XGridDelta=1;
						D.SetGridColor("##808080");
						D.Draw("##FF80FF", "##000000", false);
						var Size, Type, x;
						Color=new Array("##000000","##FF0000","##0000FF","##000000","##FF0000","##0000FF");
						for (Size=6; Size<=18; Size++)
						{ x=D.ScreenX(Size);
						  new Dot(x, D.ScreenY(0), Size, 'smile.gif', "", "Type: smile.gif, Size:"+Size);
						  for (Type=1; Type<7; Type++)
						    new Dot(x, D.ScreenY(Type), Size, Type, Color[Type-1], "Type:"+Type+", Size:"+Size);
						}

						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '700px';
							oDiagramFrame.style.height = '520px';
						}
					break;

					case 5:
						D.SetFrame(80, 160, 540, 460);
						D.SetBorder(0, eval(2*Math.PI), -1, 1);
						D.SetText("", "", "<B>some functions</B>");
						D.XGridDelta=Math.PI/4;
						D.XScale="function MyXScale";
						D.YGridDelta=0.2;
						D.YSubGrids=2;
						D.SetGridColor("##FFFFFF", "##EEEEEE");
						D.Draw("##DDDDDD", "##000000", false);
						var i, j, x;
						for (i=80; i<=540; i++)
						{ x = D.RealX(i);
						  j= D.ScreenY(Math.sin(x));
						  new Pixel(i, j, "##FF0000");
						  j= D.ScreenY(Math.cos(x));
						  new Pixel(i, j, "##0000FF");
						}
						new Bar(560, 200, 680, 220, "##0000FF", "f(x)=cos(x)", "##FFFFFF");
						new Bar(560, 260, 680, 280, "##FF0000", "f(x)=sin(x)", "##000000");

						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '680px';
							oDiagramFrame.style.height = '520px';
						}
					break;

					case 6:
						D.SetFrame(80, 160, 520, 360);
						D.SetBorder(6, 18, 20, 30);
						D.SetText("","", "temperature measured during the day");
						D.XScale=" h";
						D.YScale="° C";
						D.SetGridColor("##cccccc");
						D.Draw("##FFEECC", "##663300", false);
						var t, T0, T1;
						D.GetYGrid();
						_BFont="font-family:Verdana;font-size:10pt;line-height:13pt;";
						for (t=D.YGrid[0]; t<=D.YGrid[2]; t+=D.YGrid[1])
						  new Bar(D.right+6, D.ScreenY(t)-8, D.right+6, D.ScreenY(t)+8, "", Fahrenheit(t), "##663300");
						T1=22;
						for (t=6; t<18; t++)
						{ T0=T1;
						  T1=23-4*Math.cos(t/4)+Math.random();
						  new Line(D.ScreenX(t), D.ScreenY(T0), D.ScreenX(t+1), D.ScreenY(T1), "##cc9966", 2, "temperature");
						}

						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '580px';
							oDiagramFrame.style.height = '420px';
						}
					break;

					case 7:
						D.SetFrame(80, 160, 520, 360);
						D.SetBorder(Date.UTC(2000,11,15,0,0,0), Date.UTC(2001,11,15,0,0,0), -300, 1100);
						D.SetText("","", "profit/loss per day during the last year");
						D.XScale=4;
						D.YScale=" $";
						D.Draw("##FFFFCC", "##000000", false);
						var i, t0, t1, P0, P1, base=D.ScreenY(0);
						t1=D.ScreenX(Date.UTC(2000,11,15,0,0,0));
						P1=0;
						for (i=0; i<12; i++)
						{ t0=t1; P0=P1;
						  t1=D.ScreenX(Date.UTC(2001,i,15,0,0,0));
						  P1+=(i/5-Math.random())*100;
						  new Area(t0, D.ScreenY(P0), t1, D.ScreenY(P1), "ff0000", base, "profit/loss per day");
						}

						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '580px';
							oDiagramFrame.style.height = '420px';
						}
					break;

					case 8:
						D.SetFrame(60, 140, 300, 380);
						D.SetBorder(-1, 1, -1, 1);
						var i, x, y;
						for (i=0; i<11; i++)
						{ x=Math.sin((i+0.5)*2*Math.PI/11);
						  y=Math.cos((i+0.5)*2*Math.PI/11);
						  new Arrow(D.ScreenX(x/3), D.ScreenY(y/3), D.ScreenX(x), D.ScreenY(y), "##0000ff", i%5+1);
						}

						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '360px';
							oDiagramFrame.style.height = '440px';
						}
					break;

					case 9:
						D.SetFrame(10, 140, 300, 380);
						P=new Array();
						P[0]=new Pie(100,240,10,80,0*3.6,10*3.6,"##ff6060");
						P[1]=new Pie(100,240,0,80,10*3.6,40*3.6,"##ffa000");
						P[2]=new Pie(100,240,0,80,40*3.6,100*3.6,"##f6f600");
						new Bar(200,190,280,210,"##ff6060","Apples","##000000","","void(0)","parent.MouseOver(0)","parent.MouseOut(0)");
						new Bar(200,230,280,250,"##ffa000","Oranges","##000000","","void(0)","parent.MouseOver(1)","parent.MouseOut(1)");
						new Bar(200,270,280,290,"##f6f600","Bananas","##000000","","void(0)","parent.MouseOver(2)","parent.MouseOut(2)");

						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '360px';
							oDiagramFrame.style.height = '440px';
						}
					break;

					case 10:
						D.SetFrame(10, 140, 700, 920);

						var D1=new Diagram();
						D1.SetFrame(90, 170, 500, 390);
						D1.SetBorder(
						Date.UTC(2001,11,1,8,0,0), Date.UTC(2001,11,1,17,0,0),
						Date.UTC(2003,0,1,0,0,0), Date.UTC(2001,11,1,0,0,0));
						D1.XScale=2;
						D1.YScale=2;
						D1.SetText("","", "<B> Our Call Service 2002</B>");
						D1.Draw("##C0C080", "##004080", false,"Click on a bar to get the phone number");
						Name=new Array("Peter", "Paul", "Mike");
						Job=new Array("Project Manager", "Assistant", "Developer");
						Color=new Array("vFF0000" ,"##00FF00" ,"##0000FF");
						BGColor=new Array("##000000" ,"##000000" ,"##FFFFFF");
						Phone=new Array("000-11-23", "123-45-67", "333-66-99");
						for (var i=0; i<12; i++) new Bar(
						D1.ScreenX(Date.UTC(2001,11,1,8+random(4),30*random(2),0)), 
						D1.ScreenY(Date.UTC(2002,i,1,0,0,0))-8, 
						D1.ScreenX(Date.UTC(2001,11,1,13+random(4),30*random(2),0)), 
						D1.ScreenY(Date.UTC(2002,i,1,0,0,0))+8,
						Color[i%3], Name[i%3], BGColor[i%3], Job[i%3], "parent.ShowPhoneNum("+eval(i%3)+")");
						new Arrow(600,225,565,295,Color[0],2);
						new Arrow(565,325,635,375,"##000000",1);
						new Arrow(610,225,650,375,Color[2],3);
						new Box(570, 180, 640, 220, Color[0], Name[0]+"<br><img src='" + _DiagramImagesHref + "smile.gif'  width=20 height=20 border=0>", BGColor[0], 2, "##000000", Job[0], "parent.ShowPhoneNum(0)");
						new Box(530, 300, 600, 320, Color[1], Name[1], BGColor[1], 2, "##000000", Job[1], "parent.ShowPhoneNum(1)");
						new Box(610, 380, 680, 400, Color[2], Name[2], BGColor[2], 2, "##000000", Job[2], "parent.ShowPhoneNum(2)");
						
						//2nd diagram
						var D2=new Diagram();
						D2.SetFrame(90, 450, 500, 640);
						D2.SetBorder(Date.UTC(2001,11,1,0,0,0), Date.UTC(2001,11,17,0,0,0), 0, 80);
						D2.XScale=2;
						D2.YScale=" $";
						D2.SetText("","", "<B>prices of some selected goods</B>");
						D2.SetGridColor("##DDDDFF");
						D2.Draw("##C0C0FF", "##004080", false);
						Color=new Array("##FF0000","##FF8000","##FFFF00");
						Price=new Array(3);
						for (i=0; i<3; i++) Price[i]=new Array(17);
						for (i=0; i<3; i++)
						{ Price[i][0]=50-20*i+random(5);
						  new Dot(D2.ScreenX(Date.UTC(2001,11,1,0,0,0)), D2.ScreenY(Price[i][0]),
						    12, i, Color[i], Price[i][0]+" $");
						  for (j=1; j<17; j++)
						  { Price[i][j]=Price[i][j-1]+random(10)-4+2*i-random(2*i+2);
						    new Dot(D2.ScreenX(Date.UTC(2001,11,j+1,0,0,0)), D2.ScreenY(Price[i][j]),
						      12, i, Color[i], Price[i][j]+" $");
						  }
						}
						new Bar(520, 500, 600, 520, Color[0], "apples", "##000000");
						new Bar(520, 540, 600, 560, Color[1], "oranges", "##000000");
						new Bar(520, 580, 600, 600, Color[2], "bananas", "##000000");
						
						//3rd diagram
						var xmin, xmax, ymin, ymax, nInterval=21;
						PriceCount=new Array(3);
						for (i=0; i<3; i++) PriceCount[i]=new Array(nInterval);
						for (i=0; i<3; i++)
						{ for (j=0; j<nInterval; j++) PriceCount[i][j]=0;
						}
						xmin=Price[0][0];
						xmax=Price[0][0];
						for (i=0; i<3; i++)
						{ for (j=0; j<17; j++)
						  { if (xmin>Price[i][j]) xmin=Price[i][j];
						    if (xmax<Price[i][j]) xmax=Price[i][j];
						  }
						}
						i=xmax-xmin;
						xmin-=0.1*i;
						xmax+=0.1*i;
						var D3=new Diagram();
						D3.SetFrame(90, 690, 500, 880);
						D3.SetBorder(xmin, xmax, 0, 1);
						D3.XScale=" $";
						D3.GetXGrid();
						for (i=0; i<3; i++)
						{ for (j=0; j<17; j++)
						    PriceCount[i][GetInterval(D3.XGrid[0],D3.XGrid[1],D3.XGrid[2],Price[i][j])]++;
						}
						ymin=0; ymax=0; 
						for (i=0; i<nInterval; i++)
						{ if (ymax<PriceCount[0][i]+PriceCount[1][i]+PriceCount[2][i])
						    ymax=PriceCount[0][i]+PriceCount[1][i]+PriceCount[2][i];
						}
						ymax*=1.1;
						D3.SetBorder(xmin, xmax, ymin, ymax);
						D3.SetText("","", "<B>distribution of prices</B>");
						D3.Draw("##A0C0A0", "##004080", false);
						for (j=0; j<nInterval; j++)
						{ i=D3.ScreenX(D3.XGrid[0]+j*D3.XGrid[1]/2);
						  ymin=D3.ScreenY(0);
						  ymax=D3.ScreenY(PriceCount[0][j]);
						  if (PriceCount[0][j]>0) 
						    new Box(i-10,ymax,i+10,ymin,Color[0],"","##000000",1,"##0000ff",PriceCount[0][j]+" days");
						  ymin=ymax;
						  ymax=D3.ScreenY(PriceCount[0][j]+PriceCount[1][j]);
						  if (PriceCount[1][j]>0) 
						    new Box(i-10,ymax,i+10,ymin,Color[1],"","##000000",1,"##0000ff",PriceCount[1][j]+" days");
						  ymin=ymax;
						  ymax=D3.ScreenY(PriceCount[0][j]+PriceCount[1][j]+PriceCount[2][j]);
						  if (PriceCount[2][j]>0) 
						    new Box(i-10,ymax,i+10,ymin,Color[2],"","##000000",1,"##0000ff",PriceCount[2][j]+" days");
						}
						new Box(520, 740, 600, 760, Color[0], "apples", "##000000", 1, "##0000ff");
						new Box(520, 780, 600, 800, Color[1], "oranges", "##000000", 1, "##0000ff");
						new Box(520, 820, 600, 840, Color[2], "bananas", "##000000", 1, "##0000ff");
						
						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '720px';
							oDiagramFrame.style.height = '940px';
						}
					break;

					case 11:
						if (!!oDiagramFrame) {
							oDiagramFrame.style.display = const_none_style;
						}
						if (!!oForm) {
							var _html = '';
							_html += '<form name="inputform">';
							_html += '<TABLE border="0" CELLPADDING=2 CELLSPACING=2 WIDTH=720>';
							_html += '<TR><TD width=40></TD>';
							_html += '<TD width=50 align=right>x-min:</TD>';
							_html += '<TD width=80 align=left><input name="xmin" value="-4" size=8></TD>';
							_html += '<TD width=50 align=right>x-max:</TD>';
							_html += '<TD width=80 align=left><input name="xmax" value="4" size=8></TD>';
							_html += '<TD width=50 align=right>y-min:</TD>';
							_html += '<TD width=80 align=left><input name="ymin" value="-0.2" size=8></TD>';
    						_html += '<TD width=50 align=right>y-max:</TD>';
							_html += '<TD width=80 align=left><input name="ymax" value="0.5" size=8></TD>';
							_html += '<TD></TD>';
							_html += '</TR>';
							_html += '<TR><TD align=right>y=</TD>';
							_html += '<TD colspan=8 align=left><input name="fx" value="1/sqrt(2*PI)*exp(-x*x/2)+sin(PI*x)/10" size=56></TD>';
							_html += '<TD><input type=button value="Draw" onClick="drawData(11); drawData(12); return false;"></TD>';
							_html += '</TR>';
							_html += '</TABLE>';
							_html += '</form>';

							oForm.innerHTML = _html;
							oForm.style.display = const_inline_style;
						}
					break;

					case 12:
						D.SetFrame(60, 175, 635, 500);
						D.SetBorder(-1, 1, -1, 1);
						D.SetText("x","y", "y=f(x)");
						D.SetGridColor("##808080", "##CCCCCC");
						D.Draw("##DDDDDD", "##000000", true);
						var i, j, x, y;
						j= D.ScreenY(0);
						P=new Array(636);
						for (i=60; i<=635; i++)
						  P[i]=new Pixel(i, j, "##0000FF");

						function Draw() { 
							if ((navigator.userAgent.search("Opera 5")>=0)||(navigator.userAgent.search("Opera 6")>=0)) { 
								alert("Sorry, this doesn't work with this version of Opera.\nUse Opera 7.x, IE 5.x or Netscape 6.x instead.");
						    	return;
						  	}
						  	if ((navigator.appName=="Netscape")&&(parseInt(navigator.appVersion)<5)) { 
								if (!confirm("This is not a safe operation with Netscape 4.x."+
						                " It can cause a crash of the browser."+
						                " Do you want to continue anyway?"))
						      	return;
						  	}
						  var xmin=parseFloat(document.inputform.xmin.value);
						  var xmax=parseFloat(document.inputform.xmax.value);
						  var ymin=parseFloat(document.inputform.ymin.value);
						  var ymax=parseFloat(document.inputform.ymax.value);
						  if (isNaN(xmin)) { alert("x-min is not a number"); return; }
						  if (isNaN(xmax)) { alert("x-max is not a number"); return; }
						  if (isNaN(ymin)) { alert("y-min is not a number"); return; }
						  if (isNaN(ymax)) { alert("y-max is not a number"); return; }
						  D.SetBorder(xmin, xmax, ymin, ymax);
						  D.SetText("x", "y", "y="+document.inputform.fx.value);
						  D.SetGridColor("##808080", "##CCCCCC");
						  D.Draw("##DDDDDD", "##000000", true, "y="+document.inputform.fx.value);
						  var isEvalSafe=((window.EvalSafe)&&(EvalSafe("1+1")==2));
						  for (i=60; i<=635; i++) { 
						  	x = D.RealX(i);
						    if (isEvalSafe) { 
								y=EvalSafe(document.inputform.fx.value);
						      	if ((y=="")&&(isNaN(parseInt(y)))) { 
									alert(document.inputform.fx.value+" can not be evaluated for x="+x);
						        	return; 
						      	}
						    } else { 
								with (Math) y=eval(document.inputform.fx.value);
						    }
						    if ((ymin<=y)&&(y<=ymax)) P[i].MoveTo(i, D.ScreenY(y));
						    else P[i].SetVisibility(false);
						  }
						}
						
						Draw();

						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '700px';
							oDiagramFrame.style.height = '560px';
							oDiagramFrame.style.top = '200px';
						}
					break;

					case 13:
						D.SetFrame(70, 30, 380, 200);
						D.SetBorder(10, 50, 0, 4);
						D.Draw("##80FF80","##0000FF",false);
						B=new Array();
						for (var i=15; i<50; i+=5)
						  B[i]=new Bar(D.ScreenX(i)-10, D.ScreenY(i%3+1), D.ScreenX(i)+10, D.ScreenY(0), "##00cccc");

						if (!!oDiagramFrame) {
							oDiagramFrame.style.width = '440px';
							oDiagramFrame.style.height = '260px';
						}
					break;
				}
				if (graphicalChart != 11) {
					D.Draw("##80FF80","##0000FF",true,"Click on me !","parent.F1DiagramClick()");
					_DiagramTarget.document.writeln("</body></html>");
					_DiagramTarget.document.close();

					if (!!oDiagramFrame) {
						oDiagramFrame.style.display = const_inline_style;
					}
				}
			}
			
			function svgvml3d() {
				var oDiagramFrame = $('iframe_diagram1');
				var oDiagram3D = $('iframe_diagram3D');
				var oForm = $('form_diagram1');
				var oSelection = $('selection_graphType');
				if (!!oSelection) {
					oSelection.selectedIndex = 0;
				}
				if (!!oForm) {
					oForm.style.display = const_none_style;
				}
				if (!!oDiagramFrame) {
					oDiagramFrame.style.display = const_none_style;
				}
				if (!!oDiagram3D) {
					oDiagram3D.style.display = const_inline_style;
					oDiagram3D.style.width = '900px';
					oDiagram3D.style.height = '500px';
					oDiagram3D.src = window.location.href + 'svgvml3d/index.html';
				}
			}

			function displayData(qObj) {
				var nRecs = -1;
				var oParms = -1;
				var _id = '';
				var i = -1;
				var n = -1;
				var argsDict = DictObj.get$();

				function searchForArgRecs(_ri, _dict, _rowCntName) {
					var n = _dict.getValueFor('NAME');
					var v = _dict.getValueFor('VAL');
					if (n.trim().toUpperCase().indexOf('ARG') != -1) {
						argsDict.push(n.trim(), v);
					}
				};

//_alert(qObj);				
				var qStats = qObj.named('qDataNum');
				if (!!qStats) {
					nRecs = qStats.dataRec[1];
				}
				if (nRecs > 0) { // at present only the first data record is consumed...
					var qData = qObj.named('qData1');
					if (!!qData) {
						oParms = qObj.named('qParms');
						if (!!oParms) {
							oParms.iterateRecObjs(searchForArgRecs);
							qData.iterateRecObjs(anyErrorRecords);
							if (!bool_isAnyErrorRecords) {
								argsDict.intoNamedArgs();
							//	_alert(argsDict);
								var _graphType = argsDict.getValueFor('graphType');
								drawData(_graphType);
							} else {
								_alert(s_explainError);
							}
						}
					}
				}
				DictObj.remove$(argsDict.id);
			}

			function handleAJAXData(qObj) {
				var nRecs = -1;
				var oParms = -1;
				var _id = '';
				var i = -1;
				var n = -1;
				var argsDict = DictObj.get$();

				function searchForArgRecs(_ri, _dict, _rowCntName) {
					var n = _dict.getValueFor('NAME');
					var v = _dict.getValueFor('VAL');
					if (n.trim().toUpperCase().indexOf('ARG') != -1) {
						argsDict.push(n.trim(), v);
					}
				};

//_alert(qObj);				
				var qStats = qObj.named('qDataNum');
				if (!!qStats) {
					nRecs = qStats.dataRec[1];
				}
				if (nRecs > 0) { // at present only the first data record is consumed...
					var qData = qObj.named('qData1');
					if (!!qData) {
						oParms = qObj.named('qParms');
						if (!!oParms) {
							oParms.iterateRecObjs(searchForArgRecs);
							qData.iterateRecObjs(anyErrorRecords);
							if (!bool_isAnyErrorRecords) {
								argsDict.intoNamedArgs();
								_alert(argsDict);
							} else {
								_alert(s_explainError);
							}
						}
					}
				}
				DictObj.remove$(argsDict.id);
			}
		// -->
		</script>

		<b>Welcome to the AJAX Powered Tools !</b>
		<br><br>
		
		<table width="100%" border="0" cellspacing="-1" cellpadding="-1" bgcolor="##FFFF80" style="margin-top: 20px;">
			<tr>
				<td>
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td align="left" valign="top">
											<button name="btn_getContents" id="btn_getContents" class="buttonMenuClass" onclick="queueUp_AJAX_Sessions();  return false;">[?Get Data]</button>
										</td>
										<td align="left" valign="top">
											<select name="" id="selection_graphType" class="textClass" onChange="handle_graphType_onchange(this); return false;">
												<option value="-1" SELECTED>Choose...</option>
												<option value="0">Default Chart</option>
												<option value="1">Logarithmic Scale</option>
												<option value="2">Bar Chart Sample</option>
												<option value="3">Box Chart Sample</option>
												<option value="4">Dot Object Sample</option>
												<option value="5">Pixel Object Sample</option>
												<option value="6">Line Object Sample</option>
												<option value="7">Area Object Sample</option>
												<option value="8">Arrow Object Sample</option>
												<option value="9">Pie Object Sample</option>
												<option value="10">Static Sample</option>
												<option value="11">Dynamic Sample</option>
												<option value="13">Relative Position Sample</option>
											</select>
										</td>
										<td align="left" valign="top">
											<button name="btn_3dContents" id="btn_3dContents" class="buttonMenuClass" onclick="svgvml3d();  return false;">[3D]</button>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
		<div id="div_sysMessages" style="display: none;">
			<table width="*" border="1" cellspacing="-1" cellpadding="-1" bgcolor="##FFFF80">
				<tr>
					<td>
						<table width="*" cellspacing="-1" cellpadding="-1">
							<tr bgcolor="silver">
								<td align="center">
									<span id="span_sysMessages_title" class="boldPromptTextClass"></span>
								</td>
								<td align="right">
									<button class="buttonClass" title="Click this button to dismiss this pop-up." onclick="dismissSysMessages(); return false;">[X]</button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span id="span_sysMessages_body" class="textClass"></span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="#Request.cf_div_floating_debug_menu#" style="display: inline;">
			<table width="*" bgcolor="##80FFFF" border="1" cellpadding="-1" cellspacing="-1">
				<tr>
					<td align="left" style="display: inline;">
						<table width="100%" cellpadding="-1" cellspacing="-1">
							<tr>
								<td align="left">
									<span class="onholdStatusBoldClass">AJAX:</span>&nbsp;<button name="btn_helperPanel" id="btn_helperPanel" class="buttonMenuClass" title="Click this button to open the AJAX Debug Panel" onclick="var cObj = $('td_ajaxHelperPanel'); var bObj = $('btn_helperPanel'); var tbObj = $('table_ajaxHelperPanel'); if ( (!!cObj) && (!!bObj) && (!!tbObj) ) { cObj.style.display = ((cObj.style.display == const_none_style) ? const_inline_style : const_none_style); bObj.value = ((cObj.style.display == const_inline_style) ? '[<<]' : '[>>]'); if (cObj.style.display == const_inline_style) { tbObj.style.width = _global_clientWidth; repositionBasedOnFloatingDebugPanel(tbObj); oAJAXEngine.setDebugMode(); } else { oAJAXEngine.setReleaseMode(); }; }; return false;">[>>]</button>
								</td>
							</tr>
							<tr>
								<td align="left">
									<span class="onholdStatusBoldClass">Scopes:</span>&nbsp;<button name="btn_helperPanel2" id="btn_helperPanel2" class="buttonMenuClass" title="Click this button to open the Scopes Debug Panel" onclick="handle_ajaxHelper2_onClick(); return false;">[>>]</button>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		
		<table id="table_menuHelperPanel" width="100%" bgcolor="##80FFFF" border="1" cellpadding="-1" cellspacing="-1">
			<tr>
				<td id="td_menuHelperPanel" style="display: none;" align="left" valign="top">
					<textarea id="ta_menuHelperPanel" readonly rows="5" cols="175" class="textClass"></textarea>
				</td>
			</tr>
		</table>

		<table width="100%" cellpadding="-1" cellspacing="-1">
			<tr>
				<td align="center" id="td_ajaxHelperPanel" style="display: none;">
					<table width="100%" bgcolor="##80FFFF" border="1" bordercolor="silver" cellspacing="-1" cellpadding="-1" id="table_ajaxHelperPanel" style="width: 800px;">
						<tr>
							<td>
								<table width="100%" cellpadding="-1" cellspacing="-1">
									<tr>
										<td align="center">
											<button name="btn_useDebugMode" id="btn_useDebugMode" class="buttonMenuClass" onclick="var s = this.value; if (s.toUpperCase().indexOf('DEBUG') != -1) { oAJAXEngine.setReleaseMode(); this.value = this.value.clipCaselessReplace('Debug', 'Release'); } else { oAJAXEngine.setDebugMode(); this.value = this.value.clipCaselessReplace('Release', 'Debug'); }; return false;">[Debug Mode]</button>
										</td>
										<td align="center">
											<button name="btn_useXmlHttpRequest" id="btn_useXmlHttpRequest" class="buttonMenuClass" onclick="var s = this.value; if (s.toUpperCase().indexOf('XMLHTTPREQUEST') == -1) { oAJAXEngine.isXmlHttpPreferred = false; this.value = this.value.clipCaselessReplace('iFRAME', 'XmlHttpRequest'); } else { oAJAXEngine.isXmlHttpPreferred = true; this.value = this.value.clipCaselessReplace('XMLHTTPREQUEST', 'iFRAME'); }; return false;">[Use iFrame]</button>
										</td>
										<td align="center">
											<button name="btn_useMethodGetOrPost" id="btn_useMethodGetOrPost" class="buttonMenuClass" onclick="var s = this.value; if (s.toUpperCase().indexOf('GET') != -1) { oAJAXEngine.setMethodGet(); this.value = this.value.clipCaselessReplace('GET', 'Post'); } else { oAJAXEngine.setMethodPost(); this.value = this.value.clipCaselessReplace('POST', 'Get'); }; return false;">[Use Get]</button>
										</td>
										<td align="center">
											<button name="btn_hideShow_iFrame" id="btn_hideShow_iFrame" class="buttonMenuClass" onclick="var s = this.value; if (s.toUpperCase().indexOf('SHOW') != -1) { oAJAXEngine.showFrame(); this.value = this.value.clipCaselessReplace('show', 'Hide'); } else { oAJAXEngine.hideFrame(); this.value = this.value.clipCaselessReplace('hide', 'Show'); }; return false;">[Show iFrame]</button>
										</td>
										<td align="center">
											<input type="checkbox" id="cb_debugPanel_toggle_AJAX_echo" onclick="global_echo_AJAX_commands = ((global_echo_AJAX_commands) ? false : true); return true;">&nbsp;<a href="" onclick="simulateCheckBoxClick('cb_debugPanel_toggle_AJAX_echo'); return false;"><span class="textClass">Echo AJAX Commands</span></a>
										</td>
										<td align="center">
											<button name="btn_1" id="btn_1" class="buttonMenuClass" onclick="doAJAX_func('getTopLevelMenuNames'); return false;">[Test]</button>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<cfsavecontent variable="content_application_debug_panel">
			<cfoutput>
				#Request.commonCode.scopesDebugPanelContentLayout()#
			</cfoutput>
		</cfsavecontent>		

		<table id="table_ajaxHelperPanel2" style="width: 800px;" cellpadding="-1" cellspacing="-1">
			<tr>
				<td id="td_ajaxHelperPanel2" align="center" style="display: none;">
					<table border="1" cellspacing="-1" cellpadding="-1">
						<tr>
							<td align="center">
								#content_application_debug_panel#
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
		<div id="form_diagram1" style="position: absolute; top: 100px; left: 10px; width: 720px; height: 100px; display: none;"></div>
		<iframe id="iframe_diagram1" frameborder="0" scrolling="Auto" width=440 height=250 name="F1" style="position: absolute; top: 100px; left: 10px; display: none;"></iframe>
		<iframe id="iframe_diagram3D" frameborder="0" scrolling="Auto" width=440 height=250 name="F2" style="position: absolute; top: 100px; left: 10px; display: none;"></iframe>

		<script language="JavaScript1.2" type="text/javascript">
		<!--
			oAJAXEngine.hideFrame();
			var cObj = $('btn_hideShow_iFrame');
			if (!!cObj) {
				if (oAJAXEngine.visibility == 'visible') {
					cObj.value = cObj.value.clipCaselessReplace('show', 'Hide');
				}
			}

			var cObj = $('btn_useXmlHttpRequest');
			if (!!cObj) {
				if (oAJAXEngine.isXmlHttpPreferred == false) {
					cObj.value = cObj.value.clipCaselessReplace('iFRAME', 'XmlHttpRequest');
				}
			}

			var cObj = $('btn_useMethodGetOrPost');
			if (!!cObj) {
				if (oAJAXEngine.isMethodGet()) {
					cObj.value = cObj.value.clipCaselessReplace('GET', 'Post');
				}
			}

			var cObj = $('btn_useDebugMode');
			if (!!cObj) {
				if (oAJAXEngine.isReleaseMode() == true) {
					cObj.value = cObj.value.clipCaselessReplace('Debug', 'Release');
				}
			}

			var cObj = $(const_cf_html_container_symbol);
			var dObj = $(const_div_floating_debug_menu);
			if ( (!!cObj) && (!!dObj) ) {
				if (dObj.style.display == const_none_style) {
					dObj.style.position = cObj.style.position;
					dObj.style.top = parseInt(cObj.style.top) + 25 + 'px';
					dObj.style.left = (clientWid$() - 75) + 'px';
					dObj.style.display = const_inline_style;
				}
			}
		// -->
		</script>
		
	</body>
</cfoutput>
