<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>信息</title>
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
    <title>信息</title>
</head>

<body>
<div class="container-fluid">
    <!--      商品开始-->
    <div class="sticky-top">
        <nav class="navbar navbar-expand-lg navbar-light bg-secondary">
            <div class="container-fluid">
                <img src="${pageContext.request.contextPath}/img/tu.jpg" alt="" style="height:50px" class="rounded-circle">
                <h2 class="me-5">二手信息网站</h2>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 mx-3">
                        <li class="nav-item fw-bold"> <a class="nav-link active me-5" aria-current="page" href="index"><i class="fa fa-home me-1"></i>首页</a> </li>
                        <li class="nav-item fw-bold"> <a class="nav-link me-5" href="getCart?userid=${sessionScope.curUser.userid}"><i class="fa fa-star me-1"></i>收藏夹</a> </li>
                        <li class="nav-item fw-bold"> <a class="nav-link me-5" href="toNotice"><i class="fa fa-commenting me-1"></i>公告</a> </li>
                    </ul>
                    <form class="d-flex mx-3 my-2" action="toInformation" method="post">
                        <input class="form-control me-2" type="search" placeholder="请输入..." aria-label="Search" name="content">
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

    <div class="container py-3">
        <table class="table table-striped">

            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.InformationList}" var="Information">
            <tr>
               <td> <img src="${pageContext.request.contextPath}/img/${Information.users.img}" style="width: 50px;height: 50px"></td>
                <td>${Information.users.username}</td>
                <td>${Information.content}</td>
                <td>${Information.addtime}</td>
                <td><a href="toGoodsUser?userid=${Information.users.userid}" class="link-secondary text-decoration-none">联系我</a></td>


            </tr>
            </c:forEach>

            </tbody>

        </table>
    </div>
    <!--      商品结束-->
        <!--    分页开始-->
        <div class="container">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-end">
                    <c:if test="${requestScope.pageNo>1}">
                        <li class="page-item">
                            <a class="page-link text-black" href="toInformation?pageNo=1&pageSize=6&content=${requestScope.Information.content}">首页</a>
                        </li>
                    </c:if>
                    <c:if test="${requestScope.pageNo>1}">

                        <li class="page-item">
                            <a class="page-link text-black" href="toInformation?pageNo=${requestScope.pageNo-1}&pageSize=6&content=${requestScope.Information.content}">上一页</a>
                        </li>
                    </c:if>

                    <li class="page-item"><a class="page-link text-black" href="">${requestScope.pageCount}</a></li>
                    <c:if test="${requestScope.pageNo<requestScope.pageCount}">
                        <li class="page-item">
                          <a class="page-link text-black" href="toInformation?pageNo=${requestScope.pageNo+1}&pageSize=6&content=${requestScope.Information.content}">下一页</a>
                        </li>
                    </c:if>
                    <c:if test="${requestScope.pageNo<requestScope.pageCount}">
                        <li class="page-item">
                     <a class="page-link text-black" href="toInformation?pageNo=${requestScope.pageCount}&pageSize=6&content=${requestScope.Information.content}">尾页</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <!--    分页结束-->
    </div>
    </section>

    <!--    主体结束-->

</div>
<!--    底部开始-->
<div class="fixed-bottom">
<div class="bg-dark">
    <div class="row p-3">
        <div class="iconColor text-center">
            <a href="#"><i class="fa fa-weixin me-2"></i></a> <a href="#"></a> <a href="#"><i class="fa fa-qq me-2"></i></a> <a href="#"></a>  <a href="#"><i class="fa fa-google-plus me-2"></i></a> <a href="#"></a> <a href="#"><i class="fa fa-github me-2"></i></a> <a href="#"></a> <a href="#"><i class="fa fa-twitter"></i></a>
        </div>
    </div>
</div>
<li class="text-center p-2">Copyright © 2022.盛家愈</li>
    </div>
<!--    底部结束-->

</body>
</html>

</body>
</html>
