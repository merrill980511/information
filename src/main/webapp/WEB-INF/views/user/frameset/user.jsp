<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/8/28
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>校园信息发布平台</title>
</head>
    <frameset rows="100,*" cols="*" frameborder="no" border="0" framespacing="0">
        <frame src="/user/top" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
        <frameset rows="*" cols="190,*" frameborder="no" border="0" framespacing="0">
            <frame src="/user/left" name="UserLeftFrame" noresize="noresize" id="UserLeftFrame" title="UserLeftFrame" />
            <frameset rows="*" cols="*,25%" frameborder="no" border="0" framespacing="0">
                <frame src="/user/center" name="UserCenterFrame" noresize="noresize" id="UserCenterFrame" title="UserCenterFrame" />
                <frameset rows="300,*" cols="*" frameborder="no" border="0" framespacing="0">
                    <frame src="/user/rightUp" name="UserRightUpFrame" scrolling="No" noresize="noresize" id="UserRightUpFrame" title="UserRightUpFrame" />
                    <frame src="/user/rightDown" name="UserRightDownFrame" noresize="noresize" id="UserRightDownFrame" title="UserRightDownFrame" />
                </frameset>
            </frameset>
        </frameset>
    </frameset>
</html>
