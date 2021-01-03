<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.soft.cms.dao.VehicleDAO" %>
<%@ page import="com.soft.cms.entity.Vehicle" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 获得请求的绝对地址
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%
    VehicleDAO dao = new VehicleDAO();
    ArrayList<Vehicle> list = dao.getAllVehicle();
    if(list!=null){
        //将list存储到作用域中
        pageContext.setAttribute("list",list);
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
<body>
<div class="header">
     <div class="logo"><img  src="img/logo.png" /></div>
     
                <div class="header-right">
                    <i class="icon-user icon-white"></i> <a href="#">管理员</a><i class="icon-off icon-white"></i><a href="LogoutServlet">退出</a>
                </div>
</div>

<!-- 顶部 -->
<script type="text/javascript">
    $.post("UpdateStateServlet",function () {
        //alert("更新操作");
        //response.sendRedirect("userordermanager.jsp");
    });
</script>
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
    <div>
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
  <a href="#">首页</a> <span class="divider">/</span>
  <a href="#">运输信息</a> <span class="divider">/</span>
</ul>
   
   <div class="title_right"><strong>车辆运输信息</strong></div>
       <div style="width:900px; margin:auto">
       <table class="table table-bordered table-hover table-striped">
         <tbody>
           <tr align="center">
               <td><strong>编号</strong></td>
               <td><strong>运输号</strong></td>
               <td><strong>订单号</strong></td>
               <td><strong>快递公司</strong></td>
               <td><strong>运货员</strong></td>
               <td><strong>联系电话</strong></td>
               <td><strong>使用天数</strong></td>
               <td><strong>运输状态</strong></td>
           </tr>
           <c:forEach items="${list}" var="v" >
               <tr align="center">
                   <td>${v.id}</td>
                   <td>${v.did}</td>
                   <td>${v.oid}</td>
                   <td>${v.company}</td>
                   <td>${v.d_name}</td>
                   <td>${v.d_phone}</td>
                   <td>${v.needday}</td>
                   <td>${v.v_state}</td>
               </tr>
           </c:forEach>
         </tbody>
       </table>
   </div>
     </div>     
     </div>
    </div>
</body>
</html>
