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
<!--导入的js文件-->
<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>


<script src="../front/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../front/js/myfocus-2.0.1.min.js"></script>
<link rel="stylesheet" href="../front/css/course.css" type="text/css"></link>
</head>
<body>

	<c:import url="header.jsp" />

	<!--问答部分-->
	<div class="queMains">
		<div class="comWidth">
			<!--问答左侧-->
			<div class="queLeft fl">
				<p>
					<span>信息工程学院视频学习网站</span> &gt; <a
						href="${APP_PATH }/question/findAllByFront.action?way=time">
						问答列表</a> &gt; <span>${questioner.topic }</span>
				</p>
				<h3>
					${questioner.topic }
					<c:if
						test="${(questioner.sid == sessionScope.user_student.id &&  sessionScope.user_student != null) || (questioner.tid == sessionScope.user_teacher.tid &&  sessionScope.user_teacher != null) }">
						<i id="edit_question"
							class="btn btn-warning glyphicon glyphicon-edit"></i>
					</c:if>
				</h3>

				<p>${questioner.contents }</p>
				<!--回答问题部分-->
				<div class="proInfo">
					<p class="fl">
						<span class="span">提问者</span><img src="../front/images/face.png"
							alt="" /> <span> <c:choose>
								<c:when test="${questioner.usertype==0 }">
									<td>${questioner.dbTeacher.username }</td>
								</c:when>
								<c:otherwise>
									<td>${questioner.dbStudent.sname }</td>
								</c:otherwise>
							</c:choose> </span>
					</p>
					<p class="fr">
						<span>${questioner.creattime }</span>
					</p>
				</div>

				<c:choose>
					<c:when
						test="${sessionScope.user_student!=null || sessionScope.user_teacher!=null}">
						<!--登录回答显示-->
						<div class="textSign">
							<div class="textSign_jk">
								<form action="<c:url value='/answer/insertAnswer.action'/>"
									method="post" class="form" name="huida">
									<input type="hidden" name="qid" value="${questioner.qid }" />
									<div class="textSign_text">
										<textarea name="contents" cols="30" rows="10" id="wenben"></textarea>
									</div>
									<button type="submit" class="btn btn-primary" id="huida">回答</button>
								</form>
							</div>
						</div>
					</c:when>

					<c:otherwise>
						<!--未登录信息提示-->
						<div class="noSign">
							<p>
								<font color="red">您还没有登录！请先登录或注册后参与回答</font>
							</p>
						</div>
					</c:otherwise>
				</c:choose>

				<p class="proShu">
					<i>${questioner.replycount }</i><span>回答</span>
				</p>
				<div class="que_pInfo">
					<ul>
						<c:forEach items="${pageInfo.list }" var="answer">
							<li>
								<div class="proImg">
									<p>
										<img src="../front/images/face.png" alt="" />
									</p>
									<span> <c:choose>
											<c:when test="${answer.usertype==0 }">
												<td>${answer.dbTeacher.username }</td>
											</c:when>
											<c:otherwise>
												<td>${answer.dbStudent.sname }</td>
											</c:otherwise>
										</c:choose> </span>
								</div>
								<div class="proDet xiaoguo" aid="${answer.aid }">
									<p>${answer.contents }</p>
									<p>
										<c:if
											test="${(questioner.sid == sessionScope.user_student.id &&  sessionScope.user_student != null) || (questioner.tid == sessionScope.user_teacher.tid &&  sessionScope.user_teacher != null) }">
											<input type="hidden" id="${answer.aid }" class="del btn"
												value="删除" />
										</c:if>
										<span class="fr">发布于：${answer.creattime }</span>
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
											href="${APP_PATH}/answer/findByQidFront.action?page=${page_Num }&qid=${questioner.qid }">${page_Num
											}</a>
									</c:if>
								</c:forEach>
							</p>
						</div>
					</c:if>
				</div>
			</div>
			<!--问答右侧-->
			<!--编辑的模态框-->
			<div class="modal fade" id="edit" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<!--关闭按钮-->
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h3 class="modal-title" id="tiwenLabel1">修改提问</h3>
						</div>
						<div class="modal-body">
							<div class="modalTiwen">
								<form action="<c:url value='/question/updateQuestion.action'/>"
									method="post">
									<input type="hidden" name="qid" value="${questioner.qid }" />
									<div class="form-group">
										<span>标题</span><br> <input type="text" name="topic"
											class="form-control" placeholder="请一句话说明你的问题" id="edit_topic"
											value="${questioner.topic }" /> <span>内容</span><br>
										<textarea name="contents" cols="30" rows="10"
											class="form-control" id="edit_text"
											style="width: 100%;height: 160px;">
	                                   </textarea>
									</div>
									<div style="height:35px;">
										<button type="submit" class="btn btn-primary fr" id="edit_btn">修改</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>

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
											class="form-control" placeholder="请一句话说明你的问题"
											id="tiwen_topic" /> <span>内容</span><br>
										<textarea name="contents" cols="30" rows="10"
											class="form-control" style="width: 100%;height: 160px;"
											id="tiwen_contents">
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

						<!-- <button data-toggle="modal" data-target="#tiwen">提疑问</button> -->
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

		$("#edit_question").click(function() {
			$("#edit_text").val("${questioner.contents }");
			$("#edit").modal({

			});
		});
		$("#edit_btn").click(function() {
			var topic = $("#edit_topic").val();
			if (topic == "") {
				alert("标题不能为空！");
				return false;
			}
		});

		$(".xiaoguo").mouseover(function() {
			var aid = $(this).attr("aid");
			$("#" + aid + "").attr("type", "button");

		});
		$(".xiaoguo").mouseout(function() {
			var aid = $(this).attr("aid");
			$("#" + aid + "").attr("type", "hidden");
		});
		$(".del")
				.click(
						function() {
							var aid = $(this).attr("id");
							var msg = "您真的确定要删除吗？";
							if (confirm(msg) == true) {
								window.location = "${APP_PATH}/answer/deleteAnswerfront.action?ids="
										+ aid;
							}
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
		
		var flag2 = 0;
		$("#huida").click(function() {
			$("#huida").attr("disabled", "disabled");
			if (flag2 == 1){
				alert("请不要重复提交");
				//return false;
			}else {								
				var topic = $("#wenben").val();
				if (topic == "") {
					alert("内容不能为空！");
					flag2 = 0;
					$("#huida").removeAttr("disabled");
					//return false;
				}else{
				
					document.huida.submit();
					flag2 = 1;
					$("#huida").removeAttr("disabled");
				}
			}
		});
	</script>

</body>
</html>