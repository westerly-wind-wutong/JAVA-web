<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"></c:set>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>麒麟资讯信息网</title>
    <meta name="keywords" content="关键词,关键词,关键词,关键词,5个关键词"/>
    <meta name="description" content="网站简介，不超过80个字"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./css/index.css" rel="stylesheet">
    <script src="./js/jquery.min.js"></script>
    <script src="./js/comm.js"></script>
    <!--[if lt IE 9]>
    <script src="./js/modernizr.js"></script>
    <![endif]-->

</head>
<body>
<!--包含头文件-->
<jsp:include page="head.jsp"></jsp:include>
<!--包含左侧文件-->
<jsp:include page="left.jsp"></jsp:include>


<main>
    <div class="main-content">
        <div class="welcome"> 您好，欢迎您访问我们的官方网站！</div>
        <div class="picbox">
            <h2 class="pictitle"><a href="/">图片新闻</a></h2>
            <!--box begin-->
            <div class="Box_con"><span class="btnl btn" id="btnl"></span> <span class="btnr btn" id="btnr"></span>
                <div class="conbox" id="BoxUl">
                    <ul>
                        <li class="cur"><a href="https://www.baidu.com"><img src="./images/5.jpg" alt=""/>
                            <p></p>
                        </a></li>
                        <li class="cur"><a href="/"><img src="./images/6.jpg" alt=""/>
                            <p>山海资讯信息网</p>
                        </a></li>
                        <li class="cur"><a href="/"><img src="./images/7.jpg" alt=""/>
                            <p>山海资讯信息网</p>
                        </a></li>
                        <li class="cur"><a href="/"><img src="./images/8.jpg" alt=""/>
                            <p>山海资讯信息网</p>
                        </a></li>
                        <li class="cur"><a href="/"><img src="./images/9.jpg" alt=""/>
                            <p>山海资讯信息网</p>
                        </a></li>
                        <li class="cur"><a href="/"><img src="./images/5.jpg" alt=""/>
                            <p>山海资讯信息网</p>
                        </a></li>
                        <li class="cur"><a href="/"><img src="./images/6.jpg" alt=""/>
                            <p>山海资讯信息网</p>
                        </a></li>
                        <li class="cur"><a href="/"><img src="./images/7.jpg" alt=""/>
                            <p>山海资讯信息网</p>
                        </a></li>
                    </ul>
                </div>
            </div>
            <!--box end-->
        </div>
        <div class="newsbox">
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="">更多</a></span><b>最新时事</b></h2>
                    <ul id="cate1">

                    </ul>
                </div>
            </section>
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>娱乐新闻</b></h2>
                    <ul id="cate2">

                    </ul>
                </div>
            </section>
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>体育新闻</b></h2>
                    <ul id="cate3">

                    </ul>
                </div>
            </section>


        </div>
        <div class="blank"></div>
        <div class="links">
            <h2 class="linktitle">合作伙伴</h2>
            <ul class="link-pic">
                <li><a href="/"><img src="images/yqlj.png"></a></li>
                <li><a href="/"><img src="images/yqlj.png"></a></li>
                <li><a href="/"><img src="images/yqlj.png"></a></li>
                <li><a href="/"><img src="images/yqlj.png"></a></li>
                <li><a href="/"><img src="images/yqlj.png"></a></li>
            </ul>

        </div>
       <!--底部-->
        <jsp:include page="foot.jsp"></jsp:include>
    </div>
</main>
<a href="#" class="cd-top cd-is-visible">Top</a>
</body>
<script src="${path}/manage/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use(["jquery", "layer", "form"], function () {
        //获取分类编号是1的数据
        var obj = new Object();
        obj.cid = 1;//分类号
        obj.num = 8;//显示条数
        obj.action = "getListBycid";
        $.post("${path}/articleServlet", obj, function (data) {

             $(data).each(function (o) {
                 //显示在对应的标签中
                 $("#cate1").append("<li><a href=\"${path}/articleServlet?id="+this.id+"&action=view&backPage=info.jsp\"><span>"+this.createdtime+"</span>"+this.title+"</a></li>");
             })
        }, "json");
        //获取分类编号是8的数据
        var obj = new Object();
        obj.cid = 8;
        obj.num = 8;
        obj.action = "getListBycid";
        $.post("${path}/articleServlet", obj, function (data) {

            $(data).each(function (o) {
                $("#cate2").append("<li><a href=\"${path}/articleServlet?id="+this.id+"&action=view&backPage=info.jsp\"><span>"+this.createdtime+"</span>"+this.title+"</a></li>");
            })
        }, "json");
        //获取分类编号是9的数据
        var obj = new Object();
        obj.cid = 9;
        obj.num = 8;
        obj.action = "getListBycid";
        $.post("${path}/articleServlet", obj, function (data) {

            $(data).each(function (o) {
                $("#cate3").append("<li><a href=\"${path}/articleServlet?id="+this.id+"&action=view&backPage=info.jsp\"><span>"+this.createdtime+"</span>"+this.title+"</a></li>");
            })
        }, "json");
    });
</script>
</html>
