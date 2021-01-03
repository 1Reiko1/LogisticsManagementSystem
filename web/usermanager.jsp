<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"   %>
<%@ page import="com.soft.cms.entity.User" %>
<%@ page import="com.soft.cms.dao.UserDAO" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  .select{
    padding: 0px;
  }
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
            <div >
                <span>物流信息</span>
                <a href="车辆信息.jsp">车辆信息</a>
            </div>
            <div class="collapsed">
                <span>用户信息管理</span>
                <a href="usermanager.jsp">管理用户信息</a>
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
                <a href="#">用户信息</a> <span class="divider">/</span>
            </ul>

            <div class="title_right"><strong>用户信息管理</strong></div>
            <table  class="margin-bottom-20 table  no-border" >
                <tr>
                    <td class="text-center">
                        <input type="button" value="添加" class="btn btn-info " style="width:80px;float:left;margin-left:-5px;" data-toggle="modal" data-target="#myModal"/>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">
                        <input type="button" value="删除" class="btn btn-info " style="width:80px;float:left;margin-left:-5px;" data-toggle="modal" data-target="#myModal1"/>
                    </td>
                </tr>
            </table>
            <table class="table table-bordered table-hover table-striped">
                <tbody>
                <tr align="center">
                    <td><strong>用户编号</strong></td>
                    <td><strong>用户名</strong></td>
                    <td><strong>密码</strong></td>
                    <td><strong>注册时间</strong></td>
                </tr>
                <%
                    UserDAO userDao = new UserDAO();
                    ArrayList<User> list = userDao.getAllUser();
                    if(list!=null&&list.size()>0){
                        for(int i=0;i<=list.size()-1;i++){
                            User tempNews = list.get(i);
                %>
                <tr align="center">
                    <td><%=tempNews.getId() %></td>
                    <td><%=tempNews.getUsername() %></td>
                    <td><%=tempNews.getPassword() %></td>
                    <td><%=tempNews.getCreatetime() %></td>
                </tr>
                <%
                        }
                    }
                    else{
                        out.println("<h3>暂无用户！</h3>");
                    }
                %>

                </tbody>
            </table>
        </div>
    </div>
    <!-- 底部 -->
   <%--   添加对话框--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">用户信息</h4>
                </div>

                <form action="/LogisticsManagementSystem/UserInfoServlet" method="post" class="form">
                    <div class="modal-body">
                        <div class="col-sm-12">
                            <input type="hidden" name="x" value="2">
                            <div>
                                <label class="control-label col-sm-3">用户名：&nbsp;&nbsp;&nbsp;</label>
                                <input type="text" name="username" class="form-control margin-left-10 col-sm-6" />
                            </div>
                            <div>
                                <label class="control-label col-sm-3">密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <input type="password" name="password" class="form-control margin-left-10 col-sm-6" />
                            </div>
                            <div>
                                <label class="control-label col-sm-3">重新输入：</label>
                                <input type="password" name="typ" class="form-control margin-left-10 col-sm-6" />
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
<%--  删除对话框--%>
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">用户信息</h4>
            </div>

            <form action="/LogisticsManagementSystem/DelUserServlet" method="post" class="form">
                <div class="modal-body">
                    <div class="col-sm-12">
                        <div>
                            <label class="control-label col-sm-3">请输入你要删除的用户编号：&nbsp;&nbsp;&nbsp;</label>
                            <input type="text" name="no" class="form-control margin-left-10 col-sm-6" />
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
