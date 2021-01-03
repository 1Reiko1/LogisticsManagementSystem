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
    <div>
        <span>用户评论信息</span>
        <a href="usercomment.jsp">评论信息</a>
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
  <a href="用户信息.jsp">首页</a> <span class="divider">/</span>
  <a href="#">用户信息</a> <span class="divider">/</span>
</ul>

   <div class="title_right"><strong>用户信息</strong></div>
       <div style="width:900px; margin:auto">
       <table class="table table-bordered table-hover table-striped">
         <tbody>
           <tr align="center">
             <td><strong>用户编号</strong></td>
             <td><strong>用户名</strong></td>
             <td><strong>密码</strong></td>
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
             </tr>
			<% 
				}  
			 } 
			else{
//				out.println("<h3>暂无用户！</h3>");
			out.print("alert('暂无该用户！！');");
			} 
			%>
           
         </tbody>
       </table>
       
<%--       <table  class="margin-bottom-20 table  no-border" >--%>
<%--     <tr>--%>
<%--       <td class="text-center"><input type="button" value="打印" class="btn btn-info    margin-right-20" style="width:80px;"  />--%>
<%--           <input type="button" value="数据导出" class="btn btn-info  "  style="width:80px;" /></td>--%>
<%--     </tr>--%>
<%--   </table>--%>
   </div>


     </div>     
     </div>
    </div>
    
<!-- 底部 -->

</body>
</html>
