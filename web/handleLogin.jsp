<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.soft.cms.entity.User" %>
<%@ page import = "com.soft.cms.dao.UserDAO" %>
<%@ page import = "com.soft.cms.entity.Manager" %>
<%@ page import = "com.soft.cms.dao.ManagerDAO" %>
<%@ page import="javax.swing.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录处理</title>
  </head>
  <body>
  	
    <%
    			request.setCharacterEncoding("utf-8");
    			String userName = request.getParameter("username");
            	String password = request.getParameter("password");

            	if(userName==null|| password==null){
					JOptionPane.showMessageDialog(null, "用户名或密码不能为空", "温馨提示", JOptionPane.ERROR_MESSAGE);
          			//out.println("<script language=\"JavaScript\">alert(\"用户名或密码不能为空！\")</script>");
					response.sendRedirect("login.jsp");
            	}
            	else{
					if(request.getParameter("status").equals("0")){  //用户登录
						UserDAO userDao = new UserDAO();
        	    	    User user = userDao.getUserByUsername(userName);
        	    	    if(user!=null){
							//将登录用户对象保存到session
							request.getSession().setAttribute("SESSION_USER",user);
        	    		    if(userName.equals(user.getUsername())&&password.equals(user.getPassword())) {
								session.setAttribute("loginSuccess", "true");
								session.setAttribute("username", userName);
								response.sendRedirect("index1.jsp");
							}else{
        	    		    	if(userName.equals(user.getUsername())){
									JOptionPane.showMessageDialog(null, "用户名或密码错误", "温馨提示", JOptionPane.ERROR_MESSAGE);
									response.sendRedirect("login.jsp");
								}
							}
						}else{
							//out.println("<script language=\"JavaScript\">alert(\"该用户不存在！\")</script>");
							JOptionPane.showMessageDialog(null, "该用户不存在！！请先注册", "温馨提示", JOptionPane.ERROR_MESSAGE);
							response.sendRedirect("register.jsp");
						}
					}else{ //管理员登录
						ManagerDAO dao=new ManagerDAO();
						Manager m=dao.getManagerByName(userName);
						if(m!=null){
							//将登录用户对象保存到session
							request.getSession().setAttribute("SESSION_MANAGER",m);
							if(userName.equals(m.getName())&&password.equals(m.getPassword())) {
								session.setAttribute("loginSuccess", "true");
								session.setAttribute("username", userName);
								response.sendRedirect("index2.jsp");
							}else{
								if(userName.equals(m.getName())){
									JOptionPane.showMessageDialog(null, "用户名或密码错误", "温馨提示", JOptionPane.ERROR_MESSAGE);
									response.sendRedirect("login.jsp");
								}
							}
						}else{
							//out.println("<script language=\"JavaScript\">alert(\"该用户不存在！\")</script>");
							JOptionPane.showMessageDialog(null, "该用户不存在！！请先注册", "温馨提示", JOptionPane.ERROR_MESSAGE);
							response.sendRedirect("register.jsp");
						}
					}
            	}
    %>
  </body>
</html>
