<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>激活</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">

<link rel="stylesheet" type="text/css" href="../front/css/public.css" />
<link rel="stylesheet" type="text/css" href="../front/css/style.css" />
<link rel="stylesheet" type="text/css" href="../front/css/pass.css">



</head>

<body>
	<!-- logo部分 -->
	<c:import url="header.jsp" />
	<div class="comWidth">
		<p class="p">
			${message }
			<c:if test="${status == 1}">
				<a href="${APP_PATH }/front/index.jsp">前往登录</a>
			</c:if>
		</p>
	</div>

	<!-- 页脚 -->
	<c:import url="footer.jsp" />
</body>

</html>
