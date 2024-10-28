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
    <script src="<%=path %>/resource/bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script><!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="<%=path %>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script><!-- 包括所有已编译的插件 -->

    <link rel="stylesheet" href="<%=path%>/resource/kindeditor-4.1.10/themes/default/default.css" />
    <script src="<%=path%>/resource/kindeditor-4.1.10/kindeditor.js" type="text/javascript"></script>
    <script src="<%=path%>/resource/kindeditor-4.1.10/lang/zh_CN.js" type="text/javascript"></script>

    <link href="<%=path %>/resource/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

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

        KindEditor.ready(function(K) {
            var editor = K.editor({
                allowFileManager : true
            });
            K('#image3').click(function() {
                editor.loadPlugin('image', function() {
                    editor.plugin.imageDialog({
                        showRemote : false,
                        imageUrl : K('#url3').val(),
                        clickFn : function(url, title, width, height, border, align) {
                            K('#url3').val(url);
                            editor.hideDialog();
                            document.getElementById("goodsimg").style.display="block";
                            document.getElementById("goodsimg").src=url;
                        }
                    });
                });
            });
        });
    </script>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 main">
            <h1 class="sub-header">添加工资信息 </h1>
            <div class="table-responsive">
                <form id="searchForm" action="<%=path %>/salary/edit" method="post">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th colspan="2">请填写详细信息</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <div class="input-group input-group-md col-md-8">
                                    <span class="input-group-addon">员工</span>
                                    <select class="form-control" name="fkuserid">
                                        <option value="">请选择</option>
                                        <c:forEach items="${user.list}" var="u">
                                            <option value="${u.userid}">${u.realname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="input-group input-group-md col-md-8">
                                    <span class="input-group-addon">发放金额</span>
                                    <input type="text" name="salary" class="form-control"
                                            placeholder="">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                    <div class="btu-group col-md-offset-4 col-md-3">
                        <input type="submit" id="submit" value="确认添加" class="btn btn-info" />
                        <input type="reset" class="btn btn-info" />
                    </div>
                </form>
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
        startDate:new Date(t)
    });
</script>
