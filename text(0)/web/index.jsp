<%--
  Created by IntelliJ IDEA.
  User: nianzuo
  Date: 2022/3/30
  Time: 下午7:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>index.jsp</title>
</head>
<body>
<p>
    <FORM action="one.jsp" method="post" name="form1">
    诗人李白是啥朝代的<br>
    <input type="radio" name="R" value="a">宋
    <input type="radio" name="R" value="b">唐
    <input type="radio" name="R" value="c">明
    <input type="radio" name="R" value="d">元
    <br>
    <p>红楼梦的作者
        <br>
    <input type="radio" name="P" value="a">曹雪芹
    <input type="radio" name="P" value="b">罗贯中
    <input type="radio" name="P" value="c">李白
    <input type="radio" name="P" value="d">司马迁
    <br>
    <input type="submit" value="提交答案" name="submit">
</FORM>
</body>
</html>

