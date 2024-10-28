<%@ page language="java" pageEncoding="utf-8" %>
<%@ page import="java.util.Map" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>top-right</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <meta name="viewport" content="width=device-width, initial-scale=1"><!-- 包含头部信息用于适应不同设备 -->
    <link href="<%=path %>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet"><!-- Bootstrap core CSS -->
    <link href="<%=path %>/resource/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"><!-- Bootstrap theme -->
    <script src="<%=path %>/resource/bootstrap/js/jquery-3.1.1.min.js"></script>
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script><!-- 包括所有已编译的插件 -->
    <script src="<%=path %>/resource/bootstrap/js/docs.min.js"></script>

    <style type="text/css">
        body {
            padding-top: 50px;
        }

        .navbar-fixed-top {
            border: 0;
        }

        @media (min-width: 768px) {
            .sidebar {
                position: fixed;
                top: 51px;
                bottom: 0;
                left: 0;
                z-index: 1000;
                display: block;
                padding: 20px;
                overflow-x: hidden;
                overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
                background-color: #f5f5f5;
                border-right: 1px solid #eee;
            }
        }

        .nav-sidebar > li > a {
            padding-right: 20px;
            padding-left: 20px;
        }

        .nav-sidebar > .active > a,
        .nav-sidebar > .active > a:hover,
        .nav-sidebar > .active > a:focus {
            color: #fff;
            background-color: #428bca;
        }

        @media (min-width: 768px) {
            .main {
                padding-right: 40px;
                padding-left: 40px;
            }
        }

        .main .page-header {
            margin-top: 0;
        }

        .placeholders h4 {
            margin-bottom: 0;
        }

        .placeholder img {
            display: inline-block;
            border-radius: 50%;
        }
    </style>
    <script type="text/javascript">
        function ToOut(obj) {
            if (window.confirm("您去确定要退出该系统吗?")) {
                obj.href = "<%=path%>/system/logout";//千万不要在=号两端加入空格
                return false;
            }
        }
        function setId() {
            var li = document.getElementsByTagName("li");
            for (var i = 0; i < li.length; i++) {
                li[i].id = i + 1;
            }
        }
        function changeColor(id) {
            var li = document.getElementsByTagName("li");
            for (var i = 0; i < li.length; i++) {
                if (i + 1 == id) {
                    document.getElementById(i + 1).className = "active";
                } else {
                    document.getElementById(i + 1).className = "";
                }
            }
        }
    </script>
</head>

<body onload="setId()">
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:void(0)">中小企业人事管理系统</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li onclick="changeColor(this.id)"><a href="javascript:void(0)">管理员${sessionScope.user.username}，欢迎登陆！</a></li>
                <li onclick="changeColor(this.id)"><a href="javascript:void(0)" onclick="ToOut(this)" target="_parent">安全退出</a>
                </li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>
