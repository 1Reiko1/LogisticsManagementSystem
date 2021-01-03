package com.soft.cms.servlet;

import com.soft.cms.dao.CommentDAO;
import com.soft.cms.entity.Comment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/UserCommentServlet")
public class UserCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        // 获取请求参数
        String id=request.getParameter("id");

        CommentDAO dao=new CommentDAO();
        if(dao.delComment(Integer.parseInt(id))){
            System.out.println("ok");
            out.write("删除成功");
            response.sendRedirect("usercomment.jsp");
        }else{
            System.out.println("no");
            out.write("删除失败");
            response.sendRedirect("usercomment.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}