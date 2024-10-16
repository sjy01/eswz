<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理类别</title>
</head>
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

    <link rel="stylesheet" href="css/1.css">
</head>
<body class="container-fluid">
<div class="sticky-top">
    <nav class="navbar navbar-expand-lg navbar-light bg-secondary">
        <div class="container-fluid">
            <img src="${pageContext.request.contextPath}/img/tu.jpg" alt="" style="height:50px" class="me-3">
            <h2 class="me-5">二手信息网站</h2>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 mx-3">
                    <c:set var="state" value="0"/>
                    <li class="nav-item fw-bold"> <a class="nav-link active me-5" aria-current="page" href="toadministrators"><i class="fa fa-home me-1"></i>首页</a> </li>
                    <li class="nav-item fw-bold"> <a class="nav-link me-5" href="toAllGoods?state=${state}">管理商品</a> </li>
                    <li class="nav-item fw-bold"> <a class="nav-link me-5" href="toAllUsers?state=${state}">管理用户</a> </li>
                    <li class="nav-item fw-bold"> <a class="nav-link me-5" href="toAddNotice">发布公告</a> </li>
                    <li class="nav-item fw-bold"> <a class="nav-link me-5" href="toAdminNotice">管理公告</a> </li>
                    <li class="nav-item fw-bold"> <a class="nav-link me-5" href=toAdminInformation?state=${state}>管理信息</a> </li>
                </ul>

                <c:if test="${sessionScope.curUser==null}">
                    <ul class="navbar-nav me-5">
                        <li class="nav-item fw-bold"> <a class="nav-link activ" aria-current="page" href="toUsersLogin">登录</a> </li>
                        <li class="nav-item fw-bold"> <a class="nav-link" aria-current="page" href="toUserRegister">注册</a> </li>
                    </ul>
                </c:if>

                <c:if test="${sessionScope.curUser!=null}">
                    <ul class="navbar-nav mx-2">
                        <div class="dropdown">
                            <a class="btn btn-outline-warning dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                <span><i class="fa fa-user me-1"></i>  </span> ${sessionScope.curUser.username}
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <li><a class="dropdown-item" href="loginout">注销</a></li>


                            </ul>
                        </div>
                    </ul>
                </c:if>
            </div>
        </div>
    </nav>
    <div>

        <ul class="nav justify-content-around bg-light">
            <c:forEach items="${requestScope.classificationList}" var="classification">

                <form method="post" action="updateClassification">

                    <div class="input-group mb-3 my-3">
                        <input type="hidden" name="classificationid" value="${classification.classificationid}">
                        <input type="hidden" name="state" value="${classification.state}">
                        <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon1" name="classificationname"
                        value="${classification.classificationname}">
                        
                    </div>

                    <div class="text-center my-3">
                        <c:if test="${classification.state==false}">
                            <a href="updateState?classificationid=${classification.classificationid}&state=${classification.state}" class="link-secondary text-decoration-none px-4">上线</a>
                        </c:if>
                        <c:if test="${classification.state==true}">
                            <a href="updateState?classificationid=${classification.classificationid}&state=${classification.state}" class="link-secondary text-decoration-none px-4">下线</a>
                        </c:if>
                        <button class="btn btn-secondary px-2" type="submit">更新</button>
                    </div>
                </form>

            </c:forEach>
        </ul
    </div>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">

            <h1 class="text-center my-3">__增加类别__</h1>
            <form action="addClassification" method="post" >
                <div class="input-group mb-3 my-3">
                    <input type="text" class="form-control"  aria-label="Usernam" aria-describedby="basic-addon2" name="classificationname">
               <input type="hidden" value="tlue" name="state">
                </div>

                <div class="text-center my-3">
                    <button class="btn btn-secondary" type="submit">提交</button>
                </div>
            </form>
</body>
</html>
