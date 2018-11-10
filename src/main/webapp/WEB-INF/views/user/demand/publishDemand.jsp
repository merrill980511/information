<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/8/28
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>需求发布页面</title>
    <link type="text/css" rel="stylesheet" href="/css/body.css">
</head>
<body>
<center>
    <form action="/user/publishDemandCommit" method="post" name="myFrom">
        <input type="hidden" value="${demand_in_session.id}" name="id"/>
        <table>
            <c:if test="${demand_in_session != null}">
                <tr>
                    <td>上次编辑时间：</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${demand_in_session.edittime}"/></td>
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
                    <c:if test="${demand_in_session==null}">
                        <input type="text" name="money" value="0.0"/>
                    </c:if>
                    <c:if test="${demand_in_session!=null}">
                        <input type="text" name="money" value="${demand_in_session.money}"/>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td>是否置顶：</td>
                <td>
                    <c:if test="${demand_in_session==null}">
                        <input type="radio" name="top" value="1">是
                        <input type="radio" name="top" value="0" checked>否
                    </c:if>
                    <c:if test="${demand_in_session!=null}">
                        <input type="radio" name="top" value="1" ${demand_in_session.top == 1 ? "checked" : ""}>是
                        <input type="radio" name="top" value="0" ${demand_in_session.top == 0 ? "checked" : ""}>否
                    </c:if>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="发布" onclick="submitConfirm()">
                    <input type="button" value="保存" onclick="save();">
                    <input type="reset" value="重置">
                    <input type="button" value="删除" onclick="deleteMydemand();">
                    <input type="button" value="取消" onclick="window.location.href='/user/demandList'">
                </td>
            </tr>
        </table>
    </form>
</center>
<script type="text/javascript">
    function save() {
        var mymessage = confirm("即将保存需求");
        if (mymessage == true) {
            document.forms.myFrom.action = "/user/saveDemandCommit";
            document.forms.myFrom.submit();
        }
        // document.forms.myFrom.action = "/user/saveDemandCommit";
        // document.forms.myFrom.submit();
    }

    function deleteMydemand() {
        var mymessage = confirm("即将删除需求");
        if (mymessage == true) {
            document.forms.myFrom.action = "/user/deleteDemandCommit";
            document.forms.myFrom.submit();
        }
        // document.forms.myFrom.action = "/user/deleteDemandCommit";
        // document.forms.myFrom.submit();
    }

    function submitConfirm() {
        var mymessage = confirm("即将提交需求");
        if (mymessage == true) {
            document.forms.myFrom.submit();
        }
    }
</script>
</body>
</html>
