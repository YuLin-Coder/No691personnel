<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>register</title>
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
        /* Links */
        a,
        a:focus,
        a:hover {
            color: #fff;
        }

        html,
        body {
            height: 100%;
            background-color: #333;
        }

        body {
            color: #fff;
            text-align: center;
            text-shadow: 0 1px 3px rgba(0, 0, 0, .5);
        }

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

        .cover-container {
            margin-right: auto;
            margin-left: auto;
        }

        .inner {
            padding: 30px;
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
        }

        .cover {
            padding: 0 20px;
        }

        .cover .btn-lg {
            padding: 10px 20px;
            font-weight: bold;
        }

        @media (min-width: 768px) {
            .site-wrapper-inner {
                vertical-align: middle;
            }

            .cover-container {
                width: 100%; /* Must be percentage or pixels for horizontal alignment */
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
        function checkAccount(account) {
            var p = document.getElementById("account").parentNode;
            var c = p.childNodes;
            if (account.length < 4 || account.length > 16) {
                p.className = "input-group has-feedback input-group-md col-md-8 has-error";
                c[5].className = "glyphicon form-control-feedback glyphicon-remove";
            } else {
                p.className = "input-group has-feedback input-group-md col-md-8 has-success";
                c[5].className = "glyphicon form-control-feedback glyphicon-ok";
            }
        }
        function checkPassword(password) {
            var p = document.getElementById("password").parentNode;
            var c = p.childNodes;
            var reg = /^[A-Za-z0-9]*$/;
            if ((password.length < 6 || username.password > 30) || !(reg.test(password))) {
                p.className = "input-group has-feedback input-group-md col-md-8 has-error";
                c[5].className = "glyphicon form-control-feedback glyphicon-remove";
            } else {
                p.className = "input-group has-feedback input-group-md col-md-8 has-success";
                c[5].className = "glyphicon form-control-feedback glyphicon-ok";
            }
        }
        function checkRePassword(repassword) {
            var p = document.getElementById("repassword").parentNode;
            var c = p.childNodes;
            var password = document.getElementById("password").value;
            if (repassword != password || repassword == "") {
                p.className = "input-group has-feedback input-group-md col-md-8 has-error";
                c[5].className = "glyphicon form-control-feedback glyphicon-remove";
            } else {
                p.className = "input-group has-feedback input-group-md col-md-8 has-success";
                c[5].className = "glyphicon form-control-feedback glyphicon-ok";
            }
        }
        function checkIdCard(idcard) {
            var p = document.getElementById("idnumber").parentNode;
            var c = p.childNodes;
            var reg = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/;
            if (!reg.test(idcard)) {
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
        function checkEmail(email) {
            var p = document.getElementById("email").parentNode;
            var c = p.childNodes;
            var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!reg.test(email)) {
                p.className = "input-group has-feedback input-group-md col-md-8 has-error";
                c[5].className = "glyphicon form-control-feedback glyphicon-remove";
            } else {
                p.className = "input-group has-feedback input-group-md col-md-8 has-success";
                c[5].className = "glyphicon form-control-feedback glyphicon-ok";
            }
        }
        function checkQuestion(question) {
            var p = document.getElementById("question").parentNode;
            var c = p.childNodes;
            if (question == "") {
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
        function checkAddress(address) {
            var p = document.getElementById("address").parentNode;
            var c = p.childNodes;
            if (address == "") {
                p.className = "input-group has-feedback input-group-md col-md-8 has-error";
                c[5].className = "glyphicon form-control-feedback glyphicon-remove";
            } else {
                p.className = "input-group has-feedback input-group-md col-md-8 has-success";
                c[5].className = "glyphicon form-control-feedback glyphicon-ok";
            }
        }
        function checkAnswer(answer) {
            var p = document.getElementById("answer").parentNode;
            var c = p.childNodes;
            if (answer == "") {
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
        function finalCheck() {
            var span = document.getElementsByTagName("span");
            var a = 0;
            for (var i = 0; i < span.length; i++) {
                if (span[i].className == "glyphicon form-control-feedback" || span[i].className == "glyphicon form-control-feedback glyphicon-remove") {
                    a++;
                }
            }
            if (a == 0) {
                document.getElementById("submit").disabled = false;
            }else {
                document.getElementById("submit").disabled = true;
            }
        }
        var t1 = window.setInterval(finalCheck, 200);
    </script>
</head>

<body>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">中小型人事管理系统</a>
        </div>
        <div class="navbar-collapse collapse">
            <div class="navbar-form navbar-right">
                <a class="btn btn-success" href="<%=path %>/jsp/login.jsp">返回登录</a>
            </div>
        </div>
    </div>
</div>
<div class="site-wrapper">
    <div class="site-wrapper-inner">
        <div class="cover-container">
            <div class="inner cover">

                <form action="<%=path %>/system/reg" method="post">
                    <table class="col-md-10 col-md-offset-2">
                        <thead>
                        <tr height="45px">
                            <th>请填写注册信息 <label>：${message}</label></th>
                        </tr>

                        </thead>
                        <tbody>

                        <tr height="45px">
                            <td>
                                <div class="input-group has-feedback input-group-md col-md-8">
                                    <span class="input-group-addon">用户名</span>
                                    <input type="text" id="username" name="username" onblur="checkName(this.value)"
                                           class="form-control" placeholder="4-16位字符" value="${user.username}">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>

                        <tr height="45px">
                            <td>
                                <div class="input-group has-feedback input-group-md col-md-8">
                                    <span class="input-group-addon">密码</span>
                                    <input type="password" id="password" name="password" value="${user.password}"
                                           onblur="checkPassword(this.value)" class="form-control"
                                           placeholder="由6-30位大小写字母及数字组成">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>
                        <tr height="45px">
                            <td>
                                <div class="input-group has-feedback input-group-md col-md-8">
                                    <span class="input-group-addon">确认密码</span>
                                    <input type="password" id="repassword" onblur="checkRePassword(this.value)"
                                           class="form-control" placeholder="请再次确认并输入密码">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>
                        <tr height="45px">
                            <td>
                                <div class="input-group has-feedback input-group-md col-md-8">
                                    <span class="input-group-addon">真实姓名</span>
                                    <input type="text" id="realname" name="realname" onblur="checkRealname(this.value)"
                                           class="form-control" placeholder="请输入正确的姓名" value="${user.realname}">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>
                        <tr height="45px">
                            <td>
                                <div class="input-group has-feedback input-group-md col-md-8">
                                    <span class="input-group-addon">身份证号</span>
                                    <input type="text" id="idnumber" name="idnumber" onblur="checkIdCard(this.value)"
                                           class="form-control" placeholder="请输入正确身份证号码" value="${user.idnumber}">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>
                        <tr height="45px">
                            <td>
                                <div class="input-group has-feedback input-group-md col-md-8">
                                    <span class="input-group-addon">移动电话</span>
                                    <input type="text" id="phone" name="phone" onblur="checkPhone(this.value)"
                                           class="form-control" placeholder="请输入11位移动电话号码" value="${user.phone}">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>
                        <tr height="45px">
                            <td>
                                <div class="input-group has-feedback input-group-md col-md-8">
                                    <span class="input-group-addon">电子邮箱</span>
                                    <input type="text" id="email" name="email" onblur="checkEmail(this.value)"
                                           class="form-control" placeholder="请输入正确电子邮箱格式" value="${user.email}">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>
                        <tr height="45px">
                            <td>
                                <div class="input-group has-feedback input-group-md col-md-8">
                                    <span class="input-group-addon">密保问题</span>
                                    <input type="text" id="question" name="question" onblur="checkQuestion(this.value)"
                                           class="form-control" placeholder="请输入密保问题以备找回密码时需要" value="${user.question}">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>
                        <tr height="45px">
                            <td>
                                <div class="input-group has-feedback input-group-md col-md-8">
                                    <span class="input-group-addon">答案</span>
                                    <input type="text" id="answer" name="answer" onblur="checkAnswer(this.value)"
                                           class="form-control" placeholder="请输入密保问题答案" value="${user.answer}">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>

                        <tr height="45px">
                            <td>
                                <div class="input-group input-group-md col-md-8 has-feedback has-success">
                                    <span class="input-group-addon">性别</span>
                                    <select class="form-control" name="sex">
                                        <option value="男" ${user.sex=='男'?'selected=selected':''}>男</option>
                                        <option value="女" ${user.sex=='女'?'selected=selected':''}>女</option>
                                    </select>
                                    <span class="glyphicon form-control-feedback glyphicon-ok"></span>
                                </div>
                            </td>
                        </tr>
                        <tr height="45px">
                            <td>
                                <div class="btu-group col-md-offset-2 col-md-3">
                                    <input type="submit" id="submit" disabled="disabled" value="确认信息并注册"
                                           class="btn btn-info"/>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </form>
            </div>
            <%--
            <div class="mastfoot">
              <div class="inner">
                <p>Cover template for <a href="http://getbootstrap.com/">Bootstrap</a>, by <a href="https://twitter.com/mdo">@mdo</a>.</p>

              </div>
            </div>
          --%>
        </div>
    </div>
</div>
</body>
</html>
