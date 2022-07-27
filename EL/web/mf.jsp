<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 2022/5/12
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tlds/myFun" prefix="mf"%>
<html>
<head>
    <title>EL访问方法</title>
</head>
<body>
${mf:getMin("12,23,44,2,1123,456")}
</body>
</html>
