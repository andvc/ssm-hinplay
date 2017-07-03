package com.hinplay.modules.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hinplay.common.PageUtil;
import com.hinplay.core.entity.GameClass;
import com.hinplay.core.entity.GamesManage;
import com.hinplay.modules.admin.service.GameClassService;
import com.hinplay.modules.admin.service.GamesManageService;

/**
 * 游戏管理
 * 
 * @author admin
 *
 */
@Controller
public class GameController {
	@Autowired
	private GamesManageService gService;
	@Autowired
	private GameClassService cService;

	// 管理
	@RequestMapping("website/admin/gameManage.action")
	public String adminGameManage(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = PageUtil.PAGESIZE + "") int size, String gname, Model m) {
		try {
			PageUtil pUtil = new PageUtil();
			pUtil.setPage(page);
			pUtil.setSize(size);
			// 获取第当前页，显示多少条内容
			PageHelper.startPage(page, size);
			List<GamesManage> list = gService.selectBySearch(gname);
			// 取记录总条数
			PageInfo<GamesManage> pageInfo = new PageInfo<>(list);
			pUtil.setTotal(pageInfo.getTotal());
			m.addAttribute("searchValue", gname);
			m.addAttribute("searchName", "gname");
			m.addAttribute("pageInfo", pUtil);
			m.addAttribute("GamesList", list);
			return "admin/game/table";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 批量删除
	@RequestMapping(value = "website/admin/game/post/batchDel", method = RequestMethod.POST)
	public String adminGamePostBatchDel(Integer[] gid, Model m) {
		try {
			if (gService.deleteBatchByPrimaryKey(gid) == gid.length) {
				m.addAttribute("msg", "批量删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 单个删除
	@RequestMapping("website/admin/game/delete/{gid}")
	public String adminGameDelete(@PathVariable(value = "gid") Integer gid, Model m) {
		try {
			if (gService.deleteByPrimaryKey(gid) > 0) {
				m.addAttribute("msg", "删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 添加
	@RequestMapping("website/admin/game/insert")
	public String adminGameInsert(Model m) {
		try {
			List<GameClass> list = cService.select();
			m.addAttribute("GameClassList", list);
			return "admin/game/add";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 添加提交
	@RequestMapping(value = "website/admin/game/post/insert", method = RequestMethod.POST)
	public String adminGamePostInsert(GamesManage gManage, String[] pictures, Model m) {
		try {
			gManage.setGpictures(JSON.toJSONString(pictures));
			if (gService.insert(gManage) > 0) {
				m.addAttribute("msg", "添加成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 修改
	@RequestMapping("website/admin/game/updata/{gid}")
	public String adminGameUpdata(@PathVariable(value = "gid") Integer gid, Model m) {
		try {
			GamesManage gManage = gService.selectWithClassById(gid);
			m.addAttribute("listPic", JSON.parseArray(gManage.getGpictures(), String.class));
			List<GameClass> classList = cService.select();
			m.addAttribute("GameClassList", classList);
			m.addAttribute("Game", gManage);
			return "admin/game/updata";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 修改提交
	@RequestMapping(value = "website/admin/game/post/updata", method = RequestMethod.POST)
	public String adminGamePostUpdata(GamesManage gManage, String[] pictures, Model m) {
		try {
			gManage.setGpictures(JSON.toJSONString(pictures));
			if (gService.update(gManage) > 0) {
				m.addAttribute("msg", "修改成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}
}
