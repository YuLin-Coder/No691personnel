<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>消息提示页面</title>
	  
    <script type="text/javascript">
    function toClose(){
        location.href = "<%=path%>/servlet/ProblemUserServlet";
        return false;
    }
    
    </script>

  </head>
  
  <body>
    <h3>${message } </h3>
    <p align="center">
    <input type="button" value="关闭" onclick="toClose()">
    </p>
  </body>
</html>

