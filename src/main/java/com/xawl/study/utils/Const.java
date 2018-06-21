package com.xawl.study.utils;

import java.util.UUID;

public class Const {
	
	public final static int PAGE_NUMBER = 20;//页面显示数据数
	
	public final static int PAGE_COUNT = 5;//显示最多页面数
	
	public final static int PAGE_QUESTION=6;//显示问题个数
	
	public final static int PAGE_QUESTIONPEOPLE=5;//显示问题个数
	
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
}
