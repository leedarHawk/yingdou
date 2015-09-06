package com.zmsport.iyuesai.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件通用类
 * 
 * @author bilei
 *
 */
public final class FileUtil {
	
	private static Logger log = LoggerFactory.getLogger(FileUtil.class);

	/**
	 * 上传图片目录
	 */
	public static final String UPLOAD_DIR = "upload";

	/**
	 * 比赛图片目录
	 */
	public static final String GAME_DIR = "game";

	/**
	 * 球队图片目录
	 */
	public static final String TEAM_DIR = "team";

	/**
	 * 上传比赛图片文件
	 * 
	 * @param file
	 * @param realPath
	 * @param rootPath
	 * @return
	 */
	@SuppressWarnings("finally")
	public static String uploadGamePic(MultipartFile file, String realPath) {
		String fileName = "game_" + System.currentTimeMillis() + "."
				+ file.getOriginalFilename().split("\\.")[1];
		String absolutePath = realPath + File.separator + UPLOAD_DIR
				+ File.separator + GAME_DIR;
		String relativePath = File.separator + UPLOAD_DIR + File.separator
				+ GAME_DIR;
		File targetFile = new File(absolutePath, fileName);
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return relativePath + File.separator + fileName;
		}
	}

	/**
	 * 上传球队logo
	 * 
	 * @param file
	 * @param realPath
	 * @param rootPath
	 * @return
	 */
	@SuppressWarnings("finally")
	public static String uploadTeamLogo(MultipartFile file, String realPath,
			String name, long creatorId) {
		String dirName = name + "_" + creatorId;
		String fileName = "logo" + "."
				+ file.getOriginalFilename().split("\\.")[1];
		String relativePath = File.separator + UPLOAD_DIR + File.separator
				+ TEAM_DIR + File.separator + dirName + File.separator + "logo";
		String absolutePath = realPath + relativePath;
		File dir = new File(absolutePath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		File targetFile = new File(absolutePath, fileName);
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return relativePath + File.separator + fileName;
		}
	}
	
	/**
	 * 上传球队照片
	 * @param path
	 * @param teamDir
	 * @param b
	 * @return
	 */
	@SuppressWarnings("finally")
	public static String uploadTeamPics(String path, String teamDir, BufferedImage bi) {
		String fileName = System.currentTimeMillis() + ".jpg";
		path += File.separator + "pic" + File.separator;
		String relativePath = File.separator + UPLOAD_DIR + File.separator
				+ TEAM_DIR + File.separator + teamDir + File.separator + "pic" + File.separator + fileName;
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		try {
			ImageIO.write(bi, "jpg", new File(path + fileName)); 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			return relativePath;
		}
	}

	/**
	 * 删除某个文件夹下的所有文件夹和文件
	 * 
	 * @param delpath
	 *            String
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @return boolean
	 */
	public static void deleteAll(String delpath) {
		try {
			File file = new File(delpath);
			// 当且仅当此抽象路径名表示的文件存在且 是一个目录时，返回 true
			if (!file.isDirectory()) {
				file.delete();
			} else if (file.isDirectory()) {
				String[] filelist = file.list();
				for (int i = 0; i < filelist.length; i++) {
					File delfile = new File(delpath + File.separator + filelist[i]);
					if (!delfile.isDirectory()) {
						delfile.delete();
					} else if (delfile.isDirectory()) {
						deleteAll(delpath + File.separator + filelist[i]);
					}
				}
				file.delete();
			}
		} catch (Exception e) {
			log.error("删除目录{}错误",delpath);
		}
	}

	/**
	 * 删除文件
	 * 
	 * @param file
	 */
	public static void delFile(String file) {
		File f = new File(file);
		if (f.exists() && f.isFile()) {
			f.delete();
		}
	}
}
