
$(document).ready(function () {
	$('.message').hide();
	$('.success').hide();
	$('.alert-danger .salesforce-failed').hide();

	if($('.hidden').length > 1){
		$('.hidden').text(function(){
			window.location.href
		})
	}
	
	$('.phone').keypress(function(e){
     var key_codes = [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 0, 8];

     if (!($.inArray(e.which, key_codes) >= 0)) {
       e.preventDefault();
     }
   });
    $("form").submit(function (e) {
        e.preventDefault(); 
        var name = $('.name').val().trim(),
		lastname = $('.lastname').val().trim(),
		email = $('.email').val().trim(),
		phone = $('.phone').val().trim(),
		jobtitle = $('.jobtitle').val().trim(),
		company = $('.company').val().trim(),
		website = $('.website').val().trim(),
		message = "";

		if(!name || !lastname || !email || !phone || !jobtitle || !company || !website){
			message = "Can't be blank";
			returnMessage(message);
			return;
		}

		emailValidation = validateEmail(email);

		if(!emailValidation) {
			message = "Please check email field"
			returnMessage(message);
			return;
		}
		
		$(this).unbind('submit').submit();

		function validateEmail(email) {
		    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		    return re.test(email);
		};

		function returnMessage(message){
			$('.message').show();
			$('.message').text(function(){
				return message;
			});
		};
	});

	(function getParameters(){
		var parameter = window.location.search.replace('?','').split('=')[1]; 
		if(parameter){

			switch(parameter){
				case 'createok': 
					parameter = 'Account created!';
					break;
				case 'editok':
					parameter = 'Account edited!';
					break;
				case 'salesforceok':
					parameter = 'Salesforce integrated!'
					break;
				case 'salesforcefail':
					parameter = "Problem with salesforce integration!"
					$('.salesforce-failed').show();
					$('.salesforce-failed').text(function(){
						return parameter;
					});
					return;
			}

			$('.success').show();
			$('.success').text(function(){
				return parameter;
			});
		}	
	})();
});