(function(e){"use strict";if(typeof define==="function"&&define.amd){define(["jquery"],e)}else{e(jQuery)}})(function(e){"use strict";function r(t,n){var i=function(){},s=this,o={autoSelectFirst:false,appendTo:"body",serviceUrl:null,lookup:null,onSelect:null,width:"auto",minChars:1,maxHeight:300,deferRequestBy:0,params:{},formatResult:r.formatResult,delimiter:null,zIndex:9999,type:"GET",noCache:false,onSearchStart:i,onSearchComplete:i,containerClass:"autocomplete-suggestions",tabDisabled:false,dataType:"text",lookupFilter:function(e,t,n){return e.value.toLowerCase().indexOf(n)!==-1},paramName:"query",transformResult:function(t){return typeof t==="string"?e.parseJSON(t):t}};s.element=t;s.el=e(t);s.suggestions=[];s.badQueries=[];s.selectedIndex=-1;s.currentValue=s.element.value;s.intervalId=0;s.cachedResponse=[];s.onChangeInterval=null;s.onChange=null;s.ignoreValueChange=false;s.isLocal=false;s.suggestionsContainer=null;s.options=e.extend({},o,n);s.classes={selected:"autocomplete-selected",suggestion:"autocomplete-suggestion"};s.initialize();s.setOptions(n)}var t=function(){return{extend:function(t,n){return e.extend(t,n)},createNode:function(e){var t=document.createElement("div");t.innerHTML=e;return t.firstChild}}}(),n={ESC:27,TAB:9,RETURN:13,UP:38,DOWN:40};r.utils=t;e.Autocomplete=r;r.formatResult=function(e,t){var n=new RegExp("(\\"+["/",".","*","+","?","|","(",")","[","]","{","}","\\"].join("|\\")+")","g"),r="("+t.replace(n,"\\$1")+")";return e.value.replace(new RegExp(r,"gi"),"<strong>$1</strong>")};r.prototype={killerFn:null,initialize:function(){var t=this,n="."+t.classes.suggestion,i=t.classes.selected,s=t.options,o;t.element.setAttribute("autocomplete","off");t.killerFn=function(n){if(e(n.target).closest("."+t.options.containerClass).length===0){t.killSuggestions();t.disableKillerFn()}};if(!s.width||s.width==="auto"){s.width=t.el.outerWidth()}t.suggestionsContainer=r.utils.createNode('<div class="'+s.containerClass+'" style="position: absolute; display: none;"></div>');o=e(t.suggestionsContainer);o.appendTo(s.appendTo).width(s.width);o.on("mouseover.autocomplete",n,function(){t.activate(e(this).data("index"))});o.on("mouseout.autocomplete",function(){t.selectedIndex=-1;o.children("."+i).removeClass(i)});o.on("click.autocomplete",n,function(){t.select(e(this).data("index"),false)});t.fixPosition();if(window.opera){t.el.on("keypress.autocomplete",function(e){t.onKeyPress(e)})}else{t.el.on("keydown.autocomplete",function(e){t.onKeyPress(e)})}t.el.on("keyup.autocomplete",function(e){t.onKeyUp(e)});t.el.on("blur.autocomplete",function(){t.onBlur()});t.el.on("focus.autocomplete",function(){t.fixPosition()})},onBlur:function(){this.enableKillerFn()},setOptions:function(n){var r=this,i=r.options;t.extend(i,n);r.isLocal=e.isArray(i.lookup);if(r.isLocal){i.lookup=r.verifySuggestionsFormat(i.lookup)}e(r.suggestionsContainer).css({"max-height":i.maxHeight+"px",width:i.width+"px","z-index":i.zIndex})},clearCache:function(){this.cachedResponse=[];this.badQueries=[]},clear:function(){this.clearCache();this.currentValue=null;this.suggestions=[]},disable:function(){this.disabled=true},enable:function(){this.disabled=false},fixPosition:function(){var t=this,n;if(t.options.appendTo!=="body"){return}n=t.el.offset();e(t.suggestionsContainer).css({top:n.top+t.el.outerHeight()+"px",left:n.left+"px"})},enableKillerFn:function(){var t=this;e(document).on("click.autocomplete",t.killerFn)},disableKillerFn:function(){var t=this;e(document).off("click.autocomplete",t.killerFn)},killSuggestions:function(){var e=this;e.stopKillSuggestions();e.intervalId=window.setInterval(function(){e.hide();e.stopKillSuggestions()},300)},stopKillSuggestions:function(){window.clearInterval(this.intervalId)},onKeyPress:function(e){var t=this;if(!t.disabled&&!t.visible&&e.keyCode===n.DOWN&&t.currentValue){t.suggest();return}if(t.disabled||!t.visible){return}switch(e.keyCode){case n.ESC:t.el.val(t.currentValue);t.hide();break;case n.TAB:case n.RETURN:if(t.selectedIndex===-1){t.hide();return}t.select(t.selectedIndex,e.keyCode===n.RETURN);if(e.keyCode===n.TAB&&this.options.tabDisabled===false){return}break;case n.UP:t.moveUp();break;case n.DOWN:t.moveDown();break;default:return}e.stopImmediatePropagation();e.preventDefault()},onKeyUp:function(e){var t=this;if(t.disabled){return}switch(e.keyCode){case n.UP:case n.DOWN:return}clearInterval(t.onChangeInterval);if(t.currentValue!==t.el.val()){if(t.options.deferRequestBy>0){t.onChangeInterval=setInterval(function(){t.onValueChange()},t.options.deferRequestBy)}else{t.onValueChange()}}},onValueChange:function(){var e=this,t;clearInterval(e.onChangeInterval);e.currentValue=e.element.value;t=e.getQuery(e.currentValue);e.selectedIndex=-1;if(e.ignoreValueChange){e.ignoreValueChange=false;return}if(t.length<e.options.minChars){e.hide()}else{e.getSuggestions(t)}},getQuery:function(t){var n=this.options.delimiter,r;if(!n){return e.trim(t)}r=t.split(n);return e.trim(r[r.length-1])},getSuggestionsLocal:function(t){var n=this,r=t.toLowerCase(),i=n.options.lookupFilter;return{suggestions:e.grep(n.options.lookup,function(e){return i(e,t,r)})}},getSuggestions:function(t){var n,r=this,i=r.options,s=i.serviceUrl;n=r.isLocal?r.getSuggestionsLocal(t):r.cachedResponse[t];if(n&&e.isArray(n.suggestions)){r.suggestions=n.suggestions;r.suggest()}else if(!r.isBadQuery(t)){i.params[i.paramName]=t;if(i.onSearchStart.call(r.element,i.params)===false){return}if(e.isFunction(i.serviceUrl)){s=i.serviceUrl.call(r.element,t)}e.ajax({url:s,data:i.ignoreParams?null:i.params,type:i.type,dataType:i.dataType}).done(function(e){r.processResponse(e,t);i.onSearchComplete.call(r.element,t)})}},isBadQuery:function(e){var t=this.badQueries,n=t.length;while(n--){if(e.indexOf(t[n])===0){return true}}return false},hide:function(){var t=this;t.visible=false;t.selectedIndex=-1;e(t.suggestionsContainer).hide()},suggest:function(){if(this.suggestions.length===0){this.hide();return}var t=this,n=t.options.formatResult,r=t.getQuery(t.currentValue),i=t.classes.suggestion,s=t.classes.selected,o=e(t.suggestionsContainer),u="";e.each(t.suggestions,function(e,t){u+='<div class="'+i+'" data-index="'+e+'">'+n(t,r)+"</div>"});o.html(u).show();t.visible=true;if(t.options.autoSelectFirst){t.selectedIndex=0;o.children().first().addClass(s)}},verifySuggestionsFormat:function(t){if(t.length&&typeof t[0]==="string"){return e.map(t,function(e){return{value:e,data:null}})}return t},processResponse:function(e,t){var n=this,r=n.options,i=r.transformResult(e,t);i.suggestions=n.verifySuggestionsFormat(i.suggestions);if(!r.noCache){n.cachedResponse[i[r.paramName]]=i;if(i.suggestions.length===0){n.badQueries.push(i[r.paramName])}}if(t===n.getQuery(n.currentValue)){n.suggestions=i.suggestions;n.suggest()}},activate:function(t){var n=this,r,i=n.classes.selected,s=e(n.suggestionsContainer),o=s.children();s.children("."+i).removeClass(i);n.selectedIndex=t;if(n.selectedIndex!==-1&&o.length>n.selectedIndex){r=o.get(n.selectedIndex);e(r).addClass(i);return r}return null},select:function(e,t){var n=this,r=n.suggestions[e];if(r){n.el.val(r);n.ignoreValueChange=t;n.hide();n.onSelect(e)}},moveUp:function(){var t=this;if(t.selectedIndex===-1){return}if(t.selectedIndex===0){e(t.suggestionsContainer).children().first().removeClass(t.classes.selected);t.selectedIndex=-1;t.el.val(t.currentValue);return}t.adjustScroll(t.selectedIndex-1)},moveDown:function(){var e=this;if(e.selectedIndex===e.suggestions.length-1){return}e.adjustScroll(e.selectedIndex+1)},adjustScroll:function(t){var n=this,r=n.activate(t),i,s,o,u=25;if(!r){return}i=r.offsetTop;s=e(n.suggestionsContainer).scrollTop();o=s+n.options.maxHeight-u;if(i<s){e(n.suggestionsContainer).scrollTop(i)}else if(i>o){e(n.suggestionsContainer).scrollTop(i-n.options.maxHeight+u)}n.el.val(n.getValue(n.suggestions[t].value))},onSelect:function(t){var n=this,r=n.options.onSelect,i=n.suggestions[t];n.el.val(n.getValue(i.value));if(e.isFunction(r)){r.call(n.element,i)}},getValue:function(e){var t=this,n=t.options.delimiter,r,i;if(!n){return e}r=t.currentValue;i=r.split(n);if(i.length===1){return e}return r.substr(0,r.length-i[i.length-1].length)+e},dispose:function(){var t=this;t.el.off(".autocomplete").removeData("autocomplete");t.disableKillerFn();e(t.suggestionsContainer).remove()}};e.fn.autocomplete=function(t,n){var i="autocomplete";if(arguments.length===0){return this.first().data(i)}return this.each(function(){var s=e(this),o=s.data(i);if(typeof t==="string"){if(o&&typeof o[t]==="function"){o[t](n)}}else{if(o&&o.dispose){o.dispose()}o=new r(this,t);s.data(i,o)}})}})