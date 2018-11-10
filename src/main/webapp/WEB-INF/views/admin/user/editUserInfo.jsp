<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/26
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息页面</title>
</head>
<body>
<center>
    <table>

        <form name="form" action="/admin/editUserInfoCommit" method="post">
            <tr>
                <td>编&nbsp;&nbsp;号：</td>
                <td><input type="text" name="id" value="${user.id}" readonly/></td>
            </tr>
            <tr>
            <td>邮&nbsp;&nbsp;箱：</td>
            <td><input type="email" name="email" value="${user.email}" readonly/></td>
        </tr>
            <tr>
                <td>昵&nbsp;&nbsp;称：</td>
                <td><input type="text" name="nickname" value="${user.nickname}"/></td>
            </tr>
            <tr>
                <td>姓&nbsp;&nbsp;名：</td>
                <td><input type="text" name="name" value="${user.name}"/></td>
            </tr>
            <tr>
                <td>性&nbsp;&nbsp;别：</td>
                <td><input type="text" name="sex" value="${user.sex}"/></td>
            </tr>
            <tr>
                <td>生&nbsp;&nbsp;日：</td>
                <td><input type="date" name="birthday"
                           value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>"/></td>
            </tr>
            <tr>
                <td>联系方式：</td>
                <td><input type="text" name="phone" value="${user.phone}"/></td>
            </tr>
            <tr>
                <td>Q&nbsp;&nbsp;Q：</td>
                <td><input type="text" name="qq" value="${user.qq}"/></td>
            </tr>
            <tr>
                <td>学&nbsp;&nbsp;校：</td>
                <td><input type="text" name="school" value="${user.school}"/></td>
            </tr>
            <tr>
                <td>院&nbsp;&nbsp;系：</td>
                <td><input type="text" name="department" value="${user.department}"/></td>
            </tr>
            <tr>
                <td>班&nbsp;&nbsp;级：</td>
                <td><input type="text" name="clazz" value="${user.clazz}"/></td>
            </tr>
            <tr>
                <td>描&nbsp;&nbsp;述：</td>
                <td><input type="textarea" name="description" value="${user.description}"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="提交" onclick="check()">&emsp;
                    <input type="reset" value="重置">&emsp;
                    <input type="button" value="返回上一页" onclick="javascript:history.back(-1);">
                </td>
            </tr>
        </form>
    </table>
</center>
</body>
<script language="JavaScript">
    function check() {
        if (confirm("确定要修改信息吗？")){
            return true;
        }
    }
</script>
</html>
