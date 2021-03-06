<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>  
<meta charset="utf-8"> 
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
<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">  
<div class="container-fluid">  
<div class="navbar-header">  
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"  
                    data-target="#bs-example-navbar-collapse-1">  
<span class="sr-only">Toggle navigation</span>  
<span class="icon-bar"></span>  
<span class="icon-bar"></span>  
<span class="icon-bar"></span>  
</button>  
<a class="navbar-brand" href="${pageContext.request.contextPath }">会计学院 </a>
</div>  
  
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">  
<ul class="nav navbar-nav">  
<li class="active"><a href="${pageContext.request.contextPath }">首页</a></li>  
<!-- <li class="dropdown">  
<a href="#" class="dropdown-toggle" data-toggle="dropdown">功能<span class="caret"></span></a>  
<ul class="dropdown-menu" role="menu">  
<li class="dropdown-header">业务功能</li>  
<li><a href="#">信息建立</a></li>  
<li><a href="#">信息查询</a></li>  
<li><a href="#">信息管理</a></li>  
<li class="divider"></li>  
<li class="dropdown-header">系统功能</li>  
<li><a href="#">设置</a></li>  
</ul>  
</li>  
<li><a href="#">帮助</a></li>   -->
</ul>  
<form class="navbar-form navbar-left" >
				
				<input type="text" class="form-control" placeholder="课程">  
				<button type="submit" class="btn">查找</button>
			</form>
<ul class="nav navbar-nav navbar-right">
						<c:if test="${loginUser != null }">
							<li><a href="mylearn">我的课程 </a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">[${loginUser.username }]<strong
									class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="${ctx}/user/logOut" class="glyphicon glyphicon-inbox"> 退出帐号</a></li>
								</ul></li>
						
						
						</c:if>
						<c:if test="${loginUser == null }">
							
						
						
						
							<li><a  href="loginer"><span
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
<li class="current">
<a href="javascript: void(0);" target="_blank">首页</a>
</li>



</ul>
</div>
<!--下面是主要内容的代码-->
<div class="container-fluid">  
<div class="j-course-list">
	<div class="uc-course-list g-flow">
	 <div class="uc-course-list_content">	
	    <ul class="uc-course-list_ul">
	    <c:forEach var="course" items="${courses}" varStatus="status">
	        <li class="uc-course-list_itm f-ib">
    			<div class="uc-coursecard uc-ykt-coursecard f-fl">
    			<a target="_blank" class="j-href" href="coursedetail?courseid=${course.id}" >
        			<div class="uc-ykt-coursecard-wrap f-cb f-pr">
            			<div class="uc-ykt-coursecard-wrap_box">
               				 <div class="uc-ykt-coursecard-wrap_picbox f-pr"> 
                				<img class="imgPic j-img" src="http://www.jkj521.com/resource${course.photoUrl }" data-src="" alt="课程图片" >
              			 	</div>
               				 <div class="uc-ykt-coursecard-wrap_tit">
                    			<h3 class="">${course.courseName}</h3>
                			</div>
               		 	<div class="uc-ykt-coursecard-wrap_scorewrap f-thide f-cb f-pa">
                   		 	<div class="m-scorecnt f-fl f-cb">
                       		 	<div class="uc-starrating">
									<span class="uc-starrating_score">4.7</span>
								</div>
                    		</div>
                   			 <div class="m-hot f-fl">
                          	  (${course.salesVolume }人学过)
                    		</div>
                		</div>
                		<div class="uc-ykt-coursecard-wrap_price f-pa">
                			<c:if test="${course.free eq '1' }">
                       			 <span class="u-free">免费</span> 
                			</c:if>
                			<c:if test="${course.free eq '0' }">
                       			 <span class="u-free" style="color:red">${course.price }元</span> 
                			</c:if>
                		</div>
           		 	</div>
        		</div>
   		 	</a>
			</div>
	       </li>
	     </c:forEach>
	    </ul>
	 </div>
	</div>
  </div>
</div>  
</body>  
</html>
