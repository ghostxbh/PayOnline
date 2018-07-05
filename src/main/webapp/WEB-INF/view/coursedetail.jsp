<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<%@ include file="./common/common.jsp" %>
<title>学院</title>
<!--[if lt IE 9]>  
<script src="js/html5shiv.js"></script>  
<script src="js/respond.min.js"></script>  
<![endif]-->
<style>
body {
	padding-top: 50px;
	padding-bottom: 40px;
	color: #5a5a5a;
}
</style>

</head>

<body>
	<!--下面是顶部导航栏的代码-->
	<nav class="navbar navbar-default navbar-inverse navbar-fixed-top"
		role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath }">会计学院 </a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="${pageContext.request.contextPath }">首页</a></li>
				<li class="dropdown">
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${loginUser != null }">
					<li><a href="${ctx }/mylearn">我的课程 </a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">[${loginUser.username }]<strong
							class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="${ctx}/user/logOut" class="glyphicon glyphicon-inbox">
									退出帐号</a></li>
						</ul></li>
				</c:if>
				<c:if test="${loginUser == null }">
					<li><a href="loginer"><span
							class="glyphicon glyphicon-log-in"></span> 登录</a></li>
					<li><a href="register"><span
							class="glyphicon glyphicon-user"></span> 注册 </a></li>
					
				</c:if>

			</ul>
		</div>
	</div>
	</nav>
	<div class="mc-search-course-breadcrumb">
		<ul class="g-flow f-cb">
			<li><a href="${pageContext.request.contextPath }"
				target="_blank">首页</a></li>

			<li class="current"><span class="arrow"></span> <a
				href="javascript: void(0);">课程详情</a></li>
		</ul>
	</div>
	<div class="g-flow f-cb">
		<div class="f-bg courseheadbox" id="j-coursehead">
			<div class="u-courseHead" id="auto-id-1509947716498">
				<div class="ov f-pr j-ch" style="padding-top: 0px; top: 10px;">
					<div class="g-sd1 left j-chimg">
						<img width="450" height="250"
							src="http://www.jkj521.com/resource${course.photoUrl }">
					</div>
					<div class="g-mn1">
						<div class="g-mn1c right j-right f-pr">
							<div class="ctarea f-fl j-cht">
								<div class="u-coursetitle f-fl" id="auto-id-1509947716616">
									<h2 class="f-thide">
										<span class="u-coursetitle_title" title="">${course.courseName}</span>
									</h2>
									<div class="f-cb margin-top-15">
										<span class="cmt">已有${course.salesVolume }人学过 </span>
										<%-- <div class="f-fl" style="margin-right: 3px;">
											<a href="#" target="_blank" class="j-userNode"
												data-id="837467" data-type="10" id="auto-id-1509947716617">${course.courseInfo}</a>
										</div> --%>
									</div>
									<div class="f-cb margin-top-15">
										<span class="cmt"><b>讲师：</b>${course.lecturer } </span>
									</div>
								</div>
							</div>
							<div>
								<div class="btnarea f-pa j-chbtnarea">
									<!-- <a class="learnbtn f-db f-cb j-joinBtn"><span>立即参加</span></a>  -->									
									 <c:if test="${course.free==0}">
										<a class="learnbtn f-db f-cb j-joinBtn"><span>立即支付</span></a>
									</c:if>													
									<c:if test="${course.free==1}">
										<a class="learnbtn f-db f-cb j-joinBtn"><span>立即参加</span></a>
									</c:if> 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="g-flow f-cb">
		<div class="f-bg courseheadbox" id="j-coursehead">
			<div class="u-courseHead" id="auto-id-1509947716498">
				${course.courseInfo }
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="modal-title">
					
				</h4>
			</div>
			<div class="modal-body" id="modal-body">
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="confirm">
					
				</button>
				<button type="button" class="btn btn-default" id="cancle">
					
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
	
	<script>	
		$(document)	.ready(	function() {
							$(".learnbtn").click(function() {
												if (!"${loginUser}") {
													window.location = "${pageContext.request.contextPath }/loginer";
												} else {
													/* if ("${isSelect}" == "true") {
														deleteCourse();
													} else {
														insertCourse();
													} */
													var free = "${course.free}";
													if (free==1) {
														window.location = "${pageContext.request.contextPath }/learn/getSections?cid=${course.id}";
													}else{
														orderData();
													}
													
												}
											});
						});
		
		//时间戳函数
		/* function GetDateNow() {
			var vNow = new Date();
			var sNow = "";
			sNow += String(vNow.getFullYear());
			sNow += String(vNow.getMonth() + 1);
			sNow += String(vNow.getDate());
			sNow += String(vNow.getHours());
			sNow += String(vNow.getMinutes());
			sNow += String(vNow.getSeconds());
			sNow += String(vNow.getMilliseconds());		
			return sNow;
		} */
		
		function orderData(){
			var url = "${pageContext.request.contextPath }/pay/getConfirmInfoPage";
			var params={
				"cid": "${course.id}"	
			};
			 $('#myModal #modal-body').load(url,params,function(){
				 $("#modal-title").text("确认订单信息")
				 $("#confirm").text("去支付")
				 $("#cancle").text("取消")
				 $("#myModal #confirm").click(function(){
					 $("#myModal #formId").submit();
					 $("#confirm").text("支付完成")
				
					 $('#confirm').click(function(){						 
					 location.href = "${pageContext.request.contextPath }/learn/getSections?cid=${course.id}";
				 })
				 });
				 $("#myModal #cancle").click(function(){
					 $("#myModal").modal("hide"); 
				 });
				 $("#myModal").modal("show"); 
				 
			 })
			 
		}
			
		function insertCourse() {
			$.ajax({
				type : "post",
				url : "insertCourse",
				data : {
					"courseid" : "${course.id}",
					"userid" : "${loginUser.id}"
				},
				async : true,
				success : function(data) {
					/* alert(password==data); */
					if (data == "true") {
						location.href = "learn/watchvedio?cid=${course.id}"
						//location.reload(true) ;
					} else {
						$(".learnbtn").focus();
						return;
					}
					/* alert(data); */
				}
			})
		}
		function deleteCourse() {

			$.ajax({

						type : "post",
						url : "insertCourse",
						data : {
							"courseid" : "${course.id}" ,
							"userid" :   "${loginUser.id}"
						},
						async : true,
						success : function(data) {
							/* alert(password==data); */
							if (data == "true") {
								location.href="learn/getSections?cid=${course.id}"
								//location.reload(true) ;
							} else {
								$(".learnbtn").focus();
									return;
							}
							/* alert(data); */
						}
			})
}
function deleteCourse() {
	
	$.ajax({


				type : "post",
				url : "deleteCourse",
				data : {
					"courseid" : "${course.id}",
					"userid" : "${loginUser.id}"
				},
				async : true,
				success : function(data) {
					/* alert(password==data); */
					if (data == "true") {

						location.reload(true);
					} else {
						$(".learnbtn").focus();
						return;
					}
					/* alert(data); */
				}
	})
		}
	</script>
</body>
</html>
