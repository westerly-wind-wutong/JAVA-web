package com.pch.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.pch.dal.User;

@WebServlet(name = "LoginServlet", urlPatterns = "/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if ("login".equals(action)) {
            //第一步：设置编码
            request.setCharacterEncoding("utf-8");
            //第二步：获取表单数据
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            //第三步：
            PrintWriter out = response.getWriter();//取得输出流
            User user = new User();
            try {
                if (!user.isExist(username, password)) {
                    response.getWriter().write("{\"code\":0,\"msg\":\"用户名密码不正确\"}");
                    // response.sendRedirect(request.getContextPath() + "/manage/login.jsp");
                } else {
                    // Utility.writeCookie(response, "admin", username);
                    HttpSession session = request.getSession();
                    session.setAttribute("admin", username);
                    response.getWriter().write("{\"code\":1,\"msg\":\"成功\"}");
                   // response.sendRedirect(request.getContextPath() + "/manage/index.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            }
        }
        else if ("logout".equals(action)) {
            HttpSession session = request.getSession();
            //session.setAttribute("admin", null);
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/manage/login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
