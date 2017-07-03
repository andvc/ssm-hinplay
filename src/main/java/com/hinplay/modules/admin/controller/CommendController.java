package com.hinplay.modules.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hinplay.common.PageUtil;
import com.hinplay.core.entity.GamesManage;
import com.hinplay.modules.admin.service.CommendService;
import com.hinplay.modules.admin.service.GamesManageService;

@Controller
public class CommendController {
	@Autowired
	private CommendService cService;
	@Autowired
	private GamesManageService gService;

	// 管理
	@RequestMapping("website/admin/commend/{type}")
	public String adminCommendManage(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = PageUtil.PAGESIZE + "") int size, @PathVariable(value = "type") String type,
			Model m) {
		try {
			PageUtil pUtil = new PageUtil();
			pUtil.setPage(page);
			pUtil.setSize(size);
			// 获取第当前页，显示多少条内容
			PageHelper.startPage(page, size);
			List<GamesManage> list = cService.selectByType(type);
			// 取记录总条数
			PageInfo<GamesManage> pageInfo = new PageInfo<>(list);
			pUtil.setTotal(pageInfo.getTotal());
			m.addAttribute("type", type);
			if (type.equalsIgnoreCase("hot")) {
				m.addAttribute("text", "添加热门游戏");
			} else if (type.equalsIgnoreCase("nice")) {
				m.addAttribute("text", "添加精品游戏");
			} else {
				m.addAttribute("text", "添加最新游戏");
			}
			m.addAttribute("pageInfo", pUtil);
			m.addAttribute("GamesList", list);
			return "admin/commend/table";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 单个删除（更新）
	@RequestMapping("website/admin/commend/{type}/delete/{gid}")
	public String adminCommendDelete(@PathVariable(value = "type") String type,
			@PathVariable(value = "gid") Integer gid, Model m) {
		try {
			if (cService.updateByPrimaryKeySelective(type, gid, true) > 0) {
				m.addAttribute("msg", "删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 批量删除（更新）
	@RequestMapping(value = "website/admin/commend/post/batchDel", method = RequestMethod.POST)
	public String adminCommendPostBatchDel(String type, Integer[] gid, Model m) {
		try {
			if (cService.updateBatchByPrimaryKeySelective(type, gid, true) == gid.length) {
				m.addAttribute("msg", "批量删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 添加
	@RequestMapping("website/admin/commend/{type}/insert")
	public String adminCommendInsert(@PathVariable(value = "type") String type, Model m) {
		try {
			List<GamesManage> list = gService.select();
			m.addAttribute("GamesList", list);
			m.addAttribute("type", type);
			return "admin/commend/add";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 添加提交
	@RequestMapping(value = "website/admin/commend/post/insert", method = RequestMethod.POST)
	public String adminCommendPostInsert(String type, Integer gid, Model m) {
		try {
			if (cService.updateByPrimaryKeySelective(type, gid, false) > 0) {
				m.addAttribute("msg", "添加成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}
}
