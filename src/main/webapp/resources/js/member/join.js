$(document).ready(function() {
    const phoneInput = $('#phone');

    phoneInput.on('focus', function() {
        // 자동으로 '010-'을 추가
        if (!phoneInput.val()) {
            phoneInput.val('010-');
        }
    });

    phoneInput.on('input', function() {
        let value = phoneInput.val().replace(/\D/g, ''); // 숫자만 추출

        if (value.length > 11) {
            value = value.slice(0, 11); // 최대 11자리까지 입력 허용
        }

        // 형식에 맞게 하이픈 추가
        if (value.length > 8) {
            value = value.slice(0, 8) + '-' + value.slice(8);
        }

        // 다시 값을 설정
        phoneInput.val('010-' + value.slice(0, 8) + (value.length > 8 ? '-' + value.slice(8) : ''));
    });
});
