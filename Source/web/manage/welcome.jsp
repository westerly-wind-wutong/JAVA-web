<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./islogin.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"></c:set>
<c:set var="admin" value="${sessionScope.admin}"></c:set>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-博客系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${path}/manage/css/font.css">
    <link rel="stylesheet" href="${path}/manage/css/xadmin.css">
    <script src="${path}/manage/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${path}/manage/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <blockquote class="layui-elem-quote">欢迎管理员：
                        <span class="x-red"><c:out value="${admin}"></c:out></span>！
                    </blockquote>
                </div>
            </div>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">数据统计</div>
                <div class="layui-card-body ">
                    <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>文章数</h3>
                                <p>
                                    <cite id="articleCount">0</cite></p>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">系统信息</div>
                <div class="layui-card-body ">
                    <table class="layui-table">
                        <tbody>
                        <tr>
                            <th>用户浏览器的版本</th>
                            <td>${header["User-Agent"]}</td>
                        </tr>
                        <tr>
                            <th>IP</th>
                            <td>${header["Host"]}</td>
                        </tr>
                        <tr>
                            <th>取得主机端的服务信息</th>
                            <td>${pageContext.servletContext.serverInfo}</td>
                        </tr>
                        <tr>
                            <th>服务的web application的名称</th>
                            <td>${pageContext.request.contextPath} </td>
                        </tr>
                        <tr>
                            <th>服务器名称</th>
                            <td>${pageContext.request.serverName}</td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>


    </div>
</div>
</div>
<script type="text/javascript">
    layui.use(["jquery", "layer", "form"], function () {

        var obj = new Object();
        obj.action = "countArticle";
        $.post("${path}/articleServlet", obj, function (data) {
            var obj_data = eval('(' + data + ')'); //由JSON字符串转换为JSON对象
            document.getElementById('articleCount').innerHTML = obj_data.result;
        });
    });
</script>
</body>

</html>
