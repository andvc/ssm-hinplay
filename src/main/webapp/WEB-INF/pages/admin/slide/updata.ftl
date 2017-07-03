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
<form jstype="vali" action="/website/admin/slide/post/updata" method="POST">
	<input type="hidden" name="sid" value="${Slide.sid?c}"/>
	<table class="form">
		<tr>
      		<th>幻灯片名称(*)：</th>
      		<td>
      			<input type="text" class="text s" vali="notempty" errormsg="请输入幻灯片名称" placeholder="请输入幻灯片名称" name="sname" value="${Slide.sname }" />
        		<span class="text-hint normal">必填</span>
        	</td>
    	</tr>
    	<tr>
      		<th>幻灯图片：</th>
      		<td>
      			<#if Slide.simage != "" || !Slide.simage??>
      			<span style="margin-right:10px;float:left;position:relative">
	     			<input type="radio" value="${Slide.simage}" checked="checked" style="display:none" name="simage">
	     			<img src="${Slide.simage}" style="width: 80px; height: auto;">
	     			<a href="javascript:" style="position: absolute; right: 0px; top: 0px; width: 18px; height: 18px; line-height: 15px; text-align: center; color: rgb(255, 255, 255); font-size: 12px; font-family: cursive; border-radius: 99999px; background: rgb(0, 0, 0);" buttonAction="delPicture">x</a>
     			</span>
     			</#if>
	  			<button type="button" input-name="simage" img-width="80" img-height="auto" input-type="radio" buttonAction="selectPicture" <#if Slide.simage != "" || !Slide.simage??>style="display: none;"</#if>>选择图片</button>
	  		</td>
    	</tr>
		<tr>
     		<th>链接地址：</th>
      		<td>
      			<input type="text" class="text m" vali="notempty" name="surl" errormsg="请输入幻灯片链接地址" placeholder="请输入幻灯片链接地址" value="${Slide.surl}" />
      		</td>
    	</tr>
    	<tr>
	        <th>幻灯片类型：</th>
	        <td>
	            <input type="radio" id="stype_0" name="stype" value="0" <#if Slide.stype == 0>checked</#if>/>
	        	<label for="stype_0">首页幻灯片</label>
	        	<input type="radio" id="stype_1" name="stype" value="1" <#if Slide.stype == 1>checked</#if>/>
	        	<label for="stype_1">首页幻灯片2</label>
	        </td>
	    </tr>
    	<tr>
	      	<th>顺序：</th>
	      	<td>
	      		<input type="number" class="text zx" placeholder="请输入内容" name="sorder" value="${Slide.sorder }">
	      	</td>
    	</tr>
    	<tr>
      		<th></th>
      		<td>
      			<button type="submit">提交</button>
      		</td>
	    </tr>
	</table>
</form>
</body>
</html>