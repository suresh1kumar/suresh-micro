'use strict';

angular.module('myApp').factory('UserService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'http://localhost:8030/SpringmvcRestapiAngularApp/user/';
    var getAllBookss = "getAllBooks";
    var addBooks ="addBook";
    var updateBooks ="updateBook/";
    alert("service");
    var factory = {
        fetchAllUsers: fetchAllUsers,
        createUser: createUser,
        updateUser:updateUser,
        deleteUser:deleteUser
    };

    return factory;

    function fetchAllUsers() {
        var deferred = $q.defer();
        alert("deferred_____11::");
        alert("deferred_____22::"+deferred);
        $http.get(getAllBookss)
            .then(
            function (response) {
                deferred.resolve(response.data);
                alert("response.data ::"+response.data.id);
            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function createUser(user) {
    	alert("service createUser >>");
    	alert("user :"+user);
        var deferred = $q.defer();
        $http.post(addBooks, user)
            .then(
            function (response) {
            	alert("Add response.data ::"+response.data);
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }


    function updateUser(user, id) {
    	alert("service updateUser >>");
    	alert("service updateUser >>"+id);
    	alert("service updateUser >>::"+updateBooks+id);
        var deferred = $q.defer();
        $http.put(updateBooks+id, user)
            .then(
            function (response) {
            	alert("update response.data ::"+response.data);
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function deleteUser(id) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI+id)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

}]);