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
        <link href='https://unpkg.com/css.gg@2.0.0/icons/css/trash.css' rel='stylesheet'>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <body>
        <h1 style="text-align: center">Welcome to Administration Page </h1>  
        <%
            User user = (User) session.getAttribute("user");
            List<User> list = (List<User>) request.getAttribute("list");
            String searchValue = (String) request.getAttribute("search");
            if (searchValue == null) {
                searchValue = "";
            }
        %>
        <form action="MainController">
            <input type="submit" value="Logout" name="action" />

        </form><br>
        <form action="MainController">
            Search <input type="text" name="search" value="<%= searchValue%>" />
            <input type="submit" value="Search" name="action" />

        </form><br>
        <%

            if (list != null) {

                if (!list.isEmpty()) {

        %>



        <table class="styled-table">
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

                <%                    int count = 0;
                    for (User o : list) {
                %>
            <form action="MainController">
                <tr>
                    <td><%= ++count%></td>
                    <td><%= o.getUserID()%></td>
                    <td> <input type="text" name="fullName" value="<%= o.getFullName()%>" /> </td>
                    <td><input type="text" name="password" value="<%= o.getPassword()%>" /> </td>
                    <td><input type="text" name="roleID" value="<%= o.getRoleID()%>" /> </td>
                    <td >
                        <a onclick="deletePost(event)" href="MainController?action=Delete&userID=<%= o.getUserID()%>&seach=<%= searchValue %>"> <i style="margin-left: 1.8rem" class="gg-trash"></i></a>


                    </td>    
                    <td>

                        <input type="submit" value="Update" name="action" />
                        <input type="hidden" name="userID" value="<%= o.getUserID()%>" />
                        <input type="hidden" name="search" value="<%= searchValue%>" />

                    </td>
                </tr>   
            </form>
            <%
                }
            } else {
            %>
            <h2>No result</h2>
            <%
                    }
                }
            %>


        </tbody>
    </table>
    <script>
        function deletePost(event) {
            // Get a reference to the button element
            event.preventDefault();
            var confirmed = confirm("Are you sure you want to delete?");
            if (confirmed) {
                // continue with the default action (i.e. follow the href link)
                window.location.href = event.currentTarget.getAttribute("href");
            } else {
                //do nothing

            }
        }
    </script>
</body>
</html>
