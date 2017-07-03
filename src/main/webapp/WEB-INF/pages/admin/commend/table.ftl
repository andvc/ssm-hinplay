<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
</head>
<body>
<form action="/website/admin/commend/post/batchDel" method="POST" id="form1">
	<input type="hidden" name="type" value="${type}" />
    <table class="table-sort table-operate">
        <tr>
			<th width="20"> 
				<input name="checkbox" type="checkbox" rel="parent" /> 
			</th>
			<th>ID</th>
			<th>游戏名</th>
			<th>游戏类型</th>
			<th>活跃度</th>
			<th>合作商</th>
			<th>游戏状态</th>
			<th>创建时间</th>
			<th width="120">操作</th>
		</tr>
		<#if GamesList??>
     	<#list GamesList as GamesList>
        <tr>
			<td width="20"> 
				<input type="checkbox" name="gid" class="checkbox" value="${GamesList.gid?c}" rel="child" /> 
			</td>
			<td>${GamesList.gid?c}</td>
			<td>${GamesList.gname}</td>
			<td>${GamesList.gClass.cname}</td>
			<td>${GamesList.gplayed?c}</td>
			<td>
			<#if GamesList.gfirm==0>白鹭游戏</#if>
			</td>
			<td>
				<#if GamesList.gstate==0>已上架</#if>
				<#if GamesList.gstate==1>未上架</#if>
			</td>
			<td>${GamesList.gcreate?string("yyyy-MM-dd HH:mm:ss")}</td>
			<td>
				<a href="/website/admin/commend/${type}/delete/${GamesList.gid?c}" jsbotton="confirm" class="btn delete">删除</a>
			</td>
		</tr>
		</#list>
        </#if>
    </table>
</form>
<div id="bottom">
	<#include "../include/batchDel.ftl">
	<#include "../include/pages.ftl">
	&nbsp;&nbsp;
	<a href="/website/admin/commend/${type}/insert" target="_self">${text}</a>
</div>
</body>
</html>