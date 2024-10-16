<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>个人中心</title>
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
    <title>个人中心</title>
</head>

<body>
<div class="container-fluid">
    <!--    第一个开始-->
    <div class="sticky-top">
        <nav class="navbar navbar-expand-lg navbar-light bg-secondary">
            <div class="container-fluid"> <img src="img/1.jpg" alt="" style="height:50px" class="me-3">
                <h2 class="me-5">二手信息网站</h2>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item fw-bold"> <a class="nav-link active me-5" aria-current="page" href="#"><i class="fa fa-home me-2"></i>首页</a> </li>
                        <li class="nav-item fw-bold"> <a class="nav-link me-5" href="#"> <i class="fa fa-hand-o-down me-2"></i>我的订单</a> </li>
                        <li class="nav-item fw-bold"> <a class="nav-link me-5" href="#"><i class="fa fa-shopping-cart me-2"></i>购物车</a> </li>
                    </ul>
                    <form class="d-flex me-5">
                        <input class="form-control me-2" type="search" placeholder="请输入..." aria-label="Search">
                        <button class="btn btn-outline-warning" type="submit" style="width: 100px"> <i class="fa fa-search "></i></button>
                    </form>
                    <ul class="navbar-nav me-5">
                        <li class="nav-item fw-bold"> <a class="nav-link" aria-current="page" href="#">登录</a> </li>
                        <li class="nav-item fw-bold"> <a class="nav-link" aria-current="page" href="#">注册</a> </li>
                    </ul>
                    <ul class="navbar-nav me-5">
                        <div class="dropdown"> <a class="btn btn-outline-info dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false"> 个人中心 </a>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <li><a class="dropdown-item" href="#">修改个人信息</a></li>
                                <li><a class="dropdown-item" href="#">管理我的商品</a></li>
                                <li><a class="dropdown-item" href="#">注销</a></li>
                            </ul>
                        </div>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <!--    第一个导航结束-->
    <!--    第二个导航开始-->

    <ul class="nav justify-content-around bg-light">
        <li class="nav-item"> <a class="nav-link active fw-bold" style="color: #000000" aria-current="page" href="#">最新发布</a> </li>
        <li class="nav-item"> <a class="nav-link fw-bold" style="color: #000000" href="#">服饰鞋包</a> </li>
        <li class="nav-item"> <a class="nav-link fw-bold" style="color: #000000" href="#">美食酒水</a> </li>
        <li class="nav-item"> <a class="nav-link fw-bold" style="color: #000000" href="#">个护清洁</a> </li>
        <li class="nav-item"> <a class="nav-link fw-bold" style="color: #000000" href="#">宠物生活</a> </li>
        <li class="nav-item"> <a class="nav-link fw-bold" style="color: #000000" href="#">运动旅行</a> </li>
        <li class="nav-item"> <a class="nav-link fw-bold" style="color: #000000" href="#">数码家电</a> </li>
    </ul>

    <!--        第二个导航结束-->
    <div class="row">
        <div class="col-md-3 text-center">
        </div>
        <div class="col-md-7">
            <div class="row" style="background-color:antiquewhite">
                <div class="col-md-6" style="padding: 0px 70px"> <img src="${pageContext.request.contextPath}/img/${requestScope.userList.img}" alt="" style="width: 50px;height: 50px;margin: 50px 0" > <span class="px-4">姓名：${requestScope.userList.username}</span>
                    <%--				字符串转化为日期--%>
                    <fmt:parseDate var="time" value="${requestScope.userList.time}" pattern="yyyy-MM-dd HH:mm:ss"/>

                    <%--	输出日期--%>
                    <div>注册时间：<fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/></div>

                </div>
                <div class="col-md-6" style="margin: 30px 0">
                    <p>手机号：${requestScope.userList.phonenumber}</p>
                    <p>QQ:${requestScope.userList.qq}</p>
                    <p>学院：${requestScope.userList.college}</p>
                    <c:if test="${requestScope.userList.sex==false}">
                    <p>性别：女</p>
                    </c:if>
                    <c:if test="${requestScope.userList.sex==true}">
                        <p>性别：男</p>
                    </c:if>
                </div>
            </div>
            <!--      商品开始-->


            <div class="container py-5">
                <table class="table table-striped">

                    <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">商品名称</th>
                        <th scope="col">售价</th>
                        <th scope="col">数量</th>
                    </tr>
                    </thead>
                    <c:forEach items="${requestScope.goodsByUserId}" var="goodsByUserId">


                    <tbody>
                    <tr>
                        <th scope="row"><img src="${pageContext.request.contextPath}/img/${goodsByUserId.image}" alt="" style="width: 50px;height: 50px"></th>
                        <td>${goodsByUserId.name}</td>
                        <td>${goodsByUserId.newprice}</td>
                        <td>${goodsByUserId.stock}</td>



                    </tr>


                    </tbody>
                    </c:forEach>
                </table>
            </div>
            <!--      商品结束-->
        </div>
    </div>
</div>
</body>
</html>
</body>
</html>
