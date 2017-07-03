<script src="http://cdn.hinplay.com/static/assets/kindeditor-4.1.1/kindeditor-min.js" type="text/javascript" charset="utf-8"></script>
<script src="http://cdn.hinplay.com/static/assets/kindeditor-4.1.1/lang/zh_CN.js" type="text/javascript" charset="utf-8"></script>
<script>
$(function() {
	var editor = KindEditor.create("#wCentent",{
		allowFileManager : true,
		//编辑器样式
		cssPath:"http://cdn.hinplay.com/static/assets/kindeditor-4.1.1/themes/default/default.css",
		//上传文件地址
		uploadJson : "${webhost}/website/admin/editor/post/upload",
		//获得服务端的图片
		fileManagerJson : "${webhost}/website/admin/editor/get/file",
		width : "700px",
		height:"400px",
		items : ['source','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
					'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
					'insertunorderedlist','table','multiimage','image'],
	});
});
</script>
<style>
.ke-dialog-row .ke-input-number{
	width: 50px;
}
</style>