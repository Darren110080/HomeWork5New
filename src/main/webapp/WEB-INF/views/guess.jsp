<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guess Number Game</title>
    <!-- 引入 Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/styles/myStyle.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa; /* 背景色 */
        }
        .container {
            margin-top: 50px;
            background-color: white; /* 表单背景色 */
            padding: 30px; /* 内边距 */
            border-radius: 5px; /* 圆角 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 阴影效果 */
        }
        .message {
            color: red; /* 错误消息红色 */
            text-align: center; /* 置中对齐 */
        }
        .success-message {
            color: green; /* 成功消息绿色 */
            text-align: center; /* 置中对齐 */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Welcome To Guess Number Game!</h1>
        <h2 class="text-center">請輸入數字1~10</h2>

        <%
            Integer remains = (Integer) session.getAttribute("remains");
            if (remains != null) {
        %>
            <h3 class="text-center">你還有 <%= remains %> 次機會</h3>
        <%
            }
        %>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null && !message.isEmpty()) {
        %>
            <div class="message">
                <h3><%= message %></h3>
            </div>
        <%
            }
        %>

        <form action="<%= request.getContextPath() %>/guess" method="post" class="text-center">
            <div class="form-group">
                <label for="guessNumber">你猜的數字</label>
                <input type="text" class="form-control" id="guessNumber" name="group" required />
            </div>
            <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </form>
        <div class="text-center">
            <a href="index" class="btn btn-primary btn-custom">回首頁</a> <!-- 將 btn-link 改為 btn-primary -->
        </div>
    </div>

    <!-- 引入 Bootstrap JS 和依赖项 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
