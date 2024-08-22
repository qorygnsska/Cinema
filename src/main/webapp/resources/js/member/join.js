let emailInput;
let selectedDomain;
let customDomainInput;
   
   $(document).ready(function() {
    const minLength = 8;
    const maxLength = 16;
    const idMinLength = 4;
    const idMaxLength = 12;
    const passwordInput = $('#join--password');
    const passwordWarning = $('#join--passwordWarning');
    const passwordConfirm = $('#join--passwordConfirm');
    const confirmWarning = $('#join--confirmWarning');
    const memberIdInput = $('#memberId');
    const idWarning = $('#join--idWarning');
    const idDupWarning = $('#join--dup--idWarning');
    const phoneInput = $('#join--phone');
    emailInput = $('#memberEmail');
    const emailDropdown = $('#emailDropdown');
    customDomainInput = $('#customDomainInput');
    const dropdownButton = $('#join--email--dropdown');
    const emailWarning = $('#join--email--warning');
    selectedDomain = ''; // 초기값 설정
    let emailForAuth = '';
    let phoneFocused = false;
    const path = '${path}';

        // 비밀번호 입력 필드의 최대 길이 제한 및 유효성 검사
        passwordInput.on('input', function() {
            const passwordLength = passwordInput.val().length;
            if (passwordLength === 0) {
       			passwordWarning.hide();
            } else if (passwordLength < minLength || passwordLength > maxLength) {
                passwordWarning.show();
            } else {
                passwordWarning.hide();
            }
        });
        
        // 비밀번호 확인과 일치 여부 확인
        passwordConfirm.on('input', function() {
        	if (passwordConfirm.val() === 0) {
       			confirmWarning.hide();
            } else if (passwordInput.val() !== passwordConfirm.val()) {
                confirmWarning.show();
            } else {
                confirmWarning.hide();
            }
        });
        
        // 아이디 글자수 검사
        memberIdInput.on('input', function() {
            const idValue = memberIdInput.val();
            const lengthValid = idValue.length >= idMinLength && idValue.length <= idMaxLength;
            const validChars = /^[a-zA-Z0-9]+$/.test(idValue);
             if (idValue.length === 0) {
       			idWarning.hide();
            } else if (!lengthValid || !validChars) {
                idWarning.show();
            } else {
                idWarning.hide();
            }
        });
        
        // 전화번호 입력 처리
        phoneInput.on('focus', function() {
            if (!phoneFocused) {
                phoneInput.val('010-');
                phoneFocused = true;
            }
        });

        phoneInput.on('input', function() {
            let phoneValue = phoneInput.val().replace(/[^0-9]/g, '');
            if (phoneValue.length > 11) {
                phoneValue = phoneValue.substring(0, 11);
            }

            if (phoneValue.length > 3 && phoneValue.length <= 7) {
                phoneValue = phoneValue.replace(/(\d{3})(\d{1,4})/, '$1-$2');
            } else if (phoneValue.length > 7) {
                phoneValue = phoneValue.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1-$2-$3');
            }

            phoneInput.val(phoneValue);
        });
        
        
        // 이메일 도메인 선택 처리
        emailDropdown.on('click', '.dropdown-item', function() {
             selectedDomain = $(this).data('domain');
            if (selectedDomain) {
                customDomainInput.val(selectedDomain);
                customDomainInput.prop('disabled', true);
                dropdownButton.text(selectedDomain);
            } else if (this.id === 'customEmail') {
                customDomainInput.val('');
                customDomainInput.prop('disabled', false);
                dropdownButton.text('직접 입력');
                selectedDomain = '';
            }
        });
        
      
      // 회원가입 버튼 클릭 시 예외처리
    	    $('#join--form').on('submit', function(event) {
        const memberIdValue = $('#memberId').val().trim();
        const passwordValue = $('#join--password').val().trim();
        const nameValue = $('#name').val().trim();
        const phoneValue = $('#join--phone').val().trim();
        const emailAuthOkDisplay = $('#join--emailAuth--ok').css('display');
        
        const warnings = $('.join--warning');
        let warningVisible = false;
        
        warnings.each(function() {
            if ($(this).css('display') !== 'none') {
                warningVisible = true;
                return false;
            }
        });

        if (memberIdValue === '' || passwordValue === '' || nameValue === '' || phoneValue === '') {
            alert('모든 내용을 입력해주세요.');
            event.preventDefault();
        } else if (emailAuthOkDisplay !== 'block') {
        let emailInput = $('#memberEmail');
            alert('이메일 인증을 완료해 주세요.');
            emailInput = '';
            event.preventDefault();
        } else if (warningVisible) {
            alert('경고 메시지를 확인 후 다시 입력해주세요.');
            event.preventDefault();
        } else {
        	const emailDomain = customDomainInput.val();
        	if (emailDomain) {
        	    emailInput.val(emailInput.val() + '@' + emailDomain);
      	  }
        }
    });
    	

    });
    
    	// email 메일인증
    function emailAuth(width, height){
    
    const emailWarning = $('#join--email--warning');
    
    if(emailWarning.css('display') === 'inline'){
    	alert('사용할 수 없는 이메일입니다.');
    	return;
    } else {
    const emailWithSelectedDomain = emailInput.val() + '@' + selectedDomain;
    const emailWithCustomDomain = emailInput.val() + '@' + customDomainInput.val();
	const button = $('#join--emailAuth');


    let validEmail = '';

    if (selectedDomain && selectedDomain.trim() !== '') {
        validEmail = emailWithSelectedDomain;
    } else if (customDomainInput.val() && customDomainInput.val().trim() !== '') {
        validEmail = emailWithCustomDomain;
    }

    if (!validEmail || emailInput.val().trim() === '') {
        alert('이메일을 입력해주세요.');
        return;
    }

    const encodedEmail = encodeURIComponent(validEmail);
    const url = "emailAuth?email=" + encodedEmail;
    
var screenWidth = window.screen.width;
			    var screenHeight = window.screen.height;
			    
			    // 새 창의 크기와 위치 계산하기
			    var left = (screenWidth / 2) - (width / 2);
			    var top = (screenHeight / 2) - (height / 2);
			    
			    // 새 창 열기
			    window.open(url, name, 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left + ',scrollbars=no');
    }
    }
    
