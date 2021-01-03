<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.soft.cms.dao.OrderDAO" %>
<%@ page import="com.soft.cms.entity.Order" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 获得请求的绝对地址
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%
    OrderDAO dao = new OrderDAO();
    ArrayList<Order> olist = dao.getAllOrder();
    if(olist!=null){
        //将olist存储到作用域中
        pageContext.setAttribute("olist",olist);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>物流管理系统</title>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/css.css" />
    <script type="text/javascript" src="js/jquery1.9.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/sdmenu.js"></script>
<%--    <script type="text/javascript" src="js/laydate/laydate.js"></script>--%>
    <style>
        .select{
            padding: 0px;
        }
        .form label{
            display: inline-block;
            margin: 5px 20px;
        }
    </style>
</head>

<body>
<div class="header">
    <div class="logo"><img  src="img/logo.png" /></div>

    <div class="header-right">
        <i class="icon-user icon-white"></i> <a href="#">管理员</a><i class="icon-off icon-white"></i><a href="LogoutServlet">退出</a>
    </div>
</div>
<!-- 顶部 -->

<div id="middle">
    <div class="left">

        <script type="text/javascript">
            var myMenu;
            window.onload = function() {
                myMenu = new SDMenu("my_menu");
                myMenu.init();
            };
        </script>

        <div id="my_menu" class="sdmenu">
            <div >
                <span>分类信息</span>
                <a href="用户信息.jsp">用户信息</a>
                <a href="订单信息.jsp">订单信息</a>
            </div>
            <div >
                <span>物流信息</span>
                <a href="车辆信息.jsp">车辆信息</a>
            </div>
            <div class="collapsed">
                <span>订单信息管理</span>
                <a href="ordermanager.jsp">管理订单信息</a>
            </div>
        </div>
    </div>
    <div class="Switch"></div>
    <script type="text/javascript">
        $(document).ready(function(e) {
            $(".Switch").click(function(){
                $(".left").toggle();

            });
        });
    </script>
    <script type="text/javascript">
        $.post("UpdateStateServlet",function () {
            //alert("更新操作");
            //response.sendRedirect("userordermanager.jsp");
        });
    </script>
<%--    <script type="text/javascript">--%>
<%--        // 当页面加载完毕触发的方法--%>
<%--        function getoid() {--%>
<%--            //var id=document.getElementById(id);--%>
<%--            // var id=$("td[name=id]").val();--%>
<%--            $.ajax({--%>
<%--                url: "${pageContext.request.contextPath}/ChangeStateServlet",--%>
<%--                type: "get",//请求方式--%>
<%--                data: {oid: $("#oid").val()}, // 发送数据--%>
<%--                dataType: "json", // 如果Servlet指定了MIME类型则不需要该参数--%>
<%--                success: function (data) {// data是Servlet写出来的数据--%>
<%--                    $.messager.alert('信息','模板保存成功');--%>
<%--                }--%>
<%--            });--%>
<%--        }--%>
<%--    </script>--%>
    <script type="text/javascript">
        $(function () {
            $("#choose").click(function () {
                // alert("11111");
                var name=document.getElementById('select').value;
                var url = "${pageContext.request.contextPath}/QueOrderServlet?";
                location.href=url+"name="+name;
            });
        });
    </script>
    <div class="right"  id="mainFrame">
        <div class="right_cont">
            <ul class="breadcrumb">当前位置：
                <a href="#">首页</a> <span class="divider">/</span>
                <a href="#">订单信息</a> <span class="divider">/</span>
            </ul>

            <div class="title_right"><strong>订单信息</strong></div>
            <div style="width:900px; margin:auto"></div>
                <table class="table table-bordered">
                    <tr>
                        <td>
                            <input type="text" name="name"  id="select" placeholder="请输入用户名" class="span1-1" />
                            <a id="choose"> <input  value="查询"  class="btn btn-info " style="width:80px;" /></a>
                        </td>
                    </tr>
                </table>
                <table  class="margin-bottom-20 table  no-border" >
                    <tr>
                        <td class="text-center">
                            <input type="button" value="添加" class="btn btn-info " style="width:80px;float:left;margin-left:-5px;" data-toggle="modal" data-target="#myModal"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">
                            <input type="button" value="修改" class="btn btn-info " style="width:80px;float:left;margin-left:-5px;" data-toggle="modal" data-target="#myModal1"/>
                        </td>
                    </tr>
                </table>
                <table class="table table-bordered table-hover table-striped">
                    <tbody>
                    <tr align="center">
                        <td><strong>编号</strong></td>
                        <td><strong>订单号</strong></td>
                        <td><strong>货物名称</strong></td>
                        <td><strong>寄件人</strong></td>
                        <td><strong>寄件人电话</strong></td>
                        <td><strong>寄件人地址</strong></td>
                        <td><strong>收件人</strong></td>
                        <td><strong>收件人电话</strong></td>
                        <td><strong>收件人地址</strong></td>
                        <td><strong>订单状态</strong></td>
                        <td><strong>下单时间</strong></td>
                        <td><strong>处理操作</strong></td>
                        <td><strong>删除</strong></td>
                    </tr>
                    <c:forEach items="${olist}" var="oo">
                        <tr align="center">
                            <td>${oo.id}</td>
                            <td>${oo.oid}</td>
                            <td>${oo.goods}</td>
                            <td>${oo.sender}</td>
                            <td>${oo.sender_phone}</td>
                            <td>${oo.sender_address}</td>
                            <td>${oo.recipients}</td>
                            <td>${oo.recipients_phone}</td>
                            <td>${oo.recipients_address}</td>
                            <td>${oo.state}</td>
                            <td>${oo.time}</td>
<%--                            MyDataGrid是DataGrid的ID，_ctl03是DataGridItem的ID，lbtnV1是这个linkbutton的ID
javascript:__doPostBack('DataGrid1$ctl03$LinkButton1','')
--%>
                            <td><a  href="" data-toggle="modal"  data-target="#myModal5">分配</a></td>
                            <td><a href="${pageContext.request.contextPath}/DelOrderServlet?id=${oo.id}"  value="删除" id="del" >删除</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    <script type="text/javascript">
        $(function () {
            $("#del").click(function () {
                alert("删除操作");

            })
        });
    </script>

<%--        底部对话框--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加订单信息</h4>
                </div>
                <form action="/LogisticsManagementSystem/AddOrderServlet" method="post" class="form">
                    <div class="modal-body">
                        <div class="col-sm-12">
                            <div>
                                <label class="control-label col-sm-3">订单号：&nbsp;</label>
                                <input type="text" name="add_oid" class="form-control margin-left-10 col-sm-6" />
                            </div>
                            <div>
                                <label class="control-label col-sm-3">货物名称：&nbsp;</label>
                                <input type="text" name="add_goods" class="form-control margin-left-10 col-sm-6" />
                            </div>
                            <div>
                                <label class="control-label col-sm-3">寄件人：&nbsp;&nbsp;</label>
                                <input type="text" name="add_sender" class="form-control margin-left-10 col-sm-6" />
                            </div>
                            <div>
                                <label class="control-label col-sm-3">寄件人电话：</label>
                                <input type="text" name="add_sphone" class="form-control margin-left-10 col-sm-6" />
                            </div>
                            <div>
                                <label class="control-label col-sm-3">寄件人地址：</label>
                                <input type="text" name="add_saddress" class="form-control margin-left-10 col-sm-6" />
                            </div>
                            <div>
                                <label class="control-label col-sm-3">收件人：&nbsp;&nbsp;</label>
                                <input type="text" name="add_recipient" class="form-control margin-left-10 col-sm-6" />
                            </div>
                            <div>
                                <label class="control-label col-sm-3">收件人电话：</label>
                                <input type="text" name="add_rphone" class="form-control margin-left-10 col-sm-6" />
                            </div>
                            <div>
                                <label class="control-label col-sm-3">收件人地址：</label>
                                <input type="text" name="add_raddress" class="form-control margin-left-10 col-sm-6" />
                            </div>
                            <div>
                                <label class="control-label col-sm-3">订单状态：</label>
                                <input type="text" name="add_state" class="form-control margin-left-10 col-sm-6" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">提交</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<div class="modal fade" id="myModal5" tabindex="-1"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel5">订单处理（前提：订单号必须存在）</h4>
            </div>
            <form action="/LogisticsManagementSystem/OrderManageServlet" method="post" class="form">
            <div class="modal-body">
                <div class="col-sm-12">
                        <div>
                            <label class="control-label col-sm-3">运输号：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="text" name="f_did" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">订单号：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="text" name="f_oid" class="form-control margin-left-10 col-sm-6"/>
                        </div>

                        <div>
                            <label class="control-label col-sm-3">快递公司：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="text" name="f_company" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">运货员：&nbsp;</label>
                            <input type="text" name="f_driver" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">联系电话：&nbsp;</label>
                            <input type="text" name="f_phone" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">预计使用天数：&nbsp;</label>
                            <input type="text" name="f_needday" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">状态：&nbsp;</label>
                            <input type="text" name="f_state" class="form-control margin-left-10 col-sm-6" />
                        </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">提交</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
           </form>
        </div>
    </div>
</div>

    <div class="modal fade" id="myModal3" tabindex="-1"  role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel3">查询订单信息</h4>
                </div>
                <form action="/LogisticsManagementSystem/QueOrderServlet" method="post" class="form">
                    <div class="modal-body">
                        <div class="col-sm-12">
                            <div>
                                <label class="control-label col-sm-3">请输入你要查询的用户：</label>
                                <input type="text" name="username" class="form-control margin-left-10 col-sm-6" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">确定</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<div class="modal fade" id="myModal2"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">删除订单信息</h4>
            </div>
            <form action="/LogisticsManagementSystem/DelOrderServlet" method="post" class="form">
                <div class="modal-body">
                    <div class="col-sm-12">
                        <div>
                            <label class="control-label col-sm-3">请输入你要删除的订单编号？</label>
                            <input type="text" name="no" class="form-control margin-left-10 col-sm-6" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">修改订单信息</h4>
            </div>
            <form action="/LogisticsManagementSystem/ModOrderServlet" method="post" class="form">
            <div class="modal-body">
                <div class="col-sm-12">
                        <div>
                            <label class="control-label col-sm-3">运输号：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="text" name="m_did" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">订单号：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="text"  name="m_oid" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">快递公司：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="text"  name="m_company" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">运货员：&nbsp;</label>
                            <input type="text"  name="m_dname" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">联系电话：&nbsp;</label>
                            <input type="text"  name="m_dphone" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">使用天数：&nbsp;</label>
                            <input type="text"  name="m_needday" class="form-control margin-left-10 col-sm-6" />
                        </div>
                        <div>
                            <label class="control-label col-sm-3">运输状态：&nbsp;</label>
                            <input type="text"  name="m_state" class="form-control margin-left-10 col-sm-6" />
                        </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">提交</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
