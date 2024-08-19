document.addEventListener("DOMContentLoaded", function () {
    const ddayElements = document.querySelectorAll('.list--Dday--box');

    ddayElements.forEach(function (element) {
        const startDateStr = element.getAttribute('data-start-date');

        // 브라우저의 파싱 문제를 피하기 위해 수동으로 파싱
        const startDate = parseCustomDate(startDateStr);
        const today = new Date();

        // 시간을 0으로 설정하여 날짜만 비교하도록 함
        today.setHours(0, 0, 0, 0);
        startDate.setHours(0, 0, 0, 0);

        // Date 객체가 유효한지 확인
        if (isNaN(startDate.getTime())) {
            console.error(`Invalid date format: ${startDateStr}`);
            element.querySelector('span').textContent = "Invalid date";
            return;
        }

        // Calculate the difference in days
        const timeDiff = startDate - today;
        const daysUntilStart = Math.floor(timeDiff / (1000 * 60 * 60 * 24));

        // Set the D-day value
        if (daysUntilStart > 0) {
            element.querySelector('span').textContent = `D-${daysUntilStart}`;
        } else if (daysUntilStart === 0) {
            element.querySelector('span').textContent = `D-Day`;
        } else {
            element.querySelector('span').textContent = `D+${Math.abs(daysUntilStart)}`;
        }
    });

    // 날짜 문자열을 파싱하여 Date 객체를 생성하는 함수
    function parseCustomDate(dateStr) {
        const parts = dateStr.split(' ');
        const monthMap = {
            Jan: 0, Feb: 1, Mar: 2, Apr: 3, May: 4, Jun: 5,
            Jul: 6, Aug: 7, Sep: 8, Oct: 9, Nov: 10, Dec: 11
        };

        const day = parseInt(parts[2], 10);
        const month = monthMap[parts[1]];
        const year = parseInt(parts[5], 10);

        if (!isNaN(day) && !isNaN(month) && !isNaN(year)) {
            return new Date(year, month, day);
        } else {
            return new Date(NaN);  // 유효하지 않은 날짜를 반환
        }
    }
});
