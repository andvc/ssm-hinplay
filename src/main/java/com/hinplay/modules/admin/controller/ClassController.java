package com.hinplay.modules.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hinplay.core.entity.GameClass;
import com.hinplay.modules.admin.service.GameClassService;

/**
 * 游戏分类
 * 
 * @author admin
 *
 */
@Controller
public class ClassController {
	@Autowired
	private GameClassService cService;

	// 管理
	@RequestMapping("website/admin/gameClass.action")
	public String adminClassManage(Model m) {
		try {
			List<GameClass> list = cService.select();
			m.addAttribute("GameClassList", list);
			return "admin/class/table";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 批量删除
	@RequestMapping(value = "website/admin/class/post/batchDel", method = RequestMethod.POST)
	public String adminClassPostBatchDel(Integer[] cid, Model m) {
		try {
			if (cService.deleteBatchByPrimaryKey(cid) == cid.length) {
				m.addAttribute("msg", "批量删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 单个删除
	@RequestMapping("website/admin/class/delete/{cid}")
	public String adminClassDelete(@PathVariable(value = "cid") Integer cid, Model m) {
		try {
			if (cService.deleteByPrimaryKey(cid) > 0) {
				m.addAttribute("msg", "删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 添加
	@RequestMapping("website/admin/class/insert")
	public String adminClassInsert() {
		return "admin/class/add";
	}

	// 添加提交
	@RequestMapping(value = "website/admin/class/post/insert", method = RequestMethod.POST)
	public String adminClassPostInsert(GameClass gClass, Model m) {
		try {
			if (cService.insert(gClass) > 0) {
				m.addAttribute("msg", "添加成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 修改
	@RequestMapping(value = "website/admin/class/updata/{cid}")
	public String adminClassUpdata(@PathVariable(value = "cid") Integer cid, Model m) {
		try {
			GameClass gClass = cService.selectById(cid);
			m.addAttribute("GameClass", gClass);
			return "admin/class/updata";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 修改提交
	@RequestMapping(value = "website/admin/class/post/updata", method = RequestMethod.POST)
	public String adminClassPostUpdata(GameClass gClass, Model m) {
		try {
			if (cService.updateByPrimaryKeySelective(gClass) > 0) {
				m.addAttribute("msg", "修改成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}
}
