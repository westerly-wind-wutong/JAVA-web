<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 2022/5/19
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>JSTL标签-捕获异常</title>
</head>
<body>
<c:catch var="ex">
  <%=10/0%>
</c:catch>
<c:out value="异常：${ex.message}"></c:out>
</body>
</html>



