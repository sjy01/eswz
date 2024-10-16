<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>管理用户</title>
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
      <img src="${pageContext.request.contextPath}/img/tu.jpg" alt="" style="height:50px" class="me-3">
      <h2 class="me-5">二手信息网站</h2>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0 mx-3">
          <c:set var="state" value="0"/>
          <li class="nav-item fw-bold"> <a class="nav-link active me-5" aria-current="page" href="toadministrators"><i class="fa fa-home me-1"></i>首页</a> </li>
          <li class="nav-item fw-bold"> <a class="nav-link me-5" href="toClassification">管理类别</a> </li>
          <li class="nav-item fw-bold"> <a class="nav-link me-5" href="toAllGoods?state=${state}">管理商品</a> </li>
          <li class="nav-item fw-bold"> <a class="nav-link me-5" href="toAddNotice">发布公告</a> </li>
          <li class="nav-item fw-bold"> <a class="nav-link me-5" href="toAdminNotice">管理公告</a> </li>
          <li class="nav-item fw-bold"> <a class="nav-link me-5" href=toAdminInformation?state=${state}>管理信息</a> </li>
        </ul>
        <form class="d-flex my-2" action="phoneUser" method="post">
          <input class="form-control me-2" type="search" placeholder="请输入..." aria-label="Search" name="phonenumber">
          <button class="btn btn-outline-warning" type="submit" style="width: 50px"> <i class="fa fa-search "></i></button>
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
                <li><a class="dropdown-item" href="loginout">注销</a></li>


              </ul>
            </div>
          </ul>
        </c:if>
      </div>
    </div>
  </nav>
  <!--    第一个导航结束-->
  <ul class="nav justify-content-around bg-light">
    <c:set var="state" value="1"/>
    <li class="nav-item">
      <a class="nav-link active fw-bold" style="color: #000000" aria-current="page" name="state" href="toAllUsers?state=${state-1}">不在线</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active fw-bold" style="color: #000000" aria-current="page" name="state" href="toAllUsers?state=${state}">在线</a>
    </li>
  </ul>
<!--    用户开始-->
<div class="container py-5">
  <table class="table table-striped">

    <thead>
    <tr>
      <th scope="col">用户Id</th>
      <th scope="col">头像</th>
      <th scope="col">用户姓名</th>
      <th scope="col">手机号</th>
      <th scope="col">QQ</th>
      <th scope="col">性别</th>
      <th scope="col">状态</th>
    </tr>
    </thead>
    <tbody>


    <tr>
      <th scope="row">${requestScope.users.userid}</th>
      <td><img src="${pageContext.request.contextPath}/img/${requestScope.users.img}" alt="" style="width: 50px;height: 50px"></td>
      <td>${requestScope.users.username}</td>
      <td>${requestScope.users.phonenumber}</td>
      <td>${requestScope.users.qq}</td>
      <c:if test="${requestScope.users.sex==true}">
        <td>男</td>
      </c:if>
      <c:if test="${requestScope.users.sex==false}">
        <td>女</td>
      </c:if>
      <c:if test="${requestScope.users.state==true}">
        <td>正常</td>
      </c:if>
      <c:if test="${requestScope.users.state==false}">
        <td>封禁中</td>
      </c:if>
      <c:if test="${requestScope.users.state==true}">
        <td><a href="updateUserState?userid=${requestScope.users.userid}&state=${requestScope.users.state}">封禁</a> </td>
      </c:if>
      <c:if test="${requestScope.users.state==false}">
        <td><a href="updateUserState?userid=${requestScope.users.userid}&state=${requestScope.users.state}">解封</a> </td>
      </c:if>

    </tr>

    </tbody>

  </table>

</div>

<!--   购物车结束 -->


</body>

</html>
