<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/8/28
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>校园信息发布平台</title>
    <link rel="stylesheet" type="text/css" href="/css/frameset/top.css">
</head>
<center><h2>校 园 信 息 发 布 平 台</h2></center>
<center>
    <form method="post" name="query" action="/user/demandQuery" target="UserCenterFrame">
        <c:if test="${user_in_session != null}">
            <a href="/user/publishDemand" target="UserCenterFrame">发布需求</a>&emsp;
        </c:if>
        <c:if test="${user_in_session == null}">
            <a href="javascript:login()" target="UserCenterFrame">发布需求</a>&emsp;
        </c:if>
        <c:if test="${user_in_session != null}">
            <a href="/user/myDemand" target="UserCenterFrame">我的需求</a>
            <a href="/user/myUndertakeOrder" target="UserCenterFrame">承接订单</a>
            <a href="/user/myPublishOrder" target="UserCenterFrame">发布订单</a>
        </c:if>
        <%--<a href="/user/demandList" target="UserCenterFrame">查看需求</a>&emsp;--%>
        <%--<a href="/user/myDemand" target="UserCenterFrame">我的需求</a>&emsp;--%>
        <%--<a href="/" target="UserCenterFrame">我的消息</a>&emsp;--%>
        <input type="text" name="keyWord" value="需求查询"/>&emsp;
        <input type="submit" value="查询"/>&emsp;
        <%--<a href="/user/unfinished" target="UserCenterFrame">待承接需求</a>&emsp;--%>
        <c:if test="${user_in_session == null}">
            <a href="/user/registerEmail" target="_parent">注册</a>&emsp;
            <a href="/user/login" target="_parent">登录</a>&emsp;
        </c:if>
        <c:if test="${user_in_session != null}">
            <%--<a href="/user/demandManager" target="UserCenterFrame">需求管理</a>--%>
            <a href="/user/info" target="UserCenterFrame">个人信息</a>&emsp;
            <a href="/user/login" target="UserCenterFrame" onclick="logout()">退出</a>&emsp;
            <%--<a href="javascript:logout()">退出</a>&emsp;--%>
            <%--<select name="" onchange="self.location.href=options[selectedIndex].value">--%>
            <%--<option value="demandManager" selected></option>--%>
            <%--<option value="demandManager">需求管理</option>--%>
            <%--<option value="continueDemand">已接需求</option>--%>
            <%--<option value="publishDemand">发布需求</option>--%>
            <%--<option value="myOrder">我的订单</option>--%>
            <%--</select>--%>
            &emsp;欢迎您：<a href="/user/info" target="UserCenterFrame">${user_in_session.name}</a>
            &emsp;上次登录时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${login.lastlogin}"/>
        </c:if>
    </form>
</center>
</body>
<script language="javascript">
    function logout() {

        // if (confirm("即将安全退出")) {
        //     parent.location.href="/user/login";
        //     parent.location.reload();
        // } else {
        //     parent.location.href="/user/user";
        // }
        alert("已安全退出");
        parent.location.reload();
    }

    function login() {
        if (confirm("您还未登录，即将跳转登录界面。")) {
            window.open("/user/login");
        }
    }
</script>
</html>
