<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/29
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改通知页面</title>
</head>
<body>
<form action="/admin/editNoticeCommit" method="post" name="myFrom">
    <center>
        <table>
            <tr>
                <td>发布者：</td>
                <td>${notice_in_session.admin.name}</td>
            </tr>
            <tr>
                <td>发布时间：</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${notice_in_session.datetime}"/></td>
            </tr>
            <tr>
                <td>标题：</td>
                <td><input type="text" name="title" value="${notice_in_session.title}" required/></td>
            </tr>
            <tr>
                <td>内容：</td>
                <td>
                    <textarea rows="8" cols="15" name="content" value="${notice_in_session.message}" required>${notice_in_session.message}</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="修改" onclick="submitConfirm()">
                    <input type="reset" value="重置">
                    <input type="button" value="取消" onclick="window.location.href='/admin/noticeList'">
                </td>
            </tr>
        </table>
    </center>
</form>
<script type="text/javascript">
    function submitConfirm() {
        var mymessage = confirm("即将修改通知");
        if (mymessage == true) {
            document.forms.myFrom.submit();
        }
    }
</script>
</body>
</html>
