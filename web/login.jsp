<%-- 
    Document   : login
    Created on : Mar 27, 2023, 5:48:28 PM
    Author     : toan0
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/logincss.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

    </head>
    <body>
    <c:if test="${ERROR != null}">
        <p>${ERROR}</p>
    </c:if>
    <div class="login-form">
        <h1>LOGIN</h1>
        <form action="MainController" method="POST">
            <div class="login-with-acc">
                <div class="txt_field">
                    <input type="text" name="username" required />
                    <span></span>
                    <label>Username</label>
                </div>
                <div class="txt_field">
                    <input type="text" name="password" required />
                    <span></span>
                    <label>Password</label>

                </div>

                <button id="login-btn" name="action" value="Login">Login</button>
                <div class="signup_link">
                    Haven't an account yet?
                    <a href="#">Signup</a>
                </div>
            </div>
        </form>



    </div>


</body>
</html>
