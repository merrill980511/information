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
    <c:if test="${user_in_session == null}">
        <center><h3>发布信息管理</h3></center>
        <hr width="80%"/><br/>
        <center><a href="/user/login" target="_parent"> 请您先登录！</a></center>
    </c:if>
    <c:if test="${user_in_session != null}">
        <center><h3>需求管理</h3></center>
        <hr width="80%"/><br/>
        <center>
            发布${publishNumber}条需求<br/>
            承接${undertakeNumber}条需求<br/>
            <br/>
        </center>
    </c:if>

    <hr width="60%"/><br/>
    <c:if test="${user_in_session == null}">
        <center>
            <h3><b>我的需求</b></h3>
            <h3><b>我的订单</b></h3>
        </center>
    </c:if>

    <c:if test="${user_in_session != null}">
        <center><h3><a href="/user/myDemand" target="UserCenterFrame"><b>我的需求</b></a></h3></center>
        <c:if test="${myDemand_in_session == null}">
            您的需求空空如也~~~
        </c:if>
        <c:if test="${myDemand_in_session != null}">
            <c:forEach items="${myDemand_in_session}" var="demand">
                <center><a href="/user/demandInfo?id=${demand.id}" target="UserCenterFrame">${demand.title}</a> </center>
                <br/>
            </c:forEach>
        </c:if>

        <%--<hr width="60%"/><br/>--%>
        <%--<h4><a href="/user/continueDemand"><b>已承接需求</b></a></h4>--%>
        <%--<c:if test="${continueDemand_in_session == null}">--%>
            <%--您承接的需求空空如也~~~--%>
        <%--</c:if>--%>
        <%--<c:if test="${continueDemand_in_session != null}">--%>
            <%--<c:forEach items="${continueDemand_in_session}" var="demand">--%>
                <%--<center><a href="/user/demandInfo?id=${demand.id}">${demand.title}</a> </center>--%>
                <%--<br/>--%>
            <%--</c:forEach>--%>
        <%--</c:if>--%>

        <hr width="60%"/><br/>
        <center><h3><a href="/user/myPublishOrder" target="UserCenterFrame"><b>我的订单</b></a></h3></center>
        <c:if test="${myOrders_in_session == null}">
            您的订单空空如也~~~
        </c:if>
        <c:if test="${myOrders_in_session != null}">
            <c:forEach items="${myOrders_in_session}" var="order">
                <center><a href="/user/orderInfo?id=${order.id}" target="UserCenterFrame">${order.id}</a> </center>
                <br/>
            </c:forEach>
        </c:if>
    </c:if>
</body>
</html>
