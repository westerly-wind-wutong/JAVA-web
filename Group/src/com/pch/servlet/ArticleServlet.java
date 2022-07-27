package com.pch.servlet;

import com.pch.common.DataConverter;
import com.pch.common.Utility;
import com.pch.dal.Article;
import com.pch.dal.Category;
import com.pch.model.ArticleInfo;
import com.pch.model.PageBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet(name = "ArticleServlet", urlPatterns = "/articleServlet")
public class ArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        Article article = new Article();
        ArticleInfo articleInfo = new ArticleInfo();
        Category category = new Category();
        String action = request.getParameter("action");
        String backPage=request.getParameter("backPage");
        //获取分类下拉菜单数据
        if ("getCategoryList".equals(action)) {

            try {
                request.setAttribute("categorySet", category.getList());
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            }
            //当前时间

            request.setAttribute("nowtime", Utility.getNowDateTime().toString());
            request.getRequestDispatcher("/manage/article-add.jsp").forward(request, response);
        }
        //删除文章
        if ("delArticle".equals(action) || "delAllArticle".equals(action)) {
            idLogin(request); //验证只有登录后台才可以获取数据
            int result = article.delete(request.getParameter("ids"));
            response.getWriter().write("{\"result\":" + result + "}");
        }
        //文章总数
        if ("countArticle".equals(action)) {
            int result = 0;
            try {
                result = article.getCount(0);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.getWriter().write("{\"result\":" + result + "}");
            //response.getWriter().write(result);

        }
        //根据id查询文章
        if ("view".equals(action)) {

            try {
                ArticleInfo info = article.getArticleInfo(DataConverter.toInt(request.getParameter("id")));
                request.setAttribute("article", info);
                request.setAttribute("categorySet", category.getList());
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher(backPage).forward(request, response);
        }
        //编辑保存文章
        if ("editSaveArticle".equals(action)) {
            idLogin(request); //验证只有登录后台才可以获取数据
            //接收参数
            String txtTitle = request.getParameter("txtTitle");
            int selectCategoryId = DataConverter.toInt(request.getParameter("selectCategoryId"));
            String txtContext = request.getParameter("txtContext");
            int id = DataConverter.toInt(request.getParameter("hidId"));
            String hidImg=request.getParameter("hidImg");
            articleInfo.setTitle(txtTitle);
            articleInfo.setClassid(selectCategoryId);
            articleInfo.setContext(txtContext);
            articleInfo.setId(id);
            articleInfo.setPicture(hidImg);
            int result = article.update(articleInfo);
            response.getWriter().write("{\"result\":" + result + "}");
        }
        //添加文章
        if ("saveArticle".equals(action)) {
            idLogin(request); //验证只有登录后台才可以获取数据
            //接收参数
            String txtTitle = request.getParameter("txtTitle");
            int selectCategoryId = DataConverter.toInt(request.getParameter("selectCategoryId"));
            String txtContext = request.getParameter("txtContext");
            Date txtCreatedTime = DataConverter.toDate(request.getParameter("txtCreatedTime"));
            String hidImg=request.getParameter("hidImg");
            articleInfo.setTitle(txtTitle);
            articleInfo.setClassid(selectCategoryId);
            articleInfo.setContext(txtContext);
            articleInfo.setCreatedtime(txtCreatedTime);
            articleInfo.setPicture(hidImg);
            int result = article.insert(articleInfo);
            response.getWriter().write("{\"result\":" + result + "}");
        }
        //获取列表
        if ("getList".equals(action)) {

            //获取参数
            String txtKeyword = request.getParameter("txtKeyword");
            String txtBeginDate = request.getParameter("txtBeginDate");
            String txtEndDate = request.getParameter("txtEndDate");
            int selectCategoryId = DataConverter.toInt(request.getParameter("selectCategoryId"));
            //分页设置
            PageBean page = new PageBean();
            int currentPage = DataConverter.toInt(request.getParameter("currentPage"));//当前页码
            int rows = 10;  //每页显示条数
            if (currentPage <= 0) currentPage = 1;
            page.setCurrentPage(currentPage);
            page.setPageSize(rows);
            int totalCount = 0; //总条数
            try {
                totalCount = article.getCount(selectCategoryId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            page.setTotalCount(totalCount);
            //传数据到页面
            try {
                request.setAttribute("currentCategoryId",selectCategoryId);
                request.setAttribute("articleSet", article.getList(txtKeyword, txtBeginDate, txtEndDate, selectCategoryId, currentPage, rows));
                request.setAttribute("categorySet", category.getList());
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            }
            request.setAttribute("page", page);
            //服务端页面跳转
            request.getRequestDispatcher(backPage).forward(request, response);
        }
        if ("getListBycid".equals(action)) {
            String str = getData(DataConverter.toInt(request.getParameter("cid")), DataConverter.toInt(request.getParameter("num")));
            response.getWriter().write(str);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private String getData(int cid, int num) {
        Article article = new Article();
        try {
            //JSONArray json = JSONArray.fromObject(article.getListBycid(cid,num));
            //String json_str = json.toString();

            StringBuffer str = new StringBuffer("");
            StringBuffer strAll = new StringBuffer("");

            for (ArticleInfo item : article.getListBycid(cid, num)) {
                str.append("{");
                str.append("\"id\":").append(item.getId()).append(",");
                str.append("\"title\":").append("\"").append(item.getTitle()).append("\",");
                // str.append("\"context\":").append("\"").append( Utility.Html2Text(item.getContext())).append("\",");
                str.append("\"createdtime\":").append("\"").append(item.getCreatedtime()).append("\"");
                str.append("}");
                str.append(",");
            }
            //去掉最后一个逗号
            String newstr = Utility.Substring(str.toString(), str.toString().length() - 1);
            strAll.append("[").append(newstr).append("]");
            return strAll.toString();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private void idLogin(HttpServletRequest request) {
        //验证是否登录成功
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("admin");
        if (username == null)
            return;
        //----结束验证
    }
}
