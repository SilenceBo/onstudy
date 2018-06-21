<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
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
<title>西安文理学院——慕课网</title>

<!--导入的css样式-->
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet" href="css/sReply.css">
<!--导入的js文件-->

<link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>

<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
	<div id="AnswerDiv" class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 内容列表</strong>
		</div>
		<div class="padding button-group">
			<ul class="search">
				<li>
					<button type="button" class="button border-green"
						id="selectAllAnswer">
						<span class="icon-check"></span> 全选
					</button>
					<button type="button" onclick="deletebatch()"
						class="button border-red">
						<span class="icon-trash-o"></span> 批量删除
					</button></li>
			</ul>
		</div>
		<table id="showTable" class="table table-hover text-center">
			<tr>
				<th><input type="checkbox" id='selectCheckbox' value="1" />
				</th>
				<th width="10%">发布者</th>
				<th width="40%">标题</th>
				<th width="10%">回复人数</th>
				<th>操作</th>
			</tr>
		</table>
	</div>
	<!-- <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"> -->
	<!-- 编辑模态框 -->
	<div class="modal fade" id="amend" tabindex="-1" role="dialog"
		aria-labelledby="amendLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						&times;</button>
					<h4 class="modal-title" id="amendLabel"></h4>
				</div>
				<div class="modal-body">
					<ul class="sReply-ul">
						<li>
							<h5 class="sReply_p" id="textId">
								<a href="##">回复</a>
							</h5>
							<div id="replayDiv" class="sReply_que"></div>
							<div class="sReply_a">
								<i class="fl" id="timeI">发布时间：2017-8-25 12:25:30</i> <span
									class="fr"> <a id='replayBut' onclick="replay(this)"
									href="javascript:void(0)">回复</a> </span>
							</div></li>
					</ul>
					<form class="form">
						<textarea onfocus="this.value='';" id="answerTextarea"
							class="form-control"></textarea>
					</form>
				</div>
				<div class="modal-footer">
					<button id="replaySubmit" type="submit" class="btn btn-info">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 删除模态框 -->
</body>
<script type="text/javascript">
	var thisPage = 1;
	$(function() {
		toPage(1);
	});
	function toPage(page) {
		var ele = $("#showTable");
		$
				.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/qanda/findAll.action",
					data : {
						"page" : page,
						"cid" : "${cid}",
					},
					dataType : "json",
					success : function(data) {
						console.log(data);
						$(".showTr").remove();
						$("#selectCheckbox").attr("checked", false)
						$
								.each(
										data.data2.list,
										function() {
											var tr = $("<tr class='showTr'></tr>");
											var td1 = $("<td><input type='checkbox' name='qid' value='"+ this.qid +"' /></td>");
											var td2 = $("<td>" + this.osname
													+ "</td>");
											var td3 = $("<td>" + this.title
													+ "</td>");
											var td4 = $("<td>" + this.count
													+ "</td>");
											var td5 = $("<td></td>");
											var div = $("<div  class='button-group'></div>");
											div
													.append($(
															"<a class='button border-main' qid='"
																	+ this.qid
																	+ "' onclick='selectQandA(this)' href='javascript:selectQandA(this)' data-toggle='modal'  data-target='#amend'>编辑 </a>")
															.append(
																	$("<span class='icon-edit'></span>")));
											div
													.append($(
															"<a class='button border-red' qid="
																	+ this.qid
																	+ " href='javascript:void(0)' onclick='deleteQAndA(this)' data-target='#amend'>删除 </a>")
															.append(
																	$("<span class='icon-trash-o'></span>")));
											td5.append(div);
											tr.append(td1).append(td2).append(
													td3).append(td4)
													.append(td5);
											tr.appendTo(ele);
										});
						showPage(data.data2);
					}

				});
	}
	function showPage(data) {
		thisPage = data.pageNum;
		var ele = $("#AnswerDiv");
		$(".pagelist").remove();
		var div = $("<div class='pagelist'></div>");
		if (data.hasPreviousPage) {
			div.append("<a href='javascript:toPage(" + data.prePage
					+ ")'>上一页</a>");
		}
		$.each(data.navigatepageNums, function() {
			var a = $("<a href='javascript:toPage(" + this + ")'>" + this
					+ "</a>");
			div.append(a);
		});
		if (data.hasNextPage) {
			div.append("<a href='javascript:toPage(" + data.nextPage
					+ ")'>下一页</a>");
		}
		if (!data.isLastPage) {
			div.append("<a href='javascript:toPage(" + data.lastPage
					+ ")'>尾页</a>");
		}
		div.appendTo(ele);
	}
	$("#selectCheckbox").click(
			function() {
				$("input[type=checkbox][name=qid]").prop("checked",
						$(this).prop("checked"));
			});
	$(document)
			.on(
					"click",
					"input[type=checkbox][name=qid]",
					function() {
						var flag = $("input[type=checkbox][name=qid]:checked").length == $("input[type=checkbox][name=qid]").length;
						$("#selectCheckbox").prop("checked", flag);

					});
	var boo = true;
	$("#selectAllAnswer").click(function() {
		if (boo) {
			$.each($("input[type=checkbox][name=qid]"), function() {
				$(this).removeAttr("checked");
				$(this).prop("checked", true);
			});
			boo = false;
		} else {
			$.each($("input[type=checkbox][name=qid]"), function() {
				$(this).removeAttr("checked");
			});
			boo = true;
		}
	});
	function deletebatch() {
		var str = "";
		var i = 0;
		$.each($("input[type=checkbox][name=qid]"), function() {
			if ($(this).prop("checked")) {
				i++;
				str += $(this).prop("value") + ",";
			}
		});
		if (str == "") {
			alert("您还没有选择要删除的数据");
			return;
		}
		if (confirm("您确定要删除选中这" + i + "条数据吗?")) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/qanda/deleteByListQid.action",
						data : {
							"qids" : str,
						},
						dataType : "json",
						success : function(data) {
							alert("删除成功");
							toPage(thisPage);
						}
					});
		}
	}
	function deleteQAndA(but) {
		if (confirm("您确定要删除吗?")) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/qanda/deleteByQid.action",
						data : {
							"qid" : $(but).attr("qid"),
						},
						dataType : "json",
						success : function(data) {
							alert("删除成功");
							toPage(thisPage);
						}
					});
		}
	}
	var fqid;
	function selectQandA(but) {
		fqid = $(but).attr("qid");
		showAnswer(fqid);

	}
	function showAnswer(qid) {
		$
				.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/qanda/findAllAnswer.action",
					data : {
						"qid" : qid,
					},
					dataType : "json",
					success : function(data) {
						console.log(data);
						if (data.status == 200) {
							var qanda2 = data.data2[0];
							document.getElementById("amendLabel").innerHTML = qanda2.title;
							document.getElementById("textId").innerHTML = qanda2.text;
							document.getElementById("timeI").innerHTML = "发布时间 :"
									+ qanda2.time;
							$("#replayBut").attr("qid", qanda2.qid);
							$("#replaySubmit").attr("qid", qanda2.qid);
							$("#replayDiv p").remove();
							var div = $("#replayDiv");
							$
									.each(
											data.data,
											function() {
												if (this.typea == 0) {
													if (qanda2.osname == this.tsname) {
														var p = $("<p></p>")
																.append(
																		$(
																				"<a qid='"
																						+ this.qid
																						+ "' onclick='replay(this)' href='javascript:void(0)'></a>")
																				.append(
																						this.osname))
																.append(
																		"<span>"
																				+ this.text
																				+ "</span>");
														var a = $("<a qid='"
																+ this.qid
																+ "' onclick='deleteByQid(this)' href='javascript:void(0)'>删除</a>");
														a.appendTo(p);
														p.appendTo(div);

													} else {
														var p = $("<p></p>")
																.append(
																		$(
																				"<a qid='"
																						+ this.qid
																						+ "' onclick='replay(this)' href='javascript:void(0)'></a>")
																				.append(
																						this.osname))
																.append(
																		$("<span>回复 </span>"))
																.append(
																		$("<a qid='"
																				+ this.qid
																				+ "' onclick='replay2(this)' href='javascript:void(0)'>"
																				+ this.tsname
																				+ "</a>"))
																.append(
																		"<span>"
																				+ this.text
																				+ "</span>");
														var a = $("<a qid='"
																+ this.qid
																+ "' onclick='deleteByQid(this)' href='javascript:void(0)'>删除</a>");
														a.appendTo(p);
														p.appendTo(div);
													}
												}
												if (this.typea == 1) {
													var p = $("<p></p>")
															.append(
																	$(
																			"<a qid='"
																					+ this.qid
																					+ "' onclick='replay(this)' href='javascript:void(0)'></a>")
																			.append(
																					this.osname))
															.append(
																	$("<span>回复 </span>"))
															.append(
																	$("<a qid='"
																			+ this.qid
																			+ "' onclick='replay3(this)' href='javascript:void(0)'>"
																			+ this.tname
																			+ "</a>"))
															.append(
																	"<span>"
																			+ this.text
																			+ "</span>");
													var a = $("<a qid='"
															+ this.qid
															+ "' onclick='deleteByQid(this)' href='javascript:void(0)'>删除</a>");
													a.appendTo(p);
													p.appendTo(div);
												}
												if (this.typea == 2) {
													var p = $("<p></p>")
															.append(
																	$(
																			"<a qid='"
																					+ this.qid
																					+ "' onclick='replay3(this)' href='javascript:void(0)'></a>")
																			.append(
																					this.tname))
															.append(
																	$("<span>回复 </span>"))
															.append(
																	$("<a qid='"
																			+ this.qid
																			+ "' onclick='replay(this)' href='javascript:void(0)'>"
																			+ this.osname
																			+ "</a>"))
															.append(
																	"<span>"
																			+ this.text
																			+ "</span>");
													var a = $("<a qid='"
															+ this.qid
															+ "' onclick='deleteByQid(this)' href='javascript:void(0)'>删除</a>");
													a.appendTo(p);
													p.appendTo(div);
												}
											});
						} else {
						}
					}

				});

	}
	//点击第一个学生
	function replay(but) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/qanda/findByQid.action",
			data : {
				"qid" : $(but).attr("qid"),
			},
			dataType : "json",
			success : function(data) {
				console.log(data);
				$("#replaySubmit").attr("qid", data.data[0].qid);
				$("#replaySubmit").attr("typea", "0");
				$("#answerTextarea").val("回复 :  " + data.data[0].osname);
			}
		});

	}
	//点击第二个学生
	function replay2(but) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/qanda/findByQid.action",
			data : {
				"qid" : $(but).attr("qid"),
			},
			dataType : "json",
			success : function(data) {
				console.log(data);
				$("#replaySubmit").attr("qid", data.data[0].qid);
				$("#replaySubmit").attr("typea", "1");
				$("#answerTextarea").val("回复 :  " + data.data[0].tsname);
			}
		});

	}
	//点击教师
	function replay3(but) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/qanda/findByQid.action",
			data : {
				"qid" : $(but).attr("qid"),
			},
			dataType : "json",
			success : function(data) {
				console.log(data);
				$("#replaySubmit").attr("qid", data.data[0].qid);
				$("#replaySubmit").attr("typea", "2");
				$("#answerTextarea").val("回复 :  " + data.data[0].tname);
			}
		});

	}
	function deleteByQid(but) {
		if (confirm("您确定要删除吗?")) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/qanda/deleteByQid.action",
						data : {
							"qid" : $(but).attr("qid"),
						},
						dataType : "json",
						success : function(data) {
							if (data.status == 200) {
								alert("删除成功");
								$(but).parent().hide();
								toPage(thisPage);
							} else {
								alert(data.msg);
							}
						}
					});
		}
	}
	$("#replaySubmit")
			.click(
					function() {
						$
								.ajax({
									type : "post",
									url : "${pageContext.request.contextPath}/qanda/teacherReply.action",
									data : {
										"qid" : $(this).attr("qid"),
										"typea" : $(this).attr("typea"),
										"fqid" : fqid,
										"text" : $("#answerTextarea").val()
									},
									dataType : "json",
									success : function(data) {
										if (data.status == 200) {
											alert("回复成功");
											showAnswer(fqid);
										}
									}
								});
					});
</script>
</html>