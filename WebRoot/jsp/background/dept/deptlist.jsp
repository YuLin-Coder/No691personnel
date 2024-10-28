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

    <title>right-table</title>
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
    <script type="text/javascript">

        function toAdd() {
            //跳转到添加页面
            var ret = window.open("<%=path%>/dept/add", window, "dialogWidth:800px;dailogHeight:400px;");
            //针对于火狐和谷歌浏览器的操作
            if (ret == undefined) {
                ret = window.returnValue;
            }
            if (ret == "success") {
                window.location.reload();
            }
        }
        function toUpdate(deptid) {
            var ret = window.open("<%=path%>/dept/" + deptid + "/detail", window, "dialogWidth:800px;dailogHeight:400px;");
            //针对于火狐和谷歌浏览器的操作
            if (ret == undefined) {
                ret = window.returnValue;
            }
            if (ret == "success") {
                window.location.reload();
            }
        }

        function toDelete(deptid) {
            if (window.confirm("您去确定要对该条记录进行【删除】操作吗,删除用户后将清除他所有的信息记录?")) {
                location.href = "<%=path%>/dept/" + deptid + "/delete";//千万不要在=号两端加入空格
                return false;
            }
        }
        function toShow(deptid) {
            location.href = "<%=path %>/dept/" + deptid + "/list";//千万不要在=号两端加入空格
        }
        function jumpPage(pageNum) {
            var form = document.getElementById("form");
            var page = document.getElementById("pageNum");
            page.value = pageNum;
            form.submit();
        }
    </script>
    <style type="text/css">
        body {
            padding-top: 10px;
        }

        .sub-header {
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        @media (min-width: 768px) {
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
</head>

<body>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 main">
            <h1 class="sub-header">部门信息</h1>
            <label>${message}</label>
            <div class="table-responsive">
                <div class="alert alert-success" role="alert">
                    <form class="form-inline" id="form" action="<%=path %>/dept/list" method="post">
                        <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
                        <input class="form-control" placeholder="部门名称" type="text" name="deptname">
                        <input type="submit" value="查找" class="btn btn-success col-md-offset-8">
                        <button type="button" onclick="toAdd()" class="btn btn-success">添加</button>
                    </form>
                </div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>部门名称</th>
                        <th>部门职责</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty info.list}">
                        <tr>
                            <td colspan="8"><font color="red">不好意思，没有你想要的结果</font></td>
                        </tr>
                    </c:if>
                    <c:forEach items="${info.list}" var="dept" varStatus="vs">
                        <tr>
                            <td>${dept.deptid}</td>
                            <td>${dept.deptname}</td>
                            <td>${dept.deptdesc}</td>
                            <td>
                                <button type="button" onclick="toDelete('${dept.deptid}')"
                                        class="btn btn-sm btn-warning">删除
                                </button>
                                <button type="button" onclick="toUpdate('${dept.deptid}')" class="btn btn-sm btn-info">
                                    修改
                                </button>
                                <button type="button" onclick="toShow('${dept.deptid}')" class="btn btn-sm btn-info">
                                    查看岗位
                                </button>
                            </td>
                        </tr>
                        <c:if test="${post.size==0 && dept.deptid==fkdeptid}">
                            <tr><td style="color: red">暂无岗位</td></tr>
                        </c:if>
                        <c:if test="${post.size>0 && dept.deptid==fkdeptid}">
                            <tr><td>岗位编号</td><td>岗位名称</td><td>岗位介绍</td></tr>
                            <c:forEach items="${post.list}" var="post" varStatus="vs">
                                <tr><td>${post.postid}</td><td>${post.postname}</td><td>${post.postdesc}</td></tr>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="alert alert-info" role="alert">
                <c:if test="${info.size>0}">
                    <div class="btu-group">
                        <button onclick="jumpPage(1)" class="btn btn-sm btn-primary">首页</button>
                        <c:forEach items="${info.navigatepageNums}" var="pageNum">
                            <button onclick="jumpPage(${pageNum})" class="btn btn-sm btn-primary">${pageNum}</button>
                        </c:forEach>
                        <button onclick="jumpPage(${info.pages})" class="btn btn-sm btn-primary">尾页</button>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

</body>
</html>
