<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 获得请求的绝对地址
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
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
    <%--    <script type="text/javascript" src="js/laydate/laydate.js"></script>--%>
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
        <i class="icon-user icon-white"></i> <a href="#">管理员</a><i class="icon-off icon-white"></i><a href="LogoutServlet">退出</a>
    </div>
</div>
<!-- 顶部 -->

<div id="middle">
    <div class="right"  id="mainFrame">
        <div class="right_cont">
            <ul class="breadcrumb">当前位置：
                <a href="ordermanager.jsp">返回</a> <span class="divider">/</span>
                <a href="#">订单信息</a> <span class="divider">/</span>
            </ul>

            <div class="title_right"><strong>订单信息</strong></div>
            <div style="width:900px; margin:auto"></div>

            <table class="table table-bordered table-hover table-striped">
                <tbody>
                <tr align="center">
                    <td><strong>编号</strong></td>
                    <td><strong>订单号</strong></td>
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
                <c:forEach items="${requestScope.UserOrderList}" var="oo">
                    <tr align="center">
                        <td>${oo.id}</td>
                        <td>${oo.oid}</td>
                        <td>${oo.goods}</td>
                        <td>${oo.sender}</td>
                        <td>${oo.sender_phone}</td>
                        <td>${oo.sender_address}</td>
                        <td>${oo.recipients}</td>
                        <td>${oo.recipients_phone}</td>
                        <td>${oo.recipients_address}</td>
                        <td>${oo.state}</td>
                        <td>${oo.time}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
