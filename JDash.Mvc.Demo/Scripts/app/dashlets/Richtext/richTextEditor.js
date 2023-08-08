define(["require"], function (require) {
	return function (params) {
		this.context = params.context;

		this.domNode = document.createElement("div");
		this.editorNode = document.createElement("textarea");
		this.domNode.appendChild(this.editorNode);
		
		this.domNode.id = this.context.dashletContext.id + "Editor";

		this.startup = function () {
			var self = this;
		
			function initEditor() {
				if (self.context.config.has("content"))
					self.editorNode.innerHTML = self.context.config.get("content");

				self.context.subscribe("jdash/dashlet/editor/validating", function (event) {
					if (event.sender == this) {
						var content = self.editor.getData();
						this.config.set("content", content);
					}
				});

				self.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
					if (event.sender == this) {	
						var mydiv = document.getElementById(self.context.dashletContext.id + "Editor");
						var editor = document.createElement("textarea");
						editor.innerHTML = event.args.innerHTML;
						mydiv.appendChild(editor);
						reInitEditor(editor);
					}
				});

				self.context.subscribe('jdash/dashlet/visualStateChanging', function (event) {
					if (event.sender == this) {
						var text;
						if (self.editor.getData() != "")
							text = self.editor.getData();
						else if (self.context.config.has("content"))
							text = self.context.config.get("content");
						else if (!self.context.config.has("content"))
							text = "";

						event.args.innerHTML = self.editor.getData();
						var mydiv = document.getElementById(self.context.dashletContext.id + "Editor");
						mydiv.removeChild(mydiv.lastChild);
					}
				});

				reInitEditor(self.editorNode);

				function reInitEditor(editor) {
					self.editor = CKEDITOR.replace(editor, {
						toolbar: 'Basic'
					});
				//	self.editor.resize("100%", "auto", true, true);
				}
			}

			if (typeof (CKEDITOR) == "undefined") {
				var ckEditor = require.toUrl("./resources/ckeditor/ckeditor.js");
				require([ckEditor], function () {
					initEditor();

				});
			}
			else {
				initEditor();
			}
			
		}


		this.destroyRecursive = function () {
			if (this.editor && CKEDITOR) {
				CKEDITOR.remove(this.editor);
			}
		}
	}
})


