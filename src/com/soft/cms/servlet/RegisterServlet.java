package com.soft.cms.servlet;
import com.soft.cms.dao.UserDAO;
import com.soft.cms.entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns  = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 获取请求参数
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        // 判断用户是否已被注册
        User user = new User();
        //保存到数据库 UserDAO
        UserDAO dao=new UserDAO();
        //判断是否有相同的用户名
        Integer count = dao.selectUsernameCount(name);
        if (count>0){
            //数据库中已经有相同的用户
            //通过response对象给客户端一个错误提示
            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write(" alert('申请注册的用户名已经被占用！');");
            writer.write("window.location.href='register.jsp'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }else {
            //flag是否注册成功
            boolean flag = dao.isAddUser(name,password);
            if (flag) {
                //注册成功就跳转到登录页面 重定向
                response.sendRedirect("/LogisticsManagementSystem/login.jsp");
            } else {
                //注册失败就返回注册页面 请求转发
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
