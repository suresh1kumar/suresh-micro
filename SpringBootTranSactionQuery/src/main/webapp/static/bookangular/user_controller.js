'use strict';

angular.module('myApp').controller('UserController', ['$scope', 'UserService', function($scope, UserService) {
    alert("controller33");
	var self = this;
   // self.user={id:null,username:'',address:'',email:''};
	//userId,userName,bookingDate,sourceStation,destStation,email
    self.user={userId:null,userName:'',bookingDate:'',sourceStation:'',destStation:'',email:''};
    self.users=[];

    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;

    
    $scope.addModal = function() {
    //function addModal(){ 
    	alert("model----------------11");
		//$scope.users_form = angular.copy($scope.master);
    	self.user = angular.copy($scope.master);
    	alert("model----------------22::"+self.user);
		//self.user = angular.copy(self.users[i]);master
        //$scope.form_name = 'Add New User Information!!';
    	//self.user = angular.copy(self.users[i]);
    	$('#btnTest').click(function() {
    		$('#form_modal').modal('show');
    	});
    }
    

    fetchAllUsers();

    function fetchAllUsers(){
        UserService.fetchAllUsers()
            .then(
            function(d) {
                self.users = d;
            },
            function(errResponse){
                console.error('Error while fetching Users');
            }
        );
    }

    function createUser(user){
    	alert("controller create User >>");
        UserService.createUser(user)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while creating User');
            }
            //$('#form_modal').modal('hide');
        );
    }

    function updateUser(user, userId){
    	alert("controller updateUser >>ssssssssss::00"+userId);
    	
        UserService.updateUser(user, userId)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while updating User');
            }
            //$('#form_modal').modal('hide');
        );
    }

    function deleteUser(userId){
        UserService.deleteUser(userId)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while deleting User');
            }
        );
    }

    function submit() {
    	alert("new submit..........");
    	alert("controller updateUser ssssssss22>>::"+self.user.userId);
        if(self.user.userId==undefined){
        	//$('#form_modal').modal('show');undefined
        	//alert("controller updateUsersssssssss 11>>::"+userId);
            console.log('Saving New User', self.user);
            createUser(self.user);
            $('#form_modal').modal('hide');
        }else{
        	//alert("controller updateUser ssssssss22>>::"+userId);
            updateUser(self.user, self.user.userId);
            console.log('User updated with id ', self.user.userId);
            $('#form_modal').modal('hide');
        }
        reset();
    }

    function edit(userId){
    	alert(" edit() controller updateUser sssssssss33>>::"+userId);
    	$('#form_modal').modal('show');
       // console.log('id to be edited', userId);
        for(var i = 0; i < self.users.length; i++){
            if(self.users[i].userId === userId) {
                self.user = angular.copy(self.users[i]);
                break;
            }
        }
    }

    function remove(userId){
        console.log('userId to be deleted', userId);
        if(self.user.userId === userId) {//clean form if the user to be deleted is shown there.
            reset();
        }
        deleteUser(userId);
    }


    function reset(){
        self.user={userId:null,username:'',address:'',email:''};
        $scope.myForm.$setPristine(); //reset Form
    }

}]);