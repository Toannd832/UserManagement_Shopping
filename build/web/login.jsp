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
        <title>Login Page</title>
        <link rel="stylesheet" href="css/logincss.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

    </head>
    <body>
    <c:if test="${ERROR != null}">
        <p>${ERROR}</p>
    </c:if>
    <div class="login-form">
        <h1>LOGIN PAGE</h1>
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
                    <a href="createuser.jsp">Signup</a>
                </div>
                <div class="login-with-google">
                    <div class="left"><h3>Login G-mail FOR USER </h3>
                        <a data-turbo="false" id="gplus-signin" rel="nofollow" class="d-flex justify-content-center" data-method="post" href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/UserManagerment/LoginGoogleServlet&response_type=code
                           &client_id=59079633289-dce6j1nu4mev40qe097ih8eh2o0j30eb.apps.googleusercontent.com&approval_prompt=force"><i class="fa-brands fa-google-plus-g"></i></a></div>

                    <div class="right"><h3 style="margin-left: 9rem">Login G-mail FOR ADMIN</h3>
                        <a href="#"><i class="fa-brands fa-google-plus-g"></i></a></div>
                    <div class="sign-in-button gplus button">
                    </div>
                    </form>

                </div>


                </body>
                </html>
