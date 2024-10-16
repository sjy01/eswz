<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布商品</title>
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
            <h1 class="text-center my-3">__欢迎您__</h1>
            <form method="post" action="doAddGoods" enctype="multipart/form-data">
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon1">商品名称</span>
                    <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon1" name="name" id="name">
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon2">商品原价</span>
                    <input type="text" class="form-control"  aria-label="Usernam" aria-describedby="basic-addon2" name="price" id="price">
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon3">商品售价</span>
                    <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon3" name="newprice" id="newprice">
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon4">商品数量</span>
                    <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon4" name="stock" id="stock">
                </div>
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon5">商品介绍</span>

                    <textarea class="form-control" rows="3" name="describe" id="describe"
                    ></textarea>
                </div>
                <div class="mb-3 my-3">
                    <label for="formFile" class="form-label">请上传图片</label>
                    <input type="file" id="formFile" name="uploadFile">
                </div>
                <label for="validationCustom05" class="form-label">类别</label>

                <select class="form-select" id="validationCustom05" name="classification.classificationid">
                    <c:forEach items="${requestScope.classificationList}" var="classification">
                    <option value="${classification.classificationid}">${classification.classificationname}</option>
</c:forEach>
                </select>
                <div class="text-center my-3">

                    <button class="btn btn-secondary" type="submit" id="sub">发布</button>
                </div>

            </form>
            <div>
                <a href="index" class="link-secondary text-decoration-none">返回首页</a>
            </div>
        </div>

        <div class="col-md-4"></div>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery3.6.js"></script>
<script type="text/javascript">
    $("#sub").click(function(){

        var name = $("#name").val();

        if(name == ""){
            alert("名字不为空");

            return false;
        }

        var price = $("#price").val();
var je=/(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
        if(!je.test(price)){
            alert("请输入正确的价格");

            return false;
        }
        var newprice = $("#newprice").val();

        var je=/(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
        if(!je.test(newprice)){
            alert("请输入正确的价格");

            return false;
        }
        var stock = $("#stock").val();

        var je=/^[0-9]*$/;
        if(!je.test(stock)){
            alert("请输入正确的数量");
            return false;
        }
var describe=$("#describe").val();
        if(describe == " "){
            alert("介绍不能为空");
            return false;
        }
        var formFile = $("#formFile").val();

        if(formFile == ""){
            alert("图片不能为空");
            return false;
        }
    });
</script>
</body>
</html>
