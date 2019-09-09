!function(n){"function"==typeof define&&define.amd?define(["jquery"],n):"object"==typeof module&&module.exports?module.exports=function(e,t){return t===undefined&&(t="undefined"!=typeof window?require("jquery"):require("jquery")(e)),n(t)}:n(window.jQuery)}(function(M){M.extend(M.FE.DEFAULTS,{codeMirror:window.CodeMirror,codeMirrorOptions:{lineNumbers:!0,tabMode:"indent",indentWithTabs:!0,lineWrapping:!0,mode:"text/html",tabSize:2},codeBeautifierOptions:{end_with_newline:!0,indent_inner_html:!0,extra_liners:["p","h1","h2","h3","h4","h5","h6","blockquote","pre","ul","ol","table","dl"],brace_style:"expand",indent_char:"\t",indent_size:1,wrap_line_length:0},codeViewKeepActiveButtons:["fullscreen"]}),M.FE.PLUGINS.codeView=function(l){function d(){return l.$box.hasClass("fr-code-view")}function c(){return b?b.getValue():m.val()}function f(){d()&&(b&&b.setSize(null,l.opts.height?l.opts.height:"auto"),l.opts.heightMin||l.opts.height?(l.$box.find(".CodeMirror-scroll, .CodeMirror-gutters").css("min-height",l.opts.heightMin||l.opts.height),m.css("height",l.opts.height)):l.$box.find(".CodeMirror-scroll, .CodeMirror-gutters").css("min-height",""))}function h(){d()&&l.events.trigger("blur")}function u(){d()&&A&&l.events.trigger("focus")}function s(e){m||(function(){m=M('<textarea class="fr-code" tabIndex="-1">'),l.$wp.append(m),m.attr("dir",l.opts.direction),l.$box.hasClass("fr-basic")||(v=M('<a data-cmd="html" title="Code View" class="fr-command fr-btn html-switch'+(l.helpers.isMobile()?"":" fr-desktop")+'" role="button" tabIndex="-1"><i class="fa fa-code"></i></button>'),l.$box.append(v),l.events.bindClick(l.$box,"a.html-switch",function(){l.events.trigger("commands.before",["html"]),p(!1),l.events.trigger("commands.after",["html"])}));var e=function(){return!d()};l.events.on("buttons.refresh",e),l.events.on("copy",e,!0),l.events.on("cut",e,!0),l.events.on("paste",e,!0),l.events.on("destroy",g,!0),l.events.on("html.set",function(){d()&&p(!0)}),l.events.on("codeView.update",f),l.events.on("form.submit",function(){d()&&(l.html.set(c()),l.events.trigger("contentChanged",[],!0))},!0)}(),!b&&l.opts.codeMirror?((b=l.opts.codeMirror.fromTextArea(m.get(0),l.opts.codeMirrorOptions)).on("blur",h),b.on("focus",u)):(l.events.$on(m,"keydown keyup change input",function(){l.opts.height?this.removeAttribute("rows"):(this.rows=1,0===this.value.length?this.style.height="auto":this.style.height=this.scrollHeight+"px")}),l.events.$on(m,"blur",h),l.events.$on(m,"focus",u))),l.undo.saveStep(),l.html.cleanEmptyTags(),l.html.cleanWhiteTags(!0),l.core.hasFocus()&&(l.core.isEmpty()||(l.selection.save(),l.$el.find('.fr-marker[data-type="true"]:first').replaceWith('<span class="fr-tmp fr-sm">F</span>'),l.$el.find('.fr-marker[data-type="false"]:last').replaceWith('<span class="fr-tmp fr-em">F</span>')));var t=l.html.get(!1,!0);l.$el.find("span.fr-tmp").remove(),l.$box.toggleClass("fr-code-view",!0);var n,r,s=!1;if(l.core.hasFocus()&&(s=!0,l.events.disableBlur(),l.$el.blur()),t=(t=t.replace(/<span class="fr-tmp fr-sm">F<\/span>/,"FROALA-SM")).replace(/<span class="fr-tmp fr-em">F<\/span>/,"FROALA-EM"),l.codeBeautifier&&(t=l.codeBeautifier.run(t,l.opts.codeBeautifierOptions)),b){n=t.indexOf("FROALA-SM"),(r=t.indexOf("FROALA-EM"))<n?n=r:r-=9;var i=(t=t.replace(/FROALA-SM/g,"").replace(/FROALA-EM/g,"")).substring(0,n).length-t.substring(0,n).replace(/\n/g,"").length,o=t.substring(0,r).length-t.substring(0,r).replace(/\n/g,"").length;n=t.substring(0,n).length-t.substring(0,t.substring(0,n).lastIndexOf("\n")+1).length,r=t.substring(0,r).length-t.substring(0,t.substring(0,r).lastIndexOf("\n")+1).length,b.setSize(null,l.opts.height?l.opts.height:"auto"),l.opts.heightMin&&l.$box.find(".CodeMirror-scroll").css("min-height",l.opts.heightMin),b.setValue(t),A=!s,b.focus(),A=!0,b.setSelection({line:i,ch:n},{line:o,ch:r}),b.refresh(),b.clearHistory()}else{n=t.indexOf("FROALA-SM"),r=t.indexOf("FROALA-EM")-9,l.opts.heightMin&&m.css("min-height",l.opts.heightMin),l.opts.height&&m.css("height",l.opts.height),m.val(t.replace(/FROALA-SM/g,"").replace(/FROALA-EM/g,"")).trigger("change");var a=M(l.o_doc).scrollTop();A=!s,m.focus(),A=!0,m.get(0).setSelectionRange(n,r),M(l.o_doc).scrollTop(a)}l.$tb.find(" > .fr-command, > .fr-btn-wrap > .fr-command").not(e).filter(function(){return l.opts.codeViewKeepActiveButtons.indexOf(M(this).data("cmd"))<0}).addClass("fr-disabled").attr("aria-disabled",!0),e.addClass("fr-active").attr("aria-pressed",!0),!l.helpers.isMobile()&&l.opts.toolbarInline&&l.toolbar.hide()}function p(e){void 0===e&&(e=!d());var t,n,r=l.$tb.find('.fr-command[data-cmd="html"]');e?(l.popups.hideAll(),s(r)):(l.$box.toggleClass("fr-code-view",!1),t=r,n=c(),l.html.set(n),l.$el.blur(),l.$tb.find(" > .fr-command, > .fr-btn-wrap > .fr-command").not(t).removeClass("fr-disabled").attr("aria-disabled",!1),t.removeClass("fr-active").attr("aria-pressed",!1),l.selection.setAtStart(l.el),l.selection.restore(),l.placeholder.refresh(),l.undo.saveStep())}function g(){d()&&p(!1),b&&b.toTextArea(),m.val("").removeData().remove(),m=null,v&&(v.remove(),v=null)}var m,b,v,A=!1;return{_init:function(){if(l.events.on("focus",function(){var e;l.opts.toolbarContainer&&(e=l.$tb.find('.fr-command[data-cmd="html"]'),d()?(l.$tb.find(" > .fr-command").not(e).filter(function(){return l.opts.codeViewKeepActiveButtons.indexOf(M(this).data("cmd"))<0}).addClass("fr-disabled").attr("aria-disabled",!1),e.addClass("fr-active").attr("aria-pressed",!1)):(l.$tb.find(" > .fr-command").not(e).removeClass("fr-disabled").attr("aria-disabled",!1),e.removeClass("fr-active").attr("aria-pressed",!1)))}),!l.$wp)return!1},toggle:p,isActive:d,get:c}},M.FE.RegisterCommand("html",{title:"Code View",undo:!1,focus:!1,forcedRefresh:!0,toggle:!0,callback:function(){this.codeView.toggle()},plugin:"codeView"}),M.FE.DefineIcon("html",{NAME:"code"})});