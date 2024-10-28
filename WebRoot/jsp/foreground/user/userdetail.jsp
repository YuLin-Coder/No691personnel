<%@ page language="java" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        function toDetail(userid) {
            //跳转到添加页面
            var ret = window.open("<%=path%>/user/" + userid + "/toDetail", window, "dialogWidth:800px;dailogHeight:400px;");
            //针对于火狐和谷歌浏览器的操作
            if (ret == undefined) {
                ret = window.returnValue;
            }
            if (ret == "success") {
                window.location.reload();
            }
        }
        function toUpdate(userid) {
            var ret = window.open("<%=path%>/user/" + userid + "/detail", window, "dialogWidth:800px;dailogHeight:400px;");
            //针对于火狐和谷歌浏览器的操作
            if (ret == undefined) {
                ret = window.returnValue;
            }
            if (ret == "success") {
                window.location.reload();
            }
        }

        function toDelete(userid) {
            if (window.confirm("您去确定要对该条记录进行【删除】操作吗,删除用户后将清除他所有的信息记录?")) {
                location.href = "<%=path%>/user/" + userid + "/delete";//千万不要在=号两端加入空格
                return false;
            }
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
</head>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 main">
            <h1 class="sub-header">员工&nbsp;&nbsp;${user.realname}&nbsp;&nbsp;的详细信息</h1>
            <div class="table-responsive">
                <h3>家庭成员信息</h3>
                <div class="alert alert-success" role="alert">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>姓名</th>
                            <th>关系</th>
                            <th>工作</th>
                            <th>政治面貌</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty families.list}">
                            <tr>
                                <td colspan="8"><font color="red">不好意思，没有你想要的结果</font></td>
                            </tr>
                        </c:if>
                        <c:forEach items="${families.list}" var="f" varStatus="vs">
                            <tr>
                                <td>${f.familyid}</td>
                                <td>${f.familyname}</td>
                                <td>${f.relation}</td>
                                <td>${f.work}</td>
                                <td>${f.polity}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <h3>职业生涯信息</h3>
                <div class="alert alert-success" role="alert">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>公司</th>
                            <th>职位</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty careers.list}">
                            <tr>
                                <td colspan="8"><font color="red">不好意思，没有你想要的结果</font></td>
                            </tr>
                        </c:if>
                        <c:forEach items="${careers.list}" var="c" varStatus="vs">
                            <tr>
                                <td>${c.careerid}</td>
                                <td><fmt:formatDate value="${c.startdate}" pattern="yyyy-MM-dd"/> </td>
                                <td><fmt:formatDate value="${c.enddate}" pattern="yyyy-MM-dd"/></td>
                                <td>${c.company}</td>
                                <td>${c.position}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <h3>外语水平信息</h3>
                <div class="alert alert-success" role="alert">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>外语语种</th>
                            <th>等级考试</th>
                            <th>成绩</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty languages.list}">
                            <tr>
                                <td colspan="8"><font color="red">不好意思，没有你想要的结果</font></td>
                            </tr>
                        </c:if>
                        <c:forEach items="${languages.list}" var="l" varStatus="vs">
                            <tr>
                                <td>${l.languageid}</td>
                                <td>${l.languages}</td>
                                <td>${l.test}</td>
                                <td>${l.grade}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>


        </div>
    </div>
</div>

</body>
</html>
