<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <!-- 设置网页的基链接地址 -->
    <base href="<%=basePath%>">
    <title>用户界面</title>
</head>

<body>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>物流管理系统</title>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/css.css" />
    <script type="text/javascript" src="js/jquery1.9.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/sdmenu.js"></script>
    <script type="text/javascript" src="js/laydate/laydate.js"></script>
    <style>
        .form label{
            display: inline-block;
            margin: 5px 20px;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="logo"><img  src="img/logo.png" /></div>
    <div class="header-right">
        <%
            if (session.getAttribute("SESSION_USER") == null) {
        %>
        <i class="icon-user icon-white"></i><a href="#">游客</a>
        <%
        } else {
        %>
        <i class="icon-user icon-white"></i><a href="">${sessionScope.SESSION_USER.username}</a><i class="icon-off icon-white"></i><a href="LogoutServlet">退出</a>
        <%
            }
        %>
    </div>
</div>

<!-- 顶部 -->
<div id="middle">
    <div class="left">

        <script type="text/javascript">
            var myMenu;
            window.onload = function() {
                myMenu = new SDMenu("my_menu");
                myMenu.init();
            };
        </script>

        <div id="my_menu" class="sdmenu">
            <div >
                <span>快递信息</span>
                <a href="deliveryorder.jsp">快递订单</a>
                <a href="comment.jsp">在线评论</a>
            </div>
        </div>

    </div>
    <div class="Switch"></div>
    <script type="text/javascript">
        $(document).ready(function(e) {
            $(".Switch").click(function(){
                $(".left").toggle();

            });
        });
    </script>

    <div class="right"  id="mainFrame">

        <div class="right_cont">
            <ul class="breadcrumb">当前位置：
                <a href="#">首页</a>
            </ul>
        </div>
    </div>
        </div>
</body>
</html>
</body>
</html>
