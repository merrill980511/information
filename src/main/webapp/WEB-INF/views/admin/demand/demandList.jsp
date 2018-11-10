<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/28
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>需求列表</title>
</head>
<body>
<a href="/admin/addDemand">添加需求</a>
<form method="post">
    <br/>
    <table cellspacing="0" cellpadding="0" border="1" align="center">
        <tr>
            <th width="30"></th>
            <th width="70">编号</th>
            <th width="150">标题</th>
            <th width="100">发布用户</th>
            <th width="70">用户编号</th>
            <th width="160">发布时间</th>
            <th width="100">需求状态</th>
            <th width="100">需求类型</th>
        </tr>
        <c:forEach var="demand" items="${demands_in_session.list}">
            <tr>
                <td align="center"><input type="checkbox" name="ids" value="${demand.id}" /></td>
                <td align="center"><a href="/admin/editDemandInfo?id=${demand.id}">${demand.id}</a></td>
                <td align="center">${demand.title}</td>
                <td align="center">${demand.user.name}</td>
                <td align="center"><a href="/admin/editUserInfo?id=${demand.user.id}">${demand.user.id}</a> </td>
                <td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${demand.publishtime}"/></td>
                <td align="center">
                    <c:if test="${demand.status == 0}">可承接</c:if>
                    <c:if test="${demand.status == 1}">完成中</c:if>
                    <c:if test="${demand.status == 2}">已完成</c:if>
                </td>
                <td align="center">${demand.sort.name}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8" align="center">
                <input type="button" value="删除" onclick="del()">&emsp;&emsp;&emsp;
                <input type="button" value="添加" onclick="window.location.href='/admin/addDemand'">
            </td>
        </tr>
        <tr align="center">
            <td colspan="8">
                <a href="/admin/demandList">首页</a>
                <c:if test="${not demands_in_session.isFirstPage}">
                    <a href="/admin/demandList?currentPage=${demands_in_session.prePage}">上页</a>
                </c:if>
                <c:if test="${not demands_in_session.isLastPage}">
                    <a href="/admin/demandList?currentPage=${demands_in_session.nextPage}">下页</a>
                </c:if>
                <a href="/admin/demandList?currentPage=${demands_in_session.pages}">末页</a>
                一共${demands_in_session.total}条数据，
                当前页/总页数:${demands_in_session.pageNum}/${demands_in_session.pages}，每页${demands_in_session.size}条数据<br/>
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
                document.forms[0].action = "/admin/deleteDemand";
                document.forms[0].submit();
            }
        }
    }
</script>
</body>
</html>
