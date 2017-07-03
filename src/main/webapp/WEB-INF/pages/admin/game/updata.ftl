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
<form jstype="vali" action="/website/admin/game/post/updata" method="POST">
<table class="form">
	<input type="hidden" name="gid" value="${Game.gid?c}"/>
    <tr>
        <th>游戏名称：</th>
        <td>
	        <input type="text" class="text" vali="notempty" errormsg="请输入游戏名称" placeholder="请输入游戏名称" name="gname" value="${Game.gname }"/> 
	        <span class="text-hint normal">必填</span>
        </td>
    </tr>
    <tr>
    	<th>游戏分类：</th>
    	<td>
    		<select name="cid">
    			<#if GameClassList??>
    				<#list GameClassList as GameClassList>
        			<option value="${GameClassList.cid?c}" <#if GameClassList.cid==Game.cid>selected</#if>>${GameClassList.cname}</option>
		        	</#list>
		        </#if>
			</select>
    	</td>
    </tr>
    <tr>
        <th>付费类型：</th>
        <td>
        	<input type="radio" id="gpaytype_1" name="gpaytype" value="1" <#if Game.gpaytype==1>checked</#if>/>
        	<label for="gPayType_1">付费游戏</label>
            <input type="radio" id="gpaytype_0" name="gpaytype" value="0" <#if Game.gpaytype==0>checked</#if>/>
        	<label for="gPayType_0">免费游戏</label>
        </td>
    </tr>
    <tr>
        <th>屏幕方向：</th>
        <td>
            <input type="radio" id="gscreen_0" name="gscreen" value="0" <#if Game.gscreen==0>checked</#if>/>
        	<label for="gscreen_0">横屏</label>
            <input type="radio" id="gscreen_1" name="gscreen" value="1" <#if Game.gscreen==1>checked</#if>/>
        	<label for="gscreen_1">竖屏</label>
        </td>
    </tr>
    <tr>
        <th>游戏活跃度：</th>
        <td>
        	<input type="number" class="text s" placeholder="请输入内容" name="gplayed" value="${Game.gplayed?c }" maxlength="11"/> 
        </td>
    </tr>
	 <tr>
        <th>游戏厂商：</th>
        <td>
        	<select name="gfirm">
       			<option value="${Game.gfirm}"><#if Game.gfirm == 0>白鹭游戏</#if></option>
			</select>
        </td>
    </tr>
    <tr>
        <th>游戏地址：</th>
        <td>
	        <input type="text" class="text" vali="url" errormsg="请输入游戏地址" placeholder="请输入游戏地址" name="gurl" value="${Game.gurl }"/> 
	        <span class="text-hint normal">如 http://www.hinplay.com</span>
        </td>
    </tr>
    <tr>
        <th>游戏Runtime地址：</th>
        <td>
	        <input type="text" class="text" placeholder="请输入内容" name="gruntimeurl" value="${Game.gruntimeurl}"/> 
	        <span class="text-hint normal">如 http://www.hinplay.com</span>
        </td>
    </tr>
    <tr>
        <th>游戏logo：</th>
        <td>
        	<#if Game.glogo != "" || !Game.glogo??>
	        <span style="margin-right:10px;float:left;position:relative">
     			<input type="radio" value="${Game.glogo}" checked="checked" style="display:none" name="glogo">
     			<img src="${Game.glogo}" style="width: 80px; height: auto;">
     			<a href="javascript:" style="position: absolute; right: 0px; top: 0px; width: 18px; height: 18px; line-height: 15px; text-align: center; color: rgb(255, 255, 255); font-size: 12px; font-family: cursive; border-radius: 99999px; background: rgb(0, 0, 0);" buttonAction="delPicture">x</a>
   			</span>
   			</#if>
  			<button type="button" input-name="glogo" img-width="80" img-height="auto" input-type="radio" buttonAction="selectPicture" <#if Game.glogo != "" || !Game.glogo??>style="display: none;"</#if>>选择图片</button>
        </td>
    </tr>
    <tr>
        <th>游戏图片集：</th>
        <td>
        	<#if listPic??>
        	<#list listPic as listPic>
			<span style="margin-right:10px;float:left;position:relative">
     			<input type=checkbox value="${listPic}" checked="checked" style="display:none" name="pictures">
     			<img src="${listPic}" style="width: 130px; height: auto;">
     			<a href="javascript:" style="position: absolute; right: 0px; top: 0px; width: 18px; height: 18px; line-height: 15px; text-align: center; color: rgb(255, 255, 255); font-size: 12px; font-family: cursive; border-radius: 99999px; background: rgb(0, 0, 0);" buttonAction="delPicture">x</a>
   			</span>
   			</#list>
   			</#if>
  			<button type="button" input-name="pictures" img-width="130" img-height="auto" input-type="checkbox" buttonAction="selectPicture">选择图片</button>
		</td>
    </tr>
    <tr>
        <th>游戏状态：</th>
        <td>
            <input type="radio" id="gstate_0" name="gstate" value="0" <#if Game.gstate==0>checked</#if>/>
        	<label for="gState_0">已上架</label>
            <input type="radio" id="gstate_1" name="gstate" value="1" <#if Game.gstate==1>checked</#if>/>
        	<label for="gState_1">未上架</label>
        </td>
    </tr>
    <tr>
    	<th>游戏简介：</th>
    	<td>
    		<textarea name="gdesc" rows="10" cols="30">${Game.gdesc }</textarea>
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