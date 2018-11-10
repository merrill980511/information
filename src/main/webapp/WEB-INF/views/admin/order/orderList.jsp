<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/28
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表页面</title>
</head>
<body>
    <table cellspacing="0" cellpadding="0" border="1" align="center">
        <tr>
            <th width="100">订单号</th>
            <th width="150">发布者姓名</th>
            <th width="100">状态</th>
            <th width="200">标题</th>
        </tr>
        <c:forEach var="order" items="${orders_in_session.list}">
            <tr>
                <td align="center"><a href="/admin/orderInfo?id=${order.id}">${order.id}</a></td>
                <td align="center">${order.publishUser.name}</td>
                <td align="center">
                    <c:if test="${order.demand.status == 0}">可承接</c:if>
                    <c:if test="${order.demand.status == 1}">完成中</c:if>
                    <c:if test="${order.demand.status == 2}">已完成</c:if>
                </td>
                <td align="center">${order.demand.title}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4" align="center">
                <input type="button" value="返回上一页" onclick="javascript:history.back(-1);">&emsp;&emsp;
            </td>
        </tr>
        <tr align="center">
            <td colspan="4">
                <a href="/admin/orderList">首页</a>
                <c:if test="${not orders_in_session.isFirstPage}">
                    <a href="/admin/orderList?currentPage=${orders_in_session.prePage}">上页</a>
                </c:if>
                <c:if test="${not orders_in_session.isLastPage}">
                    <a href="/admin/orderList?currentPage=${orders_in_session.nextPage}">下页</a>
                </c:if>
                <a href="/admin/orderList?currentPage=${orders_in_session.pages}">末页</a>
                一共${orders_in_session.total}条数据，
                当前页/总页数:${orders_in_session.pageNum}/${orders_in_session.pages}，每页${orders_in_session.size}条数据<br/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
