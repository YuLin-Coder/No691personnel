<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <meta charset="utf-8" />
    <title>fileDialog Examples</title>
    <link rel="stylesheet" href="<%=path%>/resource/kindeditor-4.1.10/themes/default/default.css" />
    <script src="<%=path%>/resource/kindeditor-4.1.10/kindeditor.js"></script>
    <script src="<%=path%>/resource/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script>
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
                        }
                    });
                });
            });
        });
    </script>
</head>
<body>

<p><input type="text" id="url3" value="" /> <input type="button" id="image3" value="选择图片" />（本地上传）</p>
</body>
</html>
