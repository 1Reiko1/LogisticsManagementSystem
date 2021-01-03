<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.soft.cms.entity.Comment" %>
<%@ page import="com.soft.cms.dao.CommentDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 获得请求的绝对地址
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%
    CommentDAO dao = new CommentDAO();
    String name=(String)session.getAttribute("username");
    ArrayList<Comment> clist = dao.getUsernameComment(name);
    //将list存储到作用域中
    pageContext.setAttribute("clist",clist);
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
                <a href="#">首页</a> <span class="divider">/</span>
                <a href="#">评论信息</a> <span class="divider">/</span>
            </ul>
            <div class="title_right"><strong>用户评论信息</strong></div>
            <div style="width:900px; margin:auto">
                <table  class="margin-bottom-20 table  no-border" >
                    <tr>
                        <td class="text-center">
                            <input type="button" value="评论" class="btn btn-info " style="width:80px;float:left;margin-left:-5px;" data-toggle="modal" data-target="#myModal"/>
                        </td>
                    </tr>
                </table>
                ${username}
                <table class="table table-bordered table-hover table-striped">
                    <tr align="center">
                        <td><strong>编号</strong></td>
                        <td><strong>内容</strong></td>
                        <td><strong>日期</strong></td>
                    </tr>
                    <c:forEach items="${clist}" var="cl" >
                        <tr align="center">
                            <td>${cl.id}</td>
                            <td>${cl.content}</td>
                            <td>${cl.c_time}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- 底部 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">用户评论信息</h4>
            </div>
            <form action="/LogisticsManagementSystem/AddCommentServlet" method="post" class="form">
                <div class="modal-body">
                    <div class="col-sm-12">
                        <div>
                            <label class="control-label col-sm-3">名字：</label>
                            <input name="name" class="form-control margin-left-10 col-sm-6"/>
                        </div>
                        <div>
                            <label class="control-label col-sm-3">内容：</label>
                            <textarea cols="50" rows="3" align="center" name="str" class="form-control margin-left-10 col-sm-6"></textarea>
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
</body>
</html>
