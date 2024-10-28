<%@page language="java" pageEncoding="utf-8" %>
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
    <script src="<%=path %>/resource/bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script><!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="<%=path %>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script><!-- 包括所有已编译的插件 -->
    <script src="<%=path %>/resource/bootstrap/js/docs.min.js" type="text/javascript"></script>


    <link href="<%=path %>/resource/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <script type="text/javascript">

        function toAdd() {
            //跳转到添加页面
            var ret = window.open("<%=path%>/reward/add", window, "dialogWidth:800px;dailogHeight:400px;");
            //针对于火狐和谷歌浏览器的操作
            if (ret == undefined) {
                ret = window.returnValue;
            }
            if (ret == "success") {
                window.location.reload();
            }
        }
        function toUpdate(rewardid) {
            var ret = window.open("<%=path%>/reward/" + rewardid + "/detail", window, "dialogWidth:800px;dailogHeight:400px;");
            //针对于火狐和谷歌浏览器的操作
            if (ret == undefined) {
                ret = window.returnValue;
            }
            if (ret == "success") {
                window.location.reload();
            }
        }

        function toDelete(rewardid) {
            if (window.confirm("您去确定要对该条记录进行【删除】操作吗,删除用户后将清除他所有的信息记录?")) {
                location.href = "<%=path%>/reward/" + rewardid + "/delete";//千万不要在=号两端加入空格
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
            <h1 class="sub-header">全部薪酬信息 </h1>
            <div class="table-responsive">
                <div class="alert alert-success" role="alert">
                    <form id="form" class="form-inline" action="<%=path %>/reward/list" method="post">
                        <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
                        <div class="input-group input-group-md date form_date" data-date-format="yyyy-mm-dd">
                            <span class="input-group-addon">奖惩时间</span>
                            <input type="text" name="rewarddate" value="" id="rewarddate"
                                   class="form-control" readonly>
                            <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </span>
                            <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
							        </span>
                        </div>

                        <input type="submit" value="查找" class="btn btn-success col-md-offset-5">
                    </form>
                </div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>员工姓名</th>
                        <th>奖惩日期</th>
                        <th>原因</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty info.list}">
                        <tr>
                            <td colspan="8"><font color="red">不好意思，没有你想要的结果</font></td>
                        </tr>
                    </c:if>
                    <c:forEach items="${info.list}" var="reward" varStatus="vs">
                        <tr>
                            <td>${reward.rewardid}</td>
                            <td>${reward.user.realname}</td>
                            <td><fmt:formatDate value="${reward.rewarddate==null?'':reward.rewarddate}" pattern="yyyy-MM-dd"/></td>
                            <td>${reward.reason}</td>
                        </tr>
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
<script type="text/javascript"
        src="<%=path%>/resource/datetimepicker/jquery/jquery-1.8.3.min.js"
        charset="UTF-8">
</script>
<script type="text/javascript"
        src="<%=path%>/resource/datetimepicker/js/bootstrap.min.js">
</script>
<script type="text/javascript"
        src="<%=path%>/resource/datetimepicker/js/bootstrap-datetimepicker.js"
        charset="UTF-8">
</script>
<script type="text/javascript"
        src="<%=path%>/resource/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
        charset="UTF-8">
</script>
<script type="text/javascript">
    var newDate = new Date();
    var t = newDate.toJSON();
    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,

    });
</script>
