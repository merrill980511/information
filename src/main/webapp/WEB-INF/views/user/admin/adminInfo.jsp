<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/29
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员信息页面</title>
    <link type="text/css" rel="stylesheet" href="/css/body.css">
</head>
<body>
<center>
    <table>
        <tr>
            <td>账&nbsp;&nbsp;号：${admin_in_session.account}</td>
        </tr>
        <tr>
            <td>邮&nbsp;&nbsp;箱：${admin_in_session.email}</td>
        </tr>
        <tr>
            <td>姓&nbsp;&nbsp;名：${admin_in_session.name}</td>
        </tr>
        <tr>
            <td>性&nbsp;&nbsp;别：${admin_in_session.sex}</td>
        </tr>
        <tr>
            <td>联系方式：${admin_in_session.phone}</td>
        </tr>
        <tr>
            <td>描&nbsp;&nbsp;述：
                <textarea rows="8" cols="25" name="content" readonly
                          style="resize:none;">${admin_in_session.description}
                </textarea>
            </td>
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
