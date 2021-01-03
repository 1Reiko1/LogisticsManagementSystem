package com.soft.cms.servlet;

import com.soft.cms.dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns= "/DelOrderServlet")
public class DelOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //通过response对象给客户端一个错误提示
        PrintWriter writer = response.getWriter();
        String id=request.getParameter("id");
        OrderDAO dao=new OrderDAO();
        if(dao.delOrder(Integer.parseInt(id))){
            response.sendRedirect("ordermanager.jsp");
        }else{
            writer.write( "alert('执行失败！');");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
