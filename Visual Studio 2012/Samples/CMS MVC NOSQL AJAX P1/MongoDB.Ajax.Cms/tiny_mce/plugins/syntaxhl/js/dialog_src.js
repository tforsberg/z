
var SyntaxHLDialog = {
    init: function (ed, url) {
        var _node = ed.selection.getNode();
        var cnt = '';
        if (_node.nodeName == 'PRE') {
            cnt = ed.selection.getNode().innerHTML;
            var _attr = _node.getAttribute('class');
            if (_attr != null) {
                var _d = eval("({" + _attr + "})");
                if (_d) {
                    document.getElementById('syntaxhl_language').value = _d.brush;
                }

            };
            document.getElementById('syntaxhl_code').value = tinyMCEPopup.dom.decode(cnt);
        };

        tinyMCEPopup.requireLangPack();
    },

    insert: function () {
        var f = document.forms[0], _output, options = '';

        //If no code just return.
        if (f.syntaxhl_code.value == '') {
            tinyMCEPopup.close();
            return false;
        }

        var cnt = tinyMCEPopup.dom.encode(document.getElementById('syntaxhl_code').value);
        var ed = tinyMCEPopup.editor;
        var _node = ed.selection.getNode();
        if (_node.nodeName == 'PRE') {
            _node.innerHTML = cnt;
            _node.setAttribute('class', "brush:'" + f.syntaxhl_language.value + "'");
        }
        else {
            _output = '<p></p><pre name="code" class="brush:\'';
            _output += f.syntaxhl_language.value + '\'">';
            _output += cnt;
            _output += '</pre><p></p>';
            tinyMCEPopup.editor.execCommand('mceInsertContent', false, _output);
        }

        /* if(f.syntaxhl_nogutter.checked) {
        options += 'gutter: false; ';
        }
        if(f.syntaxhl_light.checked) {
        options += 'light: true; ';
        }
        if(f.syntaxhl_collapse.checked) {
        options += 'collapse: true; ';
        }
        if(f.syntaxhl_fontsize.value != '') {
        var fontsize=parseInt(f.syntaxhl_fontsize.value);
        options += 'fontsize: ' + fontsize + '; ';
        }

        if(f.syntaxhl_firstline.value != '') {
        var linenumber = parseInt(f.syntaxhl_firstline.value);
        options += 'first-line: ' + linenumber + '; ';
        }
        if(f.syntaxhl_highlight.value != '') {
        options += 'highlight: [' + f.syntaxhl_highlight.value + ']; ';
        }*/




        tinyMCEPopup.restoreSelection();
        tinyMCEPopup.close();
    }
};

tinyMCEPopup.onInit.add(SyntaxHLDialog.init, SyntaxHLDialog);