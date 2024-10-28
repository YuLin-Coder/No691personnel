<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'test.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=path%>/bootstrap-datetimepicker/css/bootstrap.min.css"
			rel="stylesheet" media="screen">
		<link
			href="<%=path%>/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"
			rel="stylesheet" media="screen">


	</head>

	<body>
		<div class="container">
			<form action="" class="form-horizontal" role="form">
				<fieldset>
					<legend>
						Test
					</legend>
					<div class="form-group">
						<label for="dtp_input1" class="col-md-2 control-label">
							DateTime Picking
						</label>
						<div class="input-group date form_datetime col-md-5"
							data-date="1979-09-16T05:25:07Z"
							data-date-format="dd MM yyyy - HH:ii p"
							data-link-field="dtp_input1">
							<input class="form-control" size="16" type="text" value=""
								readonly>
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span>
							</span>
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-th"></span>
							</span>
						</div>
						<input type="hidden" id="dtp_input1" value="" />
						<br />
					</div>
					<div class="form-group">
						<label for="dtp_input2" class="col-md-2 control-label">
							Date Picking
						</label>
						<div class="input-group date form_date col-md-5" data-date=""
							data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd">
							<input class="form-control" size="16" type="text" value=""
								readonly>
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span>
							</span>
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
						<input type="hidden" id="dtp_input2" value="" />
						<br />
					</div>
					<div class="form-group">
						<label for="dtp_input3" class="col-md-2 control-label">
							Time Picking
						</label>
						<div class="input-group date form_time col-md-5" data-date=""
							data-date-format="hh:ii" data-link-field="dtp_input3"
							data-link-format="hh:ii">
							<input class="form-control" size="16" type="text" value=""
								readonly>
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span>
							</span>
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-time"></span>
							</span>
						</div>
						<input type="hidden" id="dtp_input3" value="" />
						<br />
					</div>
				</fieldset>
			</form>
		</div>
		This is my JSP page.
		<br>

		<script type="text/javascript"
			src="<%=path%>/bootstrap-datetimepicker/jquery/jquery-1.8.3.min.js"
			charset="UTF-8">
</script>
		<script type="text/javascript"
			src="<%=path%>/bootstrap-datetimepicker/js/bootstrap.min.js">
</script>
		<script type="text/javascript"
			src="<%=path%>/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"
			charset="UTF-8">
</script>
		<script type="text/javascript"
			src="<%=path%>/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
			charset="UTF-8">
</script>

		<script type="text/javascript">
$('.form_datetime').datetimepicker( {
	language:  'zh-CN',
	weekStart : 1,
	todayBtn : 1,
	autoclose : 1,
	todayHighlight : 1,
	startView : 2,
	forceParse : 0,
	showMeridian : 1
});
$('.form_date').datetimepicker( {
	language : 'zh-CN',
	weekStart : 1,
	todayBtn : 1,
	autoclose : 1,
	todayHighlight : 1,
	startView : 2,
	minView : 2,
	forceParse : 0
});
$('.form_time').datetimepicker( {
	language : 'zh-CN',
	weekStart : 1,
	todayBtn : 1,
	autoclose : 1,
	todayHighlight : 1,
	startView : 1,
	minView : 0,
	maxView : 1,
	forceParse : 0
});
</script>
	</body>
</html>
