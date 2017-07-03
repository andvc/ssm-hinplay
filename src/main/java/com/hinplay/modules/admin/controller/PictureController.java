package com.hinplay.modules.admin.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hinplay.common.CommonUtil;
import com.hinplay.common.PageUtil;
import com.hinplay.core.ajaxResult.AjaxResult;
import com.hinplay.core.entity.PictureManage;
import com.hinplay.modules.admin.service.OssManageService;
import com.hinplay.modules.admin.service.PictureService;

/**
 * 图片管理
 * 
 * @author admin
 *
 */
@Controller
public class PictureController {
	@Value("#{config.WebHost}")
	private String webHost;
	@Value("#{config.OssUrlPath}")
	private String ossUrlPath;
	@Autowired
	private OssManageService oService;
	@Autowired
	private PictureService pService;

	// 管理
	@RequestMapping("website/admin/pictureManage.action")
	public String adminPictureManage(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = PageUtil.PAGESIZE + "") int size, Model m) {
		try {
			PageUtil pUtil = new PageUtil();
			pUtil.setPage(page);
			pUtil.setSize(size);
			// 获取第当前页，显示多少条内容
			PageHelper.startPage(page, size);
			List<PictureManage> list = pService.select();
			// 取记录总条数
			PageInfo<PictureManage> pageInfo = new PageInfo<>(list);
			pUtil.setTotal(pageInfo.getTotal());
			m.addAttribute("pageInfo", pUtil);
			m.addAttribute("pictureList", list);
			return "admin/picture/table";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 选择（添加）
	@RequestMapping("website/admin/picture/pictureSelect.action")
	public String adminPictureSelect(@RequestParam(defaultValue = "radio") String type, Model m) {
		try {
			List<PictureManage> list = pService.selectByShow();
			m.addAttribute("pictureList", list);
			m.addAttribute("type", type.equals("radio") ? "radio" : "checkbox");
			return "admin/picture/select";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 上传（添加）JSON
	@RequestMapping(value = "website/admin/picture/post/upload", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult adminPicturePostUpload(@RequestParam MultipartFile imgFile) {
		try {
			if (imgFile.isEmpty()) {
				return AjaxResult.getError("参数错误！");
			}
			PictureManage pManage = new PictureManage();
			String originalname = imgFile.getOriginalFilename();
			// 获取文件后缀
			String prefix = originalname.substring(originalname.lastIndexOf(".") + 1);
			// 根据时间设置名字
			String fileName = CommonUtil.getUUID() + "." + prefix;
			String ossKey = oService.uploadFile(fileName, imgFile.getContentType(), imgFile.getInputStream());
			pManage.setIsshow(1);
			pManage.setPname(originalname);
			pManage.setPsize(imgFile.getSize());
			pManage.setPtype(prefix);
			pManage.setOsskey(ossKey);
			pManage.setUrlpath(ossUrlPath + "/" + ossKey);
			if (pService.insert(pManage) > 0) {
				return AjaxResult.getSuccess("上传成功！", pManage);
			}
			return AjaxResult.getError("上传出错！");
		} catch (Exception e) {
			e.printStackTrace();
			return AjaxResult.getError("上传出错！");
		}
	}

	// 批量删除
	@RequestMapping(value = "website/admin/picture/post/batchDel", method = RequestMethod.POST)
	public String adminPicturePostBatchDel(Integer[] pid, Model m) {
		try {
			List<PictureManage> list = pService.selectSetByKey(pid);
			List<String> keys = new ArrayList<String>();
			for (PictureManage pManage : list) {
				keys.add(pManage.getOsskey());
			}
			boolean isDel = oService.deleteBatchFile(keys);
			if (isDel) {
				if (pService.deleteBatchByPrimaryKey(pid) == pid.length) {
					m.addAttribute("msg", "批量删除成功！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 单个删除
	@RequestMapping("website/admin/picture/delete/{pid}")
	public String adminPictureDelete(@PathVariable(value = "pid") Integer pid, Model m) {
		try {
			PictureManage pManage = pService.selectById(pid);
			boolean isDel = oService.deleteFile(pManage.getOsskey());
			if (isDel) {
				if (pService.deleteByPrimaryKey(pid) > 0) {
					m.addAttribute("msg", "删除成功！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}

	// 修改
	@RequestMapping(value = "website/admin/picture/updata/{pid}")
	public String adminPictureUpdata(@PathVariable(value = "pid") Integer pid, Model m) {
		try {
			PictureManage pManage = pService.selectById(pid);
			m.addAttribute("picture", pManage);
			return "admin/picture/updata";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
			return "admin/message";
		}
	}

	// 修改提交
	@RequestMapping(value = "website/admin/picture/post/updata", method = RequestMethod.POST)
	public String adminPicturePostUpdata(PictureManage pManage, @RequestParam MultipartFile imgFile, Model m) {
		try {
			if (!imgFile.isEmpty()) {
				String key = pService.selectById(pManage.getPid()).getOsskey();
				if (oService.deleteFile(key)) {
					String originalname = imgFile.getOriginalFilename();
					// 获取文件后缀
					String prefix = originalname.substring(originalname.lastIndexOf(".") + 1);
					String fileName = CommonUtil.getUUID() + "." + prefix;
					String ossKey = oService.uploadFile(fileName, imgFile.getContentType(), imgFile.getInputStream());
					pManage.setUrlpath(ossUrlPath + "/" + ossKey);
					pManage.setOsskey(ossKey);
					pManage.setPsize(imgFile.getSize());
					pManage.setPtype(prefix);
					pManage.setCreatetime(new Timestamp(System.currentTimeMillis()));
				}
			}
			if (pService.updateByPrimaryKeySelective(pManage) > 0) {
				m.addAttribute("msg", "修改成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "系统错误！");
		}
		return "admin/message";
	}
}
