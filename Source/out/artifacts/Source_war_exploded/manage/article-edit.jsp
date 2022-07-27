<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./islogin.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"></c:set>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
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
                <label for="txtTitle" class="layui-form-label">
                    <span class="x-red">*</span>标题
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="txtTitle" name="txtTitle" required="" lay-verify="required"
                           autocomplete="off" class="layui-input" value="${article.getTitle()}">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="selectCategoryId" class="layui-form-label">
                    <span class="x-red">*</span>所属分类
                </label>
                <div class="layui-input-inline">

                    <select name="selectCategoryId" id="selectCategoryId">
                        <option value="0">==请选择所属分类==</option>
                        <c:forEach items="${categorySet}" var="category">
                            <option value="${category.getId()}"  <c:if test="${category.getId()==article.getClassid()}">SELECTED="selected" </c:if>>${category.getName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="hidImg" class="layui-form-label">
                    <span class="x-red">*</span>缩略图
                </label>
                <div class="layui-input-inline">
                    <div class="layui-upload">
                        <input type="hidden" id="hidImg" name="hidImg" value="${article.getPicture()}">
                        <button type="button" class="layui-btn" id="test1">上传图片</button>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="demo1" src="${article.getPicture()}">
                            <p id="demoText"></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red"></span>内容
                </label>
                <div>

                    <textarea class="layui-textarea" id="txtContext" name="txtContext" style="display: none">${article.getContext()}</textarea>

                </div>
            </div>
            <div class="layui-form-item">

                <div class="layui-input-inline">
                    <input type="hidden" id="hidId" name="hidId"  value="${article.getId()}">
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
    layui.use(['layedit','upload'], function(){

        var layedit = layui.layedit;
        var upload = layui.upload;
        //上传图片,必须放在 创建一个编辑器前面
        layedit.set({
            uploadImage: {
                url: '${path}/uploadServlet',//接口url
                type: 'post', //默认post
                done: function(res){
                    alert(res.msg)
                },
                error: function(){
                    //请求异常回调
                    alert("异常");
                }
            }
        });
        var edi = layedit.build('txtContext'); //建立编辑器

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '${path}/uploadServlet' //改成您自己的上传接口
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功
                $('#hidImg').attr('value', res.data.src);
                //alert(res.data.src);
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });


        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;


        //自定义验证规则
        form.verify({
            txtTitle: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }

        });



        //监听提交
        form.on('submit(edit)', function (data) {
            var obj = new Object();
            obj.txtContext =layedit.getContent(edi);
            obj.txtTitle=data.field.txtTitle;
            obj.selectCategoryId=data.field.selectCategoryId;;
            obj.hidId=data.field.hidId;
            obj.hidImg=data.field.hidImg;
            obj.action="editSaveArticle";
            $.post("${path}/articleServlet", obj, function (data) {
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
