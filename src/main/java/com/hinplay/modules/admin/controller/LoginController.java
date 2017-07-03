package com.hinplay.modules.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hinplay.core.ajaxResult.AjaxResult;
import com.hinplay.modules.admin.constant.LoginConstant;

@Controller
public class LoginController {

	// 登录
	@RequestMapping("website/admin/login.action")
	public String adminLoginManage(HttpSession session) {
		if (LoginConstant.USERNAME.equals((String) session.getAttribute(LoginConstant.SESSION_NAME))) {
			return "redirect:/website/admin/index.action";
		}
		return "admin/login";
	}

	// 退出
	@RequestMapping(value = "website/admin/logout.action")
	public String adminLogout(HttpSession session) {
		if (session.getAttribute(LoginConstant.SESSION_NAME) != null) {
			session.invalidate();
			return "redirect:/website/admin/login.action";
		}
		return "redirect:/website/admin/index.action";
	}

	// 登陆提交
	@RequestMapping(value = "website/admin/login/post", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult adminLoginPost(String username, String password, HttpSession session) {
		try {
			if (LoginConstant.USERNAME.equals(username.trim()) && LoginConstant.PASSWORD.equals(password.trim())) {
				session.setAttribute(LoginConstant.SESSION_NAME, username);
				return AjaxResult.getSuccess("登录成功!");
			}
			return AjaxResult.getError("用户名或密码错误！");
		} catch (Exception e) {
			e.printStackTrace();
			return AjaxResult.getError("系统错误！");
		}
	}
}
