<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/8/28
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>校园信息发布平台</title>
    <link rel="stylesheet" type="text/css" href="/css/frameset/top.css">
</head>
<%--<body background="/images/leftBackground.gif">--%>
<center>
<table width="144" border="0" cellpadding="2" cellspacing="0">
    <%--用迭代做，传值为其id--%>
    <tr>
        <th width="139" align="center">分类列表</th>
    </tr>
    <tr>
        <td align="center">
            <a href="/user/demandList" target="UserCenterFrame">查看需求</a>
        </td>
    </tr>
    <tr>
        <td align="center">
            <a href="/user/unfinished" target="UserCenterFrame">待承接需求</a>
        </td>
    </tr>

    <%--<tr>--%>
        <%--<td align="center">--%>
            <%--<select>--%>
                <%--<option>最后编辑时间</option>--%>
                <%--<option selected>发布时间</option>--%>
            <%--</select>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <c:forEach items="${sorts_in_session}" var="sort">
        <tr>
            <td align="center">
                <a href="/user/sortQuery?sortId=${sort.id}" target="UserCenterFrame">${sort.name}</a>
            </td>
        </tr>
    </c:forEach>
    <c:if test="${users_in_session != null}">
        <tr>
            <td>

            </td>
        </tr>
    </c:if>
</table>
</center>
</body>
</html>
