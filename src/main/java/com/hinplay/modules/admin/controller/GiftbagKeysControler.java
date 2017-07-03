package com.hinplay.modules.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hinplay.common.FileUploadUtil;
import com.hinplay.common.PageUtil;
import com.hinplay.core.entity.GameGiftbag;
import com.hinplay.core.entity.GiftbagKeys;
import com.hinplay.modules.admin.service.GiftbagKeysService;
import com.hinplay.modules.admin.service.GiftbagService;

@Controller
public class GiftbagKeysControler {
	@Autowired
	private GiftbagService bService;
	@Autowired
	private GiftbagKeysService kService;

	// 管理
	@RequestMapping("website/admin/giftbag/cdkey")
	public String adminCdkeyManage(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = PageUtil.PAGESIZE + "") int size, Integer bid, Model m) {
		try {
			List<GameGiftbag> giftbags = bService.select();
			// GiftBagList
			PageUtil pUtil = new PageUtil();
			pUtil.setPage(page);
			pUtil.setSize(size);
			// 获取第当前页，显示多少条内容
			PageHelper.startPage(page, size);
			List<GiftbagKeys> list = kService.selectBySearch(bid);
			// 取记录总条数
			PageInfo<GiftbagKeys> pageInfo = new PageInfo<>(list);
			pUtil.setTotal(pageInfo.getTotal());
			m.addAttribute("GiftBagList", giftbags);
			m.addAttribute("searchValue", bid);
			m.addAttribute("searchName", "bid");
			m.addAttribute("pageInfo", pUtil);
			m.addAttribute("cdkeyList", list);
			return "admin/cdkey/table";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 批量删除
	@RequestMapping(value = "website/admin/cdkey/post/batchDel", method = RequestMethod.POST)
	public String adminCdkeyPostBatchDel(Integer[] kid, Model m) {
		try {
			if (kService.deleteBatchByPrimaryKey(kid) == kid.length) {
				m.addAttribute("msg", "批量删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 单个删除
	@RequestMapping("website/admin/cdkey/delete/{kid}")
	public String adminCdkeyDelete(@PathVariable(value = "kid") Integer kid, Model m) {
		try {
			if (kService.deleteByPrimaryKey(kid) > 0) {
				m.addAttribute("msg", "删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 添加
	@RequestMapping("website/admin/cdkey/insert")
	public String adminCdkeyInsert(Model m) {
		try {
			List<GameGiftbag> list = bService.select();
			m.addAttribute("GiftBagList", list);
			return "admin/cdkey/add";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 添加提交
	@RequestMapping(value = "website/admin/cdkey/post/insert", method = RequestMethod.POST)
	public String adminCdkeyPostInsert(GiftbagKeys keys, Model m) {
		try {
			if (kService.insert(keys) > 0) {
				m.addAttribute("msg", "添加成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 修改
	@RequestMapping("website/admin/cdkey/updata/{kid}")
	public String adminCdkeyUpdata(@PathVariable(value = "kid") Integer kid, Model m) {
		try {
			GiftbagKeys keys = kService.selectById(kid);
			List<GameGiftbag> giftbags = bService.select();
			m.addAttribute("GiftBag", keys);
			m.addAttribute("GiftBagList", giftbags);
			return "admin/cdkey/updata";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 修改提交
	@RequestMapping(value = "website/admin/cdkey/post/updata", method = RequestMethod.POST)
	public String adminGiftbagPostUpdata(GiftbagKeys keys, Model m) {
		try {
			if (kService.update(keys) > 0) {
				m.addAttribute("msg", "修改成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 导入
	@RequestMapping("website/admin/cdkey/import")
	public String adminCdkeyImport(Model m) {
		try {
			List<GameGiftbag> list = bService.select();
			m.addAttribute("GiftBagList", list);
			return "admin/cdkey/import";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 导入提交
	@RequestMapping("website/admin/cdkey/post/import")
	public String adminCdkeyUpdata(@RequestParam MultipartFile keysFlie, GiftbagKeys keys, Model m) {
		try {
			List<String> sList = FileUploadUtil.getFileList(keysFlie);
			if (sList.size() > 0) {
				List<GiftbagKeys> keyList = new ArrayList<>();
				for (String strK : sList) {
					GiftbagKeys gkeys = new GiftbagKeys();
					gkeys.setKkey(strK);
					gkeys.setBid(keys.getBid());
					gkeys.setIsused(keys.getIsused());
					keyList.add(gkeys);
				}
				if (kService.insertBatch(keyList) == sList.size()) {
					m.addAttribute("msg", "导入成功!");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}
}
