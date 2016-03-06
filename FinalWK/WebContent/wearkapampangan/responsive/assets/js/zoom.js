/*
 * jQuery Rawr zoom v1.0 - http://hungred.com/2009/04/07/javascript-framework-jquery/tutorial-jquery-effect-zoom/
 * The capability to zoom in and out of any object
 *
 * TERMS OF USE - jQuery Rawr zoom
 * Open source under the BSD License. 
 * Copyright © 2009 Clay Lua
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice, this list of 
 * conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list 
 * of conditions and the following disclaimer in the documentation and/or other materials 
 * provided with the distribution.
 * 
 * Neither the name of the author nor the names of contributors may be used to endorse 
 * or promote products derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 *  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
 * OF THE POSSIBILITY OF SUCH DAMAGE. 
 *
*/
(function($){$.fn.zoom=function(a){$.fn.zoom.defaults={zoomWidth:10,zoomHeight:10,duration:5000};var a=$.extend($.fn.zoom.defaults,a);var b=this;var c=0;var d=0;var e=1;return this.each(function(){c=$(this).height();d=$(this).width();e=$(this).css("opacity");$(this).hover(function(){$(b).stop(true,false).animate({height:a.zoomHeight+"px",width:a.zoomWidth+"px",marginTop:((c-a.zoomHeight)/2)+"px",marginLeft:((d-a.zoomWidth)/2)+"px"},a.duration).fadeTo(1,0)},function(){$(b).stop(true,false).fadeTo(1,e).animate({height:c+"px",width:d+"px",marginTop:"0px",marginLeft:"0px"},a.duration)})})}})(jQuery);