package com.hinplay.modules.admin.service;

import java.io.InputStream;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface OssManageService {
	// 文件上传
	String uploadFile(String key, String type, InputStream inputStream);

	// 删除文件
	boolean deleteFile(String key);

	// 批量删除文件
	boolean deleteBatchFile(List<String> keys);
}
