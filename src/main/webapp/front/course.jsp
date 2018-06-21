<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html charset=UTF-8">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">

<title>信息工程学院-视频学习网站</title>
<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/css/public.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/css/style.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/css/qusetion.css" />

<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.8.3.min.js"></script>
<script src="${APP_PATH }/front/js/qiehuan.js"></script>
<%-- <script src="${APP_PATH}/front/js/qiehuan.js"></script> --%>
</head>
<body>

	<c:import url="header.jsp" />

	<!--主体部分-->
	<div class="comWidth">
		<div class="mainCourse">
			<h2>全部课程</h2>

			<div class="top_search">
				<form class="navbar-form navbar-left" role="search"
					action="${APP_PATH}/course/findAllFront.action" method="POST">
					<div class="form-group">
						<input type="text" class="form-control" name="text" value="${text }"
							placeholder="搜一搜">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
			</div>

			<div class="classification classification2">
				<label>年级：</label>
				<ul class="classiUl" id="grade_ul">
					<li><a class="gradeclass"
						href="${APP_PATH}/course/findAllFront.action" id="all_ma2">全部</a>
					</li>
					<li><a class="gradeclass" id="one"></a>
					</li>
					<li><a class="gradeclass" id="two"></a>
					</li>
					<li><a class="gradeclass" id="three"></a>
					</li>
					<li><a class="gradeclass" id="four"></a>
					</li>
				</ul>
			</div>
			<c:if test="${!empty grade }">
				<div class="classIntere classIntere2">
					<label>专业：</label>
					<ul class="classiUl" id="marjor_ul">
						<li><a
							href="${APP_PATH}/course/findAllFront.action?iid=${grade }"
							id="all_ma1">全部</a>
						</li>
						<c:forEach items="${mList }" var="major">
							<li><a class="midclass" mid="${major.mid }"
								href="${APP_PATH}/course/findAllFront.action?mid=${major.mid }&grade=${grade }">${major.mname
									}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>

			<div class="classification">
				<label>兴趣：</label>
				<ul class="classiUl">
					<li><a href="${APP_PATH}/course/findAllFront.action"
						id="all_ma">全部</a>
					</li>
					<c:forEach items="${iList }" var="il">
						<c:if test="${il.iid != 1 }">
							<li><a id="${il.iid }"
								href="${APP_PATH}/course/findAllFront.action?iid=${il.iid }">${il.iname
									}</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<c:if test="${!empty fxList }">
				<div class="classIntere">
					<label>方向：</label>
					<ul class="classiUl">
						<li><a
							href="${APP_PATH}/course/findAllFront.action?iid=${iid }">全部</a>
						</li>
						<c:forEach items="${fxList }" var="fx">
							<c:if test="${fx.fid != 1 }">
								<li><a
									href="${APP_PATH}/course/findAllFront.action?fid=${fx.fid }&iid=${fx.iid }">${fx.fname
										}</a>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<!--显示课程-->
			<div class="subjectClass">
				<ul class="subjectUl" id="showCourse">
					<c:forEach items="${pageInfo.list }" var="course">
						<li id="${course.cid }">
						
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
								<a href="${APP_PATH}/index/showCourse.action?cid=${course.cid }">${course.cname }</a><br>
								<span style="font-size:14px;">${course.dbMajor.mname }</span>
							</h3>

							<p class="pay">
								<%-- <a href="${APP_PATH}/resource/showCourse.action?cid=${course.cid }">免费</a> --%>
								<span>${course.dbTeacher.username }</span> <span
									class="left_span linkNumCount" id="linkNumCount${course.cid }"
									linknum="${course.linknum }">${course.linknum }人点赞 <!-- <a class="glyphicon glyphicon-thumbs-up" href="javascript:;"></a> -->
								</span>
							<div id="img">
								<img id="link${course.cid }" cid="${course.cid }" alt=""
									src="../front/images/nb_hou.png"
									style="width: 25px; height:25px; margin-top:-35px; margin-left: 92%;"
									class="nb2">
							</div>
							</p></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<c:if test="${pageInfo.total > 20}">
			<div class="page">
				<p>
					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<a class="onPage" href="#">${page_Num }</a>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
							<a
								href="${APP_PATH}/course/findAllFront.action?page=${page_Num }&iid=${iid }&fid=${fid }&grade=${grade }&mid=${mid }&text=${text }">${page_Num
								}</a>
						</c:if>
					</c:forEach>
				</p>
			</div>
		</c:if>
	</div>
	<c:import url="footer.jsp" />
	<script type="text/javascript">
		var mydate = new Date();
		var y = mydate.getFullYear();
		var m = mydate.getMonth() + 1;
		//alert(y+"年"+m+"月");
		if (m >= 7) {
			/* for(var i=0; i<4; i++){
				var a = $("<a></a>").attr("href","${APP_PATH}/course/findAllFront.action?grade="+(y-i)).append(y-i).attr("id",(y-i)).attr("class","gradeclass");	
				$("<li></li>").append(a).appendTo("#grade_ul");
			} */
			$("#one").text(y).attr("href",
					"${APP_PATH }/course/findAllFront.action?grade=" + (y))
					.attr("grade", y);
			$("#two").text(y - 1).attr("href",
					"${APP_PATH }/course/findAllFront.action?grade=" + (y - 1))
					.attr("grade", y - 1);
			$("#three").text(y - 2).attr("href",
					"${APP_PATH }/course/findAllFront.action?grade=" + (y - 2))
					.attr("grade", y - 2);
			$("#four").text(y - 3).attr("href",
					"${APP_PATH }/course/findAllFront.action?grade=" + (y - 3))
					.attr("grade", y - 3);
		} else {
			/* for(var i=1; i<=4; i++){
				var a = $("<a></a>").attr("href","${APP_PATH}/course/findAllFront.action?grade="+(y-i)).append(y-i).attr("id",(y-i)).attr("class","gradeclass");	
				$("<li></li>").append(a).appendTo("#grade_ul");
			} */
			$("#one").text(y - 1).attr("href",
					"${APP_PATH }/course/findAllFront.action?grade=" + (y - 1))
					.attr("grade", y - 1);
			$("#two").text(y - 2).attr("href",
					"${APP_PATH }/course/findAllFront.action?grade=" + (y - 2))
					.attr("grade", y - 2);
			$("#three").text(y - 3).attr("href",
					"${APP_PATH }/course/findAllFront.action?grade=" + (y - 3))
					.attr("grade", y - 3);
			$("#four").text(y - 4).attr("href",
					"${APP_PATH }/course/findAllFront.action?grade=" + (y - 4))
					.attr("grade", y - 4);
		}
	</script>
	<script type="text/javascript">
		linkNum();
		function linkNum() {
			var ids = new Array();
			$("#showCourse li").each(function(index) {
				ids[index] = $(this).attr("id");
				//alert(ss);
			});
			//console.log(ids);
			for ( var i = 0; i < ids.length; i++) {
				var cookie = getCookie(ids[i]);
				//alert(cookie);
				if (cookie == "") {

				} else {
					//alert(cookie);
					$("#link" + (ids[i]) + "").attr('src',
							"../front/images/nb_front.png");
				}
			}
		}

		// 定义一个函数，用来读取特定的cookie值。
		function getCookie(c_name) {
			if (document.cookie.length > 0) {
				c_start = document.cookie.indexOf(c_name + "=");
				if (c_start != -1) {
					c_start = c_start + c_name.length + 1;
					c_end = document.cookie.indexOf(";", c_start);
					if (c_end == -1)
						c_end = document.cookie.length;
					return unescape(document.cookie.substring(c_start, c_end));
				}
			}
			return "";
		}

		//清除cookie    
		function clearCookie(name) {
			setCookie(name, "", -1);
		}

		//设置cookie  
		function setCookie(cname, cvalue, exdays) {
			var d = new Date();
			d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
			var expires = "expires=" + d.toUTCString();
			document.cookie = cname + "=" + cvalue + "; " + expires
					+ "; path=/";
		}
		var flag = true;
		$(".nb2")
				.click(
						function() {
							if (flag) {
								flag = false;
								var cid = $(this).attr("cid");
								if ($("#link" + (cid) + "").attr("src") == "../front/images/nb_front.png") {
									//alert("哈");
									$
											.ajax({
												type : "POST",
												url : "${pageContext.request.contextPath}/course/linkNumDel.action?cid="
														+ cid,
												dataType : "json",
												success : function(data) {
													if (data.status == 200) {
														clearCookie(cid);
														$("#link" + (cid) + "")
																.attr('src',
																		"../front/images/nb_hou.png");
														var num = $(
																"#linkNumCount"
																		+ (cid)
																		+ "")
																.attr("linknum");
														num = parseInt(num);
														$(
																"#linkNumCount"
																		+ (cid)
																		+ "")
																.attr(
																		"linknum",
																		num - 1);
														$(
																"#linkNumCount"
																		+ (cid)
																		+ "")
																.text(
																		(num - 1)
																				+ "人点赞");
														//window.location.href="${APP_PATH}/course/findAllFront.action";
													}
												}
											});
								} else {
									$
											.ajax({
												type : "POST",
												url : "${pageContext.request.contextPath}/course/linkNum.action?cid="
														+ cid,
												dataType : "json",
												success : function(data) {
													if (data.status == 200) {
														//alert(data.msg);
														$("#link" + (cid) + "")
																.attr('src',
																		"../front/images/nb_front.png");
														var num = $(
																"#linkNumCount"
																		+ (cid)
																		+ "")
																.attr("linknum");
														num = parseInt(num);
														$(
																"#linkNumCount"
																		+ (cid)
																		+ "")
																.attr(
																		"linknum",
																		num + 1);
														$(
																"#linkNumCount"
																		+ (cid)
																		+ "")
																.text(
																		(num + 1)
																				+ "人点赞");
														//window.location.href="${APP_PATH}/course/findAllFront.action";
													}
												}
											});
								}
								setTimeout(function() {
									flag = true;
								}, 500);
							}

						});

		//console.log($(".nb2").attr("src"));
	</script>

	

</body>
</html>