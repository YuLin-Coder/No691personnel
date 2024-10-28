<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>myinfo</title>
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

    <link rel="stylesheet" href="<%=path%>/resource/kindeditor-4.1.10/themes/default/default.css" />
    <script src="<%=path%>/resource/kindeditor-4.1.10/kindeditor.js" type="text/javascript"></script>
    <script src="<%=path%>/resource/kindeditor-4.1.10/lang/zh_CN.js" type="text/javascript"></script>
    <style type="text/css">
        /* Links */
        a,
        a:focus,
        a:hover {
            color: #333;
        }

        html,
        body {
            height: 100%;
            background-color: #fff;
        }

        body {
            color: #333;
            text-align: center;
            text-shadow: 0 1px 3px rgba(0, 0, 0, .5);
        }

        /* Extra markup and styles for table-esque vertical and horizontal centering */
        .site-wrapper {
            display: table;
            width: 100%;
            height: 100%; /* For at least Firefox */
            min-height: 100%;
            -webkit-box-shadow: inset 0 0 100px rgba(0, 0, 0, .5);
            box-shadow: inset 0 0 100px rgba(0, 0, 0, .5);
        }

        .site-wrapper-inner {
            display: table-cell;
            vertical-align: top;
        }

        .masthead-nav > li {
            display: inline-block;
        }

        .masthead-nav > li + li {
            margin-left: 20px;
        }

        .masthead-nav > li > a {
            padding-right: 0;
            padding-left: 0;
            font-size: 16px;
            font-weight: bold;
            color: #fff; /* IE8 proofing */
            color: rgba(255, 255, 255, .75);
            border-bottom: 2px solid transparent;
        }

        .masthead-nav > li > a:hover,
        .masthead-nav > li > a:focus {
            background-color: transparent;
            border-bottom-color: #a9a9a9;
            border-bottom-color: rgba(255, 255, 255, .25);
        }

        .masthead-nav > .active > a,
        .masthead-nav > .active > a:hover,
        .masthead-nav > .active > a:focus {
            color: #fff;
            border-bottom-color: #fff;
        }

        @media (min-width: 768px) {
            .masthead-brand {
                float: left;
            }

            .masthead-nav {
                float: right;
            }
        }

        .cover .btn-lg {
            padding: 10px 20px;
            font-weight: bold;
        }

        @media (min-width: 768px) {
            /* Start the vertical centering */
            .site-wrapper-inner {
                vertical-align: middle;
            }
        }

        @media (min-width: 992px) {
            .masthead,
            .mastfoot,
            .cover-container {
                width: 700px;
            }
        }
    </style>
    <script type="text/javascript">
        function CheckPassword() {
            var p = document.getElementById("old").parentNode;
            var c = p.childNodes;
            if (document.getElementById("old").value == document.getElementById("password").value ) {
                p.className = "input-group has-feedback input-group-md col-md-8 has-success";
                c[5].className = "glyphicon form-control-feedback glyphicon-ok";
            } else {
                p.className = "input-group has-feedback input-group-md col-md-8 has-error";
                c[5].className = "glyphicon form-control-feedback glyphicon-remove";
            }
            fianlCheck();
        }
        function fianlCheck() {
            if ((document.getElementById("password").value == document.getElementById("old").value)){
                document.getElementById("submit").disabled = false;
            }else {
                document.getElementById("submit").disabled = disabled;
            }
        }

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

<div class="site-wrapper">
    <div class="site-wrapper-inner">
        <div class="container">
            <form action="<%=path %>/system/editMine" method="post">
                <input type="hidden" name="userid" value="${sessionScope.user.userid}">
                <input type="hidden" id="password" value="${sessionScope.user.password}">
                <table class="col-md-6 col-md-offset-3">
                    <thead>
                    <tr height="50px">
                        <th>修改密码</th>
                        <label>${message}</label>
                    </tr>
                    </thead>
                    <tbody>

                    <tr height="50px">
                        <td>
                            <div class="input-group has-feedback input-group-md col-md-8">
                                <span class="input-group-addon">请输入原密码：</span>
                                <input type="text" id="old" onblur="CheckPassword()"
                                       class="form-control" placeholder="">
                                <span class="glyphicon form-control-feedback"></span>
                            </div>
                        </td>
                    </tr>
                    <tr height="50px">
                        <td>
                            <div class="input-group input-group-md col-md-8">
                                <span class="input-group-addon">新密码</span>
                                <input type="password" name="password" value=""
                                       class="form-control"
                                       placeholder="">
                            </div>
                        </td>
                    </tr>
                    <tr height="50px">
                        <td>
                            <div class="btu-group col-md-offset-2 col-md-3">
                                <input type="submit" id="submit" disabled="disabled" value="确认信息并修改" class="btn btn-info" />
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>

        </div>

    </div>

</div>
</body>
</html>
