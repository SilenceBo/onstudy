<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<title>信息工程学院-视频学习网站</title>

<!--导入的css样式-->
<link rel="stylesheet" type="text/css"
	href="${APP_PATH }/front/css/public.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH }/front/css/style.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>

</head>
<body>
	<!--页脚部分-->
	<div class="footer">
		<div class="comWidth">
			<div class="footerUl">
				<ul>
					<li>
						<div class="footerWork">
							<h3>技术支持</h3>
							<ul>
								<li><a href="http://www.xawl.edu.cn/" target="_blank">西安文理学院</a>
								</li>
								<li><a href="http://info.xawl.edu.cn/" target="_blank">信息工程学院</a>
								</li>
								<li><a href="http://jwxt.xawl.edu.cn/" target="_blank">教务系统</a>
								</li>
								<li><a href="http://info.xawl.edu.cn/dzswgcsys/33682.htm"
									target="_blank">关于我们</a>
								</li>
							</ul>
						</div></li>

					<li>
						<div class="footerPhone">
							<h3>联系我们</h3>
							<ul>
								<li>电 话：029-89384660</li>
								<li>邮编：710065</li>
								<li>网址：http://info.xawl.edu.cn</li>
								<li>时间：周一至周五8:00-21:00</li>
							</ul>

						</div></li>
					<li class="footerCode">
						<p>团小信</p> <img src="${APP_PATH }/front/images/xxgx.png" alt="团小信" />
					</li>
					<li class="footerCode1">
						<p>问题交流</p> <img src="${APP_PATH }/front/images/xxgx.jpg"
						alt="二维码" /></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="copy">
		<p>Copyright &copy; 2016-2017 西安市西安文理学院信息工程学院电子商务实验室</p>
	</div>

</body>
</html>