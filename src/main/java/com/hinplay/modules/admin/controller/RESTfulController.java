package com.hinplay.modules.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 静态地址
 * 
 * @author admin
 *
 */
@Controller
public class RESTfulController {

	// 后台主页
	@RequestMapping("website/admin/index.action")
	public String adminIndex() {
		return "admin/index";
	}
}
