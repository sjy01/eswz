<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理商品</title>
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
    <title>订单</title>
    <link rel="stylesheet" href="index.css">
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
<!--    订单开始-->
<div class="container py-5">
    <table class="table table-striped">

        <thead>
        <tr>
            <th scope="col-2"></th>
            <th scope="col-2">商品名称</th>
            <th scope="col-2">商品原价</th>
            <th scope="col-2">商品售价</th>
            <th scope="col-2">商品数量</th>
            <th scope="col-2">商品状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.goodsByUserId}" var="goodsByUserId">


        <tr>
            <th scope="row"><img src="${pageContext.request.contextPath}/img/${goodsByUserId.image}" alt="" style="width: 50px;height: 50px"></th>
            <td>${goodsByUserId.name}</td>
            <td>${goodsByUserId.price}</td>
            <td>${goodsByUserId.newprice}</td>
            <td>${goodsByUserId.stock}</td>
            <c:if test="${goodsByUserId.state==false}">
                <td>不在线</td>
            </c:if>
            <c:if test="${goodsByUserId.state}">
                <td>在线</td>
            </c:if>
            <td><a href="toUpdateGoods?goodsid=${goodsByUserId.goodsid}" class="link-secondary text-decoration-none">修改</a></td>
            <td><a href="deleteMyGoods?goodsid=${goodsByUserId.goodsid}" class="link-secondary text-decoration-none">删除</a></td>
       <td><a href="detailGoods?goodsid=${goodsByUserId.goodsid}" class="link-secondary text-decoration-none">详情</a></td>
        </tr>
        </c:forEach>

        </tbody>

    </table>
</div>

<!--   订单结束 -->
<!--    分页开始-->
<!--    分页开始-->
<div class="container mx-5">
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
            <c:if test="${requestScope.pageNo>1}">
                <li class="page-item">
                    <a class="page-link text-black" href="toMyGoods?pageNo=1&pageSize=8&name=${requestScope.goods.name}">首页</a>
                </li>
            </c:if>
            <c:if test="${requestScope.pageNo>1}">

                <li class="page-item">
                    <a class="page-link text-black" href="toMyGoods?pageNo=${requestScope.pageNo-1}&pageSize=8&name=${requestScope.goods.name}">上一页</a>
                </li>
            </c:if>

            <li class="page-item"><a class="page-link text-black" href="">${requestScope.pageCount}</a></li>
            <c:if test="${requestScope.pageNo<requestScope.pageCount}">
                <li class="page-item">
                    <a class="page-link text-black" href="toMyGoods?pageNo=${requestScope.pageNo+1}&pageSize=8">下一页</a>
                </li>
            </c:if>
            <c:if test="${requestScope.pageNo<requestScope.pageCount}">
                <li class="page-item">
                    <a class="page-link text-black" href="toMyGoods?pageNo=${requestScope.pageCount}&pageSize=8&name=${requestScope.goods.name}">尾页</a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>
<!--    分页结束-->
<!--    分页结束-->

</body>
</html>

</body>

</html>
