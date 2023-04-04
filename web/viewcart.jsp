<%-- 
    Document   : viewcart
    Created on : Apr 4, 2023, 10:28:00 PM
    Author     : toan0
--%>

<%@page import="dto.ProductOrder"%>
<%@page import="dto.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/userpage.css" rel="stylesheet" type="text/css"/>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
            .styled-table thead tr {
    background-color: #009879;
    color: #fff;
    text-align: left;

}

.styled-table th{
    font-size: 2rem;
    font-weight: bold;
    padding: 1rem 2rem;
    text-align: left;
    font-size: 1.5rem;
}

.styled-table td {
    padding: 1rem 2rem;
    font-size: 1.5rem;
    text-align: left;
}


.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
        </style>
    </head>>
    <body>

        <jsp:include page="Menu.jsp"></jsp:include>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
        %>
        <table class="styled-table">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>id</th>
                    <th>quantity</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (ProductOrder p : cart.getCart().values()) {
                %>
                <tr>
                    <td><%= count++%></td>
                    <td><%= p.getProductid()%></td>
                    <td><%= p.getQuantity()%></td>
                </tr>        
                <%
                    }
                %>    


            </tbody>
        </table>

    </body>
</html>
