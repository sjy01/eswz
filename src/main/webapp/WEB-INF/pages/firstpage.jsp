<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>二手网站</title>
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

  <link rel="stylesheet" href="css/1.css">
</head>
<!--    第一个导航开始-->
<body class="container-fluid p-0" data-bs-spy="scroll" data-bs-target="#header_web">
<div class="sticky-top">
  <nav class="navbar navbar-expand-lg navbar-light bg-secondary">
    <div class="container-fluid">
      <img class="rounded-circle" src="${pageContext.request.contextPath}/img/tu.jpg" alt="" style="height:50px">
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
        <ul class="navbar-nav mx-5">
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
<!--        第二个导航结束-->
<!--    轮播图开始-->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <ol class="carousel-indicators">
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"></li>
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"></li>
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5"></li>
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/img/lunbo1.jpg" class="d-block w-100 img-fluid" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/img/lunbo2.jpg" class="d-block w-100 img-fluid" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/img/lunbo3.jpg" class="d-block w-100 img-fluid" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/img/lunbo4.jpg" class="d-block w-100 img-fluid" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/img/lunbo5.jpg" class="d-block w-100 img-fluid" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/img/lunbo6.jpg" class="d-block w-100 img-fluid" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/img/lunbo7.jpg" class="d-block w-100 img-fluid" alt="...">
    </div>
  </div>


  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </a>

</div>
<!--    轮播图结束-->
<!--    主体开始-->
<section id="blog_web">


  <div class="container py-5">
    <div class="row">
<c:forEach items="${requestScope.goodsList}" var="goods">
  <div class="col-md-3">
      <div class="card my-3" style="width: 18rem;">
        <span class="border border-dark">
        <a href="detailGoods?goodsid=${goods.goodsid}"><img src="${pageContext.request.contextPath}/img/${goods.image}" class="card-img-top" alt="图片加载失败" ></a>
        </span>
          <div class="card-body">
          <h5 class="card-title text-truncate">${goods.name}</h5>
          <p class="card-text text-truncate">${goods.describe}</p>
        </div>
        <ul class="list-group list-group-flush text-center">
          <li class="list-group-item text-decoration-line-through">原价￥${goods.price}</li>
          <li class="list-group-item" style="color: #FF0000">现价￥${goods.newprice}</li>
        </ul>
        <div class="card-body text-center">
            <a href="insertCart?goodsid=${goods.goodsid}" class="link-secondary text-decoration-none"><i class="fa fa-star me-2"></i>加入收藏夹</a>
          <a href="detailGoods?goodsid=${goods.goodsid}" class="link-secondary mx-3 text-decoration-none"><i class="fa fa-hand-o-right me-2"></i>详情</a>
        </div>
      </div>
  </div>
</c:forEach>
      </div>
    </div>
  <!--    分页开始-->
  <div class="container mx-5">
    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-end">
<c:if test="${requestScope.pageNo>1}">
        <li class="page-item">
          <a class="page-link text-black" href="index?pageNo=1&pageSize=8&classification.classificationid=${requestScope.goods.classification.classificationid}&name=${requestScope.goods.name}">首页</a>
        </li>
</c:if>
<c:if test="${requestScope.pageNo>1}">

        <li class="page-item">
          <a class="page-link text-black" href="index?pageNo=${requestScope.pageNo-1}&pageSize=8&classification.classificationid=${requestScope.goods.classification.classificationid}&name=${requestScope.goods.name}">上一页</a>
        </li>
</c:if>

        <li class="page-item"><a class="page-link text-black" href="">${requestScope.pageCount}</a></li>
        <c:if test="${requestScope.pageNo<requestScope.pageCount}">
        <li class="page-item">
          <a class="page-link text-black" href="index?pageNo=${requestScope.pageNo+1}&pageSize=8&classification.classificationid=${requestScope.goods.classification.classificationid}&name=${requestScope.goods.name}">下一页</a>
        </li>
</c:if>
        <c:if test="${requestScope.pageNo<requestScope.pageCount}">
        <li class="page-item">
          <a class="page-link text-black" href="index?pageNo=${requestScope.pageCount}&pageSize=8&classification.classificationid=${requestScope.goods.classification.classificationid}&name=${requestScope.goods.name}">尾页</a>
        </li>
        </c:if>
      </ul>
    </nav>
  </div>
  <!--    分页结束-->
  </div>
</section>

<!--    主体结束-->
<!--    底部开始-->

<div class="bg-dark">
  <div class="row p-3">
    <div class="iconColor text-center">
      <a href="#"><i class="fa fa-weixin me-2"></i></a> <a href="#"></a> <a href="#"><i class="fa fa-qq me-2"></i></a> <a href="#"></a>  <a href="#"><i class="fa fa-google-plus me-2"></i></a> <a href="#"></a> <a href="#"><i class="fa fa-github me-2"></i></a> <a href="#"></a> <a href="#"><i class="fa fa-twitter"></i></a>
    </div>
  </div>
</div>
<li class="text-center p-2">Copyright © 2022.盛家愈</li>

<!--    底部结束-->

</body>
</html>
</body>
</html>
