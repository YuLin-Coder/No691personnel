<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会议添加界面</title>
    <script type="text/javascript" src="<%=path%>/jquery/jquery-1.4.2.js"></script>
	<link rel="stylesheet" href="<%=path%>/resource/kindeditor-4.1.10/themes/default/default.css" />
	<link rel="stylesheet" href="<%=path%>/resource/kindeditor-4.1.10/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=path%>/resource/kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="<%=path%>/resource/kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script charset="utf-8" src="<%=path%>/resource/kindeditor-4.1.10/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '<%=path%>/resource/kindeditor-4.1.10/plugins/code/prettify.css',
				uploadJson : '<%=path%>/resource/kindeditor-4.1.10/jsp/upload_json.jsp',
				fileManagerJson : '<%=path%>/resource/kindeditor-4.1.10/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
</head>
<body>

	<form name="example" method="post" action="demo.jsp">
		<textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
		<br />
		<input type="submit" name="button" value="提交内容" /> (提交快捷键: Ctrl + Enter)
	</form>
</body>
</html>
