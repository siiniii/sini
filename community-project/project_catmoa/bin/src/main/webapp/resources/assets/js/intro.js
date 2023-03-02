// login & register form
	$('button.signup').on("click", function(){
		$('.login-reg-bg').addClass('show');
		return false;
	  });
	
	//$('#login_form .mtr-btn.signup').click(function(){
	//	alert('login');
	//});

//	 ----------------------------로그인-----------------------------
	
	$('.mtr-btn.signin').click(function() {
		
		if ($('#user_id').val().length == 0 ) {
			alert("아이디와 비밀번호를 입력해 주세요");
			return false;
		} else if ($('#user_passwd').val().length == 0 ) { 
			alert("비밀번호를 입력해 주세요");
			return false;
		} 
		
	});

//  ----------------------------회원가입------------------------------
	
	$('#register_btn').click(function() { //register_form 속의 mtr-btn.signup을 클릭하면 함수 발생
		
		if ($('#register_name').val().length == 0 ) {
			alert("이름을 입력해 주세요");
			return false;
		}

		else if ($('#register_id').val().length == 0 ) {
			alert("아이디를 입력해 주세요");
			return false;
		}
		else if ($('#register_nick').val().length == 0 ) { 
			alert("닉네임을 입력해 주세요");
			return false;
		}
		else if ($('#register_pw').val().length == 0 ) { 
			alert("비밀번호를 입력해 주세요");
			return false;
			
		}
		else if ($('#register_rpw').val().length == 0 ) { 
			alert("비밀번호를 한번 더 입력해 주세요");
			return false;
		}
		
		else if ($('#register_pw').val()!= $('#register_rpw').val() ) { 
			alert("비밀번호가 잘못 입력되었습니다 다시 확인해주세요");
			return false;
		}
		
		else if ($('#register_num2').val().length == 0 ) { 
			alert("중간번호를 입력해 주세요");
			return false;
			
		}
		else if ($('#register_num3').val().length == 0 ) { 
			alert("뒷번호를 입력해 주세요");
			return false;
			
		}
		else if ($('#zipcode').val().length == 0 ) { 
			alert("주소를 선택해 주세요");
			return false;
			
		}
		else if ($("input[type=radio][name=sex]:checked").length == 0) {
				alert('성별을 선택 해주세요');
				return false;
				
		} 
		else if ($("select[name=age]").val() == "1") {
				alert('연령대를 선택해주세요');
				return false;
				
		}
		else if ($("input[name=inflow_code]:checked").length == 0) {
				alert('유입경로를 선택해주세요');
				return false;
		} 
		 //$("#register_btn").trigger("click")
    $("#register_form").submit()
    	  	
	});
