<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
</head>
<body>
<form action="/website/admin/slide/post/batchDel" method="POST" id="form1">
    <table class="table-sort table-operate">
        <tr>
            <th width="20"> 
            	<input name="checkbox" type="checkbox" value="" rel="parent"> 
            </th>
            <th width="50"> 编号 </th>
            <th width="100"> 名称 </th>
            <th>图片</th>
			<th>链接地址</th>
			<th>幻灯片类型</th>
			<th>顺序</th>
            <th width="180">操作</th>
        </tr>
        <#if SlideList??>
        <#list SlideList as SlideList>
        <tr>
            <td>  
            	<input type="checkbox" class="checkbox" name="sid" value="${SlideList.sid?c}" rel="child">
            </td>
            <td><a href="/website/admin/slide/updata/${SlideList.sid?c}">${SlideList.sid?c}</a></td>
            <td>${SlideList.sname}</td>
            <td>
            	<img src="${SlideList.simage}" height="30" />
            </td>
			<td>${SlideList.surl }</td>
			<td><#if SlideList.stype == 0>首页幻灯片</#if></td>
			<td>${SlideList.sorder}</td>
            <td>
			    <a href="/website/admin/slide/updata/${SlideList.sid?c}" class="btn edit">修改</a>
				&nbsp;|&nbsp;
            	<a href="/website/admin/slide/delete/${SlideList.sid?c}" jsbotton="confirm" class="btn delete">删除</a>
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
	<a href="/website/admin/slide/insert" target="_self">添加幻灯片</a>
</div>
</body>
</html>