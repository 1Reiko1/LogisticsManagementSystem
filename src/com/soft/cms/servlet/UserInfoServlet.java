package com.soft.cms.servlet;

import com.soft.cms.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/UserInfoServlet")
public class UserInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //通过response对象给客户端一个错误提示
        PrintWriter writer = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String typ = request.getParameter("typ");
        String id = request.getParameter("no");
        UserDAO userDAO = new UserDAO();
        if (userDAO.isAddUser(username, password) && typ.equals(password)) {
            System.out.println("添加成功");
            response.sendRedirect("usermanager.jsp");
        } else {
            writer.write("alert('执行失败！');");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
