<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/8/28
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改个人信息</title>
    <link type="text/css" rel="stylesheet" href="/css/body.css">
</head>
<body>
<center>
    <form action="/user/infoCommit" method="post">
        <input type="hidden" name="id" value="${user_in_session.id}"/>
        <table>
            <tr>
                <td>邮&nbsp;&nbsp;箱：</td>
                <td><input type="email" name="email" value="${user_in_session.email}" readonly/></td>
            </tr>
            <tr>
                <td>昵&nbsp;&nbsp;称：</td>
                <td><input type="text" name="nickname" value="${user_in_session.nickname}"/></td>
            </tr>
            <tr>
                <td>姓&nbsp;&nbsp;名：</td>
                <td><input type="text" name="name" value="${user_in_session.name}"/></td>
            </tr>
            <tr>
                <td>性&nbsp;&nbsp;别：</td>
                <td><input type="text" name="sex" value="${user_in_session.sex}"/></td>
            </tr>
            <tr>
                <td>生&nbsp;&nbsp;日：</td>
                <td><input type="date" name="birthday"
                           value="<fmt:formatDate value="${user_in_session.birthday}" pattern="yyyy-MM-dd"/>"/></td>
            </tr>
            <tr>
                <td>联系方式：</td>
                <td><input type="text" name="phone" value="${user_in_session.phone}"/></td>
            </tr>
            <tr>
                <td>Q&nbsp;&nbsp;Q：</td>
                <td><input type="text" name="qq" value="${user_in_session.qq}"/></td>
            </tr>
            <tr>
                <td>学&nbsp;&nbsp;校：</td>
                <td><input type="text" name="school" value="${user_in_session.school}"/></td>
            </tr>
            <tr>
                <td>院&nbsp;&nbsp;系：</td>
                <td><input type="text" name="department" value="${user_in_session.department}"/></td>
            </tr>
            <tr>
                <td>班&nbsp;&nbsp;级：</td>
                <td><input type="text" name="clazz" value="${user_in_session.clazz}"/></td>
            </tr>
            <tr>
                <td>描&nbsp;&nbsp;述：</td>
                <td><textarea rows="8" cols="15" name="content" required>${user_in_session.description}</textarea>
                    <%--<input type="textarea" name="description" value="${user_in_session.description}"/>--%>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="提交" onclick="edit()">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</center>
<a href="/user/resetPassword">修改密码</a>
</body>
<script language="JavaScript">
    function edit() {
        if (confirm("确定要修改个人信息？")) {
            return true;
        }
    }
</script>
</html>
