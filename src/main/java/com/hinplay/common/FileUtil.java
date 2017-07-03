package com.hinplay.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class FileUtil {
	/**
	 * 读取文本文件
	 * 
	 * @param mFiles
	 * @return
	 */
	public static String fileRead(InputStream fis) {
		StringBuffer sBuffer = new StringBuffer();
		InputStreamReader isr = null;
		BufferedReader br = null;
		String content;
		String charSet = "utf-8";
		try {
			isr = new InputStreamReader(fis, charSet);
			br = new BufferedReader(isr);
			while ((content = br.readLine()) != null) {
				sBuffer.append(content + "\r\n");
			}
			br.close();
			isr.close();
			fis.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
					fis = null;
				} catch (IOException e) {
				}
			}
			if (isr != null) {
				try {
					isr.close();
					isr = null;
				} catch (IOException e) {
				}
			}
			if (br != null) {
				try {
					br.close();
					br = null;
				} catch (IOException e) {
				}
			}
			content = null;
		}
		return sBuffer.toString();
	}
}
