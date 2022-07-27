<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"></c:set>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>资讯管理信息系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="${path}/manage/css/font.css">
    <link rel="stylesheet" href="${path}/manage/css/login.css">
    <link rel="stylesheet" href="${path}/manage/css/xadmin.css">

    <script src="${path}/manage/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${path}/manage/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">资讯管理信息系统</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form">
        <input name="txtUsername" placeholder="用户名" type="text" lay-verify="required" class="layui-input">
        <hr class="hr15">
        <input name="txtPassword" lay-verify="required" placeholder="密码" type="password" class="layui-input">
        <hr class="hr15">

        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20">
    </form>

</div>
<script>

    layui.use('form', function () {
        var form = layui.form;
        //监听提交
        form.on('submit(login)', function (data) {
            var obj = new Object();
            obj.txtUsername = data.field.txtUsername;
            obj.txtPassword = data.field.txtPassword;
            obj.action = "login";
            $.post("${path}/loginServlet", obj, function (data) {
                var obj_data = eval('(' + data + ')'); //由JSON字符串转换为JSON对象
                if (obj_data.code == 0) {
                    layer.msg("用户名密码不正确！");
                } else if (obj_data.code == 1) {
                    location.href = '${path}/manage/index.jsp'
                }
            });
            return false;
        });
    });
</script>
</body>
</html>