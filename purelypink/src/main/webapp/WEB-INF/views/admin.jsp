<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <c:url value="/resources/bootstrap/img" var="img" />
    <c:url value="/resources/bootstrap/js" var="bjs" />
    <c:url value="/resources/bootstrap/css" var="bcss" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD A PRODUCT</title>
<link href="${bcss}/bootstrap.min.css" rel="stylesheet">
   <script src="${bjs}/jquery-2.1.1.min.js"></script>
    <script src="${bjs}/bootstrap.min.js"></script>
    <script src="${bjs}/angular.min.js"></script>
    
      <script>
        var myApp=angular.module('myApp', [])

        myApp.controller('jsonCtrl', function($scope,$http) {

        	 
        	        $scope.dress = <%=request.getAttribute("productList")%>;
        	        $scope.myFunction = function() {
        	        	$scope.dress = <%=request.getAttribute("productList")%>;
        	        	$scope.pdctID=dress.pdctID;
        	        	$scope.category=dress.category;
        	        	$scope.brand=dress.brand;
        	        	$scope.price=dress.price;
        	        	}
        	        
        	      
        });
        </script>
<div style="height: 50px"></div>
<div class="container text-center" style="width: 500px">

<form:form action="addnewproduct" commandName="product" modelAttribute="product" method="post" class="form-horizontal" role="form">
<table>
    <c:if test="${!empty product.productId}">
    <tr style="padding: 10px;">
        <td>
ID        </td>
        <td>
            <form:input path="productId" readonly="true" size="8"  disabled="true" ng-model="pid" class="form-control"/>
           	<form:hidden path="productId" />
        </td> 
         <td><form:errors path="productId" cssStyle="color: #c0392b;"/></td>
    </tr>
    </c:if>
    <tr>
        <td>
            productName
        </td>
        <td>
            <form:input path="productName" ng-model="productName" class="form-control"/>
        </td> 
        <td><form:errors path="productName" cssStyle="color: #c0392b;"/></td>
    </tr>
    <tr>
        <td>
            productCategory        </td>
        <td>
            <form:input path="productCategory" ng-model="productCategory"  class="form-control"/>
        </td>
        <td><form:errors path="productCategory" cssStyle="color: #c0392b;"/></td>
    </tr>
        <tr>
        <td>
            productDescription
        </td>
        <td>
         <td>
            <form:input path="productDescription" ng-model="productDescription"  class="form-control"/>
        </td>
        <td><form:errors path="productDescription" cssStyle="color: #c0392b;"/></td>
        
        </tr>
        <tr>
        <td>
            productPrice
        </td>
        <td>
         <td>
            <form:input path="productPrice" ng-model="productPrice"  class="form-control"/>
        </td>
        <td><form:errors path="productPrice" cssStyle="color: #c0392b;"/></td>
        
        </tr>
        <tr>
        <td>
            productCondition
        </td>
        <td>
         <td>
            <form:input path="productCondition" ng-model="productCondition"  class="form-control"/>
        </td>
        <td><form:errors path="productCondition" cssStyle="color: #c0392b;"/></td>
        
        </tr>
      <tr>
        <td>
            productStatus
        </td>
        <td>
         <td>
            <form:input path="productStatus" ng-model="productStatus"  class="form-control"/>
        </td>
        <td><form:errors path="productStatus" cssStyle="color: #c0392b;"/></td>
        
        </tr>
        
           <tr>
        <td colspan="2">
            <c:if test="${!empty product.productCategory}">
                <button type="submit" class="btn" style="margin: 0px;width:100px; background-color: #00A2E8; color:white; text-align: center; font-size: 015x; border-radius: 0px;"
                    >Edit Product</button>
            </c:if>
            <c:if test="${empty product.productCategory}">
                <button type="submit" class="btn" style="margin: 0px;width:100px; background-color: #00A2E8; color:white; text-align: center; font-size: 015x; border-radius: 0px;"
                 >Add Product</button>
            </c:if>
        </td>
    </tr>
</table>  
</form:form>

</div>
<form action="uploadFile" method="post" enctype="multipart/form-data">
 Image to upload for the products: <input type="file" name="file"><br /> 
       Please Enter ProductID: <input type="text" name="uname"><br /> <br /> 
<button type="submit" class="btn" style="margin: 0px;width:100px; background-color: #00A2E8; color:white; text-align: center; font-size: 015x; border-radius: 0px;"
>FILE UPLOAD</button>
</form>


<div class="container" ng-app="myApp" ng-controller="jsonCtrl" style="padding-top:30px">
   
  <table class="table table-bordered table-striped">
    

    <thead>
      <tr>
         <td>
ID        </td>
        <td>
            <form:input path="productId" readonly="true" size="8"  disabled="true" ng-model="pid" class="form-control"/>
           	<form:hidden path="productId" />
        </td> 
         <td><form:errors path="productId" cssStyle="color: #c0392b;"/></td>
    </tr>
    </c:if>
    <tr>
        <td>
            productName
        </td>
        <td>
            <form:input path="productName" ng-model="productName" class="form-control"/>
        </td> 
        <td><form:errors path="productName" cssStyle="color: #c0392b;"/></td>
    </tr>
    <tr>
        <td>
            productCategory        </td>
        <td>
            <form:input path="productCategory" ng-model="productCategory"  class="form-control"/>
        </td>
        <td><form:errors path="productCategory" cssStyle="color: #c0392b;"/></td>
    </tr>
        <tr>
        <td>
            productDescription
        </td>
        <td>
         <td>
            <form:input path="productDescription" ng-model="productDescription"  class="form-control"/>
        </td>
        <td><form:errors path="productDescription" cssStyle="color: #c0392b;"/></td>
        
        </tr>
        <tr>
        <td>
            productPrice
        </td>
        <td>
         <td>
            <form:input path="productPrice" ng-model="productPrice"  class="form-control"/>
        </td>
        <td><form:errors path="productPrice" cssStyle="color: #c0392b;"/></td>
        
        </tr>
        <tr>
        <td>
            productCondition
        </td>
        <td>
         <td>
            <form:input path="productCondition" ng-model="productCondition"  class="form-control"/>
        </td>
        <td><form:errors path="productCondition" cssStyle="color: #c0392b;"/></td>
        
        </tr>
      <tr>
        <td>
            productStatus
        </td>
        <td>
         <td>
            <form:input path="productStatus" ng-model="productStatus"  class="form-control"/>
        </td>
        <td><form:errors path="productStatus" cssStyle="color: #c0392b;"/></td>
        
        </tr>
              <td>
          <a href="/editproduct">
         	Edit
          </a>
        </td>
        <td>
          <a href="/deleteproduct">
         	Delete
          </a>
        </td>
      </tr>
    </thead>
    
    <tbody>
    
      <tr ng-repeat="scop in dress | orderBy:sortType:sortReverse | filter:searchMusic">
         
        <td>{{scop.pdctID}}</td>
        <td>{{scop.category }}</td>
        <td>{{scop.brand}}</td>
        <td>{{scop.price}}</td>
       <td>
        <form action="editproduct" method="post">
      	<input type="hidden" value={{scop.pdctID}} name="pdctID"/>
        <input type="hidden" value={{scop.category}} name="category"/>
        <input type="hidden" value={{scop.brand}} name="brand"/>
        <input type="hidden" value={{scop.price}} name="price"/>
        <button type="submit" class="btn" style="margin: 0px;width:100px;  text-align: center; font-size: 015x; border-radius: 0px;"
                    >
        Edit &nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-edit"></span>
        </button>
      </form>
       </td>
       <td>
        <form action="deleteproduct" method="post">
     <input type="hidden" value={{scop.pdctID}} name="pdctID"/>
        <input type="hidden" value={{scop.category}} name="category"/>
        <input type="hidden" value={{scop.brand}} name="brand"/>
        <input type="hidden" value={{scop.price}} name="price"/>
      <button type="submit" class="btn" style="margin: 0px;width:100px; text-align: center; font-size: 015x; border-radius: 0px;"
                    >
        Delete &nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-remove"></span>
        </button>
      </form>
       </td>
      </tr>
              
    </tbody>
    
  </table>
 </div>

 </body>
</html>