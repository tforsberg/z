
(function ($) {
    $.extend({

        Editor: {

            fileManagerUrl: '/filemanager/',
            defaults: {

                meta: 'tinymce',
                /*mode: 'small',*/
                 script_url: '/tiny_mce/tiny_mce.js',
                //script_url: '/tiny_mce/tiny_mce_gzip.axd',
                skin: "cirkuit",
                theme: "advanced",
                theme_advanced_toolbar_location: "top",
                theme_advanced_toolbar_align: "left",
                theme_advanced_statusbar_location: "bottom",
                theme_advanced_resizing: true,
                paste_auto_cleanup_on_paste: true,
               

                /*  forced_root_block: 'p',
                apply_source_formatting: true,
                force_p_newlines: true,
                force_br_newlines: true,
                remove_linebreaks: false,
                forced_root_block: false,
                force_br_newlines: true,
                force_p_newlines: false,*/
                theme_advanced_resize_horizontal: false,
                extended_valid_elements: "pre[name|class]",
             //   valid_elements: "p/-div[*],-strong/-b[*],-em/-i[*]",

                convert_urls: false,

                entity_encoding: "raw",
                verify_html: false,
                paste_text_linebreaktype: 'p',
               /* paste_text_sticky: true,
                setup: function (ed) {
                    ed.onInit.add(function (ed) {
                        ed.pasteAsPlainText = true;
                    });*/
                   /* ed.onPostProcess.add(function (ed, o) {
                        var _cont = ed.getContent();

                        _cont = _cont.replace(/<div/gi, '<p').replace(/<\/div/gi, '</p').replace(/(.*?)<br\s?\/?>/gi, '<p>$1</p>');

                        ed.setContent(_cont);

                      
                    });*/


               /* },*/

                template_replace_values: {
                    username: "Nasa8x",
                    staffid: "118"
                }

            },


            modes: {

                small: {
                    plugins: 'autolink,save,directionality,tabfocus,emotions,inlinepopups,paste,visualchars,xhtmlxtras,fullscreen,syntaxhl',
                    theme_advanced_buttons1: 'bold,italic,underline,strikethrough,|,fontselect,fontsizeselect,undo,redo,|,justifyleft,justifycenter,justifyright,justifyfull,|,link,unlink,|,syntaxhl,image,fullscreen',
                    theme_advanced_buttons2: '',
                    theme_advanced_buttons3: '',
                    theme_advanced_buttons4: '',
                    inlinepopups_skin: 'office2007blue'

                },
                medium: {

                    plugins: 'autolink,save,tabfocus,table,advimage,iespell,advlink,emotions,inlinepopups,media,directionality,visualchars,noneditable,pagebreak,nonbreaking,xhtmlxtras,preview,fullscreen,syntaxhl',
                    theme_advanced_buttons1: "link,unlink,anchor,|,search,replace,|,bullist,numlist,outdent,indent,blockquote,|,sub,sup,|,ltr,rtl,|,cite,abbr,acronym,del,ins,attribs,|,charmap,iespell,advhr,pagebreak,|,preview,fullscreen",
                    theme_advanced_buttons2: "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,forecolor,styleprops,backcolor,fontselect,fontsizeselect,formatselect,|,emotions,image,syntaxhl",
                    theme_advanced_buttons3: '',
                    theme_advanced_buttons4: '',
                    inlinepopups_skin: 'office2007blue'

                    //file_browser_callback: '$.Editor.fileCallback'
                },

                full: {
                    plugins: 'pdw,autolink,save,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template',
                    theme_advanced_buttons1: 'pdw_toggle,paste,pastetext,pasteword,|,undo,redo,cleanup,|,tablecontrols,|,hr,removeformat,visualaid,|,insertlayer,moveforward,movebackward,absolute',
                    theme_advanced_buttons2: 'search,replace,|,bullist,numlist,outdent,indent,blockquote,|,sub,sup,|,ltr,rtl,|,cite,abbr,acronym,del,ins,attribs,|,charmap,emotions,iespell,advhr,|,image,media,|,code,preview,fullscreen',
                    theme_advanced_buttons3: 'styleprops,forecolor,backcolor,fontselect,fontsizeselect,formatselect,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,link,unlink,anchor',
                    theme_advanced_buttons4: '',
                    pdw_toggle_on: 1,
                    pdw_toggle_toolbars: "2",
                    inlinepopups_skin: 'office2007blue'
                    //file_browser_callback: '$.Editor.fileCallback'
                }

            },
            showFileManager: function () {

                var f = {
                    url: $.Editor.fileManagerUrl + '?tinymce=1&returnFull=1',
                    width: screen.width * 0.8, // pixel
                    height: screen.height * 0.8
                };

                var a = {
                    inline: false, // only works if inlinepopups plugin is available
                    window: window
                };

                // Use TinyMCE window API
                if (window.tinymce && tinyMCE.activeEditor) {
                    a.editor = tinyMCE.activeEditor;
                    return tinyMCE.activeEditor.windowManager.open(f, a);
                }


                // Use jQuery WindowManager
                if (window.jQuery && jQuery.WindowManager)
                    return jQuery.WindowManager.open(f, a);

                return false;
            },

            fileCallback: function (field_name, url, type, win) {

                if (type == "media") {
                    type = win.document.getElementById("media_type").value;
                }

                switch (type) {
                    case "image":
                        type = "images";
                        break;
                    case "media":
                    case "qt":
                    case "wmp":
                    case "rmp":
                        type = "media";
                        break;
                    case "shockwave":
                    case "flash":
                        type = "flash";
                        break;

                    case "file":
                    default:
                        type = "files";
                        break;

                }

                var f = {
                    url: $.Editor.fileManagerUrl + '?tinymce=1&returnFull=1&type=' + type,
                    width: screen.width * 0.8, // pixel
                    height: screen.height * 0.8,
                    resizable: "yes",
                    center: 1,
                    inline: 1,  // This parameter only has an effect if you use the inlinepopups plugin!
                    close_previous: "no"
                };

                var a = {
                    inline: false, // only works if inlinepopups plugin is available
                    window: win,
                    input: field_name
                };

                // Use TinyMCE window API
                if (window.tinymce && tinyMCE.activeEditor) {
                    a.editor = tinyMCE.activeEditor;
                    return tinyMCE.activeEditor.windowManager.open(f, a);
                }


                // Use jQuery WindowManager
                if (window.jQuery && jQuery.WindowManager)
                    return jQuery.WindowManager.open(f, a);

                return false;
            },


            create: function (f, o) {
                var e = (typeof f == 'object') ? f : $('#' + f);
                if ($.data(e, 'tinymce'))
                    return;

                var s = $.extend({}, this.defaults, o || {});

                if (s.file_callback)
                    $.extend(s, { file_browser_callback: '$.Editor.fileCallback' });


                if (s.toolbarMode == 'small') {
                    $.extend(s, this.modes.small);
                }
                else if (s.toolbarMode == 'medium') {

                    $.extend(s, this.modes.medium);
                }
                else {
                    $.extend(s, this.modes.full);
                }

                e.tinymce(s);

            },
            init: function() {
                $(".tinymce").each(function() {
                    var _o = $(this).metadata({ type: 'attr', name: 'data-tinymce' });
                    $.Editor.create($(this),_o);
                });
            }

        }

    });

})(jQuery);



