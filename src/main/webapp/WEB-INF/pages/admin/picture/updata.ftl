<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
</head>
<body>
<form jstype="vali" action="/website/admin/picture/post/updata" method="POST" enctype="multipart/form-data">
<input type="hidden" name="pid" value="${picture.pid?c}"/>
<table class="form">
    <tr>
        <th>图片名称：</th>
    	<td>
    		<input type="text" class="text" vali="notempty" errormsg="请输入图片名称" placeholder="请输入图片名称" name="pname" value="${picture.pname }"/>
    	</td>
    </tr>
    <tr>
    	<th>图片url地址：</th>
     	<td>
     		<input type="file" class="text" style="height:23px;" name="imgFile" placeholder="请输入内容">
     		<span class="text-hint normal">尺寸请参考图片尺寸</span>
     		<img alt="${picture.pname }" src="${picture.urlpath }" height="30">
  		</td>
   	</tr>
    <tr>
        <th>是否显示：</th>
        <td>
        	<input type="radio" id="isshow_0" name="isshow" value="1" <#if picture.isshow == 1>checked</#if>/>
        	<label for="bLast_0">显示</label>
        	<input type="radio" id="isshow_1" name="isshow" value="0" <#if picture.isshow == 0>checked</#if>/>
        	<label for="bLast_1">隐藏</label>
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