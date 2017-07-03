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
<form jstype="vali" action="/website/admin/class/post/updata" method="POST">
	<input type="hidden" name="cid" value="${GameClass.cid?c}"/>
	<table class="form">
	    <tr>
	        <th>分类名称：</th>
	        <td>
		        <input type="text" class="text" vali="notempty" errormsg="请输入分类名称" placeholder="请输入分类名称" name="cname" value="${GameClass.cname}"> 
		        <span class="text-hint normal">必填</span>
	        </td>
	    </tr>
	    <tr>
      		<th>分类图标：</th>
      		<td>	     		
      			<#if GameClass.cimage != "" || !GameClass.cimage??>
	     		<span style="margin-right:10px;float:left;position:relative">
	     			<input type="radio" value="${GameClass.cimage}" checked="checked" style="display:none" name="cimage">
	     			<img src="${GameClass.cimage}" style="width: 80px; height: auto;">
	     			<a href="javascript:" style="position: absolute; right: 0px; top: 0px; width: 18px; height: 18px; line-height: 15px; text-align: center; color: rgb(255, 255, 255); font-size: 12px; font-family: cursive; border-radius: 99999px; background: rgb(0, 0, 0);" buttonAction="delPicture">x</a>
     			</span>
     			</#if>
	  			<button type="button" input-name="cimage" img-width="80" img-height="auto" input-type="radio" buttonAction="selectPicture" <#if GameClass.cimage != "" || !GameClass.cimage??>style="display: none;"</#if>>选择图片</button>
	  		</td>
    	</tr>
	    <tr>
	        <th></th>
	        <td><button type="submit">提交</button></td>
	    </tr>
	</table>
</form>
</body>
</html>