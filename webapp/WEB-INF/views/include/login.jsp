<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../include/pluginpage.jsp"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            width: 400px;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .login-container h1 {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .login-container label {
            display: block;
            margin-bottom: 10px;
            font-size: 20px;
            font-weight: bold;
        }
        .login-container input {
            width: 100%;
            padding: 14px;
            margin-bottom: 25px;
            font-size: 18px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .login-container button {
            width: 100%;
            padding: 14px;
            font-size: 20px;
            font-weight: bold;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .login-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h1>로그인</h1>
    
    <label for="username">아이디</label>
    <input type="text" id="username" placeholder="아이디를 입력하세요" required>
    
    <label for="password">비밀번호</label>
    <input type="password" id="password" placeholder="비밀번호를 입력하세요" required>
    
    <button id="loginButton">로그인</button>
</div>

<script>
$(document).ready(function() {
    $("#loginButton").on("click", function() {
        var username = $("#username").val();
        var password = $("#password").val();

        if (!username || !password) {
            alert("아이디와 비밀번호를 입력하세요.");
            return;
        }

        console.log("아이디:", username);
        console.log("비밀번호:", password);

        $.ajax({
            url: "/donghwa/login/check", // AJAX 요청을 보낼 URL
            type: "POST",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify({
                username: username,
                password: password
            }),
            success: function(response) {
                // 서버에서 반환된 메시지 확인
                if (response.message === "로그인 성공") {
                    alert("로그인 성공");
                    window.location.href = "/donghwa"; // 로그인 성공 시 리다이렉트
                } else {
                    alert("로그인 실패: " + response.message);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert("로그인 실패: 아이디 또는 비밀번호를 확인하세요.");
            }
        });
    });
});

</script>

</body>
</html>
