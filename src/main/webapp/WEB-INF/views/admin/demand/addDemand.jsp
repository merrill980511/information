<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/28
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加需求页面</title>
</head>
<body>
    <center>
        <form action="/admin/addDemandCommit" method="post" name="myFrom">
            <table>
                <tr>
                    <td>发布用户编号：</td>
                    <td><input type="text" name="userId" required/></td>
                </tr>
                <tr>
                    <td>标&nbsp;&nbsp;题：</td>
                    <td><input type="text" name="title" required/></td>
                </tr>
                <tr>
                    <td>内&nbsp;&nbsp;容：</td>
                    <td>
                        <textarea rows="8" cols="15" name="content" required></textarea>
                    </td>
                </tr>
                <tr>
                    <td>分&nbsp;&nbsp;类：</td>
                    <td>
                        <select name="sortId">
                            <c:forEach items="${sorts_in_session}" var="sort">
                                <option value="${sort.id}" ${demand_in_session.sort.id == sort.id?"selected":""}>${sort.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>赏&nbsp;&nbsp;金：</td>
                    <td>
                        <input type="text" name="money" value="0.0"/>
                    </td>
                </tr>
                <tr>
                    <td>用户是否置顶：</td>
                    <td>
                        <input type="radio" name="top" value="1">是
                        <input type="radio" name="top" value="0" checked>否
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="发布" onclick="submitConfirm()">
                        <input type="reset" value="重置">
                        <input type="button" value="取消" onclick="window.location.href='/admin/demandList'">
                    </td>
                </tr>
            </table>
        </form>
    </center>
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
