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

@WebServlet(urlPatterns = "/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 获取请求参数
        String oid=request.getParameter("add_oid");
        String goods = request.getParameter("add_goods");
        String sender = request.getParameter("add_sender");
        String sender_phone = request.getParameter("add_sphone");
        String sender_address = request.getParameter("add_saddress");
        String recipient = request.getParameter("add_recipient");
        String recipient_phone = request.getParameter("add_rphone");
        String recipient_address = request.getParameter("add_raddress");
        String state=request.getParameter("add_state");
        Order o=new Order();
        o.setOid(oid);
        o.setGoods(goods);
        o.setSender(sender);
        o.setSender_phone(sender_phone);
        o.setSender_address(sender_address);
        o.setRecipients(recipient);
        o.setRecipients_phone(recipient_phone);
        o.setRecipients_address(recipient_address);
        o.setState(state);
        OrderDAO dao=new OrderDAO();
        if(dao.isAddOrder(o)){
            System.out.println("ok");
            response.sendRedirect("ordermanager.jsp");
        }else{
            //订单失败就返回订单信息页面 请求转发
            RequestDispatcher dispatcher = request.getRequestDispatcher("订单信息.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request, response);
    }
}
