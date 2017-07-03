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
import com.hinplay.core.entity.GameGiftbag;
import com.hinplay.core.entity.GamesManage;
import com.hinplay.modules.admin.service.GamesManageService;
import com.hinplay.modules.admin.service.GiftbagService;

@Controller
public class GiftbagController {
	@Autowired
	private GiftbagService bService;
	@Autowired
	private GamesManageService gService;

	// 管理
	@RequestMapping("website/admin/giftBagManage.action")
	public String adminGiftBagManage(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = PageUtil.PAGESIZE + "") int size, Integer gid, Model m) {
		try {
			List<GamesManage> glist = gService.select();
			PageUtil pUtil = new PageUtil();
			pUtil.setPage(page);
			pUtil.setSize(size);
			// 获取第当前页，显示多少条内容
			PageHelper.startPage(page, size);
			List<GameGiftbag> list = bService.selectBySearch(gid);
			// 取记录总条数
			PageInfo<GameGiftbag> pageInfo = new PageInfo<>(list);
			pUtil.setTotal(pageInfo.getTotal());
			m.addAttribute("GamesList", glist);
			m.addAttribute("searchValue", gid);
			m.addAttribute("searchName", "gid");
			m.addAttribute("pageInfo", pUtil);
			m.addAttribute("GiftBagList", list);
			return "admin/giftbag/table";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 批量删除
	@RequestMapping(value = "website/admin/giftbag/post/batchDel", method = RequestMethod.POST)
	public String adminGiftBagPostBatchDel(Integer[] bid, Model m) {
		try {
			if (bService.deleteBatchByPrimaryKey(bid) == bid.length) {
				m.addAttribute("msg", "批量删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 单个删除
	@RequestMapping("website/admin/giftbag/delete/{bid}")
	public String adminGiftbagDelete(@PathVariable(value = "bid") Integer bid, Model m) {
		try {
			if (bService.deleteByPrimaryKey(bid) > 0) {
				m.addAttribute("msg", "删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 添加
	@RequestMapping("website/admin/giftbag/insert")
	public String adminGiftbagInsert(Model m) {
		try {
			List<GamesManage> list = gService.select();
			m.addAttribute("GamesList", list);
			return "admin/giftbag/add";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 添加提交
	@RequestMapping(value = "website/admin/giftbag/post/insert", method = RequestMethod.POST)
	public String adminGiftbagPostInsert(GameGiftbag gbag, Model m) {
		try {
			if (bService.insert(gbag) > 0) {
				m.addAttribute("msg", "添加成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 修改
	@RequestMapping("website/admin/giftbag/updata/{bid}")
	public String adminGiftbagUpdata(@PathVariable(value = "bid") Integer bid, Model m) {
		try {
			GameGiftbag gBag = bService.selectById(bid);
			List<GamesManage> gManage = gService.select();
			m.addAttribute("GiftBag", gBag);
			m.addAttribute("GamesList", gManage);
			return "admin/giftbag/updata";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 修改提交
	@RequestMapping(value = "website/admin/giftbag/post/updata", method = RequestMethod.POST)
	public String adminGiftbagPostUpdata(GameGiftbag gBag, Model m) {
		try {
			if (bService.update(gBag) > 0) {
				m.addAttribute("msg", "修改成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}
}
