$(function() {
	/**
	 * 图片选择
	 */
	$('[buttonAction="selectPicture"]').click(function() {
		var _this = $(this);
		var iframeUrl = "/website/admin/picture/pictureSelect.action";
		var inputType = _this.attr("input-type");
		var inputName = _this.attr("input-name");
		var imgWidth = _this.attr("img-width");
		var imgHeight = _this.attr("img-height");
		if(inputType != "radio") {
			iframeUrl = iframeUrl + "?type=checkbox";
		}
		$.dialog.open(iframeUrl, {
			title: '选择图片',
			width: 850,
			height: 450,
			ok: function() {
				// 获取框架页面
				var iframe = this.iframe.contentWindow;
				iframe.$("#dialog-imgBox").find("li").each(function() {
					var input = $(this).find("input");
					if(input.is(':checked')) {
						var _span = $('<span style="margin-right:10px;float:left;position:relative"></span>');
						var _input = $('<input type="' + inputType + '" value="' + $(this).find("input").attr("data-imgpath") + '" checked="checked" style="display:none" />');
						_input.attr("name", inputName);
						_span.append(_input);
						var _img = $('<img />');
						_img.attr("src", input.attr("data-imgPath")).css({
							"width": imgWidth,
							"height": imgHeight
						});
						_span.append(_img);
						var _abtn = $('<a href="javascript:" buttonAction="delPicture">x</a>');
						_abtn.css({
							"position": "absolute",
							"right": 0,
							"top": 0,
							"width": "18px",
							"height": "18px",
							"line-height": "15px",
							"text-align": "center",
							"color": "#fff",
							"font-size": "12px",
							"font-family": "cursive",
							"background": "#000",
							"border-radius": "99999px"
						});
						_span.append(_abtn);
						_this.before(_span);
						if(inputType == "radio") {
							_this.hide();
						}
						/**
						 * 图片删除
						 */
						_abtn.click(function() {
							_span.remove();
							if(inputType == "radio") {
								_this.show();
							}
						});
					}
				});
			},
			cancel: function() {

			},
			lock: true,
			opacity: 0.4,
		});
	});
	$('[buttonAction="delPicture"]').click(function(){
		var _span = $(this).parent();
		var inputType = _span.find("input").attr("type");
		_span.remove();
		if(inputType == "radio") {
			$('[buttonAction="selectPicture"]').show();
		}
	});
});