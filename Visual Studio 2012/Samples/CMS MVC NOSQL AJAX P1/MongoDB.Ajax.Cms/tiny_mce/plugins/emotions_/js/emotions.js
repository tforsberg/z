tinyMCEPopup.requireLangPack();

var EmotionsDialog = {
	init : function(ed) {
		tinyMCEPopup.resizeToInnerSize();
	},

	insert : function(file, title) {
		var ed = tinyMCEPopup.editor, dom = ed.dom;

		tinyMCEPopup.execCommand('mceInsertContent', false, dom.createHTML('img', {
			src : file,
			alt : ed.getLang(title),
			title : ed.getLang(title)
		}));

		tinyMCEPopup.close();
	}
};

tinyMCEPopup.onInit.add(EmotionsDialog.init, EmotionsDialog);
