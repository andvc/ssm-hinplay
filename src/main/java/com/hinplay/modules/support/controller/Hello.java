package com.hinplay.modules.support.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Hello {

	@RequestMapping("hello")
	public String TestHello(Model m) {
		m.addAttribute("msg", "TestHello！");
		return "admin/message";
	}
}
