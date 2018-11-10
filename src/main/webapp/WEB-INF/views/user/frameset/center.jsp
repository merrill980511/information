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
</head>
<body>
<%--<c:if test="${demand_in_session == null}">--%>
    <%--还没有用户发布需求呦~~~--%>
<%--</c:if>--%>
<%--<c:if test="${demand_in_session != null}">--%>
    <%--<c:forEach items="${demand_in_session}" var="demand">--%>
        <%--${demand.title}--%>
    <%--</c:forEach>--%>
<%--</c:if>--%>
<a href="/user/demandList">需求列表</a>
</body>
</html>
