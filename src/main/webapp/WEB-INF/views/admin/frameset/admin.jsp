<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/25
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员页面</title>
</head>
<frameset rows="80,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="/admin/top" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
    <frameset rows="*" cols="155,*" frameborder="no" border="0" framespacing="0">
        <frame src="/admin/left" name="AdminLeftFrame" scrolling="No" noresize="noresize" id="AdminLeftFrame" title="AdminLeftFrame" />
        <frame src="/admin/right" name="AdminRightFrame" noresize="noresize" id="AdminRightFrame" title="AdminRightFrame" />
    </frameset>
</frameset>
</html>
