package com.xawl.study.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class WorkUtils {
	public static String upload(HttpServletRequest request,
			MultipartFile multipartFile) throws IOException {
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM");
		String filtName = request.getSession().getServletContext()
				.getRealPath("work")
				+ "/";
		File file = new File(filtName + sm.format(new Date()) + "/");
		if (!file.exists()) {
			file.mkdirs();
		}
		String name = sm.format(new Date()) + "/"
				+ UUID.randomUUID().toString().replace("-", "")
				+ getSuf(multipartFile.getOriginalFilename());
		file = new File(filtName + name);
		multipartFile.transferTo(file);
		return name;
	}

	public static void deleteWork(String resourcename,
			HttpServletRequest request) {
		String filtName = request.getSession().getServletContext()
				.getRealPath("work")
				+ "/";
		// System.out.println("delework"+filtName + resourcename);
		File file = new File(filtName + resourcename);
		if (file.exists()) {
			// System.out.println("文件" + resourcename + "存在");
			file.delete();
		}
	}

	public static File getWrok(HttpServletRequest request, String workName) {
		String filtName = request.getSession().getServletContext()
				.getRealPath("work")
				+ "/";
		File file = new File(filtName + workName);
		// System.out.println(filtName + workName);
		return file;
	}

	private static String getSuf(String str) {
		String[] split = str.split("\\.");
		return "." + split[split.length - 1];
	}
}
