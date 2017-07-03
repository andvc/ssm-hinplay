<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<#include "../include/tplpageStyle.ftl">
<#include "../include/tplpageJs.ftl">
<#include "../include/dialogPage.ftl">
</head>
<body>
<form jstype="vali" action="/website/admin/game/post/insert" method="POST">
<table class="form">
    <tr>
        <th>游戏名称：</th>
        <td>
	        <input type="text" class="text" vali="notempty" errormsg="请输入游戏名称" placeholder="请输入游戏名称" name="gname"/> 
	        <span class="text-hint normal">必填</span>
        </td>
    </tr>
    <tr>
    	<th>游戏分类：</th>
    	<td>
    		<select name="cid">
    			<#if GameClassList??>
        			<#list GameClassList as GameClassList>
        			<option value="${GameClassList.cid?c}">${GameClassList.cname}</option>
		        	</#list>
		        </#if>
			</select>
    	</td>
    </tr>
    <tr>
        <th>付费类型：</th>
        <td>
        	<input type="radio" id="gpaytype_1" name="gpaytype" value="1" checked/>
        	<label for="gpaytype_1">付费游戏</label>
            <input type="radio" id="gPayType_0" name="gpaytype" value="0" />
        	<label for="gpaytype_0">免费游戏</label>
        </td>
    </tr>
    <tr>
        <th>屏幕方向：</th>
        <td>
            <input type="radio" id="gscreen_0" name="gscreen" value="0"/>
        	<label for="gscreen_0">横屏</label>
            <input type="radio" id="gScreen_1" name="gscreen" value="1" checked/>
        	<label for="gscreen_1">竖屏</label>
        </td>
    </tr>
    <tr>
        <th>游戏活跃度：</th>
        <td>
        	<input type="number" class="text s" placeholder="请输入内容" name="gplayed" maxlength="11"/> 
        </td>
    </tr>
	 <tr>
        <th>游戏厂商：</th>
        <td>
        	<select name="gfirm">
       			<option value="0">白鹭游戏</option>
			</select>
        </td>
    </tr>
    <tr>
        <th>游戏地址：</th>
        <td>
        	<input type="text" class="text" vali="url" errormsg="请输入游戏地址" placeholder="请输入游戏地址" name="gurl"/>
	        <span class="text-hint normal">必填 请输入游戏地址 如 http://www.hinplay.com</span>
        </td>
    </tr>
    <tr>
        <th>游戏Runtime地址：</th>
        <td>
	        <input type="text" class="text" placeholder="请输入内容" name="gruntimeurl"/> 
        </td>
    </tr>
    <tr>
        <th>游戏logo：</th>
        <td><button type="button" input-name="glogo" img-width="80" img-height="auto" input-type="radio" buttonAction="selectPicture">选择图片</button></td>
    </tr>
    <tr>
        <th>游戏图片集：</th>
        <td><button type="button" input-name="pictures" img-width="130" img-height="auto" input-type="chebox" buttonAction="selectPicture">选择图片</button></td>
    </tr>
    <tr>
        <th>游戏状态：</th>
        <td>
            <input type="radio" id="gstate_0" name="gstate" value="0" checked/>
        	<label for="gstate_0">已上架</label>
            <input type="radio" id="gstate_1" name="gstate" value="1"/>
        	<label for="gstate_1">未上架</label>
        </td>
    </tr>
    <tr>
    	<th>游戏简介：</th>
    	<td>
    		<textarea name="gdesc" rows="10" cols="30"></textarea>
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