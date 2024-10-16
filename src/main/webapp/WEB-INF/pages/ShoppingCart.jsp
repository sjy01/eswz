<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>收藏夹</title>
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

  <link rel="stylesheet" href="index.css">
</head>
<%--第一个导航条开始--%>
<body class="ccontainer-fluid p-0" data-bs-spy="scroll" data-bs-target="#header_web">
<div class="sticky-top">
  <nav class="navbar navbar-expand-lg navbar-light bg-secondary">
    <div class="container-fluid">
      <img src="${pageContext.request.contextPath}/img/tu.jpg" alt="" style="height:50px" class="rounded-circle">
      <h2 class="me-5">二手信息网站</h2>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0 mx-3">
          <li class="nav-item fw-bold"> <a class="nav-link active me-5" aria-current="page" href="index"><i class="fa fa-home me-1"></i>首页</a> </li>
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
              <a class="btn btn-outline-warning dropdown-toggle rounded-circle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
             <span>  <img class="rounded-circle" src="${pageContext.request.contextPath}/img/${sessionScope.curUser.img}" style="width: 50px;height: 50px;"/>
  </span>
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
  <!--    第二个导航开始-->
  <ul class="nav justify-content-around bg-light">
    <li class="nav-item">
      <a class="nav-link active fw-bold" style="color: #000000" aria-current="page" href="index">最新发布</a>
    </li>
    <c:forEach items="${requestScope.classificationList}" var="classification">
      <li class="nav-item">
        <a class="nav-link active fw-bold" style="color: #000000" aria-current="page" href="index?classification.classificationid=${classification.classificationid}">${classification.classificationname}</a>
      </li>
    </c:forEach>
  </ul>
</div>
<!--    购物车开始-->
<div class="container py-5">
  <table class="table table-striped">

    <thead>
    <tr>
      <th scope="col">商品信息</th>
      <th scope="col"></th>
      <th scope="col">单价</th>
      <th scope="col">数量</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
    </thead>
    <tbody>

    <c:set var="total" value="0"/>
<c:forEach items="${requestScope.cartList}" var="cart">

    <tr>
      <th scope="row"><img src="${pageContext.request.contextPath}/img/${cart.goods.image}" alt="" style="width: 50px;height: 50px"></th>
      <td>${cart.goods.name}</td>
      <td><fmt:formatNumber value="${cart.goods.newprice}" type="Currency"></fmt:formatNumber></td>
<%--      <td>   <input type="text" value="${cart.quantity}" name="quantity" id="quantity"--%>
<%--                    onchange="window.location.href='updateQuantity?goodsid=${cart.goods.goodsid}&max=${cart.goods.stock}&quantity='+this.value"/>--%>

      <td>${cart.goods.stock}</td>
      <td><a href="deleteGoods?goodsid=${cart.goods.goodsid}" class="link-secondary text-decoration-none">移除</a> </td>
      <td> <a href="detailGoods?goodsid=${cart.goods.goodsid}" class="link-secondary text-decoration-none">详情</a></td>
    </tr>
    <c:set var="total" value="${total+cart.goods.newprice*cart.goods.stock}"/>
    </c:forEach>
      <tr>
        <th scope="row"></th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>全部购买预计花费： <fmt:formatNumber value="${total}" type="Currency"></fmt:formatNumber></td>
      </tr>
    </tbody>

  </table>

</div>

<!--   购物车结束 -->


</body>

</html>

</html>
