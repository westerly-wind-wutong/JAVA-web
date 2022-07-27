<%--
  Created by IntelliJ IDEA.
  User: nianzuo
  Date: 2022/3/31
  Time: 上午11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if("LoginAction".equals(request.getParameter("action"))){
        String txtUsername=request.getParameter("txtUsername");
        String txtPassword=request.getParameter("txtPassword");
        if("root".equals(txtUsername)&& "root".equals(txtPassword))
        {
            session.setAttribute("CurrentUser",txtUsername);
            response.sendRedirect("index.jsp");
        }
        else {
            out.print("<script>alert('用户名密码不正确';window.loaction.href('index.jsp';</script>");
        }
    }
%>
<%if (session.getValue("CurrentUser")!=null){ %>
    <table width="200" border="0">
        <tr>
            <td>欢迎您:<%=session.getValue("CurrentUser")%></td>
        </tr>
        <tr>
            <td><a href="edit.jsp">编辑个人资料</a></td>
        </tr>
        <tr>
            <td><a href="logout.jsp">退出登录</a></td>
        </tr>
    </table>
<% }else{ %>
    <form id="form1" name="form1" method="post" action="login.jsp?action=LoginAction">
        <table width="199" border="0">
            <tr>
                <td colspan="2">登录窗口</td>
            </tr>
            <tr>
                <td>用户名</td>
                <td><input name="txtUsername" type="text" size="12"></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input name="txtPassword" type="text" size="12"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="button" id="button" value="登录"/>
                    <input type="reset" name="button2" id="button2" value="重置"/></td>
            </tr>
        </table>
    </form>
    <%}%>
