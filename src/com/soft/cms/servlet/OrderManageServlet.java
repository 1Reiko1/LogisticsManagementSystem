package com.soft.cms.servlet;

import com.soft.cms.dao.OrderDAO;
import com.soft.cms.dao.VehicleDAO;
import com.soft.cms.entity.Vehicle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(urlPatterns = "/OrderManageServlet")
public class OrderManageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //通过response对象给客户端一个错误提示
        PrintWriter writer = response.getWriter();
        // 获取请求参数
        String did=request.getParameter("f_did");
        String oid=request.getParameter("f_oid");
        String company=request.getParameter("f_company");
        String d_name=request.getParameter("f_driver");
        String d_phone=request.getParameter("f_phone");
        String needday=request.getParameter("f_needday");
        String state=request.getParameter("f_state");
        Vehicle v=new Vehicle();
        v.setDid(did);
        v.setOid(oid);
        v.setCompany(company);
        v.setD_name(d_name);
        v.setD_phone(d_phone);
        v.setNeedday(Integer.parseInt(needday));
        v.setV_state(state);
        VehicleDAO dao=new VehicleDAO();
        if(dao.isAddVehicle(v)){
            System.out.println("添加成功");
            OrderDAO d=new OrderDAO();
            if(d.updateOrderState(oid,state)){
                System.out.println("订单状态更新成功");
            }
            response.sendRedirect("ordermanager.jsp");
        }else{
            writer.write("alert('执行失败！');");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
