/**
 * 
 */


$(".login-form").validate({
  rules: {
    username: {
      required: true,
      minlength: 4
    },     
    email: {
      required: true,
      email:true
    },
    password: {
      required: true,
      minlength: 5
    },
    cpassword: {
      required: true,
      minlength: 5,
      equalTo: "#password"
    }
  },
  //For custom messages
  messages: {
    username:{
      required: "Enter a username",
      minlength: "Enter at least 4 characters"
    }
  },
  errorElement : 'div',
  errorPlacement: function(error, element) {
    var placement = $(element).data('error');
    if (placement) {
      $(placement).append(error)
    } else {
      error.insertAfter(element);
    }
  }
});

var today = new Date();
var dd = today.getDate();
var mm = today.getMonth() + 1; //January is 0!
var yyyy = today.getFullYear();

if (dd < 10) {
   dd = '0' + dd;
}

if (mm < 10) {
   mm = '0' + mm;
} 
    
today = yyyy + '-' + mm + '-' + dd;
document.getElementById("datefield").setAttribute("max", today);

onKeyPress="hangul();"
function hangul(){ if((event.keyCode < 12592) || (event.keyCode > 12687)){ alert("한글만 입력이 가능합니다."); event.returnValue = false } }

var name = document.querySelector('#name');
var onlyKorean = function() {
  var pattern = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
  this.value = this.value.replace(pattern, '');
};
name.addEventListener('keypress', onlyKorean);

function onKeyNumber(){
	if( (event.keyCode < 48 ) || (event.keyCode > 57) ){
		event.returnValue = false;			
	}
}

function onKeyHangul(){

	oHangulTrue = $( "HangulTrue" );
	oName = $$( "[name=NAME]" )[0];
	
	if ( (event.keyCode < 12592) || (event.keyCode > 12687) ){
		//alert ( "한글로 입력해주세요." );						
		oHangulTrue.innerHTML = " <font color='#ff0000'> (한글로만 입력해주세요.)</font>";
		oName.focus();
		event.returnValue = false;			
		
	}
}
