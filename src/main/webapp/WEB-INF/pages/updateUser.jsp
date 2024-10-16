<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新用户</title>
</head>
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
<body style="background: url(${pageContext.request.contextPath}/img/beijinglogin.jpg) no-repeat ;background-size: 130%">
<!doctype html>
<html lang="zh-CN">

<div class="ccontainer-fluid">

<%--    <div class="row">--%>
<%--        <div class="col-md-4"></div>--%>
<%--        <div class="col-md-4">--%>
<%--            <h1 class="text-center my-3">__修改个人信息__</h1>--%>
<%--            <form id="regForm" method="post" action="updateUser" enctype="multipart/form-data">--%>
<%--                &lt;%&ndash;                隐藏域&ndash;%&gt;--%>
<%--                <input type="hidden" name="userid" value="${requestScope.userList.userid}">--%>
<%--                    <input type="hidden" name="img" value="${requestScope.userList.img}">--%>
<%--                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon1">昵称</span>--%>
<%--                    <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon1" name="username" maxlength="6"--%>
<%--                    value="${requestScope.userList.username}">--%>
<%--                </div>--%>
<%--                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon2">手机号</span>--%>
<%--                    <input type="text" class="form-control"  aria-label="Usernam" aria-describedby="basic-addon2" name="phonenumber"--%>
<%--                    value="${requestScope.userList.phonenumber}">--%>
<%--                </div>--%>
<%--                    <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon3">QQ号</span>--%>
<%--                        <input type="text" class="form-control"  aria-label="Usernam" aria-describedby="basic-addon3" name="qq"--%>
<%--                        value="${requestScope.userList.qq}">--%>
<%--                    </div>--%>
<%--                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon4">密码</span>--%>
<%--                    <input type="password" class="form-control"  aria-label="Username" aria-describedby="basic-addon4" name="password"--%>
<%--                </div>--%>
<%--                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon5">确认密码</span>--%>
<%--                    <input type="password" class="form-control"  aria-label="Username" aria-describedby="basic-addon5" name="password2">--%>
<%--                </div>--%>
<%--                    <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon6">性别</span>--%>
<%--                        <c:if test="${requestScope.userList.sex==true}">--%>
<%--                            <input type="radio" name="sex" value="true" checked class="mx-2"/>男--%>
<%--                            <input type="radio" name="sex" value="false" class="mx-2"/>女--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${requestScope.userList.sex==false}">--%>
<%--                            <input type="radio" name="sex" value="true" class="mx-2"/>男--%>
<%--                            <input type="radio" name="sex" value="false" checked  class="mx-2"/>女--%>
<%--                        </c:if>--%>

<%--                    </div>--%>
<%--                <label for="validationCustom05" class="form-label">类别</label>--%>
<%--                <select class="form-select mx-4" id="validationCustom05" required name="college">--%>
<%--                    <option>物流与信息工程学院</option>--%>
<%--                    <option>商贸与经济管理学院</option>--%>
<%--                    <option>旅游与公共管理学院</option>--%>
<%--                    <option>建筑工程学院</option>--%>
<%--                    <option>机电与汽车工程学院</option>--%>
<%--                    <option>艺术设计学院</option>--%>
<%--                    <option>教师</option>--%>
<%--                    <option>未知</option>--%>
<%--                </select>--%>

<%--                    <div class="mb-3 my-3">--%>
<%--                        <label for="formFile" class="form-label">请上传头像</label>--%>
<%--                        <img src="${pageContext.request.contextPath}/img/${requestScope.userList.img}" style="width: 70px;height: 70px;"/>--%>
<%--                        <input type="file" id="formFile" name="uploadFile">--%>
<%--                    </div>--%>

<%--                <div class="text-center my-3">--%>
<%--                    <button class="btn btn-secondary" type="submit">更新</button>--%>
<%--                </div>--%>

<%--            </form>--%>

<%--        </div>--%>
<%--        <div>--%>
<%--            <a href="index" class="link-secondary text-decoration-none">返回首页</a>--%>
<%--        </div>--%>
<%--        <div class="col-md-4"></div>--%>
<%--    </div>--%>
    <div class="row">
        <div class="col-md-6"></div>
        <div class="col-md-3 my-4" >
            <h3 class="text-center my-3">__欢迎您__</h3>
            <form id="regForm" method="post" action="updateUser" enctype="multipart/form-data">
                        <input type="hidden" name="userid" value="${requestScope.userList.userid}">
                                <input type="hidden" name="img" value="${requestScope.userList.img}">
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon1">&nbsp&nbsp昵&nbsp&nbsp&nbsp&nbsp称&nbsp</span>
                    <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon1" name="username" maxlength="6" value="${requestScope.userList.username}" style="background:rgba(255,255,255,0.15)">
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon2">&nbsp手&nbsp机&nbsp号&nbsp</span>
                    <input type="text" class="form-control"  aria-label="Usernam" aria-describedby="basic-addon2" name="phonenumber" maxlength="11" value="${requestScope.userList.phonenumber}" style="background:rgba(255,255,255,0.15)">
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon3">&nbsp&nbspQ&nbspQ&nbsp号&nbsp</span>
                    <input type="text" class="form-control"  aria-label="Usernam" aria-describedby="basic-addon3" name="qq" id="qq" maxlength="11" value="${requestScope.userList.qq}" style="background:rgba(255,255,255,0.15)">
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon4">&nbsp&nbsp密&nbsp&nbsp&nbsp&nbsp码&nbsp</span>
                    <input type="password" class="form-control"  aria-label="Username" aria-describedby="basic-addon4" name="password"  id="password" maxlength="10" placeholder="密码长度6到10位" style="background:rgba(255,255,255,0.15)" autocomplete="off">
                    <i class="fa fa-eye mb-3 my-3 mx-3" id="eye1" style="background-color: #fff"></i>
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon5">&nbsp确认密码</span>
                    <input type="password" class="form-control"  aria-label="Username" aria-describedby="basic-addon5" name="password2" id="password2" maxlength="10" placeholder="请再次输入..." style="background:rgba(255,255,255,0.15)" autocomplete="off">
                    <i class="fa fa-eye mb-3 my-3 mx-3" id="eye2" style="background-color: #fff"></i>
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon6">&nbsp&nbsp性&nbsp&nbsp&nbsp&nbsp别&nbsp&nbsp</span>
                    <%--                    <input type="radio" name="sex" value="true" checked class="mx-2"/>男--%>
                    <%--                    <input type="radio" name="sex" value="false" class="mx-2"/>女--%>
                    <c:if test="${requestScope.userList.sex==true}">
                    <div class="form-check form-check-inline mx-3 my-2">
                        <input class="form-check-input" type="radio" name="sex" id="inlineRadio1" value="true" checked>
                        <label class="form-check-label" for="inlineRadio1">男</label>

                    </div>
                    <div class="form-check form-check-inline mx-3 my-2">
                        <input class="form-check-input" type="radio" name="sex" id="inlineRadio2" value="false">
                        <label class="form-check-label" for="inlineRadio2">女</label>
                    </div>
                </div>
                </c:if>
                <c:if test="${requestScope.userList.sex==false}">
                <div class="form-check form-check-inline mx-3 my-2">
                    <input class="form-check-input" type="radio" name="sex" id="inlineRadio3" value="true">
                    <label class="form-check-label" for="inlineRadio3">男</label>

                </div>
                <div class="form-check form-check-inline mx-3 my-2">
                    <input class="form-check-input" type="radio" name="sex" id="inlineRadio4" value="false" checked>
                    <label class="form-check-label" for="inlineRadio4">女</label>
                </div>
        </div>
        </c:if>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon7">&nbsp&nbsp学&nbsp&nbsp&nbsp&nbsp院&nbsp&nbsp</span>

                    <select class="form-select" id="validationCustom05" required name="college" style="background:rgba(255,255,255,0.15)">
                        <option>物流与信息工程学院</option>
                        <option>商贸与经济管理学院</option>
                        <option>旅游与公共管理学院</option>
                        <option>建筑工程学院</option>
                        <option>机电与汽车工程学院</option>
                        <option>艺术设计学院</option>
                        <option>教师</option>
                        <option>未知</option>
                    </select>
                </div>
                <%--                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon8">&nbsp&nbsp学&nbsp&nbsp&nbsp&nbsp院&nbsp&nbsp</span>--%>
                <%--                    <input type="file" id="formFile" name="uploadFile">--%>
                <%--                </div>--%>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="formFile">&nbsp&nbsp头&nbsp&nbsp&nbsp像</label>
                    <img class="rounded-circle" src="${pageContext.request.contextPath}/img/${requestScope.userList.img}" style="width: 70px;height: 70px;"/>
                    <input type="file" class="form-control" id="formFile" name="uploadFile" style="background:rgba(255,255,255,0.15)">
                </div>
                <div class="row py-3">
                    <div class="col-md-4">
                        <a href="index" class="link-dark mx-3 text-decoration-none">返回首页</a>
                    </div>
                    <div class="col-md-3">
                        <button class="btn btn-primary" type="submit" id="sub">更新</button>
                    </div>
                    <div class="col-md-4">

                    </div>
                </div>
            </form>

        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="fixed-bottom">

        <div class="row p-3 bg-dark" style="height: 90px;">
            <div class="iconColor text-center">
                <a href="#"><i class="fa fa-weixin me-2"></i></a> <a href="#"></a> <a href="#"><i class="fa fa-qq me-2"></i></a> <a href="#"></a>  <a href="#"><i class="fa fa-google-plus me-2"></i></a> <a href="#"></a> <a href="#"><i class="fa fa-github me-2"></i></a> <a href="#"></a> <a href="#"><i class="fa fa-twitter"></i></a>
            </div>
            <div><li class="text-center p-2 text-white">Copyright © 2022.盛家愈</li></div>
        </div>

    </div>
</div>

</html>

</body>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {


// Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')
// Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })

    })()
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery3.6.js"></script>
<script type="text/javascript">
    var inputs=document.getElementsByTagName('input');
    inputs.username.onblur = function() {
        var username = $("input[name='username']").val()
            $.ajax({
                type: 'POST',
                url: 'userRegister',
                data: {username: username},
                success: function () {
                }
            })
    }
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
        $(function (){
            //表单提交时
            $("#regForm").submit(function (){
//昵称长度
                if($("input[name='username']").val().length<2){
                    alert("昵称最少2位")
                    return false;
                }
                var qq = $("#qq").val();
                //判断用户名是否为空
                if(qq == "") {
                    alert("QQ不能为空");
                    //取消默认行为
                    return false;
                }

                //手机号格式
                var phone=/^1((34[0-8])|(8\d{2})|(([35][0-35-9]|4[579]|66|7[35678]|9[1389])\d{1}))\d{7}$/;
                if(!phone.test($("input[name='phonenumber']").val())){
                    alert("手机号格式不正确")
                    return false;
                }
                //密码长度
                if($("input[name='password']").val().length<6){
                    alert("密码最少6位")
                    return false;
                }
                //两次密码是否一致
                if($("input[name='password']").val()!=$("input[name='password2']").val()){
                    alert("两次密码不一致")
                    return false;
                }
                return true;
            })
        })
    //密码显示
    let eye1 = document.getElementById('eye1');
    let eye2 = document.getElementById('eye2');
    let pwd1 = document.getElementById('password');
    let pwd2 = document.getElementById('password2');
    // 2.注册事件 处理程序
    let flag = 0;
    eye1.onclick = function() {
        // 点击一次之后，flag一定要变化
        if (flag == 0) {
            pwd1.type = 'text';
            flag = 1; //赋值操作
        } else {
            pwd1.type = 'password';
            flag = 0;
        }
    }
    let flag1=0;
    eye2.onclick = function() {
        // 点击一次之后，flag一定要变化
        if (flag1 == 0) {
            pwd2.type = 'text';
            flag1 = 1; //赋值操作
        } else {
            pwd2.type = 'password';
            flag1 = 0;
        }
    }
</script>
</html>
