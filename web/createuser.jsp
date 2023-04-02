<%-- 
    Document   : createuser
    Created on : Mar 31, 2023, 3:32:20 PM
    Author     : toan0
--%>

<%@page import="dto.User"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserErrorHandler"%>
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
        <%
            UserErrorHandler userError = (UserErrorHandler) request.getAttribute("USER_ERROR");
            User user = (User) request.getAttribute("user");
            if(user==null) user = new User();
            if (userError == null) {
                userError = new UserErrorHandler();
            }
        %>

        <form action="MainController" method="POST">
            <div class="container">
                <%= user.getUserID() %>
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
                            <input type="text"  name="userID" required="true" />

                        </div>

                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text"  name="fullName" required="true"/>
                        </div>
                        <div class="form-group">
                            <label>Role ID</label>
                            <input type="text"  name="roleID" value="US" readonly/>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password"  required="true"/>
                        </div>

                        <div class="form-group">
                            <label>Confirm Password</label>
                            <input type="password"  name="confirm_password" required="true"/>
                        </div>
                    </div>
                </div>

                <!--<button class="save-button" name="action" value="save"><i class="fas fa-save"></i> Save</button>-->
                <button name="action"  onclick="confirmCreate(event)" value="Create" class="save-button"><i class="fas fa-save"></i> Create</button>
                <div class="signup_link">         
                    <a href="login.jsp">Login Page</a>
                </div>
        </form>
        <%= userError%>

    </body>
    <script>
        function confirmCreate(event) {
            var userIdInput = document.querySelector('input[name="userID"]');
            var userID = '<%= user.getUserID()%>';
             var userIdError = '<%= userError.getUserIDError() %>';

            // kiểm tra sự trùng lặp với các userID trong mảng users            
                if (userIdInput.value === userID) {
                    alert(userIdError);
                    event.preventDefault();
                    return false;
                
            }

            // ...
        }
    </script>
</html>
