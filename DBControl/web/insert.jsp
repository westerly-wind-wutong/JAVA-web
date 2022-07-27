<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 2022/4/28
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.ch6.model.StudentInfo, com.ch6.dal.Student" %>
<%request.setCharacterEncoding("utf-8");
    StudentInfo info = new StudentInfo();
    Student student = new Student();

    if("add".equals(request.getParameter("action"))){
        info.setNumber(request.getParameter("number"));
        info.setName(request.getParameter("name"));
        info.setSex(request.getParameter("sex"));
        info.setAddress(request.getParameter("address"));
        info.setPhone(request.getParameter("phone"));
        info.setEmail(request.getParameter("email"));
        student.insert(info);
    }
%>
<html>
<head>
    <title>数据添加</title>
</head>
<body>
<form id="form1" name="form1" method="post" action="insert.jsp?action=add">
<table width="384" height="289" border="1">
    <tr>
        <td>学号</td>
        <td><input type="text" name="number" id="number"/></td>
    </tr>
    <tr>
        <td>姓名</td>
        <td><input type="text" name="name" id="name"></td>
    </tr>
    <tr>
        <td>性别</td>
        <td>
            <input type="radio" name="sex" id="sex1" value="男" checked/>男
            <input type="radio" name="sex" id="sex2" value="女"/>女
        </td>
    </tr>
    <tr>
        <td>住址</td>
        <td><input type="text" name="address" id="address"/></td>
    </tr>
    <tr>
        <td>电话</td>
        <td><input type="text" name="phone" id="phone"></td>
    </tr>
    <tr>
        <td>邮箱</td>
        <td><input type="text" name="email" id="email"></td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" name="button1" id="button" value="提交"/>
            <input type="reset" name="button2" id="button2" value="重置"/>
        </td>
    </tr>
</table>
</form>
</body>
</html>
