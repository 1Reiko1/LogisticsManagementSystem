package com.soft.cms.servlet;

import com.soft.cms.dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/ChangeStateServlet")
public class ChangeStateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        // 获取请求参数
        String oid=request.getParameter("oid");
        System.out.println("接收到的信息" + oid);
        if(oid!=null){
            OrderDAO dao=new OrderDAO();
            if(dao.updateOrderState(oid,"已完成")){
                System.out.println("ok");
                response.sendRedirect("userordermanager.jsp");
                out.write(" alert('签收成功！');");
            }else{
                System.out.println("no");
            }
        }
        //out.write("签收成功");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       this.doPost(request,response);
    }
}
