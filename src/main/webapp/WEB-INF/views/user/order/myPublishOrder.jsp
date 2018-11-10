<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/22
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我发布订单页面</title>
    <link type="text/css" rel="stylesheet" href="/css/order/orderList.css">
</head>
<body>
<center>
<c:if test="${orders_in_session.list.size() == 0}">
    您暂时还没有他人承接需求产生的订单呦~~~<br/>
    <a href="/user/publishDemand">点此发布需求</a>
</c:if>
    <c:if test="${orders_in_session.list.size() != 0}">
        <c:forEach items="${orders_in_session.list}" var="order">
            <table>
                <tr>
                    <td>订单号：</td>
                    <td><a href="/user/orderInfo?id=${order.id}">${order.id}</a></td>
                    <c:if test="${order.demand.status == 1}">
                        <td></td>
                        <%--<td><a href="/user/finishDemand?id=${order.id}">完结订单</a></td>--%>
                        <td><a href="javascript:finish('${order.id}')">完结订单</a></td>
                    </c:if>
                </tr>
                <tr>
                    <td>承接者姓名：</td>
                    <td>${order.meetUser.name}</td>
                    <td>承接者邮箱：</td>
                    <td>${order.meetUser.email}</td>
                </tr>
                <tr>
                    <td>标题：</td>
                    <td>${order.demand.title}</td>
                    <td>金额：</td>
                    <td>${order.demand.money}</td>
                </tr>
                <tr>
                    <td>状态：</td>
                    <c:if test="${order.demand.status == 1}">
                        <td>完成中</td>
                    </c:if>
                    <c:if test="${order.demand.status == 2}">
                        <td>已完成</td>
                        <td>完成时间：</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.meetBegin}"/></td>
                    </c:if>
                </tr>
                <tr>
                    <td>发布时间：</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.demand.publishtime}"/></td>
                </tr>
                <tr>
                    <td>承接时间：</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.meetBegin}"/></td>
                </tr>
            </table>
        </c:forEach>
        <tr>
            <td colspan="6">
                <a href="/user/myPublishOrder">首页</a>
                <c:if test="${not orders_in_session.isFirstPage}">
                    <a href="/user/myPublishOrder?currentPage=${orders_in_session.prePage}">上页</a>
                </c:if>
                <c:if test="${not orders_in_session.isLastPage}">
                    <a href="/user/myPublishOrder?currentPage=${orders_in_session.nextPage}">下页</a>
                </c:if>
                <a href="/user/myPublishOrder?currentPage=${orders_in_session.pages}">末页</a>
                一共${orders_in_session.total}条数据，
                当前页/总页数:${orders_in_session.pageNum}/${orders_in_session.pages}，每页${orders_in_session.size}条数据<br/>
            </td>
        </tr>
    </c:if>
</center>
</body>
<script language="JavaScript">
    function finish(id) {
        if (confirm("确认要完结订单？")) {
            self.location = '/user/finishDemand?id=' + id;
        }
    }
</script>
</html>
