package com.pch.servlet;

import com.pch.common.DataConverter;
import com.pch.dal.Category;
import com.pch.model.CategoryInfo;
import com.pch.model.PageBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CategoryServlet", urlPatterns = "/categoryServlet")
public class CategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //验证是否登录成功
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("admin");
        if(username==null)
            return;
        //----结束验证
        String action = request.getParameter("action");
        Category category = new Category();
        CategoryInfo categoryInfo = new CategoryInfo();
        //列表
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
                totalCount = category.getCount();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            page.setTotalCount(totalCount);
            //传数据到页面
            try {
                request.setAttribute("categorySet", category.getList(txtKeyword, currentPage, rows));
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("page", page);
            //服务端页面跳转
            request.getRequestDispatcher("/manage/category-list.jsp").forward(request, response);
        }
        if ("saveCategory".equals(action)) {
            //接收参数
            String txtName = request.getParameter("txtName");
            int sort = DataConverter.toInt(request.getParameter("txtSort"));
            categoryInfo.setName(txtName);
            categoryInfo.setSort(sort);
            int result = category.insert(categoryInfo);
            response.getWriter().write("{\"result\":"+result+"}");
        }
        if ("getCategory".equals(action)) {

            try {
                categoryInfo = category.getCategoryInfo(DataConverter.toInt(request.getParameter("id")));
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            }
            request.setAttribute("category", categoryInfo);

            request.getRequestDispatcher("/manage/category-edit.jsp").forward(request, response);
        }
        if ("editSaveCategory".equals(action)) {
            //接收参数
            String txtName = request.getParameter("txtName");
            int sort = DataConverter.toInt(request.getParameter("txtSort"));
            int id = DataConverter.toInt(request.getParameter("hidId"));
            categoryInfo.setName(txtName);
            categoryInfo.setSort(sort);
            categoryInfo.setId(id);
            int result = category.update(categoryInfo);
            response.getWriter().write("{\"result\":"+result+"}");
        }
        if ("delCategory".equals(action) || "delAllCategory".equals(action)){
            int result = category.delete(request.getParameter("ids"));
            response.getWriter().write("{\"result\":"+result+"}");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
