package com.hinplay.modules.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hinplay.common.CommonUtil;
import com.hinplay.core.entity.PictureManage;
import com.hinplay.modules.admin.service.OssManageService;
import com.hinplay.modules.admin.service.PictureService;

@Controller
public class EditController {
	@Value("#{config.WebHost}")
	private String webHost;
	@Value("#{config.OssUrlPath}")
	private String ossUrlPath;
	@Autowired
	private OssManageService oService;
	@Autowired
	private PictureService pService;

	// 上传（添加）JSON
	@RequestMapping(value = "website/admin/editor/post/upload", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminEditPostUpload(@RequestParam MultipartFile imgFile) {
		Map<String, Object> rMap = new HashMap<>();
		try {
			if (imgFile.isEmpty()) {
				rMap.put("error", 1);
				rMap.put("message", "参数错误！");
				return rMap;
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
				rMap.put("error", 0);
				rMap.put("url", pManage.getUrlpath());
				return rMap;
			}
			rMap.put("error", 1);
			rMap.put("message", "上传出错！");
			return rMap;
		} catch (Exception e) {
			e.printStackTrace();
			rMap.put("error", 1);
			rMap.put("message", "上传出错！");
			return rMap;
		}
	}

	// 获取服务器文件JSON
	@RequestMapping("website/admin/editor/get/file")
	@ResponseBody
	public Map<String, Object> adminEditorGetFile(String dir, String order) {
		Map<String, Object> rMap = new HashMap<>();
		try {
			if (dir.equals("image")) {
				if (order.equalsIgnoreCase("NAME")) {
					order = "pName";
				} else if (order.equalsIgnoreCase("SIZE")) {
					order = "pSize";
				} else {
					order = "pType";
				}
				List<PictureManage> listPic = pService.selectByShowAndOrder(order);
				if (listPic.size() > 0) {
					rMap.put("current_url", "");
					rMap.put("total_count", listPic.size());
					List<Map<String, Object>> lMaps = new ArrayList<>();
					for (PictureManage pManage : listPic) {
						Map<String, Object> map = new HashMap<>();
						map.put("filesize", pManage.getPsize());
						map.put("is_photo", true);
						map.put("filetype", pManage.getPtype());
						map.put("filename", pManage.getUrlpath());
						map.put("datetime",
								CommonUtil.parseLongToDate("yyyy-MM-dd HH:mm:ss", pManage.getCreatetime().getTime()));
						lMaps.add(map);
					}
					rMap.put("file_list", lMaps);
				}
			}
			return rMap;
		} catch (Exception e) {
			e.printStackTrace();
			return rMap;
		}
	}
}
