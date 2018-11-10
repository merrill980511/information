<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/26
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户密码页面</title>
</head>
<body>
<form action="/admin/editUserPasswordCommit" method="post">
    <table width="600" border="0" align="center" cellpadding="2" cellspacing="0">
        <tr>
            <th colspan="2" align="center">密码修改</th>
        </tr>
        <tr>
            <td width="300" align="right">账&emsp;号：</td>
            <td width="300">${user_in_session.id}</td>
            <<input type="hidden" name="id" value="${user_in_session.id}">
        </tr>
        <tr>
            <td align="right">用户名：</td>
            <td>${user_in_session.name}</td>
        </tr>
        <tr>
            <td align="right">新密码：</td>
            <td><input name="password" type="password" id="pwd1"/></td>
        </tr>
        <tr>
            <td align="right">确认密码：</td>
            <td><input name="confirmPwd" type="password" id="pwd2"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input name="BtnSave" type="button" id="BtnSave" onClick="check()" value="修 改">&emsp;
                <input name="Submit2" type="reset" value="重 置" />&emsp;
                <input type="button" value="返回" onclick="history.go(-1)">
            </td>
        </tr>
    </table>
</form>
<script language="javascript">

    function check(){
        if (document.forms[0].pwd2.value=="" || document.forms[0].pwd1.value==""){
            alert("密码不能为空！");
            return false;
        }
        if(document.forms[0].pwd2.value != document.forms[0].pwd1.value){
            alert("两次密码输入不一致");
            return false;
        }
        if(confirm("确定要修改密码？")){
            document.forms[0].submit();
        }
    }
</script>
</body>
</html>
