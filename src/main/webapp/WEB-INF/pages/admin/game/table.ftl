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
			<input type="text" name="${searchName}" class="m" value="<#if searchValue??>${searchValue}</#if>">
			<input type="submit" value="搜索">
		</dd>
	</dl>
</form>
<div id="contents">
	<form action="/website/admin/game/post/batchDel" method="POST" id="form1">
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
				<th width="120"> 操作 </th>
			</tr>
			<#if GamesList??>
        		<#list GamesList as GamesList>
			<tr>
				<td> 
					<input type="checkbox" class="checkbox" name="gid" value="${GamesList.gid?c}" rel="child">
				</td>
				<td>
					<a href="/website/admin/game/updata/${GamesList.gid?c}">${GamesList.gid?c}</a>
				</td>
				<td>${GamesList.gname}</td>
				<td><#if GamesList.gClass??>${GamesList.gClass.cname}</#if></td>
				<td>${GamesList.gplayed?c}</td>
				<td><#if GamesList.gfirm == 0>白鹭游戏</#if></td>
				<td>
					<#if GamesList.gstate==0>已上架</#if>
					<#if GamesList.gstate==1>未上架</#if>
				</td>
				<td>${GamesList.gcreate?string("yyyy-MM-dd HH:mm:ss")}</td>
				<td>
					<a href="/website/admin/game/updata/${GamesList.gid?c}" class="btn edit">修改</a>
					&nbsp;|&nbsp;
					<a href="/website/admin/game/delete/${GamesList.gid?c}" jsbotton="confirm" class="btn delete">删除</a>
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
</div>
</body>
</html>