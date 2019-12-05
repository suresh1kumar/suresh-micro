'use strict';

angular.module('myApp',['datatables']).factory('UserService', ['$http', '$q', function($http, $q){

    //var REST_SERVICE_URI12 = 'http://localhost:5020/SpringBootTranSactionQuery/user/';
    
    var REST_SERVICE_URI = 'http://localhost:5020/user/getUserData/';
    
   // var REST_SERVICE_URIS = 'http://localhost:5020/user/setUserData/';
    
    	
   // var getAllBookss = "getAllBooks";
   // var addBooks ="addBook";
   // var updateBooks ="updateBook/";
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
        alert("deferred_____11pppppppppppppppppppp::");
        alert("deferred_____22::"+deferred);
        alert("REST_SERVICE_URI ::"+REST_SERVICE_URI);
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
                alert("response.data ::"+response.data.userId);
            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function createUser(user) {
    	alert("service createUser >>"+REST_SERVICE_URI);
    	alert("user :"+user);
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, user)
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


    function updateUser(user, userId) {
    	alert("service updateUser11 sureshsssssssssssssssssss------->>");
    	alert("service updateUser 22>>"+userId);
    	alert("service updateUser 33>>::s:"+REST_SERVICE_URI+userId);
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+userId, user)
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

    function deleteUser(userId) {
    	alert("delete User ::"+userId);
        var deferred = $q.defer();
        if (confirm("Are you sure?")) {
        $http.delete(REST_SERVICE_URI+userId)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting User');
                deferred.reject(errResponse);
            });
        }
        return deferred.promise;
    }

}]);