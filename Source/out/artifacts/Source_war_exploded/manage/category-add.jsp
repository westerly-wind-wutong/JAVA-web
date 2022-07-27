<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./islogin.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"></c:set>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>添加分类</title>
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
                <label for="txtName" class="layui-form-label">
                    <span class="x-red">*</span>名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="txtName" name="txtName" required="" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="txtSort" class="layui-form-label">
                    <span class="x-red">*</span>排序
                </label>
                <div class="layui-input-inline">

                    <input type="text" id="txtSort" name="txtSort" required="" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>
                </div>
            </div>


            <div class="layui-form-item">
                <%--                <input type="submit" value="增加" class="layui-btn">--%>
                <button class="layui-btn" lay-filter="add" lay-submit="">
                    增加
                </button>
            </div>
        </form>
    </div>
</div>

</body>

<script>
    layui.use('layedit', function(){

        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;


        //自定义验证规则
        form.verify({
            txtName: function (value) {
                if (value.length < 2) {
                    return '名称至少得2个字符啊';
                }
            }

        });



        //监听提交
        form.on('submit(add)', function (data) {
            var obj = new Object();

            obj.txtName=data.field.txtName;
            obj.txtSort=data.field.txtSort;
            obj.action="saveCategory";
            $.post("${path}/categoryServlet", obj, function (data) {
                var obj_data = eval('(' + data + ')'); //由JSON字符串转换为JSON对象
                if (obj_data.result == 0) {
                    layer.alert("增加失败", {
                            icon: 5
                        },
                        function () {
                            //关闭当前frame
                            xadmin.close();
                            // 可以对父窗口进行刷新
                            xadmin.father_reload();
                        });
                } else {
                    layer.alert("增加成功", {
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
