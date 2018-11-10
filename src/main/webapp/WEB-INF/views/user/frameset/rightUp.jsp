<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/8/28
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>校园信息发布平台</title>
    <link rel="stylesheet" type="text/css" href="/css/frameset/top.css">
</head>
<body>
    <center><h3>最新公告</h3></center>
    <hr width="80%"/><br/>
    <c:if test="${notices_in_session == null}">
        <center>最近没有新的公告呦~~~</center>
    </c:if>
    <c:if test="${notices_in_session != null}">
        <c:forEach items="${notices_in_session}" var="notice">
            <center>
                <a href="/user/noticeInfo?id=${notice.id}" target="UserCenterFrame">${notice.title}</a>
            </center>
        </c:forEach>
    </c:if>
</body>
</html>
