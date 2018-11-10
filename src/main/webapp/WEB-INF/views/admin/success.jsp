<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 梅峰鑫
  Date: 2018/10/26
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>操作成功界面</title>
</head>
<body>
<center>
    <h2><b>修 改 结 果 页 面 </b></h2>
    <br/><hr/><br/>
    <c:if test="${isResetPassword == 1}">
        ${Msg} 三秒后跳转登录......
        <script type="text/javascript">
            onload=function(){
                setInterval(go, 1000);
            };
            var x=3;
            function go(){
                x--;
                if(x>0){
                    document.getElementById("sp").innerHTML=x;  //每次设置的x的值都不一样了。
                }else{
                    location.href='/admin/login';
                }
            }
        </script>
    </c:if>
    ${Msg} 三秒后跳转初始页面......
    <script type="text/javascript">
        onload=function(){
            setInterval(go, 1000);
        };
        var x=3;
        function go(){
            x--;
            if(x>0){
                document.getElementById("sp").innerHTML=x;  //每次设置的x的值都不一样了。
            }else{
                location.href='/admin/right';
            }
        }
    </script>
</center>
</body>
</html>
