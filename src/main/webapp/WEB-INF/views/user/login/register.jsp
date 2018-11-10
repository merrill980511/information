<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/8/27
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息完善页面</title>
    <link rel="stylesheet" type="text/css" href="/css/login/register.css">
</head>
<body>
<form action="/user/registerCommit" method="post">
    <table>
        <tr>
            <td>邮&nbsp;&nbsp;箱：</td>
            <td><input type="email" name="email" value="${email}" readonly/></td>
        </tr>
        <tr>
            <td>昵&nbsp;&nbsp;称：</td>
            <td><input type="text" name="nickname"/></td>
        </tr>
        <tr>
            <td>密&nbsp;&nbsp;码：</td>
            <td><input type="password" name="password" required/></td>
        </tr>
        <tr>
            <td>确认密码：</td>
            <td><input type="password" name="password2" required/></td>
        </tr>
        <tr>
            <td>姓&nbsp;&nbsp;名：</td>
            <td><input type="text" name="name" required/></td>
        </tr>
        <tr>
            <td>性&nbsp;&nbsp;别：</td>
            <td><input type="text" name="sex"/></td>
        </tr>
        <tr>
            <td>生&nbsp;&nbsp;日：</td>
            <td><input type="date" name="birthday"/></td>
        </tr>
        <tr>
            <td>联系方式：</td>
            <td><input type="text" name="phone" required/></td>
        </tr>
        <tr>
            <td>Q&nbsp;&nbsp;Q：</td>
            <td><input type="text" name="qq"/></td>
        </tr>
        <tr>
            <td>学&nbsp;&nbsp;校：</td>
            <td><input type="text" name="school"/></td>
        </tr>
        <tr>
            <td>院&nbsp;&nbsp;系：</td>
            <td><input type="text" name="department"/></td>
        </tr>
        <tr>
            <td>班&nbsp;&nbsp;级：</td>
            <td><input type="text" name="clazz"/></td>
        </tr>
        <tr>
            <td>描&nbsp;&nbsp;述：</td>
            <td><input type="textarea" name="description"/></td>
        </tr>
        <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="注册" onclick="register()">
                <input type="reset" value="重置">
            </td>
        </tr>
    </table>
</form>
</body>
<script language=JavaScript>
    function register() {
        if (confirm("您确定要注册么？")) {
            return true;
        }
    }
</script>
</html>
