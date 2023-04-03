<%-- 
    Document   : Menu
    Created on : Apr 3, 2023, 11:20:42 PM
    Author     : toan0
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="MainController?action=Logout">Shoes</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">

                <li class="nav-item">
                    <p class="nav-link" >
                <c:if test="${sessionScope.userGG.name!=null}">
                    <a class="nav-link" style="font-size: 16px"> ${sessionScope.userGG.name} </a>
                </c:if>
                <c:if test="${sessionScope.user != null && sessionScope.userGG.name==null}">
                    <a class="nav-link" style="font-size: 16px"> ${sessionScope.user.getFullName()}</a>
                </c:if>
               

                </p>
                </li>
            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="show">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <span class="badge badge-light">3</span>
                </a>
            </form>
            <div class="logout-button">
                <form id="logout-form" action="MainController">
                    <input type="submit" value="Logout" name="action" />
                </form>
            </div>
        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Siêu thị giày chất lượng cao</h1>
        <p class="lead text-muted mb-0">Uy tín tạo nên thương hiệu với hơn 10 năm cung cấp các sản phầm giày nhập từ Trung Quốc</p>
    </div>
</section>
<!--end of menu-->
