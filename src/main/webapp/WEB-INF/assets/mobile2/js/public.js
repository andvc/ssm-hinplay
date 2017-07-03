$(function() {
	// 初始化FastClick ，加载FastClick
	FastClick.attach(document.body);
	// loading的随机显示文字效果
	$("#loading").find(".loadingTxt").addClass(
		"t" + parseInt(Math.random() * (3) + 1, 10));
	//登陆提示文字横线
	$("#loginTips").find("span").css("width", ($("#loginTips").off().width() - $("#hintTxt").off().width()) / 2 + "px");
	//	loginWeixin
	//是否为微信否则不显示微信登陆
	if(!isWeixin()) {
		$("#loginWeixin").remove();
	}
	// 页面加载完成后执行的操作
	window.onload = function() {
			footerState();
			if(!$("#gameFrame").length > 0) {
				// 加载完成清除oading
				$("#loading").remove();
			}
		}
		// 每个页面需要执行的方法
	function footerState() {
		var pagetype = $("#pagetype").val();
		$("#footer").find("a").removeClass("active");
		switch(pagetype) {
			case "index":
				$("#footer").find(".index").addClass("active");
				indexSlide();
				indexGameHot();
				indexGameNew();
				break;
			case "gameList":
				$("#footer").find(".game").addClass("active");
				gameListByCid("");
				gClassNavClick();
				break;
			case "myCenter":
				$("#footer").find(".my").addClass("active");
				break;

		}
	}
	// 搜索-->提交时判断是否为空
	$("#gSearchForm").on("submit", function() {
			return $("#gSearchInput").val().length > 0;
		})
		// 搜索-->显示/隐藏重置按钮
	$("#gSearchInput").bind('input propertychange focus', function() {
		if($(this).val().length > 0) {
			$("#gSearchSubmit").removeClass("hidden").addClass("block");
			$("#gSearchReset").removeClass("hidden");
		} else {
			$("#gSearchSubmit").removeClass("block").addClass("hidden");
			$("#gSearchReset").addClass("hidden");
		}
	});
	// 搜索-->重置按钮单击事件
	$("#gSearchReset").click(function() {
		$("#gSearchInput").val("");
		$(this).addClass("hidden");
		$("#gSearchSubmit").removeClass("block").addClass("hidden");
	});
	// 搜索-->搜索按钮单击事件
	$("#gSearchSubmit").click(function() {
		$("#gSearchForm").submit();
	});
});

(function() {
	var d = $("#touchBall");
	var cWith = $(window).width();
	var pcWidth = parseInt(cWith);

	var cHeight = $(window).height();
	var pcHeight = parseInt(cHeight);

	var cDomWith = d.width();
	var pcDomWith = parseInt(cDomWith);

	var cDomHeight = d.height();
	var pcDomHeight = parseInt(cDomHeight);

	var iX, iY;

	var autoLocation = function() {
		var top = parseInt(d.css('top'));
		var left = parseInt(d.css('left'));
		var ch = pcHeight / 2;
		var cw = (pcWidth - pcDomWith) / 2;
		var mLeft = 0;
		var locationType = left > cw ? 'rt' : 'lt';
		switch(locationType) {
			case 'lt':
				d.css({
					"left": 0,
					"right": "auto"
				});
				mLeft = -pcDomWith / 2;
				break;
			case 'rt':
				d.css({
					"left": pcWidth - pcDomWith,
					"right": "auto"
				});
				mLeft = pcWidth - pcDomWith + pcDomWith / 2;
				break;
			case 'lb':
				break;
			case 'rb':
				break;
		}
		return mLeft;
	}
	var Mleft = function(mleft) {
		setTimeout(function() {
			d.css("left", mleft);
			d.addClass("op0_4");
		}, 1000);
	}
	var touchMove = function(e) {
		e.preventDefault();
		d.removeClass("transition");
		d.removeClass("op0_4");
		var x = e.targetTouches[0].clientX - pcDomWith / 2;
		var y = e.targetTouches[0].clientY - pcDomHeight / 2;
		var maxY = pcHeight - pcDomHeight;
		var maxX = pcWidth - pcDomWith;
		y = y < 0 ? 0 : y;
		y = y > maxY ? maxY : y;
		x = x < 0 ? 0 : x;
		x = x > maxX ? maxX : x;
		d.css({
			"left": x,
			"top": y
		});
	}
	var touchEnd = function() {
		d.addClass("transition");
		d.removeClass("op0_4");
		var maxY = pcHeight - pcDomHeight;
		var maxX = pcWidth - pcDomWith;
		Mleft(autoLocation());
	}
	d.css({
		"left": pcWidth - pcDomWith / 2,
		"top": "70px"
	}).bind("click", function(e) {
		e.preventDefault();
		var loc = autoLocation();
		if(loc > cWith / 2) {
			$(this).parents().addClass("arrowRight");
		} else {
			$(this).parents().addClass("arrowLeft");
		}
		$("#touchMenu").css("top", d.css("top"))
		$("#touchMenu").removeClass("hidden");
		d.addClass("hidden");
		$("#marks").removeClass("hidden");
	}).bind('touchmove', touchMove).bind('touchend', touchEnd);
	$("#touchMenu").find(".close").bind("click", function() {
		$("#touchMenu").addClass("hidden");
		d.removeClass("hidden");
		$("#marks").addClass("hidden");
		$("#touchMenu").parents().removeClass("arrowTop").removeClass("arrowBottom").removeClass("arrowLeft").removeClass("arrowRight");
		touchEnd();
	})
})();

// 获得模板数据 json
function dataTemplate(url, data, marks, callBack) {
	if(sessionStorage.getItem(marks) != null)
		return callBack(JSON.parse(sessionStorage.getItem(marks)));
	$.ajax({
		type: "get",
		url: url,
		data: data,
		success: function(d) {
			sessionStorage.setItem(marks, JSON.stringify(d));
			callBack(d);
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		},
		async: true
	});
}

// 首页热游推荐
function indexGameHot() {
	var url = "/getCommend";
	var dataOpt = {
		cClass: 0
	}
	dataTemplate(url, dataOpt, "indexGameHot", function(d) {
		var _html = template('gHotBox_tpl', d);
		$("#gHotBox").html(_html);
	})
}
// 首页新游推荐
function indexGameNew() {
	var url = "/getCommend";
	var dataOpt = {
		cClass: 2
	}
	dataTemplate(url, dataOpt, "indexGameNew", function(d) {
		var _html = template('gNewBox_tpl', d);
		$("#gNewBox").html(_html);
	})
}
// 首页幻灯片配置
function indexSlide() {
	new Swiper('#indexSlide', {
		autoplay: 5000,
		effect: "fade",
		loop: true,
		autoplayDisableOnInteraction: false,
		pagination: ".pagination",
		bulletClass: "bullet",
		bulletActiveClass: 'active',
	});
};
// 根据分类id查询游戏
function gameListByCid(cId) {
	var url = "/getGame";
	var dataOpt = {
		classId: cId
	}
	dataTemplate(url, dataOpt, "gameListByCid=" + cId, function(d) {
		if(d.result.length > 0) {
			var _html = template('gClassList_tpl', d);
			$("#gClassList").html(_html);
		} else {
			$("#gClassList").html('<div class="width_100 align_center pt_10">该分类还没有游戏！</div>');
		}
	})
}
// 分类点击
function gClassNavClick() {
	$("#gClassNav").find("a").click(function() {
		var cId = $(this).attr("data-res");
		$("#gClassNav").find("a").removeClass("active");
		$(this).addClass("active");
		gameListByCid(cId);
	});
}
//是否为微信
function isWeixin() {
	var ua = navigator.userAgent.toLowerCase();
	if(ua.match(/MicroMessenger/i) == "micromessenger") {
		return true;
	} else {
		return false;
	}
}