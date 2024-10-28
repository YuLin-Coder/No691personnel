<%@ page contentType="application/msexcel" %>
<!-- 以上这行设定本网页为excel格式的网页 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    response.setHeader("Content-disposition","inline; filename=salary.xls");
    //以上这行设定传送到前端浏览器时的档名为test1.xls
    //就是靠这一行，让前端浏览器以为接收到一个excel档
%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

</head>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 main">
            <h1 class="sub-header">全部薪酬信息 </h1>
            <div class="table-responsive">
                <div>
                    <table id="table1" class="table table-striped">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>员工姓名</th>
                            <th>发放日期</th>
                            <th>金额</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty info.list}">
                            <tr>
                                <td colspan="8"><font color="red">不好意思，没有你想要的结果</font></td>
                            </tr>
                        </c:if>
                        <c:forEach items="${info.list}" var="salary" varStatus="vs">
                            <tr>
                                <td>${salary.salaryid}</td>
                                <td>${salary.user.username}</td>
                                <td><fmt:formatDate value="${salary.salarydate==null?'':salary.salarydate}"
                                                    pattern="yyyy-MM-dd"/></td>
                                <td>${salary.salary}</td>
                                <td>
                                    <button type="button" onclick="toDelete('${salary.salaryid}')"
                                            class="btn btn-sm btn-warning">删除
                                    </button>
                                    <button type="button" onclick="toUpdate('${salary.salaryid}')"
                                            class="btn btn-sm btn-info">修改
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

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
