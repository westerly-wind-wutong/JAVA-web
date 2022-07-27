<%--
  Created by IntelliJ IDEA.
  User: nianzuo
  Date: 2022/4/1
  Time: 上午00:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <title>注册表单</title>
</head>
<body>
<form  action="save.jsp" method="post" name="from1">
<table width="500" height="200" border="1" bordercolor="#c0c0c0" align="center" cellspacing="0" cellpadding="0">
    <tr>
        <td colspan="2" width="=100" height="20" align="left">请填写以下信息</td>
    </tr>
    <tr>
        <td width="75" height="20" align="left">用户名</td>
        <td width="400" height="20" align="left"> <input type="text" name="userid" size="16"></td>
    </tr>
    <tr>
        <td width="75" height="20" align="left">密码</td>
        <td width="400" height="20" align="left"> <input type="password" name="pass1" size="16" maxlength="16"></td>
    </tr>
    <tr>
        <td width="75" height="20" align="left">确认密码</td>
        <td width="400" height="20" align="left"> <input type="password" name="pass2" size="16" maxlength="16"></td>
    </tr>
    <tr>
        <td width="75" height="20" align="left">性别</td>
        <td width="400" height="20" align="left"> <input type="radio" name="sex" value="男" checked="checked">男
            <input type="radio" name="sex" value="女">女
        </td>
    </tr>
    <tr>
        <td width="75" height="20" align="left">爱好</td>
        <td width="400" height="20" align="left">
            <input type="checkbox" name="like" value="篮球">篮球
            <input type="checkbox" name="like" value="足球">足球
        </td>
    </tr>
    <tr>
        <td width="75" height="20" align="left">专业</td>
        <td width="400" height="20" align="left">
            <select size="1" name="work">
            <option value="" selected="selected">请选择</option>
            <option value="通信工程">通信工程</option>
            <option value="计算机科学与技术">计算机科学与技术</option>
            <option value="软件工程">软件工程</option>
            <option value="网络工程">网络工程</option>
            <option value="数据科学与大数据技术">数据科学与大数据技术</option>
        </select>
        </td>
    </tr>
    <tr>
        <td width="75" headers="20" align="left">其他</td>
        <td width="400" headers="20" align="left">
            <textarea name="intro" cols="20" rows="3"></textarea>
        </td>
    </tr>
    <tr>
        <td width="75" headers="20"></td>
        <td align="lift">
            <input type="submit" name="submit" value="提交"/>
            <input type="reset" name="reset" value="重置" />
        </td>
    </tr>
</table>
</form>
</body>
</html>
