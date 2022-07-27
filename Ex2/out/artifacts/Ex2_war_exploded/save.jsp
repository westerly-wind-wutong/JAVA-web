<%--
  Created by IntelliJ IDEA.
  User: nianzuo
  Date: 2022/4/1
  Time: 上午00:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;c">
    <title>save.jsp</title>
</head>
<body>
用户名:<%String usr =request.getParameter("userid");
        out.print(usr);%><br>
密码:<%String pass1 =request.getParameter("pass1");
    out.print(pass1);%><br>
确认密码:<%String pass2 =request.getParameter("pass2");
    out.print(pass2);%><br>
性别:<%String sex =request.getParameter("sex");
    out.print(sex);%><br>
爱好:<%String[] like =request.getParameterValues("like");
    for (int i = 0;i < like.length; i++)
    out.print(like[i]+" ");%><br>
专业:<%String work =request.getParameter("work");
    out.print(work);%><br>
其他:<%String intro =request.getParameter("intro");
    out.print(intro);%><br>
</body>
</html>
