package com.hinplay.modules.admin.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hinplay.core.entity.MasterManage;
import com.hinplay.modules.admin.service.MasterManageService;

/**
 * 站务管理
 * 
 * @author admin
 *
 */
@Controller
public class MasterController {
	@Value("#{config.WebHost}")
	private String webHost;
	@Autowired
	private MasterManageService mService;

	// 站务管理
	@RequestMapping("website/admin/masterManage.action")
	public String adminMasterManage(Model m) {
		try {
			List<MasterManage> list = mService.select();
			m.addAttribute("MasterList", list);
			return "admin/master/table";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 批量删除
	@RequestMapping(value = "website/admin/master/post/batchDel", method = RequestMethod.POST)
	public String adminMasterPostBatchDel(Integer[] wid, Model m) {
		try {
			if (mService.deleteBatchByPrimaryKey(wid) == wid.length) {
				m.addAttribute("msg", "批量删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 单个删除
	@RequestMapping("website/admin/master/delete/{wid}")
	public String adminMasterDelete(@PathVariable(value = "wid") Integer cid, Model m) {
		try {
			if (mService.deleteByPrimaryKey(cid) > 0) {
				m.addAttribute("msg", "删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 添加
	@RequestMapping("website/admin/master/insert")
	public String adminMasterInsert(Model m) {
		m.addAttribute("webhost", webHost);
		return "admin/master/add";
	}

	// 添加提交
	@RequestMapping(value = "website/admin/master/post/insert", method = RequestMethod.POST)
	public String adminMasterPostInsert(MasterManage mManage, Model m) {
		try {
			if (mService.insert(mManage) > 0) {
				m.addAttribute("msg", "添加成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 修改
	@RequestMapping(value = "website/admin/master/updata/{wid}")
	public String adminMasterUpdata(@PathVariable(value = "wid") Integer wid, Model m) {
		try {
			MasterManage master = mService.selectWithBlobsByPrimaryKey(wid);
			m.addAttribute("Master", master);
			m.addAttribute("webhost", webHost);
			return "admin/master/updata";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 修改提交
	@RequestMapping(value = "website/admin/master/post/updata", method = RequestMethod.POST)
	public String adminMasterPostUpdata(MasterManage master, Model m) {
		try {
			master.setWtime(new Timestamp(System.currentTimeMillis()));
			if (mService.updateByPrimaryKeySelective(master) > 0) {
				m.addAttribute("msg", "修改成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}
}
