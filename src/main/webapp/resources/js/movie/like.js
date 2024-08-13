// like.js

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
