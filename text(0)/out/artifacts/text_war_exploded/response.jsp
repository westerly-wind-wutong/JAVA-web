<%--
  Created by IntelliJ IDEA.
  User: nianzuo
  Date: 2022/3/31
  Time: 上午10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>response</title>
</head>
<body>
<%
    String address = request.getParameter("where");
    if(address!=null){
        if(address.equals("Baidu"))
            response.sendRedirect("http://www.baidu.com");
        else if(address.equals("Yahoo"))
            response.sendRedirect("http://www.yahoo.com");
        else if(address.equals("Sun"))
            response.sendRedirect("http://www.sun.com");
    }
%>
<b>Please select:</b><br>
<form action="response.jsp" method="post">
    <select name="where">
        　    <option value="Baidu" selected>go to Baidu
        　 <option value="Yahoo" > go to Yahoo
        　 <option value="Sun" > go to Sun
    </select>
    <input type="submit" value="go">
</form>
</body>
</html>
