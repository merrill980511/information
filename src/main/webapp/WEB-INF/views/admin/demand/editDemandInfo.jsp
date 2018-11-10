<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/28
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改需求页面</title>
</head>
<body>
<form action="/admin/editDemandCommit" method="post" name="myFrom">
    <input type="hidden" value="${demand_in_session.id}" name="id"/>
    <center>

    <table>
        <tr>
            <td>发布用户：</td>
            <td>
                <a href="/admin/editUserInfo?id=${demand_in_session.user.id}">${demand_in_session.user.id}</a>
            </td>
        </tr>
        <tr>
            <td>发布时间：</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${demand_in_session.publishtime}" /></td>
        </tr>
        <tr>
            <td>标&nbsp;&nbsp;题：</td>
            <td><input type="text" name="title" value="${demand_in_session.title}"/></td>
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
                <input type="button" value="取消" onclick="window.location.href='/admin/demandList'">
                <input type="button" value="返回上一页" onclick="javascript:history.back(-1);">
            </td>
        </tr>
    </table>

    </center>
</form>
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
