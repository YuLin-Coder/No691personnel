<%@ page language="java" pageEncoding="utf-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="<%=path %>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="<%=path %>/resource/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <script src="<%=path %>/resource/bootstrap/js/jquery-3.1.1.min.js"></script>
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="<%=path %>/resource/bootstrap/js/bootstrap.min.js"></script><!-- 包括所有已编译的插件 -->
    <script src="<%=path %>/resource/bootstrap/js/docs.min.js"></script>

    <link rel="stylesheet" href="<%=path%>/resource/kindeditor-4.1.10/themes/default/default.css"/>
    <script src="<%=path%>/resource/kindeditor-4.1.10/kindeditor.js" type="text/javascript"></script>
    <script src="<%=path%>/resource/kindeditor-4.1.10/lang/zh_CN.js" type="text/javascript"></script>
    <style type="text/css">
        /* Links */
        a,
        a:focus,
        a:hover {
            color: #fff;
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
        function checkName(username) {
            var p = document.getElementById("username").parentNode;
            var c = p.childNodes;
            if (username.length < 3 || username.length > 16) {
                p.className = "input-group has-feedback input-group-md col-md-8 has-error";
                c[5].className = "glyphicon form-control-feedback glyphicon-remove";
            } else {
                p.className = "input-group has-feedback input-group-md col-md-8 has-success";
                c[5].className = "glyphicon form-control-feedback glyphicon-ok";
            }
        }
        function checkRealname(realname) {
            var p = document.getElementById("realname").parentNode;
            var c = p.childNodes;
            if (realname == "") {
                p.className = "input-group has-feedback input-group-md col-md-8 has-error";
                c[5].className = "glyphicon form-control-feedback glyphicon-remove";
            } else {
                p.className = "input-group has-feedback input-group-md col-md-8 has-success";
                c[5].className = "glyphicon form-control-feedback glyphicon-ok";
            }
        }
        function checkIdCard(idnumber) {
            var p = document.getElementById("idnumber").parentNode;
            var c = p.childNodes;
            var reg = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/;
            if (!reg.test(idnumber)) {
                p.className = "input-group has-feedback input-group-md col-md-8 has-error";
                c[5].className = "glyphicon form-control-feedback glyphicon-remove";
            } else {
                p.className = "input-group has-feedback input-group-md col-md-8 has-success";
                c[5].className = "glyphicon form-control-feedback glyphicon-ok";
            }
        }
        function checkAge(age) {
            var p = document.getElementById("age").parentNode;
            var c = p.childNodes;
            if (age.length < 1 || age.length > 2) {
                p.className = "input-group has-feedback input-group-md col-md-8 has-error";
                c[5].className = "glyphicon form-control-feedback glyphicon-remove";
            } else {
                p.className = "input-group has-feedback input-group-md col-md-8 has-success";
                c[5].className = "glyphicon form-control-feedback glyphicon-ok";
            }
        }
        function checkPhone(phone) {
            var p = document.getElementById("phone").parentNode;
            var c = p.childNodes;
            var reg = /^[0-9]*$/;
            if ((phone.length != 11) || (!reg.test(phone))) {
                p.className = "input-group has-feedback input-group-md col-md-8 has-error";
                c[5].className = "glyphicon form-control-feedback glyphicon-remove";
            } else {
                p.className = "input-group has-feedback input-group-md col-md-8 has-success";
                c[5].className = "glyphicon form-control-feedback glyphicon-ok";
            }
        }

        function finalCheck() {
            var span = document.getElementsByTagName("span");
            var a = 0;
            for (var i = 0; i < span.length; i++) {
                if (span[i].className == "glyphicon form-control-feedback glyphicon-remove") {
                    a++;
                }
            }
            if (a == 0) {
                document.getElementById("submit").disabled = false;
            } else {
                document.getElementById("submit").disabled = true;
            }
        }

        function UpdateInfo() {
            document.getElementById("username").disabled = false;
            document.getElementById("password").disabled = false;
            document.getElementById("repassword").disabled = false;
            document.getElementById("realname").disabled = false;
            document.getElementById("email").disabled = false;
            document.getElementById("phone").disabled = false;
            document.getElementById("age").disabled = false;
            document.getElementsByName("sex")[0].disabled = false;
            document.getElementsByName("sex")[1].disabled = false;
            document.getElementById("updateinfo").style.display = "none";
            document.getElementById("submit").style.display = "block";
        }

        KindEditor.ready(function (K) {
            var editor = K.editor({
                allowFileManager: true
            });

            K('#image3').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        showRemote: false,
                        imageUrl: K('#url3').val(),
                        clickFn: function (url, title, width, height, border, align) {
                            K('#url3').val(url);
                            editor.hideDialog();
                            document.getElementById("goodsimg").style.display = "block";
                            document.getElementById("goodsimg").src = url;
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
            <form action="<%=path %>/system/edit" method="post">
                <input type="hidden" name="userid" value="${user.userid}">
                <br><br>
                <table class="col-md-6">
                    <thead>
                    <tr height="50px">
                        <th>详细个人信息</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr height="50px">
                        <td>
                            <div class="input-group input-group-md col-md-8 has-feedback">
                                <span class="input-group-addon">用户名</span>
                                <input type="text" name="username" value="${user.username}"
                                       class="form-control" id="username" placeholder="4-16位字符">
                                <span class="glyphicon form-control-feedback"></span>
                            </div>
                        </td>
                    </tr>
                    <tr height="50px">
                        <td>
                            <div class="input-group input-group-md col-md-8 has-feedback">
                                <span class="input-group-addon">账号</span>
                                <input type="text" name="account" value="${user.account}"
                                       class="form-control" id="account" placeholder="4-16位字符">
                                <span class="glyphicon form-control-feedback"></span>
                            </div>
                        </td>
                    </tr>
                    <tr height="50px">
                        <td>
                            <div class="input-group input-group-md col-md-8 has-feedback ">
                                <span class="input-group-addon">真实姓名</span>
                                <input type="text" name="realname" value="${user.realname}"
                                       class="form-control" id="realname">
                                <span class="glyphicon form-control-feedback"></span>
                            </div>
                        </td>
                    </tr>
                    <tr height="50px">
                        <td>
                            <div class="input-group input-group-md col-md-8 has-feedback">
                                <span class="input-group-addon">生日</span>
                                <input type="text" name="birthday"
                                       value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>"
                                       class="form-control">
                                <span class="glyphicon form-control-feedback"></span>
                            </div>
                        </td>
                    </tr>
                    <tr height="50px">
                        <td>
                            <div class="input-group input-group-md col-md-8 has-feedback">
                                <span class="input-group-addon">电话</span>
                                <input type="text" name="phone" value="${user.phone}"
                                       class="form-control">
                                <span class="glyphicon form-control-feedback"></span>
                            </div>
                        </td>
                    </tr>
                    <tr height="50px">
                        <td>
                            <div class="input-group input-group-md col-md-8 has-feedback">
                                <span class="input-group-addon">地址</span>
                                <input type="text" name="address" value="${user.address}"
                                       class="form-control" id="email">
                                <span class="glyphicon form-control-feedback"></span>
                            </div>
                        </td>
                    </tr>
                    <tr height="50px">
                        <td>
                            <div class="input-group input-group-md col-md-8 has-feedback">
                                <span class="input-group-addon">QQ</span>
                                <input type="text" name="qq" value="${user.qq}"
                                       class="form-control" id="diploma">
                                <span class="glyphicon form-control-feedback"></span>
                            </div>
                        </td>
                    </tr>
                    <tr height="50px">
                        <td>
                            <div class="input-group input-group-md col-md-8 has-feedback">
                                <span class="input-group-addon">性别</span>
                                <select class="form-control" name="sex">
                                    <option value="男" ${user.sex=='男'?'selected=selected':''}>男</option>
                                    <option value="女" ${user.sex=='女'?'selected=selected':''}>女</option>
                                </select>
                                <span class="glyphicon form-control-feedback"></span>
                            </div>
                        </td>
                    </tr>


                    </tbody>
                </table>
                <div align="center" class="col-md-6">
                    <span class="col-md-12"><h4>我的头像</h4></span>
                    <div class="col-md-12">
                        <img height="250px" width="400px" src="${user.userimg}" id="goodsimg" alt="无图片，请添加！">
                        <input type="hidden" id="url3" name="userimg" value="${user.userimg} "/>
                        <input class="btn btn-primary col-md-4 col-md-offset-4" type="button" id="image3" value="选择图片"/>
                    </div>
                    <div class="col-md-12">
                        <br><br><br>
                        <div class="btu-group col-md-offset-3 col-md-3">
                            <input type="submit" id="submit" value="确认信息并修改" class="btn btn-lg btn-info"/>
                        </div>

                    </div>

                </div>
            </form>

        </div>

    </div>

</div>
</body>
</html>
