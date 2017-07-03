<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<link rel="stylesheet" type="text/css" href="http://cdn.hinplay.com/static/assets/css/public.css" />
<link rel="stylesheet" type="text/css" href="http://cdn.hinplay.com/static/assets/css/imgManager.css" />
<script src="http://cdn.hinplay.com/static/assets/libs/jquery v1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="http://cdn.hinplay.com/static/assets/libs/webuploader/webuploader.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div class="dialog-uploadImg">
	<#-- <div class="dialog-title">
		<h2>我是标题</h2>
		<a href="javascript:" class="dialog-close">关闭</a>
	</div> -->
	<div class="dialog-uploadArea">
		<button type="button" class="fr" id="dialogUpload">本地上传</button>
	</div>
	<div class="uploadProgress" id="uploadProgress">
		<#--<div class="uploadify-queue-item">
			<span class="fileName">fileName</span>
			<span class="data">data</span>
			<a href="javascript:" class="cancel" style="display:block">关闭</a>
			<div class="uploadify-progress">
				<div class="uploadify-progress-bar progreBar"></div>
			</div>
		</div>-->
	</div>
	<div class="dialog-imgBox" id="dialog-imgBox">
		<ul>
			<#if pictureList??>
	        <#list pictureList as pictureList>
			<li>
				<input type="${type}" class="select" name="uploadSelect" data-id="${pictureList.pid?c}" data-imgPath="${pictureList.urlpath }" />
				<div class="pic">
					<img src="${pictureList.urlpath }"/>
				</div>
				<p class="iName nowrap">${pictureList.pname }</p>
			</li>
			</#list>
        	</#if>
		</ul>
	</div>
</div>
</body>
<script type="text/javascript">
//初始化Web Uploader
var uploader = WebUploader.create({
    // [默认值：'file'] 设置文件上传域的name
    fileVal: 'imgFile',
    // 选完文件后，是否自动上传。
    auto: true,
    name: 'sad',
 	// swf文件路径
    swf: 'http://cdn.hinplay.com/static/assets/libs/webuploader/Uploader.swf',
    // 文件接收服务端。
    server: '/website/admin/picture/post/upload',
    pick: {
        //选择文件的按钮
        id: '#dialogUpload',
        //multiple: false //关闭多选，，默认多选
    },
    // 只允许选择图片文件,
    //accept: {
    //    title: 'Images',
    //    extensions: 'gif,jpg,jpeg,bmp,png',
    //    mimeTypes: 'image/*'
    //}
});
//文件上传过程中创建进度条实时显示。
uploader.on( 'uploadProgress', function(file, percentage) {
	// 避免重复创建
	if(!$('#item_'+file.id).length){
		var $item = $('<div class="uploadify-queue-item" id="item_'+file.id+'"></div>').appendTo('#uploadProgress');
		var $fileName = $('<span class="fileName">'+file.name+'</span>').appendTo($item);
		var $data = $('<span class="data">100%</span>').appendTo($item);
		var $cancel = $('<a href="javascript:" class="cancel">关闭</a>').appendTo($item);
		var $uploadWarp = $('<div class="uploadify-progress"></div>').appendTo($item);
		var $progreBar = $('<div class="uploadify-progress-bar"></div>').appendTo($uploadWarp);
		
		$data.html((percentage * 100).toFixed(0) + '%');
		$progreBar.css( 'width', percentage * 100 + '%' );
	}
});
uploader.on( 'uploadSuccess', function(file,response) {
	setTimeout(function(){
		$('#item_'+file.id).fadeOut(function(){
			$(this).remove();
		});
	},1500);
	if(response.code == 1){
		var result = response.result;
		var $ul = $("#dialog-imgBox").find("ul");
		var $li = $('<li></li>').appendTo($ul);
		var $input = $('<input type="${type}" class="select" data-id="'+result.pid+'" data-imgPath="'+result.urlpath+'" name="uploadSelect" checked="checked" />').appendTo($li);
		var $divpic = $('<div class="pic"></div>').appendTo($li);
		var $img = $('<img src="'+result.urlpath+'"/>').appendTo($divpic);
		var $name = $('<p class="iName nowrap">'+result.pname+'</p>').appendTo($li);
	}
});
uploader.on( 'uploadError', function(file) {});
uploader.on( 'uploadComplete', function( file ) {});
</script>
</html>
