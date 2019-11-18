<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico">
    <!-- 图标 -->
    <link rel="icon" type="images/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico">
</head>
<body>
<div class="login-box">
    <form class="login-form" action="login" method="post">
        <h1>Welcome</h1>
        <input class="txtb" type="text" name="aname" placeholder="Username">
        <input class="txtb" type="password" name="apassword" placeholder="Password">
        <input class="login-btn" type="submit" value="Login">
    </form>
</div>
<!-- 用户名和密码输入错误提示框 -->
<%
    String errorInfo = (String) request.getAttribute("error"); //获取错误属性
    if (errorInfo != null) {
%>
<script type="text/javascript">
    alert("<%=errorInfo%>");
</script>
<%
    }
%>
</body>
</html>
