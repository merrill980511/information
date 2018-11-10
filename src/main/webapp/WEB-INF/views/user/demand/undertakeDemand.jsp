<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/13
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>承接需求</title>
    <link type="text/css" rel="stylesheet" href="/css/body.css">
</head>
<body>
<c:if test="${errorMsg == null}">
    <center><h2>承接成功，请在约定时间内完成！</h2></center>
</c:if>
<c:if test="${errorMsg != null}">
    <center><h2>${errorMsg}</h2></center>
</c:if>
    <center><h2>3秒后跳转需求列表界面！</h2></center>


<script type="text/javascript">
    onload = function () {
        setInterval(go, 1000);
    };
    var x = 3; //利用了全局变量来执行
    function go() {
        x--;
        if (x > 0) {
            document.getElementById("sp").innerHTML = x;  //每次设置的x的值都不一样了。
        } else {
            location.href = '/user/user';
        }
    }
</script>
</body>
</html>
