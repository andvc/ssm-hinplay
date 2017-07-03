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
<form jstype="vali" action="/website/admin/slide/post/insert" method="POST">
	<table class="form">
		<tr>
      		<th>幻灯片名称(*)：</th>
      		<td>
      			<input type="text" class="text s" vali="notempty" errormsg="请输入幻灯片名称" placeholder="请输入幻灯片名称" name="sname" />
        		<span class="text-hint normal">必填</span>
        	</td>
    	</tr>
    	<tr>
      		<th>图片：</th>
      		<td>
	     		<button type="button" input-name="simage" img-width="80" img-height="auto" input-type="radio" buttonAction="selectPicture">选择图片</button>
	  		</td>
    	</tr>
		<tr>
     		<th>链接地址：</th>
      		<td>
      			<input type="text" class="text m" vali="notempty" name="surl" errormsg="请输入幻灯片链接地址" placeholder="请输入幻灯片链接地址" />
      		</td>
    	</tr>
    	<tr>
	        <th>幻灯片类型：</th>
	        <td>
	            <input type="radio" id="stype_0" name="stype" value="0" checked/>
	        	<label for="sOrder_0">首页幻灯片</label>
	        	<input type="radio" id="stype_1" name="stype" value="1"/>
	        	<label for="sOrder_1">首页幻灯片2</label>
	        </td>
	    </tr>
    	<tr>
	      	<th>顺序：</th>
	      	<td>
	      		<input type="number" class="text zx" placeholder="请输入内容" name="sorder">
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