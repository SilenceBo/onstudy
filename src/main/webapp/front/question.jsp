<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="../front/css/public.css" />
<link rel="stylesheet" type="text/css" href="../front/css/style.css" />
<link rel="stylesheet" type="text/css" href="../front/css/qusetion.css" />

<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>

<!--导入的js文件-->
<script src="${APP_PATH}/front/js/jquery-1.8.3.min.js"></script>
<script src="../front/js/qiehuan.js"></script>
<script type="text/javascript" src="../front/js/myfocus-2.0.1.min.js"></script>
<script src="../front/js/validationQuse.js"></script>

</head>
<body>

	<c:import url="header.jsp" />

	<!--问答部分-->
	<div class="queMain">
		<div class="comWidth">
			<!--问答左侧-->
			<div class="queLeft fl">
				<div class="que_top">
					<h3 class="fl">问答</h3>
					<ul class="fr">
						<li tid="que_show"><a id="time"
							href="${APP_PATH }/question/findAllByFront.action?way=time">最新发布</a>
						</li>
						<li tid="que_recom"><a id="click"
							href="${APP_PATH }/question/findAllByFront.action?way=click">热门推荐</a>
						</li>
						<li tid="que_appra"><a id="reply"
							href="${APP_PATH }/question/findAllByFront.action?way=reply">热门评议</a>
						</li>
					</ul>
				</div>
				<div class="que_pro oon" id="que_show">
					<ul>
						<c:forEach items="${pageInfo.list }" var="question">
							<li>
								<div class="proImg">
									<p>
										<img src="../front/images/face.png" alt="" />
									</p>
									<span> <c:choose>
											<c:when test="${question.usertype==0 }">
												<td>${question.dbTeacher.username }</td>
											</c:when>
											<c:otherwise>
												<td>${question.dbStudent.sname }</td>
											</c:otherwise>
										</c:choose> </span>
								</div>
								<div class="proDet">
									<h5>
										<a
											href="${APP_PATH }/answer/findByQidFront.action?qid=${question.qid }">${question.topic
											}</a>
									</h5>
									<span>${question.contents }</span>
									<p>
										<span>发布于：${question.creattime }</span> <a
											href="${APP_PATH }/answer/findByQidFront.action?qid=${question.qid }">回答(${question.replycount
											})</a> <a
											href="${APP_PATH }/answer/findByQidFront.action?qid=${question.qid }">浏览(${question.clickcount
											})</a>
									</p>
								</div></li>
						</c:forEach>
					</ul>
					<c:if test="${pageInfo.total > 6}">
						<div class="page">
							<p>
								<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
									<c:if test="${page_Num == pageInfo.pageNum }">
										<a class="onPage" href="#">${page_Num }</a>
									</c:if>
									<c:if test="${page_Num != pageInfo.pageNum }">
										<a
											href="${APP_PATH}/question/findAllByFront.action?page=${page_Num }&way=${way }&text=${text }">${page_Num
											}</a>
									</c:if>
								</c:forEach>
							</p>
						</div>
					</c:if>
				</div>
			</div>

			<!--问答右侧-->
			<!--提问的模态框-->
			<div class="modal fade" id="tiwen" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<!--关闭按钮-->
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h3 class="modal-title" id="tiwenLabel1">提问</h3>
						</div>
						<div class="modal-body">
							<div class="modalTiwen">
								<form action="<c:url value='/question/insertQuestion.action'/>"
									method="post" name="tiwen">
									<div class="form-group">
										<span>标题</span><br> <input type="text" name="topic"
											id="tiwen_topic" class="form-control"
											placeholder="请一句话说明你的问题" /> <span>内容</span><br>
										<textarea name="contents" placeholder="请详细描述你的问题" cols="30"
											rows="10" class="form-control"
											style="width: 100%;height: 160px;">
	                                   </textarea>
									</div>
									<div style="height:35px;">
										<button type="submit" class="btn btn-primary fr" id="fabu">发布</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
			<!-- 提问没有登录的模态框 -->
			<div class="modal fade bs-example-modal-sm" id="tiwen_unlogin"
				tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">消息提示</h4>
						</div>
						<div class="modal-body">您没有登录，请先登录！</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>

			<div class="queRight fr">
				<div class="proSea_top">
					<p>
						<input type="text" id="question" placeholder="找问题" />
						<button id="findQuestion">搜索</button>
					</p>
					<p>
						<button id="haveQuestion">提疑问</button>
					</p>
				</div>
				<div class="proSea_bot">
					<h4>热门问题</h4>
					<ul>
						<c:forEach items="${queList }" var="question">
							<li><a
								href="${APP_PATH }/answer/findByQidFront.action?qid=${question.qid }">${question.topic
									}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<c:import url="footer.jsp" />

	<!-- zb -->
	<script type="text/javascript">
		$("#haveQuestion").click(function() {
			//alert("${sessionScope}");
			var student = "${sessionScope.user_student }";
			var teacher = "${sessionScope.user_teacher }";
			/* alert(teacher=="");
			alert(student==""); */
			if (student != "" || teacher != "") {
				$("#tiwen").modal({

				});
			} else {
				//alert("您还没有登录");
				$("#tiwen_unlogin").modal({

				});
			}
		});
	</script>
	<script>
		$("#findQuestion")
				.click(
						function() {
							var text = $("#question").val();
							if (text == "") {
								alert("内容不能为空");
								return false;
							}
							window.location = "${APP_PATH}/question/findAllByFront.action?way=select&text="
									+ text;
						});
		
		var flag = 0;
		$("#fabu").click(function() {
			$("#fabu").attr("disabled", "disabled");
			if (flag == 1){
				alert("请不要重复提交");
				//return false;
			}else {								
				var topic = $("#tiwen_topic").val();
				if (topic == "") {
					
					alert("标题不能为空！");
					flag = 0;
					$("#fabu").removeAttr("disabled");
					return false;
				}else{
				
					document.tiwen.submit();
					flag = 1;
					$("#fabu").removeAttr("disabled");
				}
			}
		});
	</script>
</body>
</html>
