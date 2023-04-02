<%-- 
    Document   : create
    Created on : Apr 1, 2023, 10:58:05 PM
    Author     : toan0
--%>

<%@page import="dto.UserErrorHandler"%>
<%@page import="dto.UserErrorHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        UserErrorHandler userError = (UserErrorHandler)request.getAttribute("USER_ERROR");
        if(userError==null) userError = new UserErrorHandler();
        %>
        <form action="MainController" method="POST">
           
                            <label>User Name</label>
                           <input type="text"  name="userID"  />
                          
                      
                          
                     
                            <label>Full Name</label>
                            <input type="text"  name="fullName" />
                     
                         
                            <label>Role ID</label>
                            <input type="text"  name="roleID" value="US" readonly/>
                       
                  
                            <label>Password</label>
                            <input type="password" name="password"  />
                    
                        
                      
                            <label>Confirm Password</label>
                            <input type="password"  name="confirm_password" />
      
                <!--<button class="save-button" name="action" value="save"><i class="fas fa-save"></i> Save</button>-->
                <input type="submit" name="action"  value="Create"/>

        </form>
       <%= userError %>
      
    </body>
    </body>
</html>
