<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/8/25
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2><b>欢迎页面</b></h2>
    <c:if test="${user_in_session == null}">
        <a>注册成功，三秒后跳转登录界面！</a>

        <script type="text/javascript">
            onload=function(){
                setInterval(go, 1000);
            };
            var x=3; //利用了全局变量来执行
            function go(){
                x--;
                if(x>0){
                    document.getElementById("sp").innerHTML=x;  //每次设置的x的值都不一样了。
                }else{
                    location.href='/user/login';
                }
            }
        </script>
    </c:if>
    <c:if test="${user_in_session != null}">
        <a>修改成功，三秒后跳转信息页面！</a>

        <script type="text/javascript">
            onload=function(){
                setInterval(go, 1000);
            };
            var x=3; //利用了全局变量来执行
            function go(){
                x--;
                if(x>0){
                    document.getElementById("sp").innerHTML=x;  //每次设置的x的值都不一样了。
                }else{
                    location.href='/user/info';
                }
            }
        </script>
    </c:if>
</body>
</html>
