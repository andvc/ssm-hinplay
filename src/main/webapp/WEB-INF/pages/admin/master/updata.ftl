<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
</head>
<body>
<form jstype="vali" action="/website/admin/master/post/updata" method="POST">
	<input type="hidden" name="wid" value="${Master.wid?c}">
	<table class="form">
	    <tr>
	        <th>名称(*)：</th>
	        <td>
		        <input type="text" class="text" vali="notempty" errormsg="请输入名称" placeholder="请输入名称" name="wname" value="${Master.wname}"> 
		        <span class="text-hint normal">必填</span>
	        </td>
	    </tr>
	    <tr>
	        <th>作者：</th>
	        <td>
		        <input type="text" class="text" placeholder="请输入内容" name="wauthor" value="${Master.wauthor}"> 
	        </td>
	    </tr>
	    <tr>
      		<th>详情：</th>
      		<td><textarea name="wcentent" rows="10" cols="30" id="wCentent">${Master.wcentent }</textarea></td>
    	</tr>
	    <tr>
	        <th></th>
	        <td><button type="submit">提交</button></td>
	    </tr>
	</table>
</form>
</body>
<#include "../include/editor.ftl">
</html>