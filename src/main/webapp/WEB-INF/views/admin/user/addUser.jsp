<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/26
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加新用户</title>
</head>
<body>
<script type="text/javascript">
    function check() {
        var pwd1 = document.getElementById("password1").value;
        var pwd2 = document.getElementById("password2").value;
        if (pwd1 != "" && pwd2 != ""){
            if (pwd1 == pwd2){
                if (confirm("请务必确保邮箱的正确性！")){
                    return true;
                } else {
                    return false;
                }
            } else {
                alert("两次输入密码不一致！");
                return false;
            }
        } else {
            alert("姓名、邮箱、密码不能为空！");
            return false;
        }
    }
</script>
<hr/><br/>
<form name="form" action="/admin/addUserCommit" method="post" >
    <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="80">用户邮箱：</td>
            <td width="226"><input type="email" name="email" id="email" required>*</td>
        </tr>
        <tr>
            <td width="80">用户名：</td>
            <td width="226"><input type="text" name="name" required>*</td>
        </tr>
        <tr>
            <td width="80">昵&nbsp;&nbsp;称：</td>
            <td width="226"><input type="text" name="nickname"></td>
        </tr>
        <tr>
            <td>密&emsp;&emsp;码</td>
            <td><input type="password" name="password" id="password" required>*</td>
        </tr>
        <tr>
            <td>密码确认</td>
            <td><input type="password" name="password2" id="password2" required>*</td>
        </tr>
        <tr>
            <td>性&emsp;&emsp;别</td>
            <td>
                <input type="radio" name="sex" value="男" checked>男
                <input type="radio" name="sex" value="女">女
            </td>
        </tr>
        <tr>
            <td>生&nbsp;&nbsp;日：</td>
            <td><input type="date" name="birthday"/></td>
        </tr>
        <tr>
            <td>Q&emsp;&emsp;Q</td>
            <td><input type="text" name="qq"></td>
        </tr>
        <tr>
            <td>联系方式</td>
            <td><input type="text" name="phone" id="phone" maxlength="11" required>*</td>
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
            <td>个人说明</td>
            <td>
                <textarea rows="8"  cols="15" name="description"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="提交" onclick="check()">&emsp;&emsp;&emsp;
                <input type="reset" value="重置">&emsp;&emsp;&emsp;
                <input type="button" value="返回" onclick="history.go(-1);">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
