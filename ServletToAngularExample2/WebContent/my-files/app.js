var app = angular.module('PAGING', ['angularUtils.directives.dirPagination']);

app.controller('pagingController', ['$scope', '$http', function ($scope, $http) {

    $http.get('https://jsonplaceholder.typicode.com/posts').then(function (response) {
        $scope.posts = response.data;
    }, function () {
        $scope.error = "Some Error happend, Please Try Again Later!."
    });

    $http.get('https://api.github.com/users').then(function (response) {
        $scope.users = response.data;
    }, function () {
        $scope.userserror = "Some Error happend, Please Try Again Later!."
    });

}]);