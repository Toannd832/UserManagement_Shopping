<%-- 
    Document   : admin
    Created on : Mar 27, 2023, 6:03:44 PM
    Author     : toan0
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Administration Page</title>
        <link rel="stylesheet" href="css/admincss.css">
    </head>
    <body>
        <%
            String username = (String) session.getAttribute("user");
            List<User> list = (List<User>) request.getAttribute("list");
            String searchValue = (String) session.getAttribute("search");
            if (list == null) {
                list = new ArrayList<>();
            }

            if (username != null) {
        %>
        <h1 style="text-align: center">Welcome to Administration Page </h1>      
        <%
            }
        %>
        <form action="MainController">
            Search <input type="text" name="search" value="<%= searchValue%>" />
            <input type="submit" value="Search" name="action" />
        </form><br>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>User Id</th>
                    <th>Full Name</th>
                    <th>Password</th>
                    <th>Role ID</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    for (User o : list) {
                %>
                <tr>
                    <td><%= ++count%></td>
                    <td><%= o.getUserID()%></td>
                    <td><%= o.getFullName()%></td>
                    <td><%= o.getPassword()%></td>
                    <td><%= o.getRoleID()%></td>
                    <td><%= o.getRoleID()%></td>
                    <td><%= o.getRoleID()%></td>
                </tr>     
                <%
                    }
                %>


            </tbody>
        </table>

    </body>
</html>
