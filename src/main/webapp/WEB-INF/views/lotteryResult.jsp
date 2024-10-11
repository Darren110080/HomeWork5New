<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lottery Result</title>
    <!-- 引入 Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/styles/myStyle.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa; 
        }
        .container {
            margin-top: 50px; 
            padding: 30px; 
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
        }
        .title {
            text-align: center; 
            margin-bottom: 20px; 
        }
        .btn-custom {
            margin-top: 20px; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Lottery Game Result</h1>
        <p class="text-center"><strong>組數:</strong> <%= request.getAttribute("group") != null ? request.getAttribute("group") : "" %></p>
        <p class="text-center"><strong>排除:</strong> <%= request.getAttribute("exclude") != null ? request.getAttribute("exclude") : "" %></p>
        <p class="text-center"><strong>結果:</strong><br/> <%= request.getAttribute("result") != null ? request.getAttribute("result") : "" %></p>

        <div class="text-center">
            <a href="lottery" class="btn btn-primary btn-custom">Play again</a>
            <a href="index" class="btn btn-primary btn-custom">回首頁</a> <!-- 將 btn-link 改為 btn-primary -->
        </div>
    </div>

    <!-- 引入 Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
