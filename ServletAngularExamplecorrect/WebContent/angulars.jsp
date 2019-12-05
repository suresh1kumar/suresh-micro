<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html lang="en" ng-app="angularTable"> -->
<html  ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
 <script  src="https://cdnjs.cloudflare.com/ajax/libs/angular-resource/1.7.3/angular-resource.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>  -->
 <!-- <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.11.0.js"></script> -->
 
 
  <script data-require="angular.js@1.1.5" data-semver="1.1.5" src="http://code.angularjs.org/1.1.5/angular.min.js"></script>
    <link data-require="bootstrap-css@2.3.2" data-semver="2.3.2" rel="stylesheet" href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" />
    <script data-require="angular-ui-bootstrap@0.3.0" data-semver="0.3.0" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.3.0.min.js"></script>
 
 <script src="app.js"></script>
 <script type="text/javascript">
 var app = angular.module('myApp', ['ui.bootstrap']);

 app.controller('ListController', function($scope){
 
 $scope.curPage = 1,
 $scope.itemsPerPage = 3,
 $scope.maxSize = 5;
   
   this.items = itemsDetails;
 
 
 $scope.numOfPages = function () {
   return Math.ceil(itemsDetails.length / $scope.itemsPerPage);
   
 };
 
   $scope.$watch('curPage + numPerPage', function() {
   var begin = (($scope.curPage - 1) * $scope.itemsPerPage),
   end = begin + $scope.itemsPerPage;
   
   $scope.filteredItems = itemsDetails.slice(begin, end);
 });
 });

 var itemsDetails = [
   { itemCode : 100,
     itemName : 'ONE',
     itemDescription : 'Hey Hie',
     uom : 'FEET',
     available : 'YES',
     openStock : 7,
     restrictStock : 16,
     threshold : 0,
     active : 'YES'
     },
   { itemCode : 102,
     itemName : 'TWO',
     itemDescription : 'Hey Hie',
     uom : 'GALLONS',
     available : 'YES',
     openStock : 8,
     restrictStock : 15,
     threshold : 0,
     active : 'YES'
     },
   { itemCode : 103,
     itemName : 'THREE',
     itemDescription : 'Hey Hie',
     uom : 'GALLONS',
     available : 'YES',
     openStock : 0,
     restrictStock : 15,
     threshold : 0,
     active : 'YES'
     },
   { itemCode : 104,
     itemName : 'FOUR',
     itemDescription : 'Hey Hie',
     uom : 'FEET',
     available : 'YES',
     openStock : 0,
     restrictStock : 15,
     threshold : 0,
     active : 'YES'
     },
   { itemCode : 105,
     itemName : 'FIVE',
     itemDescription : 'Hey Hie',
     uom : 'FEET',
     available : 'YES',
     openStock : 0,
     restrictStock : 14,
     threshold : 0,
     active : 'YES'
     },
   { itemCode : 106,
     itemName : 'SIX',
     itemDescription : 'Hey Hie',
     uom : 'FEET',
     available : 'YES',
     openStock : 0,
     restrictStock : 5,
     threshold : 0,
     active : 'YES'
     },
   { itemCode : 107,
     itemName : 'SEVEN',
     itemDescription : 'Hey Hie',
     uom : 'GALLONS',
     available : 'YES',
     openStock : 0,
     restrictStock : 5,
     threshold : 0,
     active : 'YES'
     },
   { itemCode : 108,
     itemName : 'EIGHT',
     itemDescription : 'Hey Hie',
     uom : 'FEET',
     available : 'YES',
     openStock : 5,
     restrictStock : 0,
     threshold : 0,
     active : 'YES'
     },
   { itemCode : 109,
     itemName : 'NINE',
     itemDescription : 'Hey Hie',
     uom : 'GALLONS',
     available : 'YES',
     openStock : 5,
     restrictStock : 0,
     threshold : 0,
     active : 'YES'
     },
   { itemCode : 110,
     itemName : 'TEN',
     itemDescription : 'Hey Hie',
     uom : 'FEET',
     available : 'YES',
     openStock : 77,
     restrictStock : 0,
     threshold : 0,
     active : 'YES'
     }
 ];

 </script>
</head>
<body  ng-controller="ListController as list">
    
   
      <table border=1>
        <thead>
          <tr>
          <th>ITEM CODE</th>
          <th>ITEM NAME</th>
          <th>ITEM DESCRIPTION</th>
          <th>UNIT OF MEASURE</th>
          <th>AVAILABLE</th>
          <th>OPEN STOCK</th>
          <th>RESTRICT STOCK</th>
          <th>THRESHOLD</th>
          <th>ACTIVE</th>
          </tr>
        </thead>
        <tr ng-repeat="item in filteredItems">
        <td> {{item.itemCode}} </td>
        <td> {{item.itemName}} </td>
        <td> {{item.itemDescription}} </td>
        <td> {{item.uom}} </td>
        <td> {{item.available}} </td>
        <td> {{item.openStock}} </td>
        <td> {{item.restrictStock}} </td>
        <td> {{item.threshold}} </td>
        <td> {{item.active}} </td>
        </tr>
        </table>
        <div data-pagination="" data-num-pages="numOfPages()" 
		      data-current-page="curPage" data-max-size="maxSize"  
		      data-boundary-links="true">
      </div>
  </body>
</html>