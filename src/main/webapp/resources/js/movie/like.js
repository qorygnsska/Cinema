document.addEventListener("DOMContentLoaded", function() {

    function toggleLike(likeElement, reviewNo) {

        // id가 null 또는 빈 문자열이면 로그인 메시지를 표시하고 함수 종료
        if (!id || id.trim() === "") {
            alert("로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
            return;
        }

        console.log("reviewNo : " + reviewNo);

        var likeCountElement = likeElement.nextElementSibling;
        var currentCount = parseInt(likeCountElement.innerText);
        console.log("currentCount : " + currentCount);

        var action;

        // 좋아요가 이미 클릭된 상태인지 확인
        if (likeElement.classList.contains('storeDetail--clicked')) {
            // 이미 클릭된 상태면 숫자를 1 감소시킵니다.
            currentCount--;
            action = 'decrease'; // 좋아요 감소
            console.log("action : " + action);
            likeElement.classList.remove('storeDetail--clicked'); // 클릭된 상태 해제
        } else {
            // 클릭되지 않은 상태면 숫자를 1 증가시킵니다.
            currentCount++;
            action = 'increase'; // 좋아요 증가
            console.log("action : " + action);
            likeElement.classList.add('storeDetail--clicked'); // 클릭된 상태로 설정
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

// 모든 트리거 요소와 모달 창 요소 선택
const trailerOpens = document.querySelectorAll('.detail--movie_player_popup');  // 모든 트리거 버튼
const trailers = document.querySelectorAll('.detail--movie--popup');            // 모든 팝업 창
const trailerCloses = document.querySelectorAll('.detail--close');              // 모든 닫기 버튼

// 각 트레일러 링크에 클릭 이벤트 설정
// 각 트레일러 링크에 클릭 이벤트 설정
var count = 0;

trailerOpens.forEach((trailerOpen, index) => {
    trailerOpen.addEventListener('click', function(e) {
        e.preventDefault(); // 기본 동작 방지
        
 count = index;
 
        if(index === 0){        
        count = 0;
        }else if(index ===2) {
        count = 1;
        }else if(index ===4){
        count = 2;
        }
        console.log('수정한 count:' + count);
        trailers[count].style.display = 'flex';
    
            
    });
});


// 각 닫기 버튼에 대해 클릭 이벤트 설정
trailerCloses.forEach((trailerClose, index) => {
    trailerClose.addEventListener('click', function() {
        trailers[index].style.display = 'none'; // 해당 닫기 버튼에 대응되는 팝업 창 닫기
    });
});

// 모달 바깥 부분 클릭 시 모달 닫기 설정
trailers.forEach((trailer, index) => {
    trailer.addEventListener('click', function(e) {
        if (e.target === trailer) {
            trailer.style.display = 'none'; // 모달 바깥 부분을 클릭했을 때 팝업 창 닫기
        }
    });
});

  // 모든 좋아요 버튼에 대해 클릭 이벤트 설정
  const likeButtons = document.querySelectorAll("#detail--review--like");

  likeButtons.forEach(function(button) {
    const reviewNo = button.getAttribute('data-review-id'); // 각 버튼의 data-review-id에서 reviewNo를 가져옴
      button.addEventListener("click", function() {
          toggleLike(this, reviewNo);
      });
  });
});

