
   $(document).ready(function() {
console.log("..");
            const maxLength = 16;

            $('#password').on('input', function() {
                const inputField = $(this);
                const warningSpan = $('#join--passwordWarning');

                // 입력값 가져오기
                const value = inputField.val();

                if (value.length > maxLength) {
                    // 초과된 경우 경고 메시지 표시
                    warningSpan.show();
                    // 입력값을 잘라서 최대 길이로 제한
                    inputField.val(value.substring(0, maxLength));
                } else {
                    // 정상 범위 내의 경우 경고 메시지 숨기기
                    warningSpan.hide();
                }
            });
        });