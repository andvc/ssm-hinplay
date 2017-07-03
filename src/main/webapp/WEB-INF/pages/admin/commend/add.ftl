<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
</head>
<body>
<form action="/website/admin/commend/post/insert" method="POST">
<input type="hidden" name="type" value="${type}"/>
	<table class="form">
	    <tr>
	        <th>游戏名称：</th>
	        <td>
		        <select name="gid">
	    			<#if GamesList??>
	        			<#list GamesList as GamesList>
	        			<option value="${GamesList.gid}">${GamesList.gname}</option>
			        	</#list>
			        </#if>
				</select>
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