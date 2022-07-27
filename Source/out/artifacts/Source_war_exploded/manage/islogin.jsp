
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String url=request.getScheme()+"://" +request.getServerName()+":"+request.getServerPort()+"/"+request.getContextPath()+"/manage/error.jsp";
    String username = (String) session.getAttribute("admin");
    if(username==null){
        response.sendRedirect(url);
    }
%>