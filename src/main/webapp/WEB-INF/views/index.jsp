<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HomeWork3</title>
    <link href="<%= request.getContextPath() %>/styles/myStyle.css" rel="stylesheet">
    <!-- 引入 Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-5 text-center">Welcome To The Game!</h1>

      

        <div class="text-center mt-4">
            <p><a class="btn btn-primary" href="lottery">Lottery Game</a></p>
            <p><a class="btn btn-primary" href="guess">Guess Number Game!</a></p>
            <p>
                <form action="logout" method="get" style="display:inline;"> <!-- GET方法 -->
                    <button type="submit" class="btn btn-danger">Logout</button>
                </form>
            </p>
        </div>
    </div>

    <!-- 引入 Bootstrap JS  -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>