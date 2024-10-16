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
            <div class="container-fluid">
                <img src="${pageContext.request.contextPath}/img/tu.jpg" alt="" style="height:50px" class="me-3">
                <h2 class="me-5">二手信息网站</h2>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 mx-3">
                        <li class="nav-item fw-bold"> <a class="nav-link active me-5" aria-current="page" href="index"><i class="fa fa-home me-1"></i>首页</a> </li>
                        <li class="nav-item fw-bold"> <a class="nav-link me-5" href="getCart?userid=${sessionScope.curUser.userid}"><i class="fa fa-star me-1"></i>收藏夹</a> </li>
                        <li class="nav-item fw-bold"> <a class="nav-link me-5" href="toInformation"><i class="fa fa-envelope-open me-1"></i>信息</a> </li>
                        <li class="nav-item fw-bold"> <a class="nav-link me-5" href="toNotice"><i class="fa fa-commenting me-1"></i>公告</a> </li>
                    </ul>
                    <form class="d-flex mx-3 my-2" action="index" method="post">
                        <input class="form-control me-2" type="search" placeholder="请输入..." aria-label="Search" name="name">
                        <button class="btn btn-outline-warning" type="submit" style="width: 100px"> <i class="fa fa-search "></i></button>
                    </form>
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
                                    <li><a class="dropdown-item" href="toMyUser">个人主页</a></li>
                                    <li><a class="dropdown-item" href="toupdateUser">修改个人信息</a></li>
                                    <li><a class="dropdown-item" href="toMyGoods">管理我的商品</a></li>
                                    <li><a class="dropdown-item" href="toAddGoods">发布商品</a></li>
                                    <li><a class="dropdown-item" href="toinsertInformation">发布信息</a></li>
                                    <li><a class="dropdown-item" href="toMyInformation">管理信息</a></li>
                                    <li><a class="dropdown-item" href="loginout">注销</a></li>


                                </ul>
                            </div>
                        </ul>
                    </c:if>
                </div>
            </div>
        </nav>

    <!--    第一个导航结束-->
    <div class="row">
        <div class="col-md-3 text-center">
        </div>
        <div class="col-md-7">
            <div class="row" style="background-color:antiquewhite">
                <div class="col-md-6" style="padding: 0px 50px"> <img class="rounded-circle" src="${pageContext.request.contextPath}/img/${requestScope.userList.img}" alt="" style="width: 100px;height: 100px;margin: 30px 0" >
                    <span class="px-4">姓名：${requestScope.userList.username}</span>
                    <%--				字符串转化为日期--%>
                    <fmt:parseDate var="time" value="${requestScope.userList.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    <fmt:formatDate var="t" value="${time}" pattern="yyyy-MM-dd"/>
                        <div>注册时间：${t}</div>
                </div>
                <div class="col-md-6" style="margin: 30px 0">
                    <p>手&nbsp机&nbsp号&nbsp：${requestScope.userList.phonenumber}</p>
                    <p>Q&nbspQ&nbsp：${requestScope.userList.qq}</p>
                    <p>学&nbsp院&nbsp：${requestScope.userList.college}</p>
                    <c:if test="${requestScope.userList.sex==false}">
                    <p>性&nbsp别&nbsp：女</p>
                    </c:if>
                    <c:if test="${requestScope.userList.sex==true}">
                        <p>性&nbsp别&nbsp：男</p>
                    </c:if>
                </div>
            </div>
            <!--      商品开始-->


            <div class="container py-5">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col" class="text-center">在售商品</th>
                        <th scope="col" class="text-center">商品名称</th>
                        <th scope="col" class="text-center">售价</th>
                        <th scope="col" class="text-center">数量</th>
                        <th scope="col" class="text-center"></th>

                    </tr>
                    </thead>
                    <c:forEach items="${requestScope.goodsByUserId}" var="goodsByUserId">


                    <tbody>
                    <tr>
                        <th scope="row" class="text-center"><a href="detailGoods?goodsid=${goodsByUserId.goodsid}"><img src="${pageContext.request.contextPath}/img/${goodsByUserId.image}" alt="" style="width: 50px;height: 50px"></a></th>
                        <td class="text-center">${goodsByUserId.name}</td>
                        <td class="text-center">${goodsByUserId.newprice}</td>
                        <td class="text-center">${goodsByUserId.stock}</td>
                        <td class="text-center"><a class="link-dark" href="detailGoods?goodsid=${goodsByUserId.goodsid}"> <i class="fa fa-search"></i></a></td>
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
