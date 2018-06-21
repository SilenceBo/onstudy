package com.xawl.study.utils;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.Session;

import com.xawl.study.model.Student;

public class SendEmails implements Runnable{
	
	private Student student;
	
	private Result res;
	
	public void send(){
		
		if (res.getStatus() == 200) {

			Properties props = new Properties();
			try {
				props.load(this.getClass().getClassLoader()
						.getResourceAsStream("email_template.properties"));
				//System.out.println("读取文件成功");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				//System.out.println("读取文件失败");
				e1.printStackTrace();
			}
			String host = props.getProperty("host");// 获取服务器主机
			String uname = props.getProperty("uname");// 获取用户名
			String pwd = props.getProperty("pwd");// 获取密码
			String from = props.getProperty("from");// 获取发件人
			String to = student.getE_mail();// 获取收件人
			String subject = props.getProperty("subject");// 获取主题
			String content = props.getProperty("content");// 获取邮件内容
			content = MessageFormat.format(content, student.getCode());// 替换{0}

			Session session = MailUtils.createSession(host, uname, pwd);// 得到session
			Mail mail = new Mail(from, to, subject, content);// 创建邮件对象
			try {
				MailUtils.send(session, mail);// 发邮件
				//System.out.println("发送成功");
				/*res.setMsg("注册成功，请前往邮箱激活");*/
			} catch (Exception e) {
				/*Result result = new Result();
				result.setStatus(500);
				result.setMsg("邮件发送失败");
				return result;*/
				//System.out.println("发送失败");
			}
		}
		/*return res;*/	
	}
	
	public void run() {
		send();
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Result getRes() {
		return res;
	}

	public void setRes(Result res) {
		this.res = res;
	}
	
}
