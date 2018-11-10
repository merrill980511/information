<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/26
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>信息修改页面</title>
</head>
<body>
<center>

<form action="/admin/editInfoCommit" method="post">
    <table>
        <tr>
            <td>账&nbsp;&nbsp;号：</td>
            <td><input type="text" name="account" value="${admin_in_session.account}" readonly/></td>
        </tr>
        <tr>
            <td>邮&nbsp;&nbsp;箱：</td>
            <td><input type="email" name="email" value="${admin_in_session.email}"/></td>
        </tr>
        <tr>
            <td>姓&nbsp;&nbsp;名：</td>
            <td><input type="text" name="name" value="${admin_in_session.name}"/></td>
        </tr>
        <tr>
            <td>性&nbsp;&nbsp;别：</td>
            <td><input type="text" name="sex" value="${admin_in_session.sex}"/></td>
        </tr>
        <tr>
            <td>生&nbsp;&nbsp;日：</td>
            <td><input type="date" name="birthday" value="<fmt:formatDate value="${admin_in_session.birthday}" pattern="yyyy-MM-dd"/>"/></td>
        </tr>
        <tr>
            <td>联系方式：</td>
            <td><input type="text" name="phone" value="${admin_in_session.phone}"/></td>
        </tr>
        <tr>
            <td>描&nbsp;&nbsp;述：</td>
            <td><input type="textarea" name="description" value="${admin_in_session.description}"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="提交">
                <input type="reset" value="重置">
            </td>
        </tr>
    </table>
</form>
</center>
<a href="/admin/resetPassword">修改密码</a>
</body>
</html>
