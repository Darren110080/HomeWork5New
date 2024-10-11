<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.jsp.HttpJspPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- 引入 Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .error-message {
            color: red; 
            text-align: center; 
        }
        .success-message {
            color: green; 
            text-align: center; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mt-5">Login</h1>

        <% 
            // 獲取屬性
            String errorMessage = (String) request.getAttribute("error");

            // 顯示錯誤
            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
            <div class="alert alert-danger error-message" role="alert">
                <%= errorMessage %>
            </div>
        <%
            }
        %>

        <div class="row justify-content-center">
            <div class="col-md-4">
                <form action="<%= request.getContextPath() %>/login" method="post" class="mt-3">
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" class="form-control" id="username" name="username" required />
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" required />
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Login</button>
                </form>
                <p class="text-center mt-2">Don't have an account? <a href="register">Register here</a></p>
                <p class="text-center mt-2">Prefer AJAX login? <a href="loginAjax">Try here</a></p>
            </div>
        </div>
    </div>

    <!-- 引入 Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
