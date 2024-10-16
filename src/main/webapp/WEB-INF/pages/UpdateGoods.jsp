<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新商品</title>
</head>
<body>
<!doctype html>
<html lang="zh-CN">
<head>

    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.css">

    <script src="bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js" ></script>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">

            <form method="post" action="updateGoods" enctype="multipart/form-data">
<%--                隐藏域--%>
    <input type="hidden" name="goodsid" value="${requestScope.goodsById.goodsid}">
    <input type="hidden" name="image" value="${requestScope.goodsById.image}">
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon1">商品名称</span>
                    <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon1" name="name"
                    value="${requestScope.goodsById.name}">
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon2">商品原价</span>
                    <input type="text" class="form-control"  aria-label="Usernam" aria-describedby="basic-addon2" name="price"
                           value="${requestScope.goodsById.price}">
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon3">商品售价</span>
                    <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon3" name="newprice"
                           value="${requestScope.goodsById.newprice}">
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon4">商品数量</span>
                    <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon4"name="stock"
                           value="${requestScope.goodsById.stock}">
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon5">商品介绍</span>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="describe"
                    >${requestScope.goodsById.describe}</textarea>
                </div>
                <div class="mb-3 my-3">
                    <label for="formFile" class="form-label">请上传图片</label>
                    <img src="${pageContext.request.contextPath}/img/${requestScope.goodsById.image}" style="width: 50px;height: 50px;"/>
                    <input type="file" id="formFile" name="uploadFile">
                </div>
                <label for="validationCustom05" class="form-label">类别</label>

                <select class="form-select" id="validationCustom05" name="classification.classificationid">
                    <c:forEach items="${requestScope.classificationList}" var="classification">
                    <option value="${classification.classificationid}"
                            <c:if test="${classification.classificationid==requestScope.goods.classification.classificationid}">
                                selected
                            </c:if>
                    >${classification.classificationname}</option>
</c:forEach>
                </select>
                <div class="text-center my-3">

                    <button class="btn btn-primary" type="submit">修改</button>
                </div>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
</body>
</html>

</body>
</html>
