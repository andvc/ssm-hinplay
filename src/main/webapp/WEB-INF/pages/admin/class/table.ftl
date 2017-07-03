<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
</head>
<body>
<form action="/website/admin/class/post/batchDel" method="POST" id="form1">
    <table class="table-sort table-operate">
        <tr>
            <th width="20"> 
            	<input name="checkbox" type="checkbox" value="" rel="parent" /> 
            </th>
            <th width="50">编号</th>
            <th width="80">图标</th>
            <th width="100">分类</th>
            <th width="180">操作</th>
        </tr>
        <#if GameClassList??>
        	<#list GameClassList as GameClassList>
        	<tr>
	            <td>  
	            	<input type="checkbox" name="cid" class="checkbox" value="${GameClassList.cid?c}" rel="child" />
	            </td>
	            <td><a href="/website/admin/class/updata/${GameClassList.cid?c}">${GameClassList.cid?c}</a></td>
	            <td>
	            	<img src="${GameClassList.cimage}" height="30">
	            </td>
	            <td>${GameClassList.cname}</td>
	            <td>
					<a href="/website/admin/class/updata/${GameClassList.cid?c}" class="btn edit">修改</a>
	                &nbsp;|&nbsp;
	                <a href="/website/admin/class/delete/${GameClassList.cid?c}" jsbotton="confirm" class="btn delete">删除</a>
	            </td>
	        </tr>
        	</#list>
        </#if>
    </table>
</form>
<div id="bottom">
	<#include "../include/batchDel.ftl">
	 &nbsp;&nbsp;
	<a href="/website/admin/class/insert" target="_self">添加游戏分类</a>
</div>
</body>
</html>