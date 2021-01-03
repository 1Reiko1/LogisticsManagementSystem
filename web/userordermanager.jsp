<%--
  Created by IntelliJ IDEA.
  User: lingzi
  Date: 2020/12/29/0029
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8"   %>
<%@ page import="java.util.*" %>
<%@ page import="com.soft.cms.entity.Order" %>
<%@ page import="com.soft.cms.dao.OrderDAO" %>
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
    ArrayList<Order> ulist = dao.getUserOrder(name);
    if(ulist!=null){
        //将ulist存储到作用域中
        pageContext.setAttribute("umlist",ulist);
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
    <style>
        .form label{
            display: inline-block;
            margin: 5px 20px;
        }
    </style>
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
        <i class="icon-user icon-white"></i><a href="">${sessionScope.SESSION_USER.username}</a><i class="icon-off icon-white"></i><a href="LogoutServlet">退出</a>
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
            <a href="deliveryorder.jsp">首页</a> <span class="divider">/</span>
            <a href="#">用户订单信息</a> <span class="divider">/</span>
        </ul>

        <div class="title_right"><strong>用户订单信息管理</strong></div>

        <table  class="margin-bottom-20 table  no-border" >
            <tr>
                <td class="text-center">
                    <input type="button" value="添加" class="btn btn-info " style="width:80px;float:left;margin-left:-5px;" data-toggle="modal" data-target="#myModal"/>
                </td>
            </tr>
        </table>

        <table class="table table-bordered table-hover table-striped" id="table">
            <tbody>
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
                <td><strong>处理操作</strong></td>
            </tr>
            <c:forEach items="${umlist}" var="oum" >
                <tr align="center">
                    <td>${oum.id}</td>
                    <td>${oum.oid}</td>
                    <td>${oum.goods}</td>
                    <td>${oum.sender}</td>
                    <td>${oum.sender_phone}</td>
                    <td>${oum.sender_address}</td>
                    <td>${oum.recipients}</td>
                    <td>${oum.recipients_phone}</td>
                    <td>${oum.recipients_address}</td>
                    <td>${oum.state}</td>
                    <td>${oum.time}</td>
                    <td><a href="${pageContext.request.contextPath}/ChangeStateServlet?oid=${oum.oid}"  value="签收" id="receive" >签收</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%--    <script type="text/javascript">--%>
<%--        function disp_confirm(oid) {--%>
<%--            var r = confirm("亲，您确定签收该订单吗？")--%>
<%--            if (r == true) {--%>
<%--                window.location.href="${ pageContext.request.contextPath }/ChangeStateServlet?oid="+oid+""--%>
<%--            } else {--%>
<%--            }--%>
<%--        }--%>
<%--    </script>--%>

<!-- 底部 -->
<%--   添加对话框--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">用户订单信息</h4>
            </div>
            <form action="/LogisticsManagementSystem/UserOrderServlet" method="post" class="form">
                <div class="modal-body">
                    <div class="col-sm-12">
                        <div>
                            <label class="control-label col-sm-3">订单号：&nbsp;</label>
                            <input type="text" name="o_oid" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">货物名称：&nbsp;</label>
                            <input type="text" name="o_goods" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">寄件人：&nbsp;&nbsp;</label>
                            <input type="text" name="o_sender" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">寄件人电话：</label>
                            <input type="text" name="o_sphone" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">寄件人地址：</label>
                            <input type="text" name="o_saddress" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">收件人：&nbsp;&nbsp;</label>
                            <input type="text" name="o_recipient" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">收件人电话：</label>
                            <input type="text" name="o_rphone" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">收件人地址：</label>
                            <input type="text" name="o_raddress" class="form-control margin-left-10 col-sm-6" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
    $("#receive").click(function () {
        alert("签收操作");
     });
    });
</script>
</body>
</html>