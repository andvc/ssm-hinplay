<div class="pages">
<#--当前页-->
<#assign currentpage=pageInfo.page?int>
<#--总共数据的条目-->
<#assign recordCount =pageInfo.total?int>
<#--每页显示的数量-->
<#assign showsize=pageInfo.size?int>
<#--总共多少页 计算方式 -->
<#if recordCount%showsize == 0> 
<#assign pagenum=(recordCount/showsize)?int>
<#else>
<#assign pagenum=(recordCount/showsize+1)?int>
</#if>
<#-- 页码列表的长度自己定，5个长 -->
<#-- 第一条：如果总页数<=5，那么页码列表为1 ~ 总页数 -->
<#if pagenum lte 5>
	<#assign begin=1?int>
	<#if pagenum lte 0>
	<#assign end=1?int>
	<#else>
	<#assign end=pagenum?int>
	</#if>
 <#else> 
  	<#-- 第二条：按公式计算，让列表的头为当前页-2；列表的尾为当前页+2 -->
  	<#assign begin=currentpage-2?int>
  	<#assign end=currentpage+2?int>
    <#-- 第三条：第二条只适合在中间，而两端会出问题。这里处理begin出界！ -->
    <#-- 如果begin<1，那么让begin=1，相应end=5 -->
    <#if begin lt 1>
    	<#assign begin=1?int>
  		<#assign end=5?int>
    </#if> 
    <#-- 第四条：处理end出界。如果end>总页数，那么让end=总页数，相应begin=总页数-4 -->
    <#if end gt pagenum>
    	<#assign begin=pagenum-4?int>
  		<#assign end=pagenum?int>
    </#if> 
</#if>
	<#-- 循环显示页码列表 -->
	<div class="pagenumber">
		<#if currentpage == 1>
		<a class='first-page'>首页</a>
		<#else>
		<a href="?page=1&size=${showsize}<#if searchName??&&searchValue??>&${searchName}=${searchValue}</#if>" class='first-page'>首页</a>
		</#if>
		<#-- 上一页 -->
		<#if currentpage gt 1> 
		<a href="?page=${currentpage - 1}&size=${showsize}<#if searchName??&&searchValue??>&${searchName}=${searchValue}</#if>" class='prev'>&laquo;&lt;</a>
		<#else> 
		<a class='prev'>&laquo;&lt;</a>
		</#if>
		<#list begin..end as listnum>
		<#if currentpage == listnum>
		<span class='current'>${currentpage}</span>
		<#else>
		<a href='?page=${listnum}&size=${showsize}<#if searchName??&&searchValue??>&${searchName}=${searchValue}</#if>'>${listnum}</a>
		</#if>
		</#list>
		<#if currentpage lt pagenum> 
		<a href='?page=${currentpage + 1}&size=${showsize}<#if searchName??&&searchValue??>&${searchName}=${searchValue}</#if>' class='next'>&gt;&raquo;</a>
	    <#else> 
	    <a class='next'>&gt;&raquo;</a>
	    </#if>
		<#if pagenum == currentpage || pagenum == 0> 
		<a class='last-page'>末页</a>
		<#else> 
		<a href='?page=${pagenum}&size=${showsize}<#if searchName??&&searchValue??>&${searchName}=${searchValue}</#if>' class='last-page'>末页</a>
		</#if>
		<span>共 ${pagenum} 页 / ${recordCount} 条记录</span>
	</div>
</div>