<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/28
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单详细页面</title>
</head>
<body>
<center>

<table border="1">
    <tr>
        <td>订单号：</td>
        <td>${order_in_session.id}</td>
    </tr>
    <tr>
        <td>需求标题：</td>
        <td>${order_in_session.demand.title}</td>
    </tr>
    <tr>
        <td>需求内容：</td>
        <td colspan="5">
            <textarea rows="8" cols="15" name="content" readonly>${order_in_session.demand.content}</textarea>
        </td>
        <%--<td>${order_in_session.demand.content}</td>--%>
    </tr>
    <tr>
        <td>需求分类：</td>
        <td>${order_in_session.demand.sort.name}</td>
    </tr>
    <tr>
        <td>需求发布时间：</td>
        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order_in_session.demand.publishtime}"/></td>
    </tr>
    <tr>
        <td>需求承接时间：</td>
        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order_in_session.meetBegin}"/></td>
    </tr>
    <tr>
        <td>需求完成时间：</td>
        <c:if test="${order_in_session.meetEnd == null}">
            <td>完成中</td>
        </c:if>
        <c:if test="${order_in_session.meetEnd != null}">
            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order_in_session.meetEnd}"/></td>
        </c:if>
        <%--<td>${order_in_session.meetEnd}</td>--%>
    </tr>


    <tr>
        <td>发布者昵称：</td>
        <td>${order_in_session.publishUser.nickname}</td>
    </tr>
    <tr>
        <td>发布者姓名：</td>
        <td><a href="/admin/editUserInfo?id=${order_in_session.publishUser.id}">${order_in_session.publishUser.name}</a></td>
    </tr>
    <tr>
        <td>发布者邮箱：</td>
        <td>${order_in_session.publishUser.email}</td>
    </tr>
    <tr>
        <td>发布者QQ：</td>
        <td>${order_in_session.publishUser.qq}</td>
    </tr>


    <tr>
        <td>承接者昵称：</td>
        <td>${order_in_session.meetUser.nickname}</td>
    </tr>
    <tr>
        <td>承接者姓名：</td>
        <td><a href="/admin/editUserInfo?id=${order_in_session.meetUser.id}">${order_in_session.meetUser.name}</a></td>
    </tr>
    <tr>
        <td>承接者邮箱：</td>
        <td>${order_in_session.meetUser.email}</td>
    </tr>
    <tr>
        <td>承接者QQ：</td>
        <td>${order_in_session.meetUser.qq}</td>
    </tr>


    <td colspan="2" align="center">
        <c:if test="${isFinish != null}">
            <input type="button" value="返回我的订单" onclick="javascript:finish();">
        </c:if>
        <c:if test="${isFinish == null}">
            <input type="button" value="返回上一页" onclick="javascript:history.back(-1);">
        </c:if>
    </td>
</table>
</center>
</body>
<script language="JavaScript">
    function finish() {
        self.location = '/user/myPublishOrder';
    }
</script>


</html>
