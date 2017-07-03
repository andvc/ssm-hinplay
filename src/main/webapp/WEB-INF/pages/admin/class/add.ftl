<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
<#include "../include/dialogPage.ftl">
</head>
<body>
<form jstype="vali" action="/website/admin/class/post/insert" method="POST">
	<table class="form">
	    <tr>
	        <th>分类名称：</th>
	        <td>
		        <input type="text" class="text" vali="notempty" errormsg="请输入分类名称" placeholder="请输入分类名称" name="cname"> 
		        <span class="text-hint normal">必填</span>
	        </td>
	    </tr>
	    <tr>
      		<th>分类图标：</th>
      		<td><button type="button" input-name="cimage" img-width="80" img-height="auto" input-type="radio" buttonAction="selectPicture">选择图片</button></td>
    	</tr>
	    <tr>
	        <th></th>
	        <td><button type="submit">提交</button></td>
	    </tr>
	</table>
</form>
</body>
</html>