<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
</head>
<body>
<form action="/website/admin/master/post/batchDel" method="POST" id="form1">
    <table class="table-sort table-operate">
        <tr>
            <th width="20"> 
            	<input name="checkbox" type="checkbox" value="" rel="parent"> 
            </th>
            <th width="50"> 编号 </th>
            <th> 名称 </th>
            <th>作者</th>
			<th>更改时间</th>
            <th width="120">操作</th>
        </tr>
        <#if MasterList??>
        <#list MasterList as MasterList>
        <tr>
            <td>  
            	<input type="checkbox" class="checkbox" name="wid" value="${MasterList.wid?c}" rel="child">
            </td>
            <td><a href="/website/admin/master/updata/${MasterList.wid?c}">${MasterList.wid?c}</a></td>
            <td>${MasterList.wname}</td>
			<td>${MasterList.wauthor}</td>
			<td>${MasterList.wtime?string("yyyy-MM-dd HH:mm:ss")}</td>
            <td>
			    <a href="/website/admin/master/updata/${MasterList.wid?c}" class="btn edit">修改</a>
				&nbsp;|&nbsp;
            	<a href="/website/admin/master/delete/${MasterList.wid?c}" jsbotton="confirm" class="btn delete">删除</a>
            </td>
        </tr>
        </#list>
        </#if>
    </table>
</form>
<div id="bottom">
	<#include "../include/batchDel.ftl">
	&nbsp;&nbsp;
	<a href="/website/admin/master/insert" target="_self">添加站务</a>
</div>
</body>
</html>