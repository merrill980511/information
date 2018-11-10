<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/8/28
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示需求页面</title>
    <link type="text/css" rel="stylesheet" href="/css/demand/demandList.css">
</head>
<body>
<c:if test="${demands_in_session.list.size() == 0}">
    <center>还没有用户发布需求呦~~~</center><br/>
    <center><a href="/user/publishDemand"> 发布需求</a></center>
</c:if>
<c:if test="${demands_in_session.list.size() != 0}">
    <center>
        <c:forEach items="${demands_in_session.list}" var="demand">
            <table>
                <tr>
                    <td>标题：<a href="/user/demandInfo?id=${demand.id}">${demand.title}</a></td>
                    <td>金额：${demand.money}</td>
                    <td>发布时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${demand.publishtime}"/></td>
                </tr>
                <tr></tr><tr></tr>
                <tr>
                    <td>类别：${demand.sort.name}</td>
                    <td>发布用户：<a href="/user/showUserInfo?id=${demand.user.id}">${demand.user.name}</a> </td>
                </tr>
                <tr></tr><tr></tr>
                <tr>
                    <td style="border:1px solid rgb(185, 185, 185)" colspan="5">
                        内容：
                        <textarea rows="8" cols="15" name="content" readonly maxlength="100"
                                  style="resize:none;">${demand.content}</textarea>
                    </td>
                </tr>
                <tr></tr><tr></tr>
                <tr class="blank">
                    <td>状态：
                        <c:if test="${demand.status == 0}">可承接</c:if>
                        <c:if test="${demand.status == 1}">完成中</c:if>
                        <c:if test="${demand.status == 2}">已完成</c:if>
                    </td>
                        <%--<td>回复</td>--%>
                    <td>
                        <c:if test="${demand.status == 0}">
                            <%--<a href="/user/undertakeDemand?demandId=${demand.id}&userId=${user_in_session.id}" target="_parent">接单</a>--%>
                            <a href="javascript:undertake('${demand.id}', '${user_in_session.id}')"
                               target="_parent">接单</a>
                        </c:if>
                            <%--<c:if test="${demand.status != 0}">--%>
                            <%--<a>接单</a>--%>
                            <%--</c:if>--%>
                    </td>
                </tr>
                <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>

            </table>
        </c:forEach>
        <tr>
            <td colspan="6">
                <a href="/user/demandQuery">首页</a>
                <c:if test="${not demands_in_session.isFirstPage}">
                    <a href="/user/demandQuery?currentPage=${demands_in_session.prePage}">上页</a>
                </c:if>
                <c:if test="${not demands_in_session.isLastPage}">
                    <a href="/user/demandQuery?currentPage=${demands_in_session.nextPage}">下页</a>
                </c:if>
                <a href="/user/demandQuery?currentPage=${demands_in_session.pages}">末页</a>
                一共${demands_in_session.total}条数据，
                当前页/总页数:${demands_in_session.pageNum}/${demands_in_session.pages}，每页${demands_in_session.size}条数据<br/>
            </td>
        </tr>
    </center>
</c:if>
</body>
<script language=JavaScript>
    function undertake(demandId, userId) {
        if (confirm("您确定要承接需求么？")) {
            window.open("/user/undertakeDemand?demandId=" + demandId + "&userId=" + userId);
            <%--window.open("/user/undertakeDemand?demandId=${demand.id}&userId=${user_in_session.id}");--%>
        }
    }
</script>
</html>
