<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>You Lose!</title>
    <!-- 引入 Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/styles/myStyle.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa; 
        }
        .container {
            margin-top: 50px; /
            padding: 30px;
            background-color: white; 
            border-radius: 5px; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .title {
            color: #dc3545; 
            margin-bottom: 20px; 
            text-align: center;
        }
        .btn-custom {
            margin-top: 20px; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">很遺憾，你猜錯了！</h1>
        <h2 class="text-center">幸運數字是：<%= request.getAttribute("luckNumber") != null ? request.getAttribute("luckNumber") : "" %></h2>
        
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/guess" class="btn btn-primary btn-custom">再玩一次</a>
            <a href="index" class="btn btn-primary btn-custom">回首頁</a> <!-- 將 btn-link 改為 btn-primary -->
        </div>
    </div>

  
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
