document.addEventListener("DOMContentLoaded", function() {

function incrementLike(likeElement, reviewId) {
    // 이미 클릭된 상태인지 확인
    if (likeElement.classList.contains('clicked')) {
        return; // 이미 클릭되었으면 함수 종료
    }

    // 현재 좋아요 숫자 가져오기
    var likeCountElement = likeElement.nextElementSibling;
    var currentCount = parseInt(likeCountElement.innerText);

    // 숫자 증가
    currentCount++;

    // 증가된 숫자 설정
    likeCountElement.innerText = currentCount;

    // 클릭된 상태로 설정
    likeElement.classList.add('clicked');
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

});


