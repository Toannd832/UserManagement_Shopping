<%-- 
    Document   : user
    Created on : Mar 27, 2023, 6:03:55 PM
    Author     : toan0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>Hello ${sessionScope.user.name}!</h1>
    </body>
</html>
