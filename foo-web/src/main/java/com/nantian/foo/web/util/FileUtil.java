package com.nantian.foo.web.util;

import java.io.File;

/**
 * 文件工具类
 * @author nt-sp
 *
 */
public class FileUtil {
	
	public FileUtil() {
		
	}
	
	/**
	 * 判断文件夹是否存在,不存在则创建
	 * @param file
	 * @return true是文件夹,false是文件
	 */
	public static boolean judeDirExists(String dirPath) {
		File file = new File(dirPath);
        if (file.exists()) {
            if (file.isDirectory()) {
            	return true;
            } else {
            	return false;
            }
        } else {
            file.mkdirs();
            return true;
        }

    }
	
	/**
	 * 判断文件是否存在
	 * @param file
	 * @return true 文件存在，并且为文件；false 文件不存在或是文件夹
	 */
	public static boolean judeFileExists(File file) {

        if (file.exists()) {
        	if(file.isFile()){
        		return true;
        	}
        } else {
//            try {
//                file.createNewFile();
//            } catch (Exception e) {
//            	e.printStackTrace();
//            }
        }
        
        return false;

    }
}
