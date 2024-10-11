<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lottery Game</title>
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
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Welcome To Lottery Game!</h1>
        <form action="<%= request.getContextPath() %>/lottery" method="post">
            <div class="form-group">
                <label for="group">組數</label>
                <input type="text" class="form-control" id="group" name="group" value="<%= request.getAttribute("group") != null ? request.getAttribute("group") : "" %>" required />
            </div>
            <div class="form-group">
                <label for="exclude">排除</label>
                <input type="text" class="form-control" id="exclude" name="exclude" value="<%= request.getAttribute("exclude") != null ? request.getAttribute("exclude") : "" %>" required />
            </div>
            <button type="reset" class="btn btn-secondary btn-custom">Reset</button>
            <button type="submit" class="btn btn-primary btn-custom">Submit</button>
        </form>
        <div class="text-center mt-3">
            <a href="index" class="btn btn-primary btn-custom">回首頁</a> <!-- 將 btn-link 改為 btn-primary -->
        </div>
    </div>

    <!-- 引入 Bootstrap JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
