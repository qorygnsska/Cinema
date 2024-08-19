document.addEventListener("DOMContentLoaded", function() {

    // JSP에서 전달된 likeStatusMap을 JSON 형식으로 변환
    var likeStatusMap =  "${likeStatusMap}";
    console.log("likeStatusMap", likeStatusMap);

    // 사용자 ID를 가져옵니다. JSP에서 서버로부터 전달받아야 합니다.
    var id = "${id}";

    function toggleLike(likeElement, reviewNo) {
        // id가 null 또는 빈 문자열이면 로그인 메시지를 표시하고 함수 종료
        if (!id || id.trim() === "") {
            alert("로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
            return;
        }

        var likeCountElement = likeElement.nextElementSibling;
        var currentCount = parseInt(likeCountElement.innerText);
        console.log("currentCount : " + currentCount);

        var action;

        // 좋아요가 이미 클릭된 상태인지 확인
        if (likeElement.classList.contains('detail--clicked')) {
            // 이미 클릭된 상태면 숫자를 1 감소시킵니다.
            currentCount--;
            action = 'decrease'; // 좋아요 감소
            console.log("action : " + action);
            // likeElement.classList.remove('detail--clicked'); // 클릭된 상태 해제
        } else {
            // 클릭되지 않은 상태면 숫자를 1 증가시킵니다.
            currentCount++;
            action = 'increase'; // 좋아요 증가
            console.log("action : " + action);
            // likeElement.classList.add('detail--clicked'); // 클릭된 상태로 설정
        }

        // 업데이트된 숫자 설정
        likeCountElement.innerText = currentCount;

        // 서버에 ajax 요청 보내기
        updateReviewLike(reviewNo, action);
    }

    function updateReviewLike(reviewNo, action){
        console.log("ReviewNo:", reviewNo);

        $.ajax({
            type: "POST",
            url: 'updateReviewLike',
            data: JSON.stringify({
                reviewNo : reviewNo,
                action : action
            }),
            contentType : "application/json; charset=UTF-8",
            success : function(response){
                console.log("서버 응답 : ", response);
            },
            error: function(xhr, status, error){
                console.error("좋아요 업데이트 중 오류 발생 : ", error);
            }
        });
    }

    // 모든 좋아요 버튼에 대해 초기 상태 설정 및 클릭 이벤트 추가
    const likeButtons = document.querySelectorAll("#detail--review--like");

    likeButtons.forEach(function(button) {
        const reviewNo = button.getAttribute('data-review-id'); // 각 버튼의 data-review-id에서 reviewNo를 가져옴

        // likeStatusMap을 사용하여 초기 상태 설정
        if (likeStatusMap[reviewNo]) {
            button.classList.add('detail--clicked');
        }

        button.addEventListener("click", function() {
            toggleLike(this, reviewNo);
        });
    });

    // 기존 모달 관련 코드 (수정하지 않음)
    const trailerOpens = document.querySelectorAll('.detail--movie_player_popup');  
    const trailers = document.querySelectorAll('.detail--movie--popup');            
    const trailerCloses = document.querySelectorAll('.detail--close');              

    var count = 0;

    trailerOpens.forEach((trailerOpen, index) => {
        trailerOpen.addEventListener('click', function(e) {
            e.preventDefault(); 
            
            count = index;
     
            if(index === 0){        
                count = 0;
            } else if(index === 2) {
                count = 1;
            } else if(index === 4){
                count = 2;
            }
            console.log('수정한 count:' + count);

            const iframe = trailers[count].querySelector('iframe');
            if (iframe) {
                const src = iframe.getAttribute('src');
                iframe.setAttribute('src', src + (src.includes('?') ? '&' : '?') + 'autoplay=1');
            }

            trailers[count].style.display = 'flex';
        });
    });

    trailerCloses.forEach((trailerClose, index) => {
        trailerClose.addEventListener('click', function() {
            trailers[index].style.display = 'none'; 

            const iframe = trailers[index].querySelector('iframe');
            if(iframe){
                const src = iframe.getAttribute('src').split('?')[0]; 
                iframe.setAttribute('src', src);
            }
        });
    });

    trailers.forEach((trailer, index) => {
        trailer.addEventListener('click', function(e) {
            if (e.target === trailer) {
                trailer.style.display = 'none'; 

                const iframe = trailers[index].querySelector('iframe');
                if(iframe){
                    const src = iframe.getAttribute('src').split('?')[0]; 
                    iframe.setAttribute('src', src);
                }
            }
        });
    });
});
