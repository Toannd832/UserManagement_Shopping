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
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        <h2>Account Information</h2>
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
    <style>
        img{
            width: 200px;
            height: 120px;
        }
    </style>
    <div class="product-management">

        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage <b>Product</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                        <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>
                            <span class="custom-checkbox">
                                <input type="checkbox" id="selectAll">
                                <label for="selectAll"></label>
                            </span>
                        </th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${LIST_PRODUCT}" var="o">
                        <tr>
                            <td>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                    <label for="checkbox1"></label>
                                </span>
                            </td>
                            <td>${o.id}</td>
                            <td>${o.name}</td>
                            <td>
                                <img src="${o.image}">
                            </td>
                            <td>${o.price} $</td>
                            <td>
                                <a href="#editEmployeeModal"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="clearfix">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Edit Modal HTML -->
    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="MainController" method="post">
                    <div class="modal-header">						
                        <h4 class="modal-title">Add Product</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">					
                        <div class="form-group">
                            <label>Name</label>
                            <input name="name" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input name="image" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input name="price" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Title</label>
                            <textarea name="title" class="form-control" required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea name="description" class="form-control" required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Category</label>
                            <select name="category" class="form-select" aria-label="Default select example">
                                <c:forEach items="${LIST}" var="o">
                                    <option value="${o.cid}">${o.cname}</option>
                                </c:forEach>
                            </select>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" name="action" class="btn btn-success" value="Add">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Edit Modal HTML -->
    <div id="editEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form>
                    <div class="modal-header">						
                        <h4 class="modal-title">Edit Employee</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">					
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <textarea class="form-control" required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Phone</label>
                            <input type="text" class="form-control" required>
                        </div>					
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-info" value="Save">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Delete Modal HTML -->
    <div id="deleteEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form>
                    <div class="modal-header">						
                        <h4 class="modal-title">Delete Product</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">					
                        <p>Are you sure you want to delete these Records?</p>
                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-danger" value="Delete">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>
