<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>left-btn</title>
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
        html,
        body {
            overflow-x: hidden; /* Prevent scroll on narrow devices */
        }

        body {
            padding-top: 70px;
        }

        footer {
            padding: 30px 0;
        }

        @media screen and (max-width: 767px) {
            .row-offcanvas {
                position: relative;
                -webkit-transition: all .25s ease-out;
                -o-transition: all .25s ease-out;
                transition: all .25s ease-out;
            }

            .row-offcanvas-right
            .sidebar-offcanvas {
                right: -50%; /* 6 columns */
            }

            .row-offcanvas-left
            .sidebar-offcanvas {
                left: -50%; /* 6 columns */
            }
        }
    </style>
    <script type="text/javascript">
        function setId() {
            var a = document.getElementsByTagName("a");
            for (var i = 0; i < a.length; i++) {
                a[i].id = i + 1;
            }
        }
        function changeColor(id) {
            var a = document.getElementsByTagName("a");
            for (var i = 0; i < a.length; i++) {
                if (i + 1 == id) {
                    document.getElementById(i + 1).className = "list-group-item active";
                } else {
                    document.getElementById(i + 1).className = "list-group-item";
                }
            }
        }
    </script>
</head>

<body onload="setId()">
<div class="container">
    <div class="row sidebar">
        <div class="col-md-3" id="sidebar" role="navigation">
            <div class="list-group">
                <a href="<%=path %>/dept/listFore" target="rightFrame" onclick="changeColor(this.id)"
                   class="list-group-item">部门信息</a>
                <a href="<%=path %>/post/listFore" target="rightFrame" onclick="changeColor(this.id)"
                   class="list-group-item">岗位信息</a>
                <a href="<%=path %>/user/listFore" target="rightFrame" onclick="changeColor(this.id)"
                   class="list-group-item">员工信息总览</a>
                <a href="<%=path %>/salary/listFore" target="rightFrame" onclick="changeColor(this.id)"
                   class="list-group-item">薪酬信息</a>
                <a href="<%=path %>/reward/listFore" target="rightFrame" onclick="changeColor(this.id)"
                   class="list-group-item">奖惩信息</a>
                <a href="<%=path %>/system/pwd" target="rightFrame" onclick="changeColor(this.id)"
                   class="list-group-item">修改密码</a>

            </div>
        </div><!--/span-->
    </div><!--/row-->
</div>
</body>
</html>
