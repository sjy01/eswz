<%--
  Created by IntelliJ IDEA.
  User: sjy
  Date: 2022/11/12
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<!doctype html>
<html lang="zh-CN">
<head>
    <!-- 必须引入国际标准字符集 -->
    <meta charset="utf-8">
    <!-- 移动设备优先-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 引入Bootstrap 中CSS 文件库-->
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <!--	  引入第三方字体图标-->
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.css">
    <!-- 引入Bootstrap Bundle，包括Papper-->
    <script src="bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js" ></script>
</head>
<body style="background: url(${pageContext.request.contextPath}/img/beijinglogin.jpg) no-repeat">
<div class="container-fluid">

    <div class="row">
        <div class="col-md-7"></div>
        <div class="col-md-3" style="margin: 100px 0px;background-color:#F5F5F5">

            <h3 class="text-center my-3">__欢迎您__</h3>
            <form action="usersLogin" method="post" id="regForm">
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon2">手机号</span>
                    <input type="text" class="form-control"  aria-label="Usernam" aria-describedby="basic-addon2" name="phonenumber" id="phonenumber">
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon3">密&nbsp&nbsp&nbsp码</span>
                    <input type="password" class="form-control"  aria-label="Username" aria-describedby="basic-addon3" name="password" id="password" autocomplete="off">
                    <i class="fa fa-eye mb-3 my-3 mx-3" id="eye"></i>

                </div>
<%--                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon6">管理员</span>--%>
<%--                    <input type="radio" name="administrators" value="true"  class="mx-3"/>是--%>
<%--                    <input type="radio" name="administrators" value="false" checked class="mx-3"/>否--%>
<%--                </div>--%>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon6">管理员</span>
                <div class="form-check form-check-inline mx-5 my-2">
                    <input class="form-check-input" type="radio" name="administrators" id="inlineRadio1" value="true">
                    <label class="form-check-label" for="inlineRadio1">是</label>
                </div>
                <div class="form-check form-check-inline mx-5 my-2">
                    <input class="form-check-input" type="radio" name="administrators" id="inlineRadio2" value="false" checked>
                    <label class="form-check-label" for="inlineRadio2">否</label>
                </div>
                </div>
                <div class="text-center my-3">
                    <button class="btn btn-primary" type="submit" id="subId">登录</button>
                </div>
            </form>
            <div class="row my-3">
                <div class="col-md-4">
                    <a href="index" class="link-dark mx-3 text-decoration-none">返回首页</a>
                </div>
                <div class="col-md-4">

                </div>
                <div class="col-md-4">
                    <a href="toUserRegister" class="link-dark mx-3  text-decoration-none">去注册</a>
                </div>
            </div>
        </div>
        </div>

        <div class="col-md-2"></div>
    </div>

</div>
<!--    发布结束-->
<!--    底部开始-->

<div class="fixed-bottom">

    <div class="row p-3 bg-dark" style="height: 135px;">
        <div class="iconColor text-center" style="padding: 30px 0px;">
            <a href="#"><i class="fa fa-weixin me-2"></i></a> <a href="#"></a> <a href="#"><i class="fa fa-qq me-2"></i></a> <a href="#"></a>  <a href="#"><i class="fa fa-google-plus me-2"></i></a> <a href="#"></a> <a href="#"><i class="fa fa-github me-2"></i></a> <a href="#"></a> <a href="#"><i class="fa fa-twitter"></i></a>
        </div>
        <div><li class="text-center p-2 text-white">Copyright © 2022.盛家愈</li></div>
    </div>

</div>


<!--    底部结束-->

</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery3.6.js"></script>
<script type="text/javascript">
    var inputs=document.getElementsByTagName('input');
    inputs.phonenumber.onblur = function() {
        var phonenumber = $("input[name='phonenumber']").val()
        $.ajax({
            type:'POST',
            url:'usersLogin',
            data:{phonenumber:phonenumber},
            success:function (){

            }
        })

    }
    $("#subId").click(function(){
        //获取用户输入的用户名
        var phonenumber = $("#phonenumber").val();
        //判断用户名是否为空
        if(phonenumber == ""){
            alert("手机号不能为空");
            //取消默认行为
            return false;
        }
        //获取用户输入的密码用户名
        var password = $("#password").val();
        //判断密码是否为空
        if(password == ""){
            alert("密码不能为空");
            //取消默认行为
            return false;
        }
    });
    //密码显示
    let eye = document.getElementById('eye');
    let pwd= document.getElementById('password');

    // 2.注册事件 处理程序
    let flag = 0;
    eye.onclick = function() {
        // 点击一次之后，flag一定要变化
        if (flag == 0) {
            pwd.type = 'text';
            flag = 1; //赋值操作
        } else {
            pwd.type = 'password';
            flag = 0;
        }
    }
</script>
</body>
</html>
