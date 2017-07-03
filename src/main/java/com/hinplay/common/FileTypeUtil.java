package com.hinplay.common;

import java.util.Arrays;
import java.util.List;

public class FileTypeUtil {
	// 图片类型
	public static final List<String> IMAGES_TYPES = Arrays.asList("image/jpg", "image/jpeg", "image/png", "image/gif");

	// 校验文件类型是否是图片类型
	public static boolean isImages(String postfix) {
		return IMAGES_TYPES.contains(postfix);
	}
}
