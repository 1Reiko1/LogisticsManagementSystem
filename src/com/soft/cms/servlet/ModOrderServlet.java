package com.soft.cms.servlet;

import com.soft.cms.dao.OrderDAO;
import com.soft.cms.entity.Order;
import com.soft.cms.entity.Vehicle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/ModOrderServlet")
public class ModOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //通过response对象给客户端一个错误提示
        PrintWriter writer = response.getWriter();
        String did=request.getParameter("m_did");
        String oid=request.getParameter("m_oid");//订单号不能被修改
        String company=request.getParameter("m_company");
        String dname=request.getParameter("m_dname");
        String dphone=request.getParameter("m_dphone");
        String needday=request.getParameter("m_needday");
        String state=request.getParameter("m_state");
        Vehicle v=new Vehicle();
        v.setDid(did);
        v.setCompany(company);
        v.setD_name(dname);
        v.setD_phone(dphone);
        v.setNeedday(Integer.parseInt(needday));
        v.setV_state(state);
        OrderDAO dao=new OrderDAO();
        if(dao.updateOrderInfo(v,oid)){
            System.out.println("修改成功");
            response.sendRedirect("ordermanager.jsp");
        }else {
            writer.write( "alert('执行失败！');");
            response.sendRedirect("ordermanager.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
