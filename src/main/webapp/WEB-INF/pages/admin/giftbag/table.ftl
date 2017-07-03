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
		<dt>游戏：</dt>
		<dd>
	        <select name="${searchName}" class="m">
	        	<option value="">全部</option>
    			<#if GamesList??>
        			<#list GamesList as GamesList>
        			<option value="${GamesList.gid?c}" <#if searchValue??><#if searchValue == GamesList.gid>selected</#if></#if>>${GamesList.gname}</option>
		        	</#list>
		        </#if>
			</select>
			<input type="submit" value="搜索">
		</dd>
	</dl>
</form>
<div id="contents">
	<form action="/website/admin/giftbag/post/batchDel" method="POST" id="form1">
		<table class="table-sort table-operate">
			<tr>
				<th width="20"> 
					<input name="checkbox" type="checkbox" rel="parent" /> 
				</th>
				<th>ID</th>
				<th>游戏</th>
				<th>礼包名称</th>
				<th>礼包内容</th>
				<th>使用说明</th>
				<th>是否过期</th>
				<th width="120"> 操作 </th>
			</tr>
			<#if GiftBagList??>
        		<#list GiftBagList as GiftBagList>
			<tr>
				<td> 
					<input type="checkbox" class="checkbox" name="bid" value="${GiftBagList.bid?c}" rel="child">
				</td>
				<td>
					<a href="/website/admin/giftbag/updata/${GiftBagList.bid?c}">${GiftBagList.bid?c}</a>
				</td>
				<td><#if GiftBagList.game??>${GiftBagList.game.gname}</#if></td>
				<td>${GiftBagList.bname}</td>
				<td>${GiftBagList.bdesc}</td>
				<td>${GiftBagList.bdesc}</td>
				<td>
					<#if GiftBagList.blast == 0>未过期</#if>
					<#if GiftBagList.blast == 1>已过期</#if>
				</td>
				<td>
					<a href="/website/admin/giftbag/updata/${GiftBagList.bid?c}" class="btn edit">修改</a>
					&nbsp;|&nbsp;
					<a href="/website/admin/giftbag/delete/${GiftBagList.bid?c}" jsbotton="confirm" class="btn delete">删除</a>
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
	<a href="/website/admin/giftbag/insert" target="_self">添加游戏礼包</a>
</div>
</body>
</html>