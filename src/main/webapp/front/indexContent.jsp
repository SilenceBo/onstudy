<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html charset=UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>


<title>信息工程学院教学管理平台</title>

<!--导入的css样式-->
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/front/css/qusetion.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/front/css/public.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/front/css/style.css" />
	
<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>

<%-- <script type="text/javascript" src="${APP_PATH}/front/js/myfocus-2.0.1.min.js"></script> --%>
<script type="text/javascript" src="${APP_PATH}/front/js/jquerysession.js"></script>
<!-- <script type="text/javascript">
    //设置
    myFocus.set({
        id : 'myFocus',//ID
        pattern : 'mF_taobao2010'//风格
    });
</script> -->


</head>
<body>

	<c:import url="header.jsp" />


	
	<div id="myCarousel" class="carousel slide comWidth" style="height: 350px;">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<c:set var="salary2" value="0" />
			<c:forEach items="${caList }" var="carousel" varStatus="vs">
				<c:if test="${carousel.type==0 && carousel.status==1}">
					<c:choose>
						<c:when test="${salary2 == 0}">
							<li data-target="#myCarousel" data-slide-to="${salary2}"
								class="active"></li>
						</c:when>
						<c:otherwise>
							<li data-target="#myCarousel" data-slide-to="${salary2}"></li>
						</c:otherwise>
					</c:choose>
					<c:set var="salary2" value="${salary2+1}" />
				</c:if>
			</c:forEach>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<c:set var="salary" value="0" />
			<c:forEach items="${caList }" var="carousel" varStatus="vs">
				<c:if test="${carousel.type==0 && carousel.status==1}">
					<c:choose>
						<c:when test="${salary == 0}">
							<div class="item active sLunbo">
								<a
									href="${APP_PATH}/index/showCourse.action?cid=${carousel.cid }">
									<img src="${APP_PATH }${carousel.value }" thumb="" alt=""
									style="width:100%;height:100%;" /> </a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="item sLunbo">
								<a
									href="${APP_PATH}/index/showCourse.action?cid=${carousel.cid }">
									<img src="${APP_PATH }${carousel.value }" thumb="" alt=""
									style="width:100%;height:100%;" /> </a>
							</div>
						</c:otherwise>
					</c:choose>
					<c:set var="salary" value="${salary+1}" />
				</c:if>
			</c:forEach>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>



	<!--最新资讯-->
	<div class="news comWidth">

			<p>
				最新资讯：
				<marquee behavior="alternate" scrollamount="2"
					style="vertical-align: middle; ">
					<c:forEach items="${caList }" var="carousel">
						<c:if test="${carousel.type==1 && carousel.status==1}">
							<a
								href="${APP_PATH}/index/showCourse.action?cid=${carousel.cid }">${carousel.name}</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
					</c:forEach>
				</marquee>
			</p>
		
	</div>
	<!--主体部分-->
	<div class="comWidth">
		<div class="mainBody">
			<div class="navH2">
				<h4>热门课程</h4>
			</div>
			<div class="subjectClass">
				<ul class="subjectUl">
					<c:forEach items="${cList }" var="course">
						<li>
							
							<c:if test="${fn:contains(course.image,'.')==true}">
							<a href="${APP_PATH}/index/showCourse.action?cid=${course.cid }">
								<img src="${APP_PATH}${course.image }" alt="" />
							</a>
							</c:if>
							<c:if test="${fn:contains(course.image,'.')==false}">
								<a class="subjectUl_sImg" href="${APP_PATH}/index/showCourse.action?cid=${course.cid }">
										<i>${course.cname }</i> 
								</a>
							</c:if>
							
							<h3>
								<a href="${APP_PATH}/index/showCourse.action?cid=${course.cid }">${course.cname
									}</a><br>
								<span style="font-size:14px;">${course.dbMajor.mname }</span>
							</h3>
							<p class="pay">
								<%-- <a href="${APP_PATH}/resource/showCourse.action?cid=${course.cid }">免费</a> --%>
								<span>${course.dbTeacher.username }</span> 
								<span class="left_span2">${course.linknum }人点赞</span>
							</p></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<c:import url="footer.jsp" />
	
	<script type="text/javascript" src="${APP_PATH}/front/js/sFoot.js"></script>

	<script type="text/javascript">
    	var msg = "${courseIsDelete}";
    	if(msg != ""){
    		alert(msg);
    	}
    	  
        $('#myCarousel').carousel({
             interval: 2000
        });
    </script>
</body>
</html>
