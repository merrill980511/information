<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/8/27
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>邮箱注册页面</title>
    <link rel="stylesheet" type="text/css" href="/css/login/email.css" >
</head>
<body>
<h1>邮箱注册页面</h1>
<form action="/user/registerEmailCommit" method="post">
    <table>
        <tr>
            <td>邮&nbsp;箱：</td>
            <td><input type="email" name="email" value="${email}" required/></td>
        </tr>
        <tr></tr><tr></tr>
        <tr>
            <td>验证码：</td>
            <td><input type="text" name="code"/></td>
        </tr>
        <tr></tr><tr></tr><tr></tr><tr></tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="提交">
                <input type="reset" value="重置">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <a href="/">返回</a>
            </td>
        </tr>
        <tr></tr><tr></tr><tr></tr><tr></tr> <tr></tr><tr></tr><tr></tr><tr></tr>
    </table>
</form>
${errorMsg}
</body>
</html>
