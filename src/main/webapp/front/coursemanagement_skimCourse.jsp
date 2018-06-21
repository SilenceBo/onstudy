<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>西安文理学院——慕课网</title>
	<!--导入的css样式-->
	<link rel="stylesheet" href="../front/css/pintuer.css">
    <link rel="stylesheet" href="../front/css/admin.css">
    <link rel="stylesheet" href="../front/css/sSkim.css">
    <!--导入的js文件-->
   <link rel="stylesheet" type="text/css" href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />

<script type="text/javascript" src="${APP_PATH}/front/js/jquery-1.12.4.js"></script>
<script src="${APP_PATH}/front/bootstrap/bootstrap.min.js"></script>
    <script src="../front/js/jquery.js"></script>
    <script src="../front/js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
        <div class="padding button-group">  
            <ul class="search">
               <li>
                 <h5 style="color: red;">总浏览量:${course.logclick + course.unlogclick }, 学生浏览量: ${course.logclick }, 游客浏览量: ${course.unlogclick }</h5>
               </li>
           </ul>
        </div>
        <div class="sContainer">
			<div class="sConNav nav nav-tabs navbar">
				<ul id="itemSkim">
					<li class="aLi" aid="all">所有记录</li>
				</ul>
			</div>
			<div class="sConContent">
				<div class="sConContent_tal" id="all">
					<div class="sTal_table">
						<form>
							<table class="table table-hover text-center">
								<tr>
									<th width=30%>学生名</th>
									<th width=30%>班级</th>
									<th width=30%>最后访问时间</th>									
									<th width=120>浏览次数</th>								
								</tr>
								<tbody id="all_logs">
									
								</tbody>
						</table>
						</form>
						<div class="row">
							<div class="col-md-6" id="zb_page_info_area"></div>
							<div class="col-md-6" id="zb_page_nav_area"></div>
						</div>
					</div>
				</div>
			</div>
        </div>
    </div>
</body>
<!-- <script>

	$(function(){
		$(".sConNav>ul").on('click','li',function(){
			var aid = $(this).attr('aid');
			$(".sConNav>ul>li").removeClass('aLi');
			$(this).addClass('aLi');
			$(".sConContent>.sConContent_tal").addClass('hide');
			$("#"+aid).removeClass('hide');
		});
	});
</script> -->

<script type="text/javascript">
/*显示本门课程所有学生浏览记录*/
to_page(1);
function to_page(pn){
	var courseId = getUrlParam('courseId');
	$.ajax({
		url:"${APP_PATH}/CourseClickLog/findAllCourseClicklogs.action?courseId="+courseId+"&page="+pn,
		type:"GET",
		success : function(data) {
			if(data.status == 200){
				buide_logs_table(data.data.list, "#all_logs");
				if (data.data.total >= 5) {
					//2.解析并显示分页信息
					buide_pqge_info(data, "#zb_page_info_area");
					//3.解析并显示分页条
					buide_pqge_nav(data, "#zb_page_nav_area");
				}
			}
		}
	});
}

function buide_logs_table(data, ele) {
	$(ele).empty();
	$.each(data,function() {
		var tr = $("<tr></tr>");
		var tdName =$("<td>"+this.sname+"</td>");
		var tdCount =$("<td>"+this.clickcount+"</td>");
		var tdTime =$("<td>"+this.lasttime+"</td>");
		if(this.className != null){
			var tdClass =$("<td>"+this.className+"</td>");
		}else{
			var tdClass =$("<td>无</td>");
		}
		tr.append(tdName).append(tdClass).append(tdTime).append(tdCount);
		tr.appendTo(ele);
	});
}

//解析并显示分页信息
function buide_pqge_info(data, ele) {
	//清空
	$(ele).empty();
	$(ele).append(
			"当前" + data.data.pageNum + "页,总" + data.data.pages + "页,共"
					+ data.data.total + "记录数");
	//给全局总记录数赋值
	totalRecord = data.data.total;
	//保存当前页
	currentPage = data.data.pageNum;
}

//解析并显示分页条
function buide_pqge_nav(data, ele) {
	//清空
	$(ele).empty();
	var ul = $("<ul></ul>").addClass("pagination");

	var firstPageLi = $("<li></li>").append(
			$("<a></a>").append("首页").attr("href", "#"));
	var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
	//判断前一页和首页能否被点击
	if (data.data.hasPreviousPage == false) {
		firstPageLi.addClass("disabled");
		prePageLi.addClass("disabled");
	} else {
		//为首页，下一页添加事件
		firstPageLi.click(function() {
			to_page(1);
		});
		prePageLi.click(function() {
			to_page(data.data.pageNum - 1);
		});
	}

	var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
	var lastPageLi = $("<li></li>").append(
			$("<a></a>").append("尾页").attr("href", "#"));
	//判断下一页和末页能否被点击
	if (data.data.hasNextPage == false) {
		nextPageLi.addClass("disabled");
		lastPageLi.addClass("disabled");
	} else {
		//为下一页页，末页添加事件
		nextPageLi.click(function() {
			to_page(data.data.pageNum + 1);
		});
		lastPageLi.click(function() {
			to_page(data.data.pages);
		});
	}

	//添加首页和前一页
	ul.append(firstPageLi).append(prePageLi);

	$.each(data.data.navigatepageNums, function(index, item) {
		var numLi = $("<li></li>").append($("<a></a>").append(item));
		//当前页突出显示
		if (data.data.pageNum == item) {
			numLi.addClass("active");
		}
		numLi.click(function() {
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


/* 显示学习本门课程的班级 */
$(function(){
	var courseId = getUrlParam('courseId');
	$.ajax({
		url:"${APP_PATH}/CourseAndClass/findCourseClassByCourseId.action?courseId="+courseId,
		type:"GET",
		success : function(data) {
			if(data.status == 200){
				/* buide_emps_table(data.data,"#itemSkim"); */
			}
		}
	});
});


//解析并显示数据
function buide_emps_table(data, ele) {
	$(ele).empty();
	/* alert(data);
	alert(ele); */
	/* console.log(data); */
	var i=1;
	$.each(data,function() {
	/* console.log(data); */
	/* alert(this.dbClassName.name); */
		if(i == 1){
			var li = $('<li class="aLi" aid=""+data.classId+"">'+this.dbClassName.name+'</li>');
			i++;
		}else{
			var li = $('<li aid=""+data.classId+"">'+this.dbClassName.name+'</li>');
			i++;
		}
		li.appendTo(ele);
	});
}
/*获取地址栏参数*/
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}
</script>
</html>
