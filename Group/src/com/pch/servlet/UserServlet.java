package com.pch.servlet;

import com.pch.common.DataConverter;
import com.pch.dal.User;
import com.pch.model.PageBean;
import com.pch.model.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UserServlet", urlPatterns = "/userServlet")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //验证是否登录成功
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("admin");
        if(username==null)
            return;
        //----结束验证
        String action = request.getParameter("action");
        UserInfo userInfo = new UserInfo();
        User user = new User();

        //获取列表
        if ("getList".equals(action)) {
            //获取参数
            String txtKeyword = request.getParameter("txtKeyword");
            //分页设置
            PageBean page = new PageBean();
            int currentPage = DataConverter.toInt(request.getParameter("currentPage"));//当前页码
            int rows = 10;  //每页显示条数
            if (currentPage <= 0) currentPage = 1;
            page.setCurrentPage(currentPage);
            page.setPageSize(rows);
            int totalCount = 0; //总条数
            try {
                totalCount = user.getCount();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            page.setTotalCount(totalCount);
            //传数据到页面
            try {
                request.setAttribute("userSet", user.getList(txtKeyword, currentPage, rows));
            } catch (SQLException e) {
                e.printStackTrace();
            }

            request.setAttribute("page", page);
            //服务端页面跳转
            request.getRequestDispatcher("/manage/user-list.jsp").forward(request, response);
        }
        if ("saveUser".equals(action)) {
            //接收参数
            String txtUsername = request.getParameter("txtUsername");
            //String txtPassword = Encrypt(request.getParameter("txtPassword"));
            String txtEmail = request.getParameter("txtEmail");

            userInfo.setUsername(txtUsername);
            //userInfo.setPassword(txtPassword);
            userInfo.setEmail(txtEmail);
            int result = user.insert(userInfo);
            response.getWriter().write("{\"result\":"+result+"}");
        }
        if ("delUser".equals(action) || "delAllUser".equals(action)) {
            int result = user.delete(request.getParameter("ids"));
            response.getWriter().write("{\"result\":"+result+"}");
        }
        if ("getUser".equals(action)) {

            try {
                userInfo = user.getUserInfo(DataConverter.toInt(request.getParameter("id")));
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            }
            request.setAttribute("user", userInfo);

            request.getRequestDispatcher("/manage/user-edit.jsp").forward(request, response);
        }
        if ("editSaveUser".equals(action)) {
            //接收参数
            String txtUsername = request.getParameter("txtUsername");
            //String txtPassword = Encrypt(request.getParameter("txtPassword"));
            String txtEmail = request.getParameter("txtEmail");
            int id = DataConverter.toInt(request.getParameter("hidId"));
            userInfo.setUsername(txtUsername);
            //userInfo.setPassword(txtPassword);
            userInfo.setEmail(txtEmail);
            userInfo.setId(id);
            int result = user.update(userInfo);
            response.getWriter().write("{\"result\":"+result+"}");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
