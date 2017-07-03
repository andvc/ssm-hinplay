<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
</head>
<body>
<form jstype="vali" action="/website/admin/cdkey/post/updata" method="POST">
<input type="hidden" name="kid" value="${GiftBag.kid?c}"/>
<table class="form">
    <tr>
        <th>礼包名称：</th>
        <td>
	       <select name="bid">
    			<#if GiftBagList??>
        			<#list GiftBagList as GiftBagList>
        			<option value="${GiftBagList.bid?c}" <#if GiftBagList.bid == GiftBag.bid>selected</#if>>${GiftBagList.bname}</option>
		        	</#list>
		        </#if>
			</select>
        </td>
    </tr>
    <tr>
    	<th>兑换码：</th>
    	<td>
    		<input type="text" class="text" vali="notempty" errormsg="请输入兑换码" placeholder="请输入兑换码" name="kkey" value="${GiftBag.kkey}"/>
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