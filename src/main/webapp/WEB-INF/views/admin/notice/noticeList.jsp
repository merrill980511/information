<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/28
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公告列表</title>
</head>
<body>
<a href="/admin/addNotice">发布通知</a>
<form method="post">
    <br/>
    <table cellspacing="0" cellpadding="0" border="1" align="center">
        <tr>
            <th width="30"></th>
            <th width="150">编号</th>
            <th width="100">标题</th>
            <th width="150">发布者</th>
            <th width="150">发布时间</th>
        </tr>
        <c:forEach var="notice" items="${notices_in_session.list}">
            <tr>
                <td align="center"><input type="checkbox" name="ids" value="${notice.id}" /></td>
                <td align="center"><a href="/admin/editNotice?id=${notice.id}">${notice.id}</a></td>
                <td align="center">${notice.title}</td>
                <td align="center">${notice.admin.name}</td>
                <td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${notice.datetime}"/></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="7" align="center">
                <input type="button" value="删除" onclick="del()">&emsp;&emsp;&emsp;
                <input type="button" value="添加" onclick="window.location.href='/admin/addNotice'">
            </td>
        </tr>
        <tr align="center">
            <td colspan="6">
                <a href="/admin/noticeList">首页</a>
                <c:if test="${not notices_in_session.isFirstPage}">
                    <a href="/admin/noticeList?currentPage=${notices_in_session.prePage}">上页</a>
                </c:if>
                <c:if test="${not notices_in_session.isLastPage}">
                    <a href="/admin/noticeList?currentPage=${notices_in_session.nextPage}">下页</a>
                </c:if>
                <a href="/admin/noticeList?currentPage=${notices_in_session.pages}">末页</a>
                一共${notices_in_session.total}条数据，
                当前页/总页数:${notices_in_session.pageNum}/${notices_in_session.pages}，每页${notices_in_session.size}条数据<br/>
            </td>
        </tr>
    </table>
</form>
<script>
    function del() {
        var names = document.getElementsByName("ids");
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
                document.forms[0].action = "/admin/deleteNoticeCommit";
                document.forms[0].submit();
            }
        }
    }
</script>
</body>
</html>
