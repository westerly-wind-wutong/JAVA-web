<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <div class="logo">麒麟资讯信息网</div>
    <div class="top-nav">
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="nav">
            <li><a href="index.jsp">首页</a></li>
            <li><a href="${path}/articleServlet?action=getList&backPage=list.jsp&selectCategoryId=1">最新时事</a></li>
            <li><a href="${path}/articleServlet?action=getList&backPage=list.jsp&selectCategoryId=8">娱乐新闻</a></li>
            <li><a href="${path}/articleServlet?action=getList&backPage=list.jsp&selectCategoryId=9">体育新闻</a></li>

        </ul>
    </div>
    <div class="search">
        <form action="" method="post" name="searchform" id="searchform">
            <input name="keyboard" id="keyboard" class="input_text" value="搜索你喜欢的" style="color: rgb(153, 153, 153);" onfocus="if(value=='搜索你喜欢的'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='搜索你喜欢的'}" type="text">
            <input name="Submit" class="input_submit" value="" type="submit">
        </form>
    </div>
</header>