package com.xawl.study.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.junit.Test;
import org.springframework.web.multipart.MultipartFile;

public class ResourceUtils {

	public static String upload(HttpServletRequest request,
			MultipartFile multipartFile, String name) throws IOException {
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM");

		String filtName = request.getSession().getServletContext()
				.getRealPath("resource")
				+ "/";
		File file = new File(filtName + sm.format(new Date()) + "/");
		if (!file.exists()) {
			file.mkdirs();
		}
		name = sm.format(new Date()) + "/"
				+ UUID.randomUUID().toString().replace("-", "") + ResourceUtils.getSuf(name);
		file = new File(filtName + name);
		multipartFile.transferTo(file);
		return name;
	}

	public static void deleteResource(String resourcename,
			HttpServletRequest request) {
		String filtName = request.getSession().getServletContext()
				.getRealPath("resource")
				+ "/";
		File file = new File(filtName + resourcename);
		if (file.exists()) {
			file.delete();
		}
	}

	public static void reName(HttpServletRequest request, String oldName,
			String newName) {
		String filtName = request.getSession().getServletContext()
				.getRealPath("resource")
				+ "/";
		File file = new File(filtName + oldName);
		File newFile = new File(filtName + newName);
		FileOutputStream out = null;
		FileInputStream in = null;
		try {
			out = new FileOutputStream(newFile);
			in = new FileInputStream(file);
			IOUtils.copy(in, out);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		file.delete();
	}

	public static File getResource(HttpServletRequest request,
			String resourceName) {
		String filtName = request.getSession().getServletContext()
				.getRealPath("resource")
				+ "/";
		File file = new File(filtName + resourceName);
		return file;
	}

	private static String getSuf(String str) {
		String[] split = str.split("\\.");
		return "." + split[split.length - 1];
	}

}
