<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 2022/5/12
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="f" scope="page" class="com.ch6.Friend"></jsp:useBean>
<jsp:setProperty name="f" property="name" value="Lucy"></jsp:setProperty>
<html>
<head>
    <title>pageScope</title>
</head>
<body>
pageScope应用：
<ul>
    <li>${pageScope.f.name}</li>
</ul>
<hr>
</body>
</html>

