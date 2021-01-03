package com.soft.cms.servlet;

import com.soft.cms.dao.OrderDAO;
import com.soft.cms.entity.Order;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns  = "/UserOrderServlet")
public class UserOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 获取请求参数
        String oid=request.getParameter("o_oid");
        String goods = request.getParameter("o_goods");
        String sender = request.getParameter("o_sender");
        String sender_phone = request.getParameter("o_sphone");
        String sender_address = request.getParameter("o_saddress");
        String recipient = request.getParameter("o_recipient");
        String recipient_phone = request.getParameter("o_rphone");
        String recipient_address = request.getParameter("o_raddress");
        Order o=new Order();
        o.setOid(oid);
        o.setGoods(goods);
        o.setSender(sender);
        o.setSender_phone(sender_phone);
        o.setSender_address(sender_address);
        o.setRecipients(recipient);
        o.setRecipients_phone(recipient_phone);
        o.setRecipients_address(recipient_address);
        o.setState("未装车");
        OrderDAO dao=new OrderDAO();
        if(dao.isAddOrder(o)){
            System.out.println("ok");
            response.sendRedirect("userordermanager.jsp");
        }else{
            //订单失败就返回快递订单页面 请求转发
            RequestDispatcher dispatcher = request.getRequestDispatcher("deliveryorder.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}