<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="gray-bg">

  <div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
    
      <hr />
      <h4>Set Your Password</h4>

      <div th:if="${successMessage}" class="alert alert-success"
        role="alert" th:text=${successMessage}></div>

      <div th:if="${errorMessage}" class="alert alert-danger"
        role="alert" th:text=${errorMessage}></div>
        
      <div th:if="${invalidToken}" class="alert alert-danger"
        role="alert" th:text=${invalidToken}></div>

      <form th:if="!${invalidToken}" class="m-t" id="passwordForm" role="form" action="#"
       th:object="${setPassword}" th:action="@{/confirm}" method="post">

        <input type="hidden" name="token" th:value=${confirmationToken}  >

        <div class="form-group input-group">
          <span class="input-group-addon">
            <span class="glyphicon glyphicon-lock"></span>
          </span>
          <input name="password" type="password" id="password"  
            placeholder="Password" class="form-control" required />
          <span class="glyphicon"
            aria-hidden="true"></span>
        </div>

        <div class="form-group input-group has-feedback">
          <span class="input-group-addon">
            <span class="glyphicon glyphicon-lock"></span>
          </span>
         <input type="password" class="form-control" id="signup-password-confirm" placeholder="Confirm Password" name="ConfirmPassword" data-fv-notempty="true"
                                       data-fv-notempty-message="Please confirm password"
                                       data-fv-identical="true"
                                       data-fv-identical-field="password"
                                       data-fv-identical-message="Both passwords must be identical" />
                   
          <div class="help-block with-errors"></div>
        </div>


		
        <button type="submit"
          class="btn btn-primary block full-width m-b">Save
        </button>

      </form>

     
    </div>
  </div>

  <!-- jQuery-->
  <script
    src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

  <!-- Bootstrap -->
  <script
    src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>

  
  <script src="//cdnjs.cloudflare.com/ajax/libs/zxcvbn/4.4.2/zxcvbn.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/flv.js/1.5.0/flv.min.js"></script>
 <!--  <script th:src="@{js/fv.min.js}"></script> -->
  <script>
		$(document).ready(function() {
		    $('#passwordForm').formValidation({
		        framework: 'bootstrap',
		        icon: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        
		            password: {
		                validators: {
		                    notEmpty: {
		                        message: 'The password is required'
		                    },
		                    callback: {
		                        callback: function(value, validator, $field) {
		                            var password = $field.val();
		                            if (password == '') {
		                                return true;
		                            }
		                            var result  = zxcvbn(password),
		                                score   = result.score,
		                                message = result.feedback.warning || 'The password is weak';
		                            // Update the progress bar width and add alert class
		                            var $bar = $('#strengthBar');
		                            switch (score) {
		                                case 0:
		                                    $bar.attr('class', 'progress-bar progress-bar-danger')
		                                        .css('width', '1%');
		                                    break;
		                                case 1:
		                                    $bar.attr('class', 'progress-bar progress-bar-danger')
		                                        .css('width', '25%');
		                                    break;
		                                case 2:
		                                    $bar.attr('class', 'progress-bar progress-bar-danger')
		                                        .css('width', '50%');
		                                    break;
		                                case 3:
		                                    $bar.attr('class', 'progress-bar progress-bar-warning')
		                                        .css('width', '75%');
		                                    break;
		                                case 4:
		                                    $bar.attr('class', 'progress-bar progress-bar-success')
		                                        .css('width', '100%');
		                                    break;
		                            }
		                            // We will treat the password as an invalid one if the score is less than 3
		                            if (score < 3) {
		                                return {
		                                    valid: false,
		                                    message: message
		                                }
		                            }
		                            return true;
		                        }
		                    }
		                }
		            }
		        }
		    });
		});
		</script>
	});
  </script>

</body>

</body>
</html>