<%-- 
    Document   : admin
    Created on : Mar 27, 2023, 6:03:44 PM
    Author     : toan0
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Administration Page</title>
<!--        Link file css External-->
        <link rel="stylesheet" href="css/admincss.css"> 
        <link href='https://unpkg.com/css.gg@2.0.0/icons/css/trash.css' rel='stylesheet'>
        <!-- Font here -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700&amp;display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Kaushan+Script&amp;display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme&amp;display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aladin&amp;display=swap">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<!--        Link JS file External-->
        <script src="js/admin.js"></script>
        

    </head>
</head>
<body>

    <!-- Header here -->
<!--    <div class="navbar" style="position: fixed">
        <div id="logo">
            <a href="<c:url value="/"/>"
               ><img
                    src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Remove_bg_logo.png?raw=true"
                    alt="MonkeTech"
                    />Administration Page</a>
        </div>
        <div class="header-info">
            <ul>
                <li><a href="<c:url value="/"/>">Home</a></li>
                <li><a href="#service">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <div class="account">
                    

                    
                        <li>

                            <a href="#">${sessionScope.user.fullName}</a>
                            <ul>
                                <li><a href="<c:url value="/account"/>">My Profile</a></li>
                                <li><a href="<c:url value="/job/viewMyJob"/>">My Applications</a></li>
                                <li><a href="<c:url value="/logout"/>">Logout</a></li>
                            </ul>
                        </li>
                    </sec:authorize>    
                </div>

            </ul>
        </div>
    </div>-->


    <%
        User user = (User) session.getAttribute("user");
        List<User> list = (List<User>) request.getAttribute("list");
        String searchValue = (String) request.getAttribute("search");
        if (searchValue == null) {
            searchValue = "";
        }
    %>
    <div class="container">
        <h1>Welcome to Administration Page</h1>
         <form action="MainController">
        <input type="submit" value="Logout" name="action" />
         </form>
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
                    <a onclick="deletePost(event)" href="MainController?action=Delete&userID=<%= o.getUserID()%>&seach=<%= searchValue%>"> <i style="margin-left: 1.8rem" class="gg-trash"></i></a>


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
    </div>

</body>
</html>
