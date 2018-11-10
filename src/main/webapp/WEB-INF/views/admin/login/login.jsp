<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/24
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录界面</title>
</head>
<body>
<center><h2><b>管 理 员 登 录 页 面 </b></h2><br/></center>
<center>
    <hr/><br/>
    <%session.invalidate(); %>
    <form name="" action="/admin/loginCommit"  method="post">
        <table width="300" border="0" align="center" cellpadding="2" cellspacing="0">
            <h6 style="color: red">${errorMsg}</h6>
            <tr>
                <th colspan="2" align="center">登&nbsp;录 </th>
            </tr>
            <tr>
                <td width="75" align="right">账&emsp;号：</td>
                <td width="220"><input type="text" id="account" name="account" required/></td>
            </tr>
            <tr>
                <td width="75" align="right">密&emsp;码：</td>
                <td> <input type="password" name="password"  id="password" size="20" maxlength="16" required/></td>
            </tr>
            <tr>
                <td width="75" align="right">验证码：</td>
                <td>
                    <input type="text" name="code" maxlength="4" size="5">&emsp;&emsp;
                    <img id="image" border="0" onclick="refresh()" src="/images/randomCodeImage.jsp" title="点击更换图片" style="cursor: pointer"><br/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input onclick="return check();" type="submit" name="Submit" value="登 录" />
                    &emsp;&emsp;&emsp;
                    <input name="Submit2" type="reset" value="重 置" />
                </td>
            </tr>
        </table>
    </form>
    <script language="javascript">
        function check(){
            if(document.getElementById("username").value == "" || document.getElementById("password").value == ""){
                alert("请输入管理员密码");
                return false;
            }
            return true;
        }
        function refresh() {
            //IE存在缓存,需要new Date()实现更换路径的作用
            document.getElementById("image").src="/images/randomCodeImage.jsp?"+new Date().getTime();
        }
    </script>
</center>
</body>
</html>
