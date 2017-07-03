package com.hinplay.modules.admin.service.impl;

import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.DeleteObjectsRequest;
import com.hinplay.common.CommonUtil;
import com.hinplay.common.FileTypeUtil;
import com.hinplay.modules.admin.service.OssManageService;

@Service
public class OssManageServiceImpl implements OssManageService {
	@Value("#{config.OssAppId}")
	private String ossAppId;
	@Value("#{config.OssAppKey}")
	private String ossAppKey;
	@Value("#{config.OssEndpoint}")
	private String ossEndpoint;
	@Value("#{config.OssBucketName}")
	private String ossBucketName;
	@Value("#{config.OssUploadPath}")
	private String ossUploadPath;
	@Value("#{config.OssImgPath}")
	private String ossImgPath;
	@Value("#{config.OssFilePath}")
	private String ossFilePath;
	@Value("#{config.OssUrlPath}")
	private String ossUrlPath;

	@Override
	public String uploadFile(String key, String type, InputStream inputStream) {
		// 创建OSSClient实例
		OSSClient client = new OSSClient(ossEndpoint, ossAppId, ossAppKey);
		try {
			String nowTime = CommonUtil.parseLongToDate("yyyyMMdd", System.currentTimeMillis());
			if (FileTypeUtil.isImages(type)) {
				key = ossUploadPath + "/" + ossImgPath + "/" + nowTime + "/" + key;
			} else {
				key = ossUploadPath + "/" + ossFilePath + "/" + nowTime + "/" + key;
			}
			client.putObject(ossBucketName, key, inputStream);
		} finally {
			// 关闭client
			client.shutdown();
		}
		return key;
	}

	@Override
	public boolean deleteFile(String key) {
		boolean flag = false;
		// 创建OSSClient实例
		OSSClient client = new OSSClient(ossEndpoint, ossAppId, ossAppKey);
		try {
			// 删除Object
			client.deleteObject(ossBucketName, key);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭client
			client.shutdown();
		}
		return flag;
	}

	@Override
	public boolean deleteBatchFile(List<String> keys) {
		boolean flag = false;
		// 创建OSSClient实例
		OSSClient client = new OSSClient(ossEndpoint, ossAppId, ossAppKey);
		try {
			client.deleteObjects(new DeleteObjectsRequest(ossBucketName).withKeys(keys));
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭client
			client.shutdown();
		}
		return flag;
	}

}
