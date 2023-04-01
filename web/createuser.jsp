<%-- 
    Document   : createuser
    Created on : Mar 31, 2023, 3:32:20 PM
    Author     : toan0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User Page</title>
        <link rel="stylesheet" href="css/createpage.css">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <form action="MainController" method="POST">
            <div class="container">
                <div class="box">
                    <div class="header">
                        <h2>Create Account Information</h2>
                        <div class="actions">
                            <button class="edit-button"><i class="fa-solid fa-user-pen"></i></button>
                        </div>
                    </div>
                    <div class="content">
                        <div class="form-group">
                            <label>User Name</label>
                           <input type="text" id="phone" name="userID" required="true" />
                        </div>
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" id="full-name" name="fullName" value="" required="true"/>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" id="email" name="password" value="" required="true"/>
                        </div>
                        <div class="form-group">
                            <label>Confirm Password</label>
                            <input type="password" id="phone" name="confirm_password" required="true"/>
                        </div>
                    </div>
                </div>
               
                <!--<button class="save-button" name="action" value="save"><i class="fas fa-save"></i> Save</button>-->
                <button name="action" value="Create" class="save-button"><i class="fas fa-save"></i> Create</button>
                     <div class="signup_link">         
                    <a href="login.jsp">Login Page</a>
                </div>
        </form>
        
    </body>
</html>
