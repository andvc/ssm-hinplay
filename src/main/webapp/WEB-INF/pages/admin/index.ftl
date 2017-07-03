<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台管理</title>
<link rel="stylesheet" type="text/css" href="http://cdn.hinplay.com/static/assets/css/public.css"/>
<link rel="stylesheet" type="text/css" href="http://cdn.hinplay.com/static/assets/css/styles.css"/>
<script src="http://cdn.hinplay.com/static/assets/libs/jquery v1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="http://cdn.hinplay.com/static/assets/js/util.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="top_data">
    <div id="logo"><!--<a>海牛游戏后台管理系统</a>--><span>海牛游戏后台管理系统</span></div>
    <div class="top-text">
        <!--<span>欢迎您，</span>-->
        <!--<b>yanshi03</b>&nbsp;|&nbsp;-->
        <a href="/" target="_blank" class="logout">网站主页</a>
        <span id="alert_msg_ct" style="color:red;"></span>
        <a href="/website/admin/logout.action" class="logout">退出系统</a>
    </div>
</div>
<div id="left_panel">
    <ul id="nav_class"></ul>
    <div class="switch-content"><a href="javascript:;" class="open" onclick="SidbarControl.ShowSec();">全部展开</a><a href="javascript:;" class="close" onclick="SidbarControl.HideSec();">全部收起</a></div>
    <ul id="nav_list"></ul>
</div>
<div id="main">
	<div id="top_menu">
		<div class="top_menu_box">
			<div class="top_menu_contents" id="js_menu_contents"></div>
		</div>
		<a href="javascript:;" class="btn left disabled" id="js_tab_left_btn">向左</a><a href="javascript:;" class="btn right disabled" id="js_tab_right_btn">向右</a></div>
	<ul id="handle">
		<li class="back"><a href="javascript:;" onclick="TopMenuControl.Back();">后退(ctrl+b)</a></li>
		<li class="go"><a href="javascript:;" onclick="TopMenuControl.Forward();">前进(ctrl+n)</a></li>
		<li class="refresh"><a href="javascript:;" onclick="TopMenuControl.Refresh();">刷新(ctrl+q)</a></li>
		<li class="screen" id="js_screen_li"><a href="javascript:;" onclick="MainAPI.FullScreen();">全屏(ctrl+i)</a></li>
		<li class="undo" id="js_undo_li" style="display:none;"><a href="javascript:;" onclick="MainAPI.UndoScreen();">还原(ctrl+u)</a></li>
		<li class="close-all"><a href="javascript:;" onclick="TopMenuControl.Close();">关闭全部</a></li>
	</ul>
	<div id="main_frame"></div>
</div>
<script type="text/javascript">
	//数据
	var MenuData = {
		'1': {
			Text: '游戏'
		},
		'2': {
			Text: '游戏管理',
			Parent: '1'
		},
		'3': {
			Text: '管理游戏',
			Parent: '2',
			url: '/website/admin/gameManage.action',
			Default:true
		},
		'4': {
			Text: '添加游戏',
			Parent: '2',
			url: '/website/admin/game/insert'
		},
		'5': {
			Text: '游戏分类',
			Parent: '2',
			url: '/website/admin/gameClass.action'
		},
		'6': {
			Text: '推荐管理',
			Parent: '1'
		},
		'7': {
			Text: '热门游戏',
			Parent: '6',
			url: '/website/admin/commend/hot'
		},
		'8': {
			Text: '精品游戏',
			Parent: '6',
			url: '/website/admin/commend/nice'
		},
		'9': {
			Text: '最新游戏',
			Parent: '6',
			url: '/website/admin/commend/new'
		},
		'10': {
			Text: '礼包管理',
			Parent: '1'
		},
		'11': {
			Text: '礼包管理',
			Parent: '10',
			url: '/website/admin/giftBagManage.action'
		},
		'12': {
			Text: '兑换码管理',
			Parent: '10',
			url: '/website/admin/giftbag/cdkey'
		},
		'13': {
			Text: '兑换码导入',
			Parent: '10',
			url: '/website/admin/cdkey/import'
		},
		'14': {
			Text: '配置'
		},
		'15': {
			Text: '素材管理',
			Parent: '14'
		},
		'16': {
			Text: '图片管理',
			Parent: '15',
			url: '/website/admin/pictureManage.action'
		},
		'17': {
			Text: '幻灯片管理',
			Parent: '15',
			url: '/website/admin/slideManage.action'
		},
		'18': {
			Text: '站务管理',
			Parent: '14'
		},
		'19': {
			Text: '站务管理',
			Parent: '18',
			url: '/website/admin/masterManage.action'
		},
		'20': {
			Text: '添加站务',
			Parent: '18',
			url: '/website/admin/master/insert'
		}
	}
</script>
<script src="http://cdn.hinplay.com/static/assets/js/main.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>