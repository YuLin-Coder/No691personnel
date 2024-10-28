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

    <title>right-form</title>
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

    <link href="<%=path %>/resource/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

    <style type="text/css">
        /*
         * Base structure
         */

        /* Move down content because we have a fixed navbar that is 50px tall */
        body {
            padding-top: 10px;
        }

        /*
         * Global add-ons
         */

        .sub-header {
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        /*
         * Top navigation
         * Hide default border to remove 1px line.
         */
        .navbar-fixed-top {
            border: 0;
        }

        /*
         * Sidebar
         */

        /* Hide for mobile, show later */
        .sidebar {
            display: none;
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

        /* Sidebar navigation */
        .nav-sidebar {
            margin-right: -21px; /* 20px padding + 1px border */
            margin-bottom: 20px;
            margin-left: -20px;
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

        /*
         * Main content
         */

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

        /*
         * Placeholder dashboard ideas
         */

        .placeholders {
            margin-bottom: 30px;
            text-align: center;
        }

        .placeholders h4 {
            margin-bottom: 0;
        }

        .placeholder {
            margin-bottom: 20px;
        }

        .placeholder img {
            display: inline-block;
            border-radius: 50%;
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
            var reg = /^([0-9]|[0-9]{2}|100)$/;

            if (!reg.test(age)) {
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
        function checkRole() {
            var p = document.getElementById("fkroleid").parentNode;
            var c = p.childNodes;
            var obj = document.getElementById("fkroleid");
            var value = obj.options[obj.selectedIndex].value;
            if (value == "") {
                p.className = "input-group has-feedback input-group-md col-md-8 has-error";
                c[5].className = "glyphicon form-control-feedback glyphicon-remove";
            } else {
                p.className = "input-group has-feedback input-group-md col-md-8 has-success";
                c[5].className = "glyphicon form-control-feedback glyphicon-ok";
            }
        }
        function checkSex() {
            var p = document.getElementById("sex").parentNode;
            var c = p.childNodes;
            var obj = document.getElementById("sex");
            var value = obj.options[obj.selectedIndex].value;
            if (value == "") {
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
        function firstCheck() {
            checkName(document.getElementById("username").value);
            checkRealname(document.getElementById("realname").value);
            checkIdCard(document.getElementById("idnumber").value);
            checkAge(document.getElementById("age").value);
            checkPhone(document.getElementById("phone").value);
            checkRole();
            checkSex();
            checkPassword(document.getElementById("password").value);
        }


        function add_post(){
            var obj = document.getElementById("fkdeptid");
            var value = obj.options[obj.selectedIndex].value;
            var xmlhttp;
            if (value==0) {
                return;
            }
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp=new XMLHttpRequest();
            } else {// code for IE6, IE5
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function() {
                if (xmlhttp.readyState==4 && xmlhttp.status==200) {
                    var attr = xmlhttp.responseText.split("},{");
                    var post = document.getElementById("fkpostid");
                    post.length = 0;
                    for(var i=0; i<attr.length; i++){
                        var option = document.createElement("option");
                        option.value = attr[i].split("},")[1].split(",")[2].split(":")[1];
                        option.text = attr[i].split("},")[1].split(",")[3].split(":")[1].split("\"")[1];
                        post.appendChild(option);
                    }

                }
            };
            xmlhttp.open("GET","/personnel/user/"+ value +"/add_post",true);
            xmlhttp.send();
        }

    </script>
</head>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 main">
            <h1 class="sub-header">修改员工信息</h1>
            <div class="table-responsive">
                <form action="<%=path %>/user/edit" method="post">
                    <input type="hidden" name="userid" value="${user.userid}">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th colspan="2">请填写要修的信息</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <div class="input-group input-group-md col-md-8 has-feedback">
                                    <span class="input-group-addon">用户名</span>
                                    <input type="text" name="username" value="${user.username}" class="form-control"
                                           id="username" placeholder="">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                            <td>
                                <div class="input-group input-group-md col-md-8 has-feedback">
                                    <span class="input-group-addon">性别</span>
                                    <select class="form-control" id="sex" name="sex">
                                        <option value="">请选择</option>
                                        <option value="男" ${user.sex=='男'?'selected=selected':''}>男</option>
                                        <option value="女" ${user.sex=='女'?'selected=selected':''}>女</option>
                                    </select>
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group input-group-md col-md-8 has-feedback">
                                    <span class="input-group-addon">真实姓名</span>
                                    <input type="text" name="realname" value="${user.realname}" class="form-control"
                                           id="realname"  placeholder="">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                            <td>
                                <div class="input-group input-group-md col-md-8 date form_date" data-date-format="yyyy-mm-dd">
                                    <span class="input-group-addon">出生日期</span>
                                    <input type="text" name="birthday" value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>"
                                           class="form-control" readonly>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </span>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
							        </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group input-group-md col-md-8 has-feedback">
                                    <span class="input-group-addon">电子邮箱</span>
                                    <input type="text" name="email" value="${user.email}" class="form-control"
                                           id="email" >
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                            <td>
                                <div class="input-group input-group-md col-md-8 has-feedback">
                                    <span class="input-group-addon">电话</span>
                                    <input type="text" name="phone" value="${user.phone}" class="form-control"
                                           id="phone" placeholder="">
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group input-group-md col-md-8 has-feedback">
                                    <span class="input-group-addon">状态</span>
                                    <select class="form-control" name="fkstateid">
                                        <option value="0">请选择</option>
                                        <c:forEach items="${state.list}" var="state">
                                            <option value="${state.stateid}" ${user.fkstateid==state.stateid?'selected=selected':''} >${state.statename}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                            <td>
                                <div class="input-group input-group-md col-md-8 has-feedback">
                                    <span class="input-group-addon">用户权限</span>
                                    <select class="form-control" id="fkroleid" name="fkroleid">
                                        <option value="0">请选择</option>
                                        <c:forEach items="${role.list}" var="role">
                                            <option value="${role.roleid}" ${user.fkroleid==role.roleid?'selected=selected':''} >${role.rolename}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group input-group-md col-md-8 has-feedback">
                                    <span class="input-group-addon">部门</span>
                                    <select class="form-control"  id="fkdeptid" name="fkdeptid" onchange="add_post()">
                                        <option value="">请选择</option>
                                        <c:forEach items="${dept.list}" var="dept">
                                            <option value="${dept.deptid}">${dept.deptname}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </td>
                            <td>
                                <div class="input-group input-group-md col-md-8 has-feedback">
                                    <span class="input-group-addon">岗位</span>
                                    <select class="form-control" name="fkpostid" id="fkpostid">
                                        <option value="">请选择</option>
                                        <c:forEach items="${post.list}" var="post">
                                            <option value="${post.postid}" ${user.fkpostid==post.postid?'selected=selected':''}>${post.postname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                    <div class="btu-group col-md-offset-4 col-md-3">
                        <input type="submit" id="submit" class="btn btn-info">
                        <input type="reset" class="btn btn-info">
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
    });
</script>
