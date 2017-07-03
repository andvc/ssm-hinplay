<!DOCTYPE html>
<html>
<head>
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<title>海牛游戏后台登录</title>
<link rel="stylesheet" type="text/css" href="http://cdn.hinplay.com/static/assets/css/login.css" />
<script src="http://cdn.hinplay.com/static/assets/libs/jquery v1.8.3.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div class="login">
    <form action="/website/admin/login/post" method="post" id="form">
        <div class="logo"></div>
        <div class="login_form">
            <div class="user">
                <input class="text_value" name="username" type="text" />
                <input class="text_value" name="password" type="password" />
            </div>
            <button class="button" type="submit">登录</button>
        </div>
        <div id="tip" styple="display:none"></div>
        <div class="foot"></div>
    </form>
</div>
<script type="text/javascript">
	$('#form').submit(function(){
		var self = $(this);
		var _action = self.attr('action');
		var _method = self.attr('method');
		$.ajax({
			url: _action,
			type: _method,
			data: self.serialize(),
			success: function(d){
				$('#tip').slideDown().html(d.msg);
				if(d.code == 1){
					setTimeout(function(){
						window.location.href="/website/admin/index.action";
					},1500);
				}
			}
		});
		return false;
	});
</script>
</body>
</html>