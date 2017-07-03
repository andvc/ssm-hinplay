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
import com.hinplay.core.entity.SlideManage;
import com.hinplay.modules.admin.service.SlideManageService;

/**
 * 幻灯片管理
 * 
 * @author admin
 *
 */
@Controller
public class SlideController {
	@Autowired
	private SlideManageService sService;

	// 管理
	@RequestMapping("website/admin/slideManage.action")
	public String adminSlideManage(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = PageUtil.PAGESIZE + "") int size, Model m) {
		try {
			PageUtil pUtil = new PageUtil();
			pUtil.setPage(page);
			pUtil.setSize(size);
			// 获取第当前页，显示多少条内容
			PageHelper.startPage(page, size);
			List<SlideManage> list = sService.select();
			// 取记录总条数
			PageInfo<SlideManage> pageInfo = new PageInfo<>(list);
			pUtil.setTotal(pageInfo.getTotal());
			m.addAttribute("pageInfo", pUtil);
			m.addAttribute("SlideList", list);
			return "admin/slide/table";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 批量删除
	@RequestMapping(value = "website/admin/slide/post/batchDel", method = RequestMethod.POST)
	public String adminSlidePostBatchDel(Integer[] sid, Model m) {
		try {
			if (sService.deleteBatchByPrimaryKey(sid) == sid.length) {
				m.addAttribute("msg", "批量删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 单个删除
	@RequestMapping("website/admin/slide/delete/{sid}")
	public String adminSlideDelete(@PathVariable(value = "sid") Integer sid, Model m) {
		try {
			if (sService.deleteByPrimaryKey(sid) > 0) {
				m.addAttribute("msg", "删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 添加
	@RequestMapping("website/admin/slide/insert")
	public String adminSlideInsert() {
		return "admin/slide/add";
	}

	// 添加提交
	@RequestMapping(value = "website/admin/slide/post/insert", method = RequestMethod.POST)
	public String adminSlidePostInsert(SlideManage sManage, Model m) {
		try {
			if (sService.insert(sManage) > 0) {
				m.addAttribute("msg", "添加成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 修改
	@RequestMapping(value = "website/admin/slide/updata/{sid}")
	public String adminSlideUpdata(@PathVariable(value = "sid") Integer sid, Model m) {
		try {
			SlideManage slide = sService.selectById(sid);
			m.addAttribute("Slide", slide);
			return "admin/slide/updata";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 修改提交
	@RequestMapping(value = "website/admin/slide/post/updata", method = RequestMethod.POST)
	public String adminSlidePostUpdata(SlideManage slide, Model m) {
		try {
			if (sService.updateByPrimaryKeySelective(slide) > 0) {
				m.addAttribute("msg", "修改成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}
}
