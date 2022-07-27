<%--
  Created by IntelliJ IDEA.
  User: nianzuo
  Date: 2022/4/14
  Time: 上午9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="cal" class="com.javabean.Calculator2" scope="page"></jsp:useBean>

<%
  if("do".equals(request.getParameter("action"))){
    String value1=request.getParameter("txtNumber1");
    String value2=request.getParameter("txtNumber2");
    String operator=request.getParameter("radioOperator");
    cal.setValue1(Double.parseDouble(value1));
    cal.setValue2(Double.parseDouble(value2));
    cal.setOperatorchar(operator);
    out.print(cal.calcuate());
  }
%>
<html>
  <head>
    <title>计算器</title>
  </head>
  <body>
  <form method="post" action="./index.jsp?action=do">
    <table width="379" height="149" border="1">
      <tbody>
      <tr>
        <td width="141">第一个参数：</td>
        <td width="222">
          <input type="text" name="txtNumber1">
        </td>
      </tr>
      <tr>
        <td>运算符：</td>
        <td>
          <input type="radio" name="radioOperator" value="+">+
          <input type="radio" name="radioOperator" value="-">-
          <input type="radio" name="radioOperator" value="*">*
          <input type="radio" name="radioOperator" value="/">/
        </td>
      </tr>
      <tr>
        <td>第二个参数：</td>
        <td><input type="text" name="txtNumber2"></td>
      </tr>
      <tr>
        <td>&nbsp</td>
        <td><input type="submit" name="submit" value="提交"></td>
      </tr>
      </tbody>
    </table>
  </form>
  </body>
</html>
