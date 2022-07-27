<%--
  Created by IntelliJ IDEA.
  User: nianzuo
  Date: 2022/4/14
  Time: 上午11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="cal" class="com.EncryptAndDecrypt" scope="page"></jsp:useBean>
<%  if("do".equals(request.getParameter("action"))){
    String txt=request.getParameter("txtNumber1");
    String value2=request.getParameter("txtNumber2");
    String operator=request.getParameter("radioOperator");

}
%>
<html>
  <head>
    <title>加密与解密</title>
  </head>
  <body>
  <form method="post" action="./index.jsp?action=do">
    <table>
      <tbody>
      <tr>
        <td>原字符串：</td>
        <td>
          <input type="text" name="txt">
        </td>
      </tr>
      <tr>
          <td>密码：</td>
          <td>
              <input type="text" name="pass">
          </td>
      </tr>
      <tr>
        <td>
          <input type="submit" name="submit" value="提交">
<%--          <input type="">--%>
        </td>
      </tr>
      <tr>
        <td>加密后：</td>
      </tr>
      </tbody>
    </table>
  </form>
  </body>
</html>
