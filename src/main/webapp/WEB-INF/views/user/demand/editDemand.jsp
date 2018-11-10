<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/22
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改需求页面</title>
    <link type="text/css" rel="stylesheet" href="/css/body.css">
</head>
<body>
<center>
    <form action="/user/editDemandCommit" method="post" name="myFrom">
        <input type="hidden" value="${demand_in_session.id}" name="id"/>
        <table>
            <c:if test="${demand_in_session != null}">
                <tr>
                    <td>发布时间：</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${demand_in_session.publishtime}"/></td>
                </tr>
            </c:if>
            <tr>
                <td>标&nbsp;&nbsp;题：</td>
                <td><input type="text" name="title" value="${demand_in_session.title}" required/></td>
            </tr>
            <tr>
                <td>内&nbsp;&nbsp;容：</td>
                <td>
                    <textarea rows="8" cols="15" name="content" required>${demand_in_session.content}</textarea>
                </td>
            </tr>
            <tr>
                <td>分&nbsp;&nbsp;类：</td>
                <td>
                    <select name="sort">
                        <c:forEach items="${sorts_in_session}" var="sort">
                            <option value="${sort.id}" ${demand_in_session.sort.id == sort.id?"selected":""}>${sort.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>赏&nbsp;&nbsp;金：</td>
                <td>
                    <input type="text" name="money" value="${demand_in_session.money}"/>
                </td>
            </tr>
            <tr>
                <td>是否置顶：</td>
                <td>
                    <input type="radio" name="top" value="1" ${demand_in_session.top == 1 ? "checked" : ""}>是
                    <input type="radio" name="top" value="0" ${demand_in_session.top == 0 ? "checked" : ""}>否
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="确定" onclick="submitConfirm()">
                    <input type="button" value="取消" onclick="window.location.href='/user/myDemand'">
                </td>
            </tr>
        </table>
    </form>
</center>
<script type="text/javascript">
    function submitConfirm() {
        var mymessage = confirm("即将提交需求");
        if (mymessage == true) {
            document.forms.myFrom.submit();
        }
    }
</script>
</body>
</html>
