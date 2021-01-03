package com.soft.cms.servlet;

import com.soft.cms.dao.OrderDAO;
import com.soft.cms.entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/QueOrderServlet")
public class QueOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        // 获取请求参数
        String name=request.getParameter("name");
        System.out.println("okok"+name);
        OrderDAO dao=new OrderDAO();
        ArrayList<Order> array=dao.getUserOrder(name);
        if(array!=null){
            request.setAttribute("UserOrderList",array);
            request.getRequestDispatcher("queryorder.jsp").forward(request,response);
        }else{
            response.sendRedirect("ordermanager.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
