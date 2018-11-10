<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/25
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center><h2>校 园 信 息 发 布 平 台 管 理 系 统</h2></center>
<p align="right">欢迎您<a href="/admin/editInfo" target="AdminRightFrame">${admin_in_session.name}</a>，
    上次登录时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${admin_in_session.lastlogin}"/></p>
</body>
</html>
