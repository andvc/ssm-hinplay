<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
</head>
<body>
<form action="" method="get">
	<dl class="search-class">
		<dt style="width:65px">礼包名称：</dt>
		<dd>
	        <select name="${searchName}" class="m">
	        	<option value="">全部</option>
    			<#if GiftBagList??>
        			<#list GiftBagList as GiftBagList>
        			<option value="${GiftBagList.bid?c}" <#if searchValue??><#if searchValue == GiftBagList.bid>selected</#if></#if>>${GiftBagList.bname}</option>
		        	</#list>
		        </#if>
			</select>
			<input type="submit" value="搜索">
		</dd>
	</dl>
</form>
<div id="contents">
	<form action="/website/admin/cdkey/post/batchDel" method="POST" id="form1">
		<table class="table-sort table-operate">
			<tr>
				<th width="20"> 
					<input name="checkbox" type="checkbox" rel="parent" />
				</th>
				<th>ID</th>
				<th>兑换码</th>
				<th>礼包名称</th>
				<th>是否已兑换</th>
				<th width="120"> 操作 </th>
			</tr>
			<#if cdkeyList??>
        		<#list cdkeyList as cdkeyList>
			<tr>
				<td> 
					<input type="checkbox" class="checkbox" name="kid" value="${cdkeyList.kid?c}" rel="child"> 
				</td>
				<td>
					<a href="/website/admin/cdkey/updata/${cdkeyList.kid?c}">${cdkeyList.kid?c}</a>
				</td>
				<td>${cdkeyList.kkey}</td>
				<td><#if cdkeyList.giftbag??>${cdkeyList.giftbag.bname}</#if></td>
				<td>
					<#if cdkeyList.isused==0>未兑换</#if>
					<#if cdkeyList.isused==1>已兑换</#if>
				</td>
				<td>
					<a href="/website/admin/cdkey/updata/${cdkeyList.kid?c}" class="btn edit">修改</a>
					&nbsp;|&nbsp;
					<a href="/website/admin/cdkey/delete/${cdkeyList.kid?c}" jsbotton="confirm" class="btn delete">删除</a>
				</td>
			</tr>
			</#list>
        </#if>
		</table>
	</form>
</div>
<div id="bottom">
	<#include "../include/batchDel.ftl">
	<#include "../include/pages.ftl">
	&nbsp;&nbsp;
	<a href="/website/admin/cdkey/insert" target="_self">添加兑换码</a>
</div>
</body>
</html>