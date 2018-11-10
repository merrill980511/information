<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/22
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>需求详细页面</title>
    <link type="text/css" rel="stylesheet" href="/css/body.css">
</head>
<body>
<center>
    <table>
        <tr>
            <td>标&nbsp;&nbsp;题：</td>
            <td>${demand.title}</td>
        </tr>
        <tr>
            <td>分&nbsp;&nbsp;类：</td>
            <td>${demand.sort.name}</td>
        </tr>
        <tr>
            <td>赏&nbsp;&nbsp;金：</td>
            <td>${demand.money}</td>
        </tr>
        <tr>
            <td>发布时间：</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${demand.publishtime}"/></td>
        </tr>
        <tr>
            <td>内&nbsp;&nbsp;容：</td>
            <td>
                <textarea rows="8" cols="15" name="content" readonly style="resize:none;">${demand.content}</textarea>
            </td>
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
