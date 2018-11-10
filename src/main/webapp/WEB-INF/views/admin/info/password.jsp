<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/26
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码界面</title>
</head>
<body>
<center>
<table>
    <form action="/admin/resetPasswordCommit" method="post">
        <tr>
            <td>请输入密码：</td>
            <td><input type="password" name="password"/></td>
        </tr>
        <tr>
            <td>请确认密码：</td>
            <td><input type="password" name="password2"/></td>
        </tr>
        <td colspan="2" align="center">
            <input type="submit" value="提交" onclick="sub()">
            <input type="reset" value="重置">
        </td>
        <tr>
            <td colspan="2" align="center">
                <a href="/admin/admin">返回</a>
            </td>
        </tr>
    </form>
</table>
</center>
</body>
<script language="JavaScript">
    function sub() {
        if (document.forms[0].password.value=="" || document.forms[0].password2.value==""){
            alert("请先输入密码！");
            return false;
        }
        if (confirm("确定要修改密码？")){
            if(document.forms[0].password.value!=document.forms[0].password2.value){
                alert("两次密码输入不一致");
                return false;
            }
            return true;
        }
    }
</script>
</html>
