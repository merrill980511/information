<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/21
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息展示页面</title>
    <link type="text/css" rel="stylesheet" href="/css/body.css">
</head>
<body>
<center>
    <table>
        <tr>
            <td>邮&nbsp;&nbsp;箱：</td>
            <td><input type="email" name="email" value="${user.email}" readonly/></td>
        </tr>
        <tr>
            <td>昵&nbsp;&nbsp;称：</td>
            <td><input type="text" name="nickname" value="${user.nickname}" readonly/></td>
        </tr>
        <tr>
            <td>姓&nbsp;&nbsp;名：</td>
            <td><input type="text" name="name" value="${user.name}" readonly/></td>
        </tr>
        <tr>
            <td>性&nbsp;&nbsp;别：</td>
            <td><input type="text" name="sex" value="${user.sex}" readonly/></td>
        </tr>
        <tr>
            <td>生&nbsp;&nbsp;日：</td>
            <td><input type="date" name="birthday"
                       value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>" readonly/></td>
        </tr>
        <tr>
            <td>联系方式：</td>
            <td><input type="text" name="phone" value="${user.phone}" readonly/></td>
        </tr>
        <tr>
            <td>Q&nbsp;&nbsp;Q：</td>
            <td><input type="text" name="qq" value="${user.qq}" readonly/></td>
        </tr>
        <tr>
            <td>学&nbsp;&nbsp;校：</td>
            <td><input type="text" name="school" value="${user.school}" readonly/></td>
        </tr>
        <tr>
            <td>院&nbsp;&nbsp;系：</td>
            <td><input type="text" name="department" value="${user.department}" readonly/></td>
        </tr>
        <tr>
            <td>班&nbsp;&nbsp;级：</td>
            <td><input type="text" name="clazz" value="${user.clazz}" readonly/></td>
        </tr>
        <tr>
            <td>描&nbsp;&nbsp;述：</td>
            <td><input type="textarea" name="description" value="${user.description}" readonly/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="返回上一页" onclick="javascript:history.back(-1);">
            </td>
        </tr>
    </table>
</center>
</body>
</html>
