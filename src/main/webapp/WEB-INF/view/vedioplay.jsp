<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
 <%@ include file="./common/common.jsp" %>
<link rel="stylesheet"	href="${ctx }/style/videojs/video-js.css">
<script src="${ctx }/style/videojs/video.js"></script>
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
.u-courseHead .ov .right {
    height: 250px;
    margin-left: 650px;
    padding-right: 20px;
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
				<li class="active">
					<a href="${pageContext.request.contextPath }">首页</a>
				</li>
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
					<li><a href="#">关于 </a></li>
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
				href="javascript: void(0);">课程播放</a></li>
		</ul>
	</div>
	<div class="g-flow f-cb">
		<div class="f-bg courseheadbox" id="j-coursehead">
			<div class="u-courseHead" id="auto-id-1509947716498" style="height:600px;">
				<div class="ov f-pr j-ch" style="padding-top: 0px; top: 10px;height:600px;"> 
					<div class="g-sd1 left j-chimg">
						<div id="box">
       						 <video id="example_video_1" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="none" width="640" height="480" data-setup="{}">
            					<source src="http://www.jkj521.com/resource${first.videoUrl }" type="video/mp4">
         			 		</video>
         			 		<div>
         			 			<h3>当前播放：</h3><span id="curPlay">${first.videoName }</span>
         			 		</div>
   				 		</div>
					</div>
					<div class="g-mn1" >
						<div class="g-mn1c right" style="height:40px;">
							<h3>播放列表</h3>
						</div>
						<div class="g-mn1c right j-right f-pr" style="height:500px;overflow-y:scroll;">
							<div class="layui-collapse" lay-accordion="">
								<c:forEach var="each" items="${list }" varStatus="status">
									<div class="layui-colla-item">
    								<h2 class="layui-colla-title">${each.sectionName }</h2>
   										 <div class="layui-colla-content">
   										 	<ul class="list-group">
   										 		<c:forEach var="ea" items="${each.list }">
   										 			<li class="list-group-item" style="width:100%;cursor:pointer;" onclick="changeSource('${ea.videoUrl }',this)">${ea.videoName }</li>
   										 		</c:forEach>
   										 	</ul>
    									</div>
 								 </div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
		layui.use(['element', 'layer'], function(){
			  var element = layui.element;
			  var layer = layui.layer;
		});
		
		
		videojs.options.flash.swf = "videojs/video-js.swf"
	        //传入视频ID,适用于页面上只有一个播放器的情况
	        //teachOrder 采用哪种播放方式，默认采用html5的video标签播放，苹果不支持flash
	        //mydata 是要传给播放器上显示的用户名
	        var player = videojs('#example_video_1',{
	            techOrder: ["html5","flash"],
	            control: {
	                 captionsButton: true,
	                 chaptersButton : true,
	                 liveDisplay:true,
	                 playbackRateMenuButton: true,
	                 subtitlesButton:true
	             },
	               controlBar: {
	                fullscreenToggle:true,
	                volumeMenuButton:true
	            },
	            height:"480px",
	            width:"640px"

	        },function(){
	            //这里是播放器初始化之后放置要显示的内容
	            //更高级的应用可以创建一个组件(component)
	             var textNode = document.createElement('div');
	             textNode.className = 'user-name';
	            //textNode.innerHTML = this.options().mydata.username||'';
	             this.el().appendChild(textNode);
	             this.userName = textNode;
	             player.play();
	        });
	    
	        // var volumeMenuButton  = player.controlBar.getChild('volumeMenuButton').el();
	        // volumeMenuButton.style.display='none'
	     

	        function changeSource(value,that){
	        	var curPlay=$("#curPlay").text();
	        	if(!curPlay){
	        		curPlay="其他视频"
	        	}
	        	layer.confirm('当前正在播放  '+curPlay+'，是否切换？',  function(index){
	    	            layer.close(index);
	    	            player.src("http://www.jkj521.com/resource"+value);
	    	            $("#curPlay").text($(that).text());
	    	            player.play();
	        		});
	            
	        }
		</script>
</body>
</html>
