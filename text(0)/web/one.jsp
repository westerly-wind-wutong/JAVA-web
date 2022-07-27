<%--
  Created by IntelliJ IDEA.
  User: nianzuo
  Date: 2022/3/31
  Time: 上午9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>request对象使用-two.jsp</title>
</head>

<body>
<% int n=0;
    String s1 =request.getParameter("R");
    String s2 =request.getParameter("P");
    if(s1==null){s1=" ";}
    if(s2==null){s2=" ";}
    if(s1.equals("b")){n+=50;}
    if(s2.equals("a")){n+=50;}
    %>
<p>你的得分<%=n%>></p>
</body>
</html>
