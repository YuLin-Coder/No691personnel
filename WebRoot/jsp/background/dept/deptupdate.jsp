<%@ page language="java" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>right-form</title>
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
            padding-top: 10px;
        }

        .sub-header {
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
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

        .main {
            padding: 20px;
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


    </script>
</head>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 main">
            <h1 class="sub-header">修改部门信息</h1>
            <div class="table-responsive">
                <form action="<%=path %>/dept/edit" method="post">
                    <input type="hidden" name="deptid" value="${dept.deptid}">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th colspan="2">请填写要修的信息</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <div class="input-group input-group-md col-md-8">
                                    <span class="input-group-addon">部门名称</span>
                                    <input type="text" name="deptname" value="${dept.deptname}" class="form-control"
                                           placeholder="">
                                </div>
                                <div class="input-group input-group-md col-md-8">
                                    <span class="input-group-addon">部门介绍</span>
                                    <input type="text" name="deptdesc" value="${dept.deptdesc}" class="form-control"
                                           placeholder="">
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btu-group col-md-offset-4 col-md-3">
                        <input type="submit" class="btn btn-info" />
                        <input type="reset" class="btn btn-info" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
