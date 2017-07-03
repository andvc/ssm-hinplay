package com.hinplay.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	/**
	 * 读取一个文件，获得每行的值，放入一个list里面
	 * 
	 * @param mFiles
	 * @return
	 */
	public static List<String> getFileList(MultipartFile mFiles) {
		List<String> list = new ArrayList<String>();
		String readStr = null;
		try {
			readStr = FileUtil.fileRead(mFiles.getInputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (readStr != null && !readStr.trim().equals("")) {
			String[] strArry = readStr.replace("\r", "").split("\n");
			for (int i = 0; i < strArry.length; i++) {
				if (!strArry[i].trim().equals("")) {
					list.add(strArry[i].trim());
				}
			}
		}
		return list;
	}
}
