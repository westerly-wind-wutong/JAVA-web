package com.servlet;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginFilter2 implements javax.servlet.Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request1 =(HttpServletRequest) servletRequest;
        HttpServletResponse response1 =(HttpServletResponse) servletResponse;
        servletRequest.setCharacterEncoding("utf-8");
        servletResponse.setContentType("text/html;charset=utf-8");
        PrintWriter out = servletResponse.getWriter();
        String user =servletRequest.getParameter("txtUsername");
        String pass = servletRequest.getParameter("txtPassword");
        out.println("LoginFilter2用户名："+user);
        out.println("LoginFilter2密  码:"+pass);
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}