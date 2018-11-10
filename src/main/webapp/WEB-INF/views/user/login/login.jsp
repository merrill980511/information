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
    <title>登录页面</title>
    <link rel="stylesheet" type="text/css" href="/css/login/login.css">
</head>
<body>
<h1>校园信息发布平台</h1>
<form action="/user/loginCommit" method="post">
    <table>
        <tr>
            <td>邮&nbsp;箱：</td>
            <td><input id="email" type="email" name="email" value="${login.email}" required/></td>
        </tr>
        <tr>
            <td>密&nbsp;码：</td>
            <td><input id="password" type="password" name="password" value="${login.password}"/></td>
        </tr>
        <tr>
            <td>验证码：</td>
            <td>
                <input type="text" name="code" maxlength="4" size="5">&emsp;&emsp;
                <img id="image" border="0" onclick="refresh()" src="/images/randomCodeImage.jsp" title="点击更换图片" style="cursor: pointer"><br/>
            </td>
        </tr>
        <tr class="button">
            <td   colspan="2" align="center">
                <input class="button1" type="submit" value="登陆" onclick="check()">
                <input class="button2" type="reset" value="重置">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="margin:8px">
                <a class="login" href="/user/registerEmail">注册</a>
            </td>
        </tr>
        <tr>
            <td  colspan="2" align="center">
                <a class="forget" href="/user/resetPassword">忘记密码</a>
            </td>
        </tr>
    </table>
</form>
${errorMsg}
<script language="javascript">
    function check(){
        if(document.getElementById("email").value == "" || document.getElementById("password").value == ""){
            alert("请输入邮箱密码");
            return false;
        }
        return true;
    }
    function refresh() {
        //IE存在缓存,需要new Date()实现更换路径的作用
        document.getElementById("image").src="/images/randomCodeImage.jsp?"+new Date().getTime();
    }
</script>
</body>
</html>
