<%@page import="purelypink.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <c:url value="/resources/images" var="img" />
    <c:url value="/resources/bootstrap/js" var="bjs" />
    <c:url value="/resources/bootstrap/css" var="bcss" />
<head>


    <title>Purely Pink</title>

    
    <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/bootstrap/css/landing-page.css" rel="stylesheet">

    <script src="${bjs}/angular.min.js"></script>
    <link href="resources/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<script type="text/javascript">
    angular.module('sortApp', [])
    .controller('mainController', function($scope)
    		{
      // create the list  
      $scope.dress = <%=request.getAttribute("productList")%>
    });    
    </script>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav" href="#">Purely Pink</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#aboutus">Who we are</a>
                    </li>
                            <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="products">What We Offer
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="products">Dresses</a></li>
          <li><a href="products">Jewellery</a></li>
          <li><a href="products">Bags</a></li> 
        </ul>
      </li> <li>
                        <a href="contactus">Ring to Us</a>
                    </li>
                     <li>
                        <a href="register">Register with Us</a>
                    </li>
                    
                     <li>
                        <a href="login">Welcome Back--SignIn</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>


    <!-- Header -->
    <!-- /.intro-header -->
     <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.min.js"></script>
   <!--   <script src="resources/bootstrap/js/ptable.js"></script>-->
</head>
<body>
    <c:url value="D:\apache-tomcat-8.0.33-windows-x64\apache-tomcat-8.0.33\tmpFiles" var="pdimg" />
        <div class="container">
                        <h3>Be Pretty in Pink</h3>                       
         </div>
     <div class="container" ng-app = "cartApp">
            <div class="row">
                <div class="col-md-5">
                    <img src="<c:url value="/resources/images/${product.productId}.png" />" alt="image" style="width:100%"/>
                </div>
                <div class="col-md-5">
                    <h3>${product.productName}</h3>
                    <p>${product.productDescription}</p>
                    <p><strong>Manufacturer</strong>: ${product.productManufacturer}</p>
                    <p><strong>Category</strong>: ${product.productCategory}</p>
                    <p><strong>Condition</strong>: ${product.productCondition}</p>
                    <p>${product.productPrice} USD</p>
                    <br/>
                    <c:set var = "role" scope="page" value="${param.role}" />
                    <c:set var = "url" scope="page" value="/product/productList" />
                    <c:if test="${role='admin'}">
                        <c:set var="url" scope="page" value="/admin/productInventory" />
                    </c:if>
                    <p ng-controller="cartCtrl">
                        <a href="<c:url value = "${url}" />" class="btn btn-default">Back</a>
                       <a href="#" class="btn btn-warning btn-large" ng-click="addToCart('${product.productId}')"><span class="glyphicon glyphicon-shopping-cart"></span> Order Now</a>                        
                        <a href="<spring:url value="/cart" />" class="btn btn-default"><span class="glyphicon glyphicon-hand-right"></span> View Cart</a>
                    </p>
                </div>
            </div>
        </div>


<!-- My -->
<script src="<c:url value="/resources/js/controller.js?v3" /> "></script>

    <div>
    <form action="cartFlow">
    <input type="hidden" value=${product.productName} name="productName"/>
        <input type="hidden" value=${product.productDescription} name="productDescription"/>
        <input type="hidden" value=${product.productManufacturer} name="productManufacturer"/>
        <input type="hidden" value=${product.productCategory} name="productCategory"/>
          <input type="hidden" value=${product.productCondition} name="productCondition"/>
          <input type="hidden" value=${product.productPrice} name="productPrice"/>     
        <input type="text" name="quantity"/>
   <!--<a href="cartFlow">--><input type="submit" value="Add to Cart"><!--</a>-->
    </form>
    </div>
 <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="aboutus">About</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="products">Services</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="contactus">Contact</a>
                        </li>
                    </ul>
                    <p class="copyright text-muted small">Copyright &copy; PurelyPink 2016. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>