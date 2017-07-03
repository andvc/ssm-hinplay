<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
</head>
<body>
<form action="/website/admin/cdkey/post/import" method="POST" enctype="multipart/form-data">
<table class="form">
    <tr>
        <th>礼包名称：</th>
        <td>
	       <select name="bid">
    			<#if GiftBagList??>
        			<#list GiftBagList as GiftBagList>
        			<option value="${GiftBagList.bid?c}">${GiftBagList.bname}</option>
		        	</#list>
		        </#if>
			</select>
        </td>
    </tr>
    <tr>
    	<th>选择文件：</th>
    	<td>
    		<input type="file" class="text" style="height:23px;" name="keysFlie" placeholder="请输入内容">
    		<input type="hidden" name="isused" value="0" />
    		<span class="text-hint normal">请选择兑换码文件</span>
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