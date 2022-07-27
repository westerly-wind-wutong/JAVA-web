<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 2022/4/27
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="com.ch6.model.StudentInfo, com.ch6.dal.Student" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>数据查询</title>
</head>
<body>
    <table width="539" border="1">
        <tr>
            <td>学号</td>
            <td>姓名</td>
            <td>性别</td>
            <td>住址</td>
            <td>电话</td>
            <td>邮箱</td>
            <td>操作</td>
        </tr>
        <%
            Student student = new Student();    //创建com.ch6.dal.Student的对象,命名为student
            List<StudentInfo> list = student.getList(); //通过student对象调用方法getList()获取学生列表信息,该方法返回一个List集合
            for(StudentInfo info: list){
        %>
        <tr>
            <td><%out.print(info.getNumber());//调用对象的属性值%></td>
            <td><%out.print(info.getName());%></td>
            <td><%out.print(info.getSex());%></td>
            <td><%out.print(info.getAddress());%></td>
            <td><%out.print(info.getPhone());%></td>
            <td><%out.print(info.getEmail());%></td>
            <td><a href="update.jsp?id=<%=info.getId()%>">编辑</a> | <a href=" ">删除</a></td>
        </tr>
        <%} %>
    </table>
</body>
</html>
