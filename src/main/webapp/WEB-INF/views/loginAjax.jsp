<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login with AJAX</title>
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
        <h1 class="text-center mt-5">Login with AJAX</h1>

        <div class="row justify-content-center">
            <div class="col-md-4">
                <form id="loginForm" class="mt-3">
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
                <p class="text-center mt-2">Prefer classic login? <a href="login">Try here</a></p>
                <div id="message" class="error-message"></div>
            </div>
        </div>
    </div>

    <script>
    document.getElementById("loginForm").addEventListener("submit", function(event) {
        event.preventDefault(); // 防阻表單提交

        
        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;

        fetch("<%= request.getContextPath() %>/loginAjax", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "X-Requested-With": "XMLHttpRequest"
            },
            body: JSON.stringify({ username, password })
        })
        .then(response => {
            // 檢查是否為JSON響應
            const contentType = response.headers.get("content-type");
            console.log(contentType);
            if (contentType && contentType.includes("application/json")) {
            	
                return response.json(); // 解析JSON響應
            } else {
                throw new Error("Unexpected content type: " + contentType);
            }
        })
        .then(data => {
            if (data.success) {
                // 登陸成功，跳轉到頁面
                window.location.href = "<%= request.getContextPath() %>/index";
            } else if (data.error) {
                document.getElementById("message").textContent = data.error; // 顯示錯誤訊息
            }
        })
        .catch(error => {
            console.error('Error:', error);
            document.getElementById("message").textContent = "An error occurred during login.";
        });
    });

    </script>

    <!-- 引入 Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
