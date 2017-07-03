<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
</head>
<body>
<div id="contents">
	<form action="/website/admin/picture/post/batchDel" method="POST" id="form1">
		<table class="table-sort table-operate">
			<tr>
				<th width="20"> 
					<input name="checkbox" type="checkbox" rel="parent" /> 
				</th>
				<th>ID</th>
				<th>图片名</th>
				<th>是否显示</th>
				<th>图片</th>
				<th>图片大小</th>
				<th>图片类型</th>
				<th>图片更新时间</th>
				<th width="120"> 操作 </th>
			</tr>
			<#if pictureList??>
        		<#list pictureList as pictureList>
			<tr>
				<td> 
					<input type="checkbox" name="pid" class="checkbox" value="${pictureList.pid?c}" rel="child" />
				</td>
				<td>
					<a href="/website/admin/picture/updata/${pictureList.pid?c}">${pictureList.pid?c}</a>
				</td>
				<td>${pictureList.pname}</td>
				<td>
					<#if pictureList.isshow == 1>显示</#if>
					<#if pictureList.isshow == 0>隐藏</#if>
				</td>
				<td><img src="${pictureList.urlpath}" height="30"></td>
				<td>${pictureList.psize?c}</td>
				<td>${pictureList.ptype}</td>
				<td>${pictureList.createtime?string("yyyy-MM-dd HH:mm:ss")}</td>
				<td>
					<a href="/website/admin/picture/updata/${pictureList.pid?c}" class="btn edit">修改</a>
					&nbsp;|&nbsp;
	                <a href="/website/admin/picture/delete/${pictureList.pid?c}" jsbotton="confirm" class="btn delete">删除</a>
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
	<a href="/website/admin/picture/pictureSelect.action" target="_self">添加图片</a>
</div>
</body>
</html>