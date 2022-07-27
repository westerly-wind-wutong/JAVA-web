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
<%
    request.setCharacterEncoding("utf-8");
    StudentInfo info = new StudentInfo();
    Student student = new Student();
    if("edit".equals(request.getParameter("action"))){
        info = student.getStudent(request.getParameter("id"));
        if(info==null){
            out.print("找不到该学生信息");
        }
        info.setId((Integer.parseInt(request.getParameter("id"))));
        info.setNumber(request.getParameter("number"));
        info.setName(request.getParameter("name"));
        info.setSex(request.getParameter("sex"));
        info.setAddress(request.getParameter("address"));
        info.setPhone(request.getParameter("phone"));
        info.setEmail(request.getParameter("email"));
        student.update(info);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>数据编辑</title>
</head>
<body>
<%
    StudentInfo sinfo = student.getStudent(request.getParameter("id"));
    if (sinfo == null){
        out.print("找不到该学生信息");
        return;
    }
%>
<form id="form1" name="form1" method="post" action="update.jsp?action=edit">
    <table width="384" height="289" border="1">
        <tr>
            <td>学号</td>
            <td><input type="text" name="number" id="number" value="<%=sinfo.getNumber() %>"/></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" name="name" id="name" value="<%=sinfo.getName() %>"/></td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                <input type="radio" name="sex" id="sex1" value="男" <%if("男".equals(sinfo.getSex())) out.print("checked"); %>/>男
                <input type="radio" name="sex" id="sex2" value="女" <%if("女".equals(sinfo.getSex())) out.print("checked"); %>/>女
            </td>
        </tr>
        <tr>
            <td>住址</td>
            <td><input type="text" name="address" id="address" value="<%=sinfo.getAddress()%>"/></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input type="text" name="phone" id="phone" value="<%=sinfo.getPhone()%>"></td>
        </tr>
        <tr>
            <td>邮箱</td>
            <td><input type="text" name="email" id="email" value="<%=sinfo.getEmail() %>"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" name="button1" id="button" value="提交"/>
                <input type="reset" name="button2" id="button2" value="重置"/>
                <input type="hidden" name="id" value="<%=sinfo.getId() %>">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
