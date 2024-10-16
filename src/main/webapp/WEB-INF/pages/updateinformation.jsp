<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新信息</title>
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
            <form method="post" action="updateInformation">
                <input type="hidden" name="id" value="${requestScope.informationById.id}">
                <div class="input-group mb-3 my-3"> <span class="input-group-text" id="basic-addon5">问题描述</span>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content"
                    >${requestScope.informationById.content}</textarea>
                </div>

                <div class="text-center my-3">

                    <button class="btn btn-primary" type="submit">发布</button>
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
