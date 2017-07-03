package com.hinplay.common;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;
import java.util.UUID;

import javax.imageio.ImageIO;

public class CommonUtil {

	/**
	 * 返回一个字符串大写 64位的UUID
	 * 
	 * @return
	 */
	public static String getUpperUUID64() {
		return CommonUtil.getUUID64().toUpperCase();
	}

	/**
	 * 返回一个32位大写的uuid
	 * 
	 * @return
	 */
	public static String getUpperUUID() {
		return CommonUtil.getUUID().toUpperCase();
	}

	/**
	 * 返回一个字符串小写 64位的UUID
	 * 
	 * @return
	 */
	public static String getUUID64() {
		return CommonUtil.getUUID() + CommonUtil.getUUID();
	}

	/**
	 * 返回一个字符串小写 32位的UUID
	 * 
	 * @return
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}

	/**
	 * 计算出一个16位MD5的加密结果
	 * 
	 * @param string
	 *            需要加密的字符串
	 * @return
	 */
	public static String strTo16MD5Case(String string) {
		return CommonUtil.strTo32MD5Case(string).substring(8, 24);
	}

	/**
	 * 计算出一个32位MD5的加密结果
	 * 
	 * @param string
	 *            需要加密的字符串
	 * @return
	 */
	public static String strTo32MD5Case(String string) {
		string = "";
		StringBuffer buf = new StringBuffer("");
		try {
			// 生成实现指定摘要算法的 MessageDigest 对象。
			MessageDigest md = MessageDigest.getInstance("MD5");
			// 使用指定的字节数组更新摘要。
			md.update(string.getBytes());
			// 通过执行诸如填充之类的最终操作完成哈希计算。
			byte b[] = md.digest();
			// 生成具体的md5密码到buf数组
			int i;
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buf.toString();
	}

	/**
	 * 获取Properties配置文件返回Map
	 * 
	 * @return
	 */
	public static Map<String, String> PropertiesParseToMap(String pathName) {
		Properties properties = new Properties();
		InputStream is = CommonUtil.class.getClassLoader().getResourceAsStream(pathName);
		try {
			properties.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		@SuppressWarnings({ "unchecked", "rawtypes" })
		Map<String, String> map = new HashMap<String, String>((Map) properties);
		Set<Entry<String, String>> propertySet = map.entrySet();
		for (Object o : propertySet) {
			@SuppressWarnings({ "rawtypes", "unused" })
			Map.Entry entry = (Map.Entry) o;
		}
		return map;
	}

	/**
	 * 把毫秒转化成日期
	 * 
	 * @param dateFormat(日期格式，例如：MM/
	 *            dd/yyyy HH:mm:ss)
	 * @param millSec(毫秒数)
	 * @return
	 */
	public static String parseLongToDate(String dateFormat, Long millSec) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		Date date = new Date(millSec);
		return sdf.format(date);
	}

	/**
	 * byte(字节)根据长度转成kb(千字节)和mb(兆字节)
	 * 
	 * @param bytes
	 * @return
	 */
	public static String parsebytesToKbOrMb(long bytes) {
		BigDecimal filesize = new BigDecimal(bytes);
		BigDecimal megabyte = new BigDecimal(1024 * 1024);
		float returnValue = filesize.divide(megabyte, 2, BigDecimal.ROUND_UP).floatValue();
		if (returnValue > 1)
			return (returnValue + "MB");
		BigDecimal kilobyte = new BigDecimal(1024);
		returnValue = filesize.divide(kilobyte, 2, BigDecimal.ROUND_UP).floatValue();
		return (returnValue + "KB");
	}

	/**
	 * 去掉字符串的换行和制表符
	 * 
	 * @param str
	 * @return
	 */
	public static String replaceLineAndTab(String str) {
		String dest = "";
		if (str != null) {
			dest = str.replaceAll("\t|\r|\n", "");
		}
		return dest;
	}

	/**
	 * 将一个数组转换为字符串
	 * 
	 * @param objects
	 *            数组
	 * @param separator
	 *            分隔符
	 * @return
	 */
	public static String ReadArrtoString(Object[] objects, String separator) {
		StringBuffer sBuffer = new StringBuffer();
		for (Object object : objects) {
			sBuffer.append(object);
			sBuffer.append(separator);
		}
		return sBuffer.substring(0, sBuffer.length() - 1);
	}

	/**
	 * 将一个字符串数组转换成整形数组
	 * 
	 * @param arr
	 * @return
	 */
	public static Integer[] strArrayTointArray(String[] arr) {
		Integer[] intArr = new Integer[arr.length];
		for (int i = 0; i < arr.length; i++) {
			intArr[i] = Integer.parseInt(arr[i]);
		}
		return intArr;
	}

	/**
	 * 生成一个指定区间的随机数
	 * 
	 * @param min
	 * @param max
	 * @return
	 */
	public static int getRandomScope(int min, int max) {
		return min + (int) (Math.random() * ((max - min) + 1));
	}

	/**
	 * 获取手机短信验证码（6位）
	 * 
	 * @return
	 */
	public static String getSMSCode() {
		return String.valueOf(getRandomScope(100000, 999999));
	}

	/**
	 * 通过读取文件并获取其width及height的方式，来判断判断当前文件是否图片，这是一种非常简单的方式。
	 * 
	 * @param imageFile
	 * @return
	 */
	public static boolean isImage(File imageFile) {
		if (!imageFile.exists()) {
			return false;
		}
		Image img = null;
		try {
			img = ImageIO.read(imageFile);
			if (img == null || img.getWidth(null) <= 0 || img.getHeight(null) <= 0) {
				return false;
			}
			return true;
		} catch (Exception e) {
			return false;
		} finally {
			img = null;
		}
	}
}
