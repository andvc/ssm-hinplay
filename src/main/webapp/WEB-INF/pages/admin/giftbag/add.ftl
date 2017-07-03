<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
</head>
<body>
<form jstype="vali" action="/website/admin/giftbag/post/insert" method="POST">
<table class="form">
    <tr>
        <th>游戏：</th>
        <td>
	       <select name="gid">
    			<#if GamesList??>
        			<#list GamesList as GamesList>
        			<option value="${GamesList.gid?c}">${GamesList.gname}</option>
		        	</#list>
		        </#if>
			</select>
        </td>
    </tr>
    <tr>
    	<th>礼包名称：</th>
    	<td>
    		<input type="text" class="text" vali="notempty" errormsg="请输入礼包名称" placeholder="请输入礼包名称" name="bname"/> 
    	</td>
    </tr>
    <tr>
        <th>礼包内容：</th>
        <td>
            <input type="text" class="text" vali="notempty" errormsg="请输入礼包内容" placeholder="请输入礼包内容" name="bdesc"/>
        </td>
    </tr>
    <tr>
        <th>使用说明：</th>
        <td>
        	<textarea name="bexplain" rows="2" cols="20" placeholder="请输入使用说明"></textarea>
        </td>
    </tr>
    <tr>
        <th>是否过期：</th>
        <td>
        	<input type="radio" id="blast_0" name="blast" value="0" checked/>
        	<label for="blast_0">未过期</label>
        	<input type="radio" id="blast_1" name="blast" value="1" />
        	<label for="blast_1">已过期</label>
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