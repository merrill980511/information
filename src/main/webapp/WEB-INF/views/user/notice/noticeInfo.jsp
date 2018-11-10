<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/23
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>通知信息页面</title>
    <link type="text/css" rel="stylesheet" href="/css/body.css">
</head>
<body>
<center>

    <table>
        <tr>
            <td>发布者：</td>
            <td><a href="/user/showAdminInfo?account=${notice_in_session.admin.account}">${notice_in_session.admin.name}</a></td>
        </tr>
        <tr>
            <td>发布时间：</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${notice_in_session.datetime}"/></td>
        </tr>
        <tr>
            <td>标题：</td>
            <td>${notice_in_session.title}</td>
        </tr>
        <tr>
            <td>内容：</td>
            <td>${notice_in_session.message}</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="返回上一页" onclick="javascript:history.back(-1);">
            </td>
        </tr>
    </table>
</center>
</body>
</html>
