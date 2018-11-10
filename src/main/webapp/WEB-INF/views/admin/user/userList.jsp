<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/26
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示用户界面</title>
</head>
<body>
    <a href="/admin/addUser">添加用户</a>
    <form method="post">
        <br/>
        <table cellspacing="0" cellpadding="0" border="1" align="center">
            <tr>
                <th width="30"></th>
                <th width="150">邮箱</th>
                <th width="100">姓名</th>
                <th width="150">昵称</th>
                <th width="200">联系方式</th>
                <th width="100">操作</th>
            </tr>
            <c:forEach var="user" items="${users_in_session.list}">
                <tr>
                    <td align="center"><input type="checkbox" name="emails" value="${user.email}" /></td>
                    <td align="center"><a href="/admin/editUserInfo?id=${user.id}">${user.email}</a></td>
                    <td align="center">${user.name}</td>
                    <td align="center">${user.nickname}</td>
                    <td align="center">${user.phone}</td>
                    <td align="center"><a href="/admin/editUserPassword?id=${user.id}">修改密码</a></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="7" align="center">
                    <input type="button" value="删除" onclick="del()">&emsp;&emsp;&emsp;
                    <input type="button" value="添加" onclick="window.location.href='/admin/addUser'">
                </td>
            </tr>
            <tr align="center">
                <td colspan="6">
                    <a href="/admin/userList">首页</a>
                    <c:if test="${not users_in_session.isFirstPage}">
                        <a href="/admin/userList?currentPage=${users_in_session.prePage}">上页</a>
                    </c:if>
                    <c:if test="${not users_in_session.isLastPage}">
                        <a href="/admin/userList?currentPage=${users_in_session.nextPage}">下页</a>
                    </c:if>
                    <a href="/admin/userList?currentPage=${users_in_session.pages}">末页</a>
                    一共${users_in_session.total}条数据，
                    当前页/总页数:${users_in_session.pageNum}/${users_in_session.pages}，每页${users_in_session.size}条数据<br/>
                </td>
            </tr>
        </table>
    </form>
    <script>
        function del() {
            var names = document.getElementsByName("emails");
            var flag = false ;//标记判断是否选中一个
            for(var i=0;i<names.length;i++){
                if(names[i].checked){
                    flag = true ;
                }
            }
            if(!flag){
                alert("请选择要操作的项！");
            } else {
                if(confirm("确定要要执行此操作吗?")){
                    document.forms[0].action = "/admin/deleteUser";
                    document.forms[0].submit();
                }
            }
        }
    </script>
</body>
</html>
