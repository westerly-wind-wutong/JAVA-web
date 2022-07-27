<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./islogin.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="p" scope="page" class="com.pch.model.PageBean"></jsp:useBean>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"></c:set>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>分类列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${path}/manage/css/font.css">
    <link rel="stylesheet" href="${path}/manage/css/xadmin.css">
    <script src="${path}/manage/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${path}/manage/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">分类管理</a>
            <a>
              <cite>列表</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5" method="post" action="categoryServlet?action=getList">

                        <div class="layui-inline layui-show-xs-block">

                            <input type="text" name="txtKeyword" placeholder="请输入分类名称" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i
                                    class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除
                    </button>
                    <button class="layui-btn" onclick="xadmin.open('添加分类','${path}/manage/category-add.jsp',450,300)"><i
                            class="layui-icon"></i>添加
                    </button>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" lay-filter="checkall" lay-skin="primary">全选
                            </th>
                            <th>ID</th>
                            <th>名称</th>
                            <th>排序</th>

                            <th>操作</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${categorySet}" var="category">
                            <tr>
                                <td>
                                    <input type="checkbox" name="ids" value="${category.getId()}" lay-skin="primary">
                                </td>
                                <td><c:out value="${category.getId()}"></c:out></td>
                                <td><c:out value="${category.getName()}"></c:out></td>
                                <td><c:out value="${category.getSort()}"></c:out></td>
                                <td class="td-manage">
                                    <button class="layui-btn layui-btn layui-btn-xs"  onclick="xadmin.open('编辑','${path}/categoryServlet?id=${category.getId()}&action=getCategory',450,300)" ><i class="layui-icon">&#xe642;</i>编辑</button>
                                    <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="category_del(this,'${category.getId()}')" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>

                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <div class="page">
                        <div>
                            <a>当前第 ${page.currentPage} 页</a>
                            <a class="prev" href="${path}/categoryServlet?action=getList&currentPage=1">首页</a>
                            <c:choose>
                                <c:when test="${page.currentPage==1}">
                                    <a class="num" href="${path}/categoryServlet?action=getList&currentPage=1">上一页</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="num"
                                       href="${path}/categoryServlet?action=getList&currentPage=${page.currentPage-1}">上一页</a>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${page.currentPage==page.totaPage}">
                                    <a class="num"
                                       href="${path}/categoryServlet?action=getList&currentPage=${page.totaPage}">下一页</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="num"
                                       href="${path}/categoryServlet?action=getList&currentPage=${page.currentPage+1}">下一页</a>
                                </c:otherwise>
                            </c:choose>


                            <a class="next" href="${path}/categoryServlet?action=getList&currentPage=${page.totaPage}">尾页</a>
                            <a class="num">共 ${page.totalCount} 条，每页显示 ${page.pageSize} 条，共 ${page.totaPage} 页</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });

        // 监听全选
        form.on('checkbox(checkall)', function (data) {
            if (data.elem.checked) {
                $('tbody input').prop('checked', true);
            } else {
                $('tbody input').prop('checked', false);
            }
            form.render('checkbox');
        });
    });

    /*删除*/
    function category_del(objs, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            //创建一个对象,用来传递要发送到服务端的数据
            var obj=new Object();
            //将id,给object赋值

            obj.ids=id;
            obj.action="delCategory";
            $.post("${path}/categoryServlet", obj, function(data) {
                var obj_data = eval('(' + data + ')'); //由JSON字符串转换为JSON对象
                if(obj_data.result==0){
                    layer.msg('删除失败!', {icon: 1, time: 1000});
                }else{
                    $(objs).parents("tr").remove();
                    layer.msg('删除成功!', {icon: 1, time: 1000});


                }
            });
            // $(obj).parents("tr").remove();

        });
    }


    function delAll(argument) {
        var ids = [];
        // 获取选中的id
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
                ids.push($(this).val())
            }
        });

        layer.confirm('确认要删除吗？', function (index) {
            //捉到所有被选中的，发异步进行删除
            var obj=new Object();
            //将ids,给object赋值
            obj.ids=ids.toString();
            obj.action="delAllCategory";
            $.post("${path}/categoryServlet", obj, function(data) {
                var obj_data = eval('(' + data + ')'); //由JSON字符串转换为JSON对象
                if(obj_data.result==0){
                    layer.msg('删除失败!', {icon: 5, time: 1000});
                }else{
                    layer.msg('删除成功!', {icon: 1, time: 1000});
                    $(".layui-form-checked").not('.header').parents('tr').remove();
                }
            });
        });
    }
</script>

</html>