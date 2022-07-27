<%--
  Created by IntelliJ IDEA.
  User: nianzuo
  Date: 2022/3/31
  Time: 上午10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>index.jsp</title>
  </head>
  <body>
  <table width="673" height="301" border="1">
    <tr>
      <td height="87" colspan="2" valign="bottom">
        <%@include file="meun.jsp"%>
      </td>
      </tr>
    <tr>
      <td width="231" valign="top">
        <%@include file="login.jsp"%></td>
      <td width="372">
        <%@include file="main.jsp"%>
      </td>
    </tr>
  </table>
  </body>
</html>
