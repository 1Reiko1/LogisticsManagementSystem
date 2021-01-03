<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>物流管理系统</title>
    <link rel="stylesheet" href="css/bootstrap.css" />

    <script type="text/javascript" src="js/jquery1.9.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
        body{ background:#0066A8 url(http://member.wtbds.com/images/Login_bg.jpg) no-repeat center 0px;}
        .tit{ margin:auto; margin-top:170px; text-align:center; width:350px; padding-bottom:20px;}
        .login-wrap{ width:220px; padding:30px 50px 0 330px; height:220px; background:#fff url(img/20150212154319.jpg) no-repeat 30px 40px; margin:auto; overflow: hidden;position: relative;}
        .copyright{ margin:auto; margin-top:10px; text-align:center; width:370px; color:#CCC}
        .login-register{
            bottom: -20px;
            position: absolute;
        }
        .login-register td{
            display: block;
            width: 100%;
        }
        .return{
            margin-left: 45px !important;
            display: inline-block;
            text-decoration: none !important;
        }
        @media (max-height: 700px) {.tit{ margin:auto; margin-top:100px; }}
        @media (max-height: 500px) {.tit{ margin:auto; margin-top:50px; }}
    </style>
    <script type="text/javascript">
        function validate() {
            var name = document.getElementById("name");
            var password = document.getElementById("password");
            var pattern = /^([a-zA-Z0-9_-])/;

            if (name.value == "") {
                alert("用户名不能为空！");
                name.focus();
                return false;
            } else if (!pattern.test(name.value)) {
                alert("请输入正确的格式！");
                name.focus();
                return false;
            }
            if (password.value == "") {
                alert("密码不能为空！");
                password.focus();
                return false;
            } else if (password.length&lt;6 || password.length>12) {
                alert("密码长度不符合要求，请输入6-12位密码!");
                password.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="tit"><img src="img/tit.png" alt="" /></div>
<div class="login-wrap">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <div class="modal-body">
            <div class="col-sm-12">
                <form action="RegisterServlet"  method="post"
                      onsubmit="return validate();">
                    <div>
                        <label class="control-label col-sm-3">用户名：&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input type="text" name="name" id="name"/>
                    </div>
                    <div>
                        <label class="control-label col-sm-3">密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input type="password" name="password" id="password"/>
                    </div>
                    <div>
                        <label class="control-label col-sm-3">密码确认：</label>
                        <input type="password" name="password1" id="password1"/>
                    </div>
                    <tr class="login-register">
                        <td height="60" valign="bottom">
                            <button type="submit" class="btn btn-primary">注册</button>
                            <a href="index.jsp" class="return">返回首页</a>
                        </td>
                    </tr>
                </form>
        </div>
</div>
    </table>
</div>

<div class="copyright">建议使用IE8以上版本或谷歌浏览器</div>

</body>
</html>
