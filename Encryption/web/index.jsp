<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 2022/4/21
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="ma" class="com.bean.EncryptAndDecrypt" scope="request"></jsp:useBean>
<%
  request.setCharacterEncoding("utf-8");
  if("b".equals(request.getP("a"))){
    String txt1=request.getP("txt1");
    String txt2=ma.encrypt(txt1,"123");
    out.print("加密后："+txt2);
  }

%>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="index.jsp?a=b" method="post">
    <div>
      原字符串：<input name="txt1" type="text" value="">
    </div>
    <div>
      <input name="jiami" type="submit" value="加密">
      <input name="chongzi" type="submit" value="重置">
    </div>
  </form>
  </body>
</html>
