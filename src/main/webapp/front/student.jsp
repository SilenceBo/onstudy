<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<meta content=always name=referrer>
<meta name="renderer" content="webkit">
<title>信息工程学院-视频学习网站</title>
<!--css样式-->
<link rel="stylesheet" type="text/css"
	href="${APP_PATH }/front/css/public.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH }/front/css/style.css" />

<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript"
	src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>

<link rel="stylesheet" href="${APP_PATH }/front/css/signIn.css" />
<link rel="stylesheet" type="text/css" href="../front/css/qusetion.css" />
<script src="${APP_PATH}/front/js/jquery.cookie.js"></script>
</head>
<body>
	<!--logo部分-->
	<div class="top">
		<div class="comWidth">
			<div class="logoLeft">
				<a href="${APP_PATH}/front/index.jsp"><img
					src="${APP_PATH }/front/images/logo1.png" alt=""
					style="width:180px;" /> </a> <a
					href="${APP_PATH}/course/findAllFront.action"
					style="height: 74px;margin-left:90px;">课程</a> <a
					href="${APP_PATH }/question/findAllByFront.action?way=time"
					style="height: 74px;">问答</a>
			</div>
			<div class="logoRight">
				<a href="${APP_PATH }/front/index.jsp">主页</a> <span>|</span> <a
					href="${APP_PATH }/student/signOut.action">退出登录</a>
			</div>
		</div>
	</div>
	<!-- <div class="sRadio_shang">
	 <span>进度条:</span>  
	 <progress id="progressBar" value="0" max="100"></progress>
	 <span id="percentage"></span>
</div> -->
	<!--主体部分信息-->
	<div class="comWidth clearfix">
		<div class="mainInfo">
			<div class="mainLeft">
				<p tid="information" id="MyInformation" class="left_sOn">
					<i class="glyphicon glyphicon-user"></i><label>个人信息</label>
				</p>
				<p tid="inform" id="MyInform">
					<i class="glyphicon glyphicon-envelope"></i><label>我的通知</label>
				</p>
				<p tid="course" id="MyCourse">
					<i class="glyphicon glyphicon-folder-open"></i><label>我的课程</label>
				</p>
				<p tid="work" id="MyWork">
					<i class="glyphicon glyphicon-list-alt"></i><label>我的作业</label>
				</p>
				<p tid="answers" id="MyAnswers">
					<i class="glyphicon glyphicon-comment"></i><label>我的提问</label>
				</p>
				<p tid="blog" id="question">
					<i class="glyphicon glyphicon-edit"></i><label>我的问答</label>
				</p>
			</div>
			<div class="allRight">
				<div class="totally oon" id="information">
					<div class="basicInfo">
						<p>
							<a href="#" style="color: #000000;" tid="info1">基本信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="#" tid="info2" style="color: #000000;">修改密码</a>
						</p>
					</div>
					<!--基本信息-->
					<div class="info1">
						<form id="myInfo">
							<ol class="BI-li">
								<li class=""><span class="label">昵称</span> <input
									id="sname" name="sname" data-validate="nick" autocomplete="off"
									class="BI-email bor" placeholder="请输入昵称" type="text">
									<p class="prompt"></p>
								</li>
								<li class=""><span class="label">性别</span> <label>
										<input name="sex" id="manSex" value="男" type="radio">
										男</label> <label> <input name="sex" id="female" value="女"
										type="radio"> 女</label>
								</li>
								<li class=""><span class="label">邮箱</span> <input
									name="e_mail" id="e_mail" class="BI-email bor" value="把对应值传进来"
									type="text">
								</li>
								<li class=""><span class="label">学号</span> <input
									name="account" id="account" value="disabled" disabled
									class="BI-date bor" placeholder="请输入学号" value="" type="text">
								</li>

								<li class=""><span class="label">班级</span> <select
									class="BI-email BI-job bor" name="classId" tvl="" id="classID">
								</select>
								</li>
							</ol>
							<input type="button" id="updataBut"
								class="blue-btn btn btn-default" style="color: #000000;"
								value="更新" />
						</form>
					</div>
					<!--修改密码-->
					<div class="info2">
						<form id="updataPWDform">
							<ol class="BI-li">
								<li class=""><span class="label">&nbsp;&nbsp;旧密码&nbsp;&nbsp;</span>
									<input name="oldPwd" class="BI-email bor" placeholder="请输入旧密码"
									value="" type="password">
								</li>
								<li class=""><span class="label">&nbsp;&nbsp;新密码&nbsp;&nbsp;</span>
									<input id="inputPwd" name="pwd" class="BI-email bor"
									placeholder="请输入新密码" type="password">
								</li>
								<li style="margin-bottom:30px;"><span class="label">确认密码</span>
									<input name="repwd" class="BI-email bor" placeholder="请再次输入新密码"
									value="" type="password">
								</li>
							</ol>
						</form>
						<button class="red-btn btn btn-default" style="color: #000000;"
							onclick="updataPwd();">修改</button>
					</div>
				</div>
				<div id="inform" class="totally">
					<table width="85%" valign="top" id="infoTable"
						class="table-bordered table-striped">
						<tr>
							<!-- <th ><input name="noticeCheckBox" type="checkbox"
								value="checkbox" checked="checked" /></th> -->
							<th>发件人</th>
							<th>标题</th>
							<th>发布时间</th>
							<th></th>
							<th></th>
						</tr>
					</table>
				</div>
				<div id="course" class="totally toallymain"></div>
				<div id="work" class="totally clearfix">
					<div class="tst_total"></div>
				</div>
				<div id="focus" class="totally">暂无相关数据</div>
				<div id="answers" class="totally">
					<table width="85%" valign="top" id="answersTable"
						class="table-bordered table-striped">
						<tr>
							<!-- <th ><input name="noticeCheckBox" type="checkbox"
								value="checkbox" checked="checked" /></th> -->
							<th>教师</th>
							<th>时间</th>
							<th></th>
						</tr>
					</table>
				</div>
				<div id="blog" class="totally">
					<div class="basicInfo">
						<p>
							<a href="#" style="color: #000000;" tid="info1">我的提问</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#" tid="info2" style="color: #000000;">我参与的问题</a>
						</p>
					</div>
					<div class="info1 container">
						<div id="myQuestion">
							<ul>
							</ul>
						</div>
						<div class="row">
							<div class="col-md-6" id="page_info_area"></div>
							<div class="col-md-6" id="page_nav_area"></div>
						</div>
					</div>
					<div class="info2">
						<div id="aboutQuestion">
							<ul>
							</ul>
						</div>
						<div class="row">
							<div class="col-md-6" id="page_info_area2"></div>
							<div class="col-md-6" id="page_nav_area2"></div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!--页脚部分-->
	<div class="copy">
		<p>Copyright &copy; 2016-2017 西安市西安文理学院信息工程学院电子商务实验室</p>
	</div>
	<!-- question模态框 -->
	<div class="modal fade" id="questionModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="post" id="questionForm">
					<div class="modal-body" id="questionModalText"></div>
					<textarea id="replayTextarea" rows="5" cols="80" name="text"
						style="margin-left:40px;"></textarea>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" onclick="reply()" class="btn btn-primary">回复</button>
				</div>
			</div>
		</div>
	</div>
	<!-- checkquestion模态框 -->
	<div class="modal fade" id="checkquestion" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<h4 id="questionTitle">标题</h4>
				<div class="modal-body" id="questionlavle"></div>
				<p style="width: 600px;padding:30px" id="questionText"></p>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 进度条模态框 -->
	<div class="modal fade" id="Sjindu" tabindex="-1" role="dialog"
		aria-labelledby="SjinduLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-body">
					<div class="sRadio_shang">
						<span>进度条:</span>
						<progress id="progressBar" value="0" max="100" style="width:100%;"></progress>
						<span id="percentage"></span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<script type="text/javascript" src="${APP_PATH }/front/js/footer.js"></script>
</body>
<script>
	$(function() {
		showMessage();
	});
	function showMessage() {
		$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/student/selectByAccountJson.action",
				dataType : "json",
				data : {
					"account" : "${user_student.account}"
				},
				success : function(data) {
					$("input[name=id]").remove();
					$("#sname").val(data[0].sname);
					$("#e_mail").val(data[0].e_mail);
					$("#account").val(data[0].account);
					$("#myInfo").append(
					$("<input></input>").attr("type", "hidden")
									.attr("name", "id").attr("value",
											data[0].id));
					if (data[0].sex == "男") {
						$("#manSex").attr("checked", "checked");
					} else {
						$("#female").attr("checked", "checked");
					}
					$.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/classname/findAllClass.action",
							dataType : "json",
							success : function(result) {
								showClassName(result.data,data[0].classId);
							}
						});
				}
			});
	}
	function showClassName(data, classId) {
	$(".optionClass").remove();
		var ele = $("#classID");
		$.each(data, function() {
			var option = $("<option class='optionClass'></option>").attr("value", this.classId)
					.append(this.name);
			if (this.classId == classId) {
				option.attr("selected", "selected");
			}
			option.appendTo(ele);
		});
	}
	$(".mainLeft").on("click", "p", function() {
		$(".mainLeft p").removeClass("left_sOn");
		$(this).addClass("left_sOn");
		var a1 = $(this).attr("tid");
		$(".totally").removeClass("oon");
		$("#" + a1).addClass("oon");
		//		alert(a1);
	});

	$(".basicInfo").on("click", "a", function() {
		var infoo = $(this).attr("tid");
		//		alert(infoo);
		$(".info1").css("display", "none");
		$(".info2").css("display", "none");
		$("." + infoo).css("display", "block");
	});
	$("#MyCourse").click(function() {
						$.ajax({
								type : "post",
								url : "${pageContext.request.contextPath}/StudentInformationCntroller/myCourse.action",
								dataType : "json",
								success : function(data) {
									if (data.status == 200) {
										var ele = $("#course");
										ele.empty();
										console.log(data.data);
										$.each(data.data,function() {
											var img = this.image;									
													if(img.indexOf(".")>0){
														/* var img=$("<i>"+this.cname+"</i>");  */
														var img = $("<img></img>").attr("src","${APP_PATH}"+ this.image); 	
													}else{
														 /* var img = $("<img></img>").attr("src","${APP_PATH}"+ this.image); */   
														  var img=$("<span>"+this.cname+"</span>");  	   
													}
											/* var img = $("<img></img>").attr("src","${APP_PATH}"+ this.image); */
											
											var a1 = $("<a class='course_sImg'></a>").attr("href","${APP_PATH}/resource/showCourse.action?cid="+ this.cid);
											var a2 = $("<a></a>").attr("href","${APP_PATH}/resource/showCourse.action?cid="+ this.cid);
											var a3 = $("<a></a>").attr("href","${APP_PATH}/resource/showCourse.action?cid="+ this.cid);
											var h3 = $("<h5></h5>").append(a2.append(this.teacher.username+ "&nbsp;: &nbsp; &nbsp;"	+ this.cname));
											var ul = $("<ul></ul>").append(a1.append(img)).append(h3);
											var div = $("<div></div>").append(ul);
											div.addClass("toallypage");
											div.appendTo(ele);
										});
									} else {
										alert(data.msg);
									}
								}

							});
					});
	$("#updataBut").click(function() {
						$.ajax({
								type : "post",
								url : "${pageContext.request.contextPath}/student/updateByAccount.action",
								dataType : "json",
								data : $("#myInfo").serialize(),
								success : function(data) {
									if(data.status==200){
										alert("修改成功");
										showMessage();
									}else{
										alert(data.msg);
										showMessage();
									}
								}
							});

					});
	$("#MyInform").click(function() {
		$(".infoTableTr").remove();
		$(".passed").remove();
		$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/adminNotice/findStudentNotice.action",
				dataType : "json",
				success : function(data) {
					if(data.satus=200){
					console.log(data);
					adminAddNotice("#infoTable",data.data,"管理员"); 
					}else{
						alert(data.msg);
					}
				}
			});

		$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/courseNotice/findCourseNoticeByCid.action",
				dataType : "json",
				success : function(data) {
					if(data.satus=200){
					console.log(data);
					addNotice("#infoTable",data.data); 
					}else{
						alert(data.msg);
					}
				}
		});
	});
	function adminAddNotice(ele,data,name){
		var table=$(ele);
		$.each(data,function (){
			var tr=$("<tr></tr>").addClass("infoTableTr");
			/*.append($("<td></td>").append($("<input></input>").attr("name","noticeCheckBox").attr("type","checkbox").attr("value",this.anid)))*/
			tr.append($("<td></td>").append(name))
			.append($("<td></td>").append($("<a anid="+this.anid+" onclick='selectAdminNotice(this)'></a>").append(this.title)))
			.append($("<td></td>").append(this.time))
			.append($("<td></td>").append($("<button anid="+this.anid+" onclick='selectAdminNotice(this)' type='button' class='btn btn-xs btn-danger'>查看</button>")))
			.append($("<td></td>").append($("<button anid="+this.anid+" onclick='deleteAdminNotice(this)' type='button' class='btn btn-xs btn-danger'>删除</button>")));
			if(!(this.isBrowsed==0||this.isBrowsed==1)){
				tr.addClass("passed");
			}
			tr.appendTo(table);
		});
	} 
	function selectAdminNotice(but){
		$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/adminNotice/findByAnid.action",
				dataType : "json",
				data :{"anid":$(but).attr("anid") },
				success : function(data) {
					if(data.satus=200){
						console.log(data);
						document.getElementById("questionTitle").innerHTML=data.data.title;
						document.getElementById("questionText").innerHTML=data.data.text;
						$("#checkquestion").modal();
					}else{
						alert(data.msg);
					}
				}
			});
	}
	function selectCourseNotice(but){
		$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/courseNotice/findByCnid.action",
				dataType : "json",
				data :{"cnid":$(but).attr("cnid") },
				success : function(data) {
					if(data.satus=200){
						console.log(data);
						document.getElementById("questionTitle").innerHTML=data.data.title;
						document.getElementById("questionText").innerHTML=data.data.text;
						$("#checkquestion").modal();
					}else{
						alert(data.msg);
					}
				}
			});
	}
	function deleteAdminNotice(but){
		alert($(but).attr("anid"));
		if(confirm("您确定要删除吗?")){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/noticeLogs/deleteByAnidOrsid.action",
			dataType : "json",
			data :{"anid":$(but).attr("anid") },
			success : function(data) {
				if(data.satus=200){
				console.log(data);
				$(but).parent().parent().hide();
				}else{
					alert(data.msg);
				}
			}
		});
		}
	}
	function deleteCourseNotice(but){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/noticeLogs/deleteByCnidOrsid.action",
			dataType : "json",
			data :{"cnid":$(but).attr("cnid") },
			success : function(data) {
				if(data.satus=200){
					$(but).parent().parent().hide();
					console.log(data);
				}else{
					alert(data.msg);
				}
			}
		});
	}
	function addNotice(ele,data){
		var table=$(ele);
		$.each(data,function (){
			var tr=$("<tr></tr>").addClass("infoTableTr");
			/*.append($("<td></td>").append($("<input></input>").attr("name","noticeCheckBox").attr("type","checkbox").attr("value",this.cnid)))*/
			tr.append($("<td></td>").append(this.cname))
			.append($("<td></td>").append($("<a cnid="+this.cnid+" onclick='selectCourseNotice(this)'></a>").append(this.title)))
			.append($("<td></td>").append(this.time))
			.append($("<td></td>").append($("<button cnid="+this.cnid+" onclick='selectCourseNotice(this)' type='button' class='btn btn-xs btn-danger'>查看</button>")))
			.append($("<td></td>").append($("<button cnid="+this.cnid+" onclick='deleteCourseNotice(this)' type='button' class='btn btn-xs btn-danger'>删除</button>")));
			if(!(this.isBrowsed==0||this.isBrowsed==1)){
				tr.addClass("passed");
			}
			tr.appendTo(table);
		});
	} 
	function updataPwd(){
	$(".msgClasss").remove();
		if($("input[name=pwd]").val()==""||$("input[name=pwd]").val()==null){
			var span=$("<h3 class='msgClasss'>密码不能为空</h3>").addClass("text-danger");
			$("#inputPwd").after(span);
		}
		else if($("input[name=pwd]").val()!=$("input[name=repwd]").val()){
			$(".text-danger").empty();
			var span=$("<h3 class='msgClasss'>两次密码不一致</h3>").addClass("text-danger");
			$("#inputPwd").after(span);
		}else{	
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/student/updatePWD.action",
				data :$("#updataPWDform").serialize(),
				dataType : "json",
				success : function(data) {
					if(data.status == 200){
						alert("修改成功请重新登陆");
						location.replace("${APP_PATH }/student/signOut.action");  
					}
					else{
						alert(data.msg);
					}
				},
			});
		}
	}
	
	
	
	$("#MyWork").click(function() {
						$.ajax({
								type : "post",
								url : "${pageContext.request.contextPath}/StudentInformationCntroller/myCourse.action",
								dataType : "json",
								success : function(data) {
									if (data.status == 200) {
										var ele = $("#work");
										ele.empty();
										$.each(data.data,function() {
										var img = this.image;	
										 if(img.indexOf(".")>0){
											var img = $("<img></img>").attr("src","${APP_PATH}"+ this.image); 	
										}else{
											  var img=$("<span>"+this.cname+"</span>");  	   
										} 
										//var img = $("<img></img>").attr("src","${APP_PATH}"+ this.image); 	
										var a1 = $("<a class='course_sImg'></a>").attr("onclick","showMyWork("+this.cid+")");
										var a2 = $("<a></a>").attr("onclick","showMyWork("+this.cid+")");
										var a3 = $("<a></a>").attr("onclick","showMyWork("+this.cid+")");
										var h3 = $("<h4></h4>").append(a2.append(this.teacher.username
																							+ "&nbsp;: &nbsp; &nbsp;"
																							+ this.cname));
										var ul = $("<ul></ul>").append(h3).append(a1.append(img));
										var div = $("<div></div>").append(ul);
										div.addClass("toallypage");
										div.appendTo(ele);
										});
									} else {
										alert(data.msg);
									}
								}

							});

					});
					
	var cids;			
	 function showMyWork(cid){
	 		cids=cid;
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/teacherWork/myWork.action",
					dataType : "json",
					data: {"cid":cid},
					success : function(data) {
						console.log(data);
						if (data.status == 200) {
							var ele = $("#work");
							ele.empty();
							var div =$("<div class='tst_total'></div>");
						 	var i=1;
						 	$.each(data.data,function() {
						 		console.log(this);
						 		var div2=$("<div class='tst_one'></div>");
						 			/* div2.append(progress); */
									div2.append($("<h5 title='"+this.teacherWork.title+"'>"+ this.teacherWork.title +"</h5>"));
									div2.append($("<p>"+ this.teacherWork.jobRequires +"</p>"));
									div2.append($("<a></a>").addClass("download").append("下载作业附件").attr("href","${APP_PATH}/teacherWork/download.action?twid="+this.teacherWork.twid));
									if(this.overdue==false){
										if(this.submit==true){
											div2.append($("<br><span style='color: blue;margin-bottom:40px;' >已提交:"+ this.studentWork.filename +"</span>"));
											div2.append($("<a class='seachers' href='${pageContext.request.contextPath}/studentWork/Sdownload.action?swid="
																					+ this.studentWork.swid
																					+ "'>查看</a>"));
										}else{
											div2.append($("<span  style='color: red;'>未提交</span>"));
									
										}
										var input=$("<button type='button'  disabled='disabled' class='btn btn-default btn-sm'>已经过了交作业的期限"+ this.teacherWork.deadline +"</button>");
										var form=$("<form></form>").append(input);
										div2.append(form);
									}else if(this.submit==true){
										div2.append($("<span style='color: blue;width:70px;' >已提交:"+ this.studentWork.filename +"</span>"));
										div2.append($("<a class='seachers' href='${pageContext.request.contextPath}/studentWork/Sdownload.action?swid="
																					+ this.studentWork.swid
																					+ "'>查看</a>"));
										var input=$("<div class='report-file'><span id='file"+ i +"'>上传文件…</span></div>");
										input.append($("<input tabindex='3' size='3' name='files' class='file-prew' type='file'/>").attr("onchange","changes('file"+ i +"',this)"));
										var input1=$("<input></input>").attr("type","hidden").attr("value",this.teacherWork.cid).attr("name","cid");
										var input2=$("<input></input>").attr("type","hidden").attr("value",this.teacherWork.twid).attr("name","twid");
										var input3=$("<button type='button' class='btn btn-default btn-sm'>修改</button>").attr("onclick","updataWork(this)").attr("value","点击修改作业").attr("twid",this.teacherWork.twid);
										var form=$("<form></form>").append(input).append(input1).append(input2).append(input3).attr("id","commitFrom"+this.teacherWork.twid).attr("enctype","multipart/form-data");
										div2.append(form);
									}else{
										div2.append($("<span  style='color: red;'>未提交</span>"));
										var input=$("<div class='report-file'><span id='file"+ i +"'>上传文件…</span></div>");
										input.append($("<input tabindex='3' size='3' name='files' class='file-prew' type='file'/>").attr("onchange","changes('file"+ i +"',this)"));
										var input1=$("<input></input>").attr("type","hidden").attr("value",this.teacherWork.cid).attr("name","cid");
										var input2=$("<input></input>").attr("type","hidden").attr("value",this.teacherWork.twid).attr("name","twid");
										var input3=$("<button type='button' class='btn btn-default btn-sm'>提交</button>").attr("onclick","TJWork(this)").attr("twid",this.teacherWork.twid);
										var form=$("<form></form>").append(input).append(input1).append(input2).append(input3).attr("id","commitFrom"+this.teacherWork.twid).attr("enctype","multipart/form-data");
										div2.append(form);
									}
									div2.appendTo(div);
									i++;
							});  
							div.appendTo(ele);
						} else {
							alert(data.msg);
						}
					}

				});
	} 
	function  changes(str,but){
		$("#"+str).html($(but).val());
	}
	function TJWork(but){
		if(confirm("如果你的作业包含多个文件请打包成压缩包后上传,确定上传点击确定")){
			var str="#commitFrom"+$(but).attr("twid");
			var format = new FormData($(str)[0]);
			console.log($(str));
			$(but).attr("disabled","disabled");
			var FileController = "${pageContext.request.contextPath}/studentWork/commitWork.action";
			var xhr = new XMLHttpRequest();
	        xhr.open("post", FileController, true);
			xhr.onreadystatechange=function(){
	                    if(xhr.readyState==4 && xhr.status==200){
	                        var data=xhr.responseText;
	                        data=eval("("+data+")");
	                        alert(data.msg);
	                        $(but).removeAttr("disabled");
	                        $("#Sjindu").modal("hide");
	                        showMyWork(cids);
	                    }else if(xhr.readyState==4 && xhr.status>400){
	                    	alert("上传请求失败");
	                    	$("#Sjindu").modal("hide");
	                   		$(but).removeAttr("disabled");
	                    }
	                };
			$("#Sjindu").modal();
			xhr.upload.addEventListener("progress", progressFunction, false);
	        xhr.send(format);
		}
	}
	
	function progressFunction(evt) {
            var progressBar = document.getElementById("progressBar");
            var percentageDiv = document.getElementById("percentage");
            if (evt.lengthComputable) {
                progressBar.max = evt.total;
                progressBar.value = evt.loaded;
                percentageDiv.innerHTML = Math.round(evt.loaded / evt.total * 100) + "%";
            }
     }  
	
	function updataWork(but){
		if(confirm("如果你的作业包含多个文件请打包成压缩包后上传,确定上传点击确定")){
			var str="#commitFrom"+$(but).attr("twid");
			var format = new FormData($(str)[0]);
			console.log($(str));
			$(but).attr("disabled","disabled");
			var FileController = "${pageContext.request.contextPath}/studentWork/updateWork.action";
			var xhr = new XMLHttpRequest();
	        xhr.open("post", FileController, true);
			xhr.onreadystatechange=function(){
	                    if(xhr.readyState==4 && xhr.status==200){
	                        var data=xhr.responseText;
	                        data=eval("("+data+")");
	                        alert(data.msg);
	                        $(but).removeAttr("disabled");
	                        $("#Sjindu").modal("hide");
	                    }else if(xhr.readyState==4 && xhr.status>400){
	                    	alert("上传请求失败");
	                   		$(but).removeAttr("disabled");
	                   		 $("#Sjindu").modal("hide");
	                    }
	                };
			$("#Sjindu").modal();
			xhr.upload.addEventListener("progress", progressFunction, false);
	        xhr.send(format);
        }
	}
	function noSubmissionDate(data){
		var oDate1 = new Date(data);
	    var oDate2 = new Date(getNowFormatDate());
	    if(oDate1.getTime() > oDate2.getTime()){
	   		return false;
	    } else {
	    	return true;
	    }
	}
	function getNowFormatDate() {
	    var date = new Date();
	    var seperator1 = "-";
	    var seperator2 = ":";
	    var month = date.getMonth() + 1;
	    var strDate = date.getDate();
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
	            + " " + date.getHours() + seperator2 + date.getMinutes()
	            + seperator2 + date.getSeconds();
	    return currentdate;
	} 
	$("#MyInformation").click(function() {
	});
	$("#MyAnswers").click(function (){
		var table=$("#answersTable");
		$(".infoTableTr").remove();
		$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/qanda/findBySid.action",
				dataType : "json",
				success : function(data) {
					if(data.status == 200){
						console.log(data);
						$.each(data.data,function (){
							var tr=$("<tr></tr>").addClass("infoTableTr");
							/*.append($("<td></td>").append($("<input></input>").attr("name","noticeCheckBox").attr("type","checkbox").attr("value",this.anid)))
							*/
							tr.append($("<td></td>").append(this.tname))
							.append($("<td></td>").append(this.time))
							.append($("<td></td>").append($("<button qid="+this.qid+" onclick='checkAnswers(this)' type='button' class='btn btn-xs btn-info'>查看</button>"))
							.append($("<button qid="+this.qid+" onclick='deleteAnswers(this)' type='button' class='btn btn-xs btn-danger'>删除</button>")));
							tr.appendTo(table);
						});
					}
					else{
						alert(data.msg);
					}
				},
			});
	});
	function  deleteAnswers(but){
		if(confirm("您确定要删除吗?")){
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/qanda/deleteByQid.action",
				dataType : "json",
				data :{"qid":$(but).attr("qid") },
				success : function(data) {
					if(data.satus=200){
						alert("删除成功");
						$(but).parent().parent().hide();
						console.log(data);
					}else{
						alert(data.msg);
					}
				}
			});
		}
	}
	function checkAnswers(but){
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/qanda/findByQid.action",
					dataType : "json",
					data :{"qid":$(but).attr("qid") },
					success : function(data) {
						if(data.satus=200){
							document.getElementById("questionModalText").innerHTML=data.data[0].osname+":"+data.data[0].text;
							$(".hiddeninput").remove();
							$("#questionForm").append($("<input class='hiddeninput' type='hidden' name='osname' value="+data.data[0].osname+"></input>"));
							$("#questionForm").append($("<input class='hiddeninput' type='hidden' name='tid' value="+data.data[0].tid+"></input>"));
							$("#questionForm").append($("<input class='hiddeninput' type='hidden' name='tname' value="+data.data[0].tname+"></input>"));
							$("#questionForm").append($("<input class='hiddeninput' type='hidden' name='qid' value="+data.data[0].qid+"></input>"));
							$("#questionForm").append($("<input class='hiddeninput' type='hidden' name='cid' value="+data.data[0].cid+"></input>"));
							$.ajax({
								type : "post",
								url : "${pageContext.request.contextPath}/qanda/findAllAnswer.action",
								dataType : "json",
								data :{"qid":$(but).attr("qid") },
								success : function(data) {
								console.log(data);
										if(data.satus=200){
											$.each(data.data,function (){
												if(this.typea==0){
													document.getElementById("questionModalText").innerHTML+="<br>"+"我:"+
														this.text;
												}else{
													document.getElementById("questionModalText").innerHTML+="<br>"+
														this.tname+":"+this.text;
												}
											});
										}
								}
							});
							$("#questionModal").modal();
							console.log(data);
						}else{
							alert(data.msg);
						}
					}
				});
	}
	function updatacheckAnswers(qid){
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/qanda/findByQid.action",
					dataType : "json",
					data :{"qid":qid },
					success : function(data) {
						if(data.satus=200){
							document.getElementById("questionModalText").innerHTML=data.data[0].osname+":"+data.data[0].text;
							$(".hiddeninput").remove();
							$("#questionForm").append($("<input class='hiddeninput' type='hidden' name='osname' value="+data.data[0].osname+"></input>"));
							$("#questionForm").append($("<input class='hiddeninput' type='hidden' name='tid' value="+data.data[0].tid+"></input>"));
							$("#questionForm").append($("<input class='hiddeninput' type='hidden' name='tname' value="+data.data[0].tname+"></input>"));
							$("#questionForm").append($("<input class='hiddeninput' type='hidden' name='qid' value="+data.data[0].qid+"></input>"));
							$("#questionForm").append($("<input class='hiddeninput' type='hidden' name='cid' value="+data.data[0].cid+"></input>"));
							$.ajax({
								type : "post",
								url : "${pageContext.request.contextPath}/qanda/findAllAnswer.action",
								dataType : "json",
								data :{"qid":qid },
								success : function(data) {
								console.log(data);
										if(data.satus=200){
											$.each(data.data,function (){
												if(this.typea==0){
													document.getElementById("questionModalText").innerHTML+="<br>"+"我:"+
														this.text;
												}else{
													document.getElementById("questionModalText").innerHTML+="<br>"+
														this.tname+":"+this.text;
												}
											});
										}
								}
							});
							$("#questionModal").modal();
							console.log(data);
						}else{
							alert(data.msg);
						}
					}
				});
	}
	function reply(){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/qanda/addStudentReply.action",
			dataType : "json",
			data :$("#questionForm").serialize(),
			success : function(data) {
				if(data.satus=200){
					console.log(data);
					alert("回复成功");
					console.log(data);
					document.getElementById("questionModalText").innerHTML+="<br>"+"我:"+$("#replayTextarea").val();
					$("#replayTextarea").val("");
				}else{
					alert(data.msg);
				}
			}
		});
	}
</script>
<script type="text/javascript">
	//全局总记录数，去最后一页
	var totalRecord,currentPage;   
	
	$("#question").click(function(){
		//去首页
		to_page(1);
		to_page2(1);
	});
	
	//分页跳转
	function to_page(pn){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/question/findQuestionByidJson.action",
			dataType : "json",
			data : {
				"id" : "${user_student.id}",
				"page": pn
			},
			success:function(data){
				//console.log(result);
				//1.解析并显示员工数据
				if(data.data.list == ""){
					$("#myQuestion ul p").remove();
					$("#myQuestion ul").append("<p class='pstyle'>没有提出问题，快去提问吧！</p>");
					return false;
				}
				buide_emps_table(data.data.list,"#myQuestion ul");
				if(data.data.total>=5){
					//2.解析并显示分页信息
					buide_pqge_info(data, "#page_info_area");
					//3.解析并显示分页条
					buide_pqge_nav(data, "#page_nav_area");
				}
			}
		});
	}
	//解析并显示问题数据
   	function buide_emps_table(data, ele){
   		$(ele).empty();	
   		$.each(data,function(){
			var li = $("<li></li>");
			var div = $("<div class='proDet'></div>");
			var h4 = $("<h4><a href='${APP_PATH }/answer/findByQidFront.action?qid="+this.qid+"'>"+this.topic+"</a></h4>");
			var span = $("<h6>"+this.contents+"</h6>");
			var p = $("<p><span class='release'>发布于："+this.creattime+"</span>"+
			          "<span class='aSpan'><a href='${APP_PATH }/answer/findByQidFront.action?qid="+this.qid+"'>回答("+this.replycount+")</a>"+
			          "<a href='${APP_PATH }/answer/findByQidFront.action?qid="+this.qid+"'>浏览("+this.clickcount+")</a></span> </p>");
			        
			div.append(h4).append(span).append(p);
			li.append(div);
			li.appendTo(ele);
		});
   	}
		
		//解析并显示分页信息
   		function buide_pqge_info(data, ele){
   			//清空
   			$(ele).empty();
   			$(ele).append("当前"+data.data.pageNum+"页,总"+
   				data.data.pages+"页,共"+data.data.total+"记录数");
   			//给全局总记录数赋值
   			totalRecord = data.data.total;
   			//保存当前页
   			currentPage = data.data.pageNum;
   		}
   			
   		//解析并显示分页条
   		function buide_pqge_nav(data, ele){
   			//清空
   			$(ele).empty();
   			var ul = $("<ul></ul>").addClass("pagination");
   			
   			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
   			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
   			//判断前一页和首页能否被点击
   			if(data.data.hasPreviousPage == false){
   				firstPageLi.addClass("disabled");
   				prePageLi.addClass("disabled");
   			}else{
   				//为首页，下一页添加事件
	   			firstPageLi.click(function(){
	   				to_page(1);
	   			});
	   			prePageLi.click(function(){
	   				to_page(data.data.pageNum - 1);
	   			});
   			}
   			
   			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
   			var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
   			//判断下一页和末页能否被点击
   			if(data.data.hasNextPage == false){
   				nextPageLi.addClass("disabled");
   				lastPageLi.addClass("disabled");
   			}else{
   				//为下一页页，末页添加事件
	   			nextPageLi.click(function(){
	   				to_page(data.data.pageNum + 1);
	   			});
	   			lastPageLi.click(function(){
	   				to_page(data.data.pages);
	   			});
   			}	
   			
   			//添加首页和前一页
   			ul.append(firstPageLi).append(prePageLi);
   			
   			$.each(data.data.navigatepageNums,function(index,item){
   				var numLi = $("<li></li>").append($("<a></a>").append(item));
   				//当前页突出显示
   				if(data.data.pageNum == item){
   					numLi.addClass("active");
   				}
   				numLi.click(function(){
   					to_page(item);
   				});
   				//添加页码
   				ul.append(numLi);
   			});
   			
   			//添加下一页和末页
   			ul.append(nextPageLi).append(lastPageLi);
   			
   			var navEle = $("<nav></nav>").append(ul);
   			navEle.appendTo(ele);
   		}
   		
   		//分页跳转
		function to_page2(pn){
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/question/findAboutQuestionByidJson.action",
				dataType : "json",
				data : {
					"id" : "${user_student.id}",
					"page": pn
				},
				success:function(data){
					if(data.data.pagedList == ""){
						$("#aboutQuestion ul p").remove();
						$("#aboutQuestion ul").append("<p class='pstyle'>没有已参与的问题，快去回答问题吧！</p>");
						return false;
					}
					//console.log(data.data);
					//1.解析并显示员工数据
					buide_emps_table(data.data.pagedList,"#aboutQuestion ul");
					if(data.data.totalCount>=5){
						//2.解析并显示分页信息
						buide_pqge_info2(data, "#page_info_area2");
						//3.解析并显示分页条
						buide_pqge_nav2(data, "#page_nav_area2");
					}
				}
			});
		}				
		
		//解析并显示分页信息
   		function buide_pqge_info2(data, ele){
   			//清空
   			$(ele).empty();
   			$(ele).append("当前"+data.data.nowPage+"页,总"+
   				data.data.totalPage+"页,共"+data.data.totalCount+"记录数");
   			//给全局总记录数赋值
   			totalRecord = data.data.totalCount;
   			//保存当前页
   			currentPage = data.data.nowPage;
   		}
   			
   		//解析并显示分页条
   		function buide_pqge_nav2(data, ele){
   			//清空
   			$(ele).empty();
   			var ul = $("<ul></ul>").addClass("pagination");
   			
   			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
   			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
   			//判断前一页和首页能否被点击
   			if(data.data.nowPage == 1){
   				firstPageLi.addClass("disabled");
   				prePageLi.addClass("disabled");
   			}else{
   				//为首页，下一页添加事件
	   			firstPageLi.click(function(){
	   				to_page2(1);
	   			});
	   			prePageLi.click(function(){
	   				to_page2(data.data.nowPage - 1);
	   			});
   			}
   			
   			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
   			var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
   			//判断下一页和末页能否被点击
   			if(data.data.totalPage == data.data.nowPage){
   				nextPageLi.addClass("disabled");
   				lastPageLi.addClass("disabled");
   			}else{
   				//为下一页页，末页添加事件
	   			nextPageLi.click(function(){
	   				to_page2(data.data.nowPage + 1);
	   			});
	   			lastPageLi.click(function(){
	   				to_page2(data.data.totalPage);
	   			});
   			}	
   			
   			//添加首页和前一页
   			ul.append(firstPageLi).append(prePageLi);
   			var array = new Array();
   			if(data.data.totalPage<=5){
   				for(var i=1; i<=data.data.totalPage; i++){
   					array[i-1]=i;
   				}
   			}else{
   				var begin = data.data.nowPage-2;
   				var end = data.data.nowPage+2;
   				console.log(begin);
   				if(begin<1){
   					begin = 1;
   					console.log(begin);
   					end = 5;
   				}
   				if(end > data.data.totalPage){
   					begin = data.data.totalPage-4;
   					end = data.data.totalPage;
   				}
   				
   				array[0]=begin;
   				array[1]=begin+1;
   				array[2]=begin+2;
   				array[3]=begin+3;
   				array[4]=end;
   				//console.log(array);
   			}
   			$.each(array,function(index,item){
   				var numLi = $("<li></li>").append($("<a></a>").append(item));
   				//当前页突出显示
   				if(data.data.nowPage == item){
   					numLi.addClass("active");
   				}
   				numLi.click(function(){
   					to_page2(item);
   				});
   				//添加页码
   				ul.append(numLi);
   			});
   			
   			//添加下一页和末页
   			ul.append(nextPageLi).append(lastPageLi);
   			
   			var navEle = $("<nav></nav>").append(ul);
   			navEle.appendTo(ele);
   		}
</script>
</html>
