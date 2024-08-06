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
    const ssn1Input = $('#join--ssn1');
    const ssn2Input = $('#join--ssn2');
    const emailInput = $('#memberEmail');
    const emailDropdown = $('#emailDropdown');
    const customDomainInput = $('#customDomainInput');
    const dropdownButton = $('#join--email--dropdown');
    const emailWarning = $('#join--email--warning');
    let selectedDomain = ''; // 초기값 설정

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
            let phoneValue = phoneInput.val().replace(/[^0-9]/g, ''); // 숫자만 남기기
            if (phoneValue.length > 11) {
                phoneValue = phoneValue.substring(0, 11); // 최대 11자리
            }

            if (phoneValue.length > 3 && phoneValue.length <= 7) {
                phoneValue = phoneValue.replace(/(\d{3})(\d{1,4})/, '$1-$2');
            } else if (phoneValue.length > 7) {
                phoneValue = phoneValue.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1-$2-$3');
            }

            phoneInput.val(phoneValue);
        });
        
        // 주민등록번호 입력 처리
        ssn1Input.on('input', function() {
            let ssn1Value = ssn1Input.val().replace(/[^0-9]/g, ''); // 숫자만 남기기
            if (ssn1Value.length > 6) {
                ssn1Value = ssn1Value.substring(0, 6); // 최대 6자리
            }

            ssn1Input.val(ssn1Value);

            if (ssn1Value.length === 6) {
                ssn2Input.focus(); // 6자리 입력 후 뒷칸으로 포커스 이동
            }
        });
        
        ssn2Input.on('input', function() {
            let ssn2Value = ssn2Input.val().replace(/[^0-9]/g, ''); // 숫자만 남기기
            if (ssn2Value.length > 7) {
                ssn2Value = ssn2Value.substring(0, 7); // 최대 7자리
            }
            ssn2Input.val(ssn2Value);
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
        
        // id 중복체크 ajax
        memberIdInput.on('input', function() {
        const idValue = memberIdInput.val();
    	const idLength = idValue.length;
        if(idLength>=4 && idLength<=12){
        	$.ajax({
        		type: 'post',
        		url: 'http://localhost:8090/cinema/idCheck',
        		data: { id : memberIdInput.val() },
        		dataType: 'json',
        		success: function(data){
        			if(data === 0){
        			idDupWarning.hide();
        			} else {
        			idDupWarning.show();
        			}
        		}
        	})
        	}else {
        		idDupWarning.hide();
    		}
        });
        
        // email 중복체크 ajax
    	customDomainInput.on('input', function() {
        	let totalEmail = emailInput.val() + '@' + customDomainInput.val();
        	
        	$.ajax({
        		type: 'post',
        		url: 'http://localhost:8090/cinema/emailCheck',
        		data: { email : totalEmail },
        		dataType: 'json',
        		success: function(data){
        			if(data === 0){
        			emailWarning.hide();
        			} else {
        			emailWarning.show();
        			}
        		}
        	})
        	
    	});
    
    	// email 중복체크2 ajax
     	emailDropdown.on('click', function() {
        	let totalEmail = emailInput.val() + '@' + selectedDomain;
        	
        	    $.ajax({
        		type: 'post',
        		url: 'http://localhost:8090/cinema/emailCheck',
        		data: { email : totalEmail },
        		dataType: 'json',
        		success: function(data){
        			if(data === 0){
        			emailWarning.hide();
        			} else {
        			emailWarning.show();
        			}
        		}
        	})
    	});
    });