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
    <title>发布通知页面</title>
</head>
<body>
<form action="/admin/addNoticeCommit" method="post" name="myFrom">
    <center>
        <table>
            <tr>
                <td>标题：</td>
                <td><input type="text" name="title" required/></td>
            </tr>
            <tr>
                <td>内容：</td>
                <td>
                    <textarea rows="8" cols="15" name="content" required></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="发布" onclick="submitConfirm()">
                    <input type="reset" value="重置">
                    <input type="button" value="取消" onclick="window.location.href='/admin/noticeList'">
                </td>
            </tr>
        </table>
    </center>
</form>
<script type="text/javascript">
    function submitConfirm() {
        var mymessage = confirm("即将提交需求");
        if (mymessage == true) {
            document.forms.myFrom.submit();
        }
    }
</script>
</body>
</html>
