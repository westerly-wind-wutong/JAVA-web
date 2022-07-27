<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./islogin.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"></c:set>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>编辑分类</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${path}/manage/css/font.css">
    <link rel="stylesheet" href="${path}/manage/css/xadmin.css">
    <script type="text/javascript" src="${path}/manage/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${path}/manage/js/xadmin.js"></script>

    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form" method="post" id="addForm">
            <div class="layui-form-item">
                <label for="txtUsername" class="layui-form-label">
                    <span class="x-red">*</span>用户名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="txtUsername" name="txtUsername" required="" lay-verify="required"
                           autocomplete="off" class="layui-input" value="${user.getUsername()}">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>将会成为您唯一的登入名
                </div>
            </div>
            <div class="layui-form-item">
                <label for="txtPassword" class="layui-form-label">
                    <span class="x-red">*</span>密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="txtPassword" name="txtPassword" required="" lay-verify="pass"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    6到16个字符
                </div>
            </div>
            <div class="layui-form-item">
                <label for="txtPassword2" class="layui-form-label">
                    <span class="x-red">*</span>确认密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="txtPassword2" name="txtPassword2" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="txtEmail" class="layui-form-label">
                    <span class="x-red">*</span>邮箱
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="txtEmail" name="txtEmail" required="" lay-verify="email"
                           autocomplete="off" class="layui-input" value="${user.getEmail()}">
                    <input type="hidden" id="hidId" name="hidId"  value="${user.getId()}">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>
                </div>
            </div>


            <div class="layui-form-item">
                <%--                <input type="submit" value="增加" class="layui-btn">--%>
                <button class="layui-btn" lay-filter="edit" lay-submit="">
                    保存
                </button>
            </div>
        </form>
    </div>
</div>

</body>

<script>
    layui.use('layedit', function () {


        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;


        //自定义验证规则
        form.verify({
            txtUserame: function (value) {
                if (value.length < 6) {
                    return '名称至少得6个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            repass: function (value) {
                if ($('#txtPassword').val() != $('#txtPassword2').val()) {
                    return '两次密码不一致';
                }
            }

        });


        //监听提交
        form.on('submit(edit)', function (data) {
            var obj = new Object();
            obj.txtUsername = data.field.txtUsername;
            obj.txtPassword = data.field.txtPassword;
            obj.txtEmail = data.field.txtEmail;
            obj.hidId = data.field.hidId;
            obj.action = "editSaveUser";
            $.post("${path}/userServlet", obj, function (data) {
                var obj_data = eval('(' + data + ')'); //由JSON字符串转换为JSON对象
                if (obj_data.result == 0) {
                    layer.alert("编辑失败", {
                            icon: 5
                        },
                        function () {
                            //关闭当前frame
                            xadmin.close();
                            // 可以对父窗口进行刷新
                            xadmin.father_reload();
                        });
                } else {
                    layer.alert("编辑成功", {
                            icon: 6
                        },
                        function () {
                            //关闭当前frame
                            xadmin.close();
                            // 可以对父窗口进行刷新
                            xadmin.father_reload();
                        });
                }
            });
            return false;
        });


    });
</script>


</html>
