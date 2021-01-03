<%@ page import="com.soft.cms.entity.Comment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.soft.cms.dao.CommentDAO" %><%--
  Created by IntelliJ IDEA.
  User: lingzi
  Date: 2020/12/29/0029
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 获得请求的绝对地址
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%
    CommentDAO dao=new CommentDAO();
    ArrayList<Comment> list=dao.getAllComment();
    request.setAttribute("CommentList",list);
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

<body>
<div class="header">
    <div class="logo"><img  src="img/logo.png" /></div>
    <div class="header-right">
        <i class="icon-user icon-white"></i><a href="">管理员</a><i class="icon-off icon-white"></i><a href="LogoutServlet">退出</a>
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
                <span>分类信息</span>
                <a href="用户信息.jsp">用户信息</a>
                <a href="订单信息.jsp">订单信息</a>
            </div>
            <div>
                <span>物流信息</span>
                <a href="车辆信息.jsp">运输信息</a>
            </div>
            <div  class="collapsed">
                <span>用户评论信息</span>
                <a href="usercomment.jsp">评论信息</a>
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
                <a href="#">用户评论信息</a> <span class="divider">/</span>
            </ul>

            <div class="title_right"><strong>用户评论信息</strong></div>
            <table  class="margin-bottom-20 table  no-border" >
                <tr>
                    <td class="text-center">
                        <input type="button" value="删除" class="btn btn-info " style="width:80px;float:left;margin-left:-5px;" data-toggle="modal" data-target="#myModal"/>
                    </td>
                </tr>
            </table>
            <table class="table table-bordered table-hover table-striped" id="table">
                <tbody>
                <tr align="center">
                    <td><strong>编号</strong></td>
                    <td><strong>发布人：</strong></td>
                    <td><strong>内容</strong></td>
                    <td><strong>日期</strong></td>
                </tr>
                <c:forEach items="${CommentList}" var="comment" >
                    <tr align="center">
                        <td>${comment.id}</td>
                        <td>${comment.username}</td>
                        <td>${comment.content}</td>
                        <td>${comment.c_time}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 底部 -->
    <%--   删除对话框--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">用户评论信息</h4>
                </div>
                <form action="/LogisticsManagementSystem/UserCommentServlet" method="post" class="form">
                    <div class="modal-body">
                        <div class="col-sm-12">
                            <div>
                                <label class="control-label col-sm-3">请输入你要删除的编号：</label>
                                <input type="text" name="id" class="form-control margin-left-10 col-sm-6"/>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" >提交</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>