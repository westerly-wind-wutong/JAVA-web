<%@ page import="com.servlet.CounterListener" %><%--
  Created by IntelliJ IDEA.
  User: nianzuo
  Date: 2022/4/7
  Time: 上午9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
  <head>
    <title>Chapter03-Servlet使用</title>
  </head>
  <body>
  <%out.print("当前在线用户："+CounterListener.count);%>
  <form action="LoginServlet" method="post">
    <div style="border: solid 1px darkgray;width: 300px; margin:0 auto; padding:20px;">
      <div style="height: 30px;">用户名：<input name="txtUsername" type="text"></div>
      <div style="height: 30px;">密&nbsp&nbsp&nbsp&nbsp码：<input name="txtPassword" type="password"></div>
      <div style="height: 30px;"><input name="btnLogin" type="submit" value="登录"></div>
    </div>
  </form>
  </body>
</html>