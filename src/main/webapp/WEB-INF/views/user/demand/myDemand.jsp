<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/8/29
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示个人需求页面</title>
    <link type="text/css" rel="stylesheet" href="/css/demand/demandList.css">
</head>
<body>
<c:if test="${demands_in_session == null}">
    <center>您还没有相关需求呦~~~</center>
</c:if>
<center>
    <table>
        <c:if test="${demands_in_session != null}">
            <tr>
                <th>标题</th>
                <th>分类</th>
                <th>内容简介</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${demands_in_session}" var="demand">
                <c:if test="${demand.top == 1}">
                    <tr>
                        <td>${demand.title}</td>
                        <td>${demand.sort.name}</td>
                        <td><textarea rows="2" cols="20" name="content" readonly maxlength="30"
                                      style="resize:none;">${demand.content}</textarea></td>
                        <td>
                                <%--<a href="/user/editDemand">修改</a>--%>
                            <a href="javascript:edit('${demand.id}', '${demand.status}')">修改</a>
                                <%--<a href="/user/deleteDemand">删除</a>--%>
                            <a href="javascript:del('${demand.id}', '${demand.status}')">删除</a>
                        </td>
                        <td>top!</td>
                    </tr>
                </c:if>
            </c:forEach>
            <c:forEach items="${demands_in_session}" var="demand">
                <c:if test="${demand.top != 1}">
                    <tr>
                        <td>${demand.title}</td>
                        <td>${demand.sort.name}</td>
                        <td><textarea rows="2" cols="20" name="content" readonly maxlength="30"
                                      style="resize:none;">${demand.content}</textarea></td>
                        <td>
                            <a href="javascript:edit('${demand.id}', '${demand.status}')">修改</a>
                            <a href="javascript:del('${demand.id}', '${demand.status}')">删除</a>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </c:if>
    </table>
</center>
</body>
<script language="JavaScript">
    function edit(id, status) {
        if (status != 0) {
            alert("该需求已被承接，不可以修改");
        } else {
            if (confirm("是否需要修改该需求？")) {
                self.location = '/user/editDemand?id=' + id;
            }
        }
    }

    function del(id, status) {
        if (status != 0) {
            alert("该需求已被承接，不可以修改");
        } else {
            if (confirm("是否需要删除该需求？")) {
                self.location = '/user/deleteDemand?id=' + id;
            }
        }
    }
</script>
</html>
