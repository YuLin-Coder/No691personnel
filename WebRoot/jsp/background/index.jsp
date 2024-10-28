<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <base href="<%=basePath%>">
	    
	    <title>index</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<meta name="viewport" content="width=device-width, initial-scale=1"><!-- 包含头部信息用于适应不同设备 -->
		<link href="<%=path %>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet"><!-- Bootstrap core CSS -->
		<link href="<%=path %>/resource/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"><!-- Bootstrap theme -->
		<script src="<%=path %>/resource/bootstrap/js/jquery-3.1.1.min.js"></script><!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
		<script src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script><!-- 包括所有已编译的插件 -->
		<script src="<%=path %>/resource/bootstrap/js/docs.min.js"></script>
	</head>
  	<frameset rows="50,*" cols="*" frameborder="no" border="0" framespacing="0">
		<frame src="<%=path %>/jsp/background/top-right.jsp" name="topFrame" scrolling="No" noresize="noresize" id="" title="topFrame" />
		<frameset cols="250,*" frameborder="no" border="0" framespacing="0">
			<frame src="<%=path %>/jsp/background/left-btn.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="" title="leftFrame" />
			<frame src="<%=path %>/jsp/background/right-first.jsp" name="rightFrame" id="" title="rightFrame" />
		</frameset>
	</frameset>
	<body>
		
	</body>
</html>
