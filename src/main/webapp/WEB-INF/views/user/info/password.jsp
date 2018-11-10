<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/8/28
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码界面</title>
    <link type="text/css" rel="stylesheet" href="/css/body.css">
</head>
<body>
<center>
    <form action="/user/resetPasswordCommit" method="post">
        <table>
            <tr>
                <td>邮&nbsp;箱：</td>
                <td><input type="email" name="email" value="${email}" required/></td>
            </tr>
            <tr>
                <td>验证码：</td>
                <td><input type="text" name="code"/></td>
            </tr>
            <tr>
                <td>密&nbsp;&nbsp;码：</td>
                <td><input type="password" name="password"/></td>
            </tr>
            <tr>
                <td>确认密码：</td>
                <td><input type="password" name="password2"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="提交" onclick="sub()">
                    <input type="reset" value="重置">
                </td>
            </tr>
            <tr align="center">
                <td colspan="2" align="center">
                    <input type="submit" value="获取验证码">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a href="/user/demandList">返回</a>
                </td>
            </tr>
        </table>
    </form>
    ${errorMsg}
</center>
<script language="JavaScript">
    function sub() {
        if (document.forms[0].password.value == "" || document.forms[0].password2.value == "") {
            alert("请先输入密码！");
            return false;
        }
        if (confirm("确定要修改密码？")) {
            if (document.forms[0].password.value != document.forms[0].password2.value) {
                alert("两次密码输入不一致");
                return false;
            }
            return true;
        }
    }
</script>
</body>
</html>
