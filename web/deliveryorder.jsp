<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.soft.cms.dao.OrderDAO" %>
<%@ page import="com.soft.cms.entity.Order" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 获得请求的绝对地址
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%
    OrderDAO dao = new OrderDAO();
    String name=(String)session.getAttribute("username");
    ArrayList<Order> uolist = dao.getUserOrder(name);
    if(uolist!=null){
        //将list存储到作用域中
        pageContext.setAttribute("uolist",uolist);
    }
%>
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
</head>
<script type="text/javascript">
    $.post("UpdateStateServlet",function () {
        //alert("更新操作");
        //response.sendRedirect("userordermanager.jsp");
    });
</script>
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

<script type="text/javascript">

</script>
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
            <div class="collapsed">
                <span>用户订单信息管理</span>
                <a href="userordermanager.jsp">管理用户订单信息</a>
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
                <a href="#">首页</a> <span class="divider">/</span>
                <a href="#">订单信息</a> <span class="divider">/</span>
            </ul>
            <div class="title_right"><strong>用户订单信息</strong></div>
            <div style="width:900px; margin:auto">
                <table class="table table-bordered table-hover table-striped">
                    <tr align="center">
                        <td><strong>编号</strong></td>
                        <td><strong>订单编号</strong></td>
                        <td><strong>货物名称</strong></td>
                        <td><strong>寄件人</strong></td>
                        <td><strong>寄件人电话</strong></td>
                        <td><strong>寄件人地址</strong></td>
                        <td><strong>收件人</strong></td>
                        <td><strong>收件人电话</strong></td>
                        <td><strong>收件人地址</strong></td>
                        <td><strong>订单状态</strong></td>
                        <td><strong>下单时间</strong></td>
                    </tr>
                    <c:forEach items="${uolist}" var="uo" >
                        <tr align="center">
                            <td>${uo.id}</td>
                            <td>${uo.oid}</td>
                            <td>${uo.goods}</td>
                            <td>${uo.sender}</td>
                            <td>${uo.sender_phone}</td>
                            <td>${uo.sender_address}</td>
                            <td>${uo.recipients}</td>
                            <td>${uo.recipients_phone}</td>
                            <td>${uo.recipients_address}</td>
                            <td>${uo.state}</td>
                            <td>${uo.time}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- 底部 -->

</body>
</html>
