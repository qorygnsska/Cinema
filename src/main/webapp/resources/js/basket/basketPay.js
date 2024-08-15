	function openFirstPopup() {
	
    const popupContent = `
        <html>
        <head>
            <title>전자금융거래 이용약관</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    line-height: 1.6;
                    padding: 20px;
                }
                h1, h2, h3 {
                    font-weight: bold;
                }
                p {
                    margin-bottom: 10px;
                }
            </style>
        </head>
        <body>
            <h1>전자금융거래 기본약관</h1>

            <h2>제1조 (목적)</h2>
            <p>이 약관은 CJ올리브네트웍스(주)(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.</p>

            <h2>제2조 (용어의 정의)</h2>
            <p>이 약관에서 정하는 용어의 정의는 다음과 같습니다.</p>
            <ol>
                <li>'전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.</li>
                <li>'전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.</li>
                <li>'이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.</li>
                <li>'접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.</li>
                <li>'거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.</li>
                <li>'오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.</li>
            </ol>

            <h2>부칙</h2>
            <p><strong>제 1호, 2006.12.26</strong></p>
            <p>본 약관은 2007년 1월 1일부터 시행한다.</p>
        </body>
        </html>
    `;
    
    const popupWindow = window.open("", "popupWindow", "width=600,height=600,scrollbars=yes");
    popupWindow.document.write(popupContent);
    popupWindow.document.close(); 
}
function openSecondPopup() {
    const popupContent = `
        <html>
        <head>
            <title>개인정보의 수집 및 이용에 대한 동의</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    line-height: 1.6;
                    padding: 20px;
                }
                h1, h2, h3 {
                    font-weight: bold;
                }
                p {
                    margin-bottom: 10px;
                }
            </style>
        </head>
        <body>
            <h1>개인정보의 수집 및 이용에 대한 동의</h1>

            <p>CJ올리브네트웍스㈜(이하 '회사')는 이용자의 개인정보를 중요시하며, 『전자금융거래법』, 『개인정보보호법』, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『전자상거래 등에서의 소비자보호에 관한 법률』, 『특정금융거래정보의 보고 및 이용 등에 관한 법률』 등을 준수하며 관련 법령에 의거한 개인정보처리방침을 정하여 이용자 권익을 보호하고 있습니다.</p>

            <h2>1. 개인정보의 수집 및 이용 목적</h2>
            <p>회사는 전자금융거래서비스를 제공함에 있어서 취득한 정보를 이용자의 동의를 얻지 않고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 않습니다. 다만, 업무상 이용자 정보를 제3자에게 위탁할 경우 홈페이지(www.cjolivenetworks.co.kr)을 통해 이용자에게 고지합니다.</p>

            <h2>2. 수집하는 개인정보 항목</h2>
            <p>회사는 전자금융업자로서 고객 확인 및 검증, 결제내역 조회, 고객상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
            <!-- 아래 내용은 예시로 넣었습니다. 실제 내용으로 교체하십시오 -->
            <ul>
                <li>신원 확인 및 고객 검증을 위한 수집 정보</li>
                <li>고위험 거래 대상으로 분류 시 개인정보 추가 수집 내역</li>
                <li>결제내역 조회, 고객상담, 서비스 신청 등을 위한 수집 정보</li>
            </ul>

            <h2>3. 개인정보 수집방법</h2>
            <p>가맹점 결제서비스 이용을 위한 계약 시 (전자계약 서비스 글로싸인을 통함)</p>

            <h2>4. 개인정보의 보유 및 이용기간</h2>
            <p>회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 및 지체 없이 해당 정보를 파기합니다. 단, 관계 법령의 규정에 의하여 보존할 필요가 있는 경우 일정한 기간 동안 보관합니다.</p>

            <h2>5. 개인정보의 파기절차 및 방법</h2>
            <p>회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.</p>
            <ul>
                <li>파기절차: 회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 데이터베이스(DB)로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라 일정 기간 저장된 후 파기됩니다.</li>
                <li>파기방법: 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</li>
            </ul>

            <!-- 더 많은 내용이 필요하다면 여기에 추가할 수 있습니다 -->
        </body>
        </html>
    `;
    
    const popupWindow = window.open("", "popupWindow", "width=600,height=600,scrollbars=yes");
    popupWindow.document.write(popupContent);
    popupWindow.document.close();
}
function openThirdPopup() {

    const popupContent = `
        <html>
        <head>
            <title>개인정보의 제3자 제공 동의</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    line-height: 1.6;
                    padding: 20px;
                }
                h1, h2, h3 {
                    font-weight: bold;
                }
                p, li {
                    margin-bottom: 10px;
                }
            </style>
        </head>
        <body>
            <h1>개인정보의 제3자 제공 동의</h1>

            <h2>1. 개인정보 제3자 제공에 대한 동의</h2>
            <p>CJ올리브네트웍스㈜(이하 '회사')는 이용자의 개인정보를 본 개인정보처리방침에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이 동 범위를 초과하여 이용하거나 이용자의 개인 정보를 제3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</p>
            <ul>
                <li>이용자가 사전에 동의한 경우</li>
                <li>법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</li>
            </ul>

            <h2>2. 제3자 제공 목록</h2>
            <p>회사의 서비스 이행을 위하여 개인정보를 제3자에게 제공하고 있는 경우는 다음과 같습니다.</p>
            <ol>
                <li>
                    <strong>신용카드 결제</strong><br>
                    제공받는 자: 국민, 비씨, 롯데, 삼성, NH농협, 현대, KEB하나, 신한<br>
                    제공 정보: 결제정보 (카드번호, 고객명, 생년월일, 전화번호 등)
                </li>
                <li>
                    <strong>슈가페이(CJ올리브네트웍스의 자체 간편결제 서비스)</strong><br>
                    제공받는 자: NICE정보통신, ㈜헥토파이낸셜<br>
                    제공 정보: 카드사명, 결제정보(카드번호, 카드비밀번호 앞2자리 등)
                </li>
                <li>
                    <strong>간편결제</strong><br>
                    제공받는 자: 카카오페이, 페이코, 스마일페이, 네이버페이 등<br>
                    제공 정보: 결제정보 (전화번호, 상품명 등)
                </li>
                <!-- 나머지 내용 추가 -->
            </ol>

            <h2>3. 개인정보의 보유 및 이용기간</h2>
            <p>개인정보는 원칙적으로 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관됩니다.</p>

            <!-- 더 많은 내용이 필요하다면 여기에 추가할 수 있습니다 -->
        </body>
        </html>
    `;

    const popupWindow = window.open("", "popupWindow", "width=600,height=600,scrollbars=yes");
    popupWindow.document.write(popupContent);
    popupWindow.document.close();
}	




document.addEventListener("DOMContentLoaded", function () {
    const allAgreementCheckbox = document.getElementById("basketPay_agreement");
    const allServiceAgreementCheckbox = document.getElementById("basketPay_all_agreement");
    const giftAgreementCheckbox = document.getElementById("basketPay_gift_agreement");
    const subAgreementCheckboxes = document.querySelectorAll(".sub-agreement");

    // "주문정보/결제 대행 서비스 약관 모두 동의" 체크박스 클릭 시
    allAgreementCheckbox.addEventListener("change", function () {
        const isChecked = allAgreementCheckbox.checked;
        document.querySelectorAll(".basketPay-agreement-checkbox").forEach(function (checkbox) {
            if (checkbox.id !== "basketPay_agreement") { // 주문정보/결제 대행 서비스 약관 체크박스를 제외하고 나머지 체크박스들만 체크
                checkbox.checked = isChecked;
            }
        });
    });

    // "결제 대행 서비스 약관 모두 동의" 체크박스 클릭 시
    allServiceAgreementCheckbox.addEventListener("change", function () {
        const isChecked = allServiceAgreementCheckbox.checked;
        subAgreementCheckboxes.forEach(function (checkbox) {
            checkbox.checked = isChecked;
        });
        checkAllAgreementStatus(); // 기프트콘 구매 동의와 함께 체크 여부 확인
    });

    // 기프트콘 구매 동의 체크박스 클릭 시
    giftAgreementCheckbox.addEventListener("change", function () {
        checkAllAgreementStatus(); // 결제 대행 서비스 약관 모두 동의와 함께 체크 여부 확인
    });

    // 아래 개별 체크박스들이 모두 체크되면 "결제 대행 서비스 약관 모두 동의" 체크박스도 체크
    subAgreementCheckboxes.forEach(function (checkbox) {
        checkbox.addEventListener("change", function () {
            if ([...subAgreementCheckboxes].every(cb => cb.checked)) {
                allServiceAgreementCheckbox.checked = true;
            } else {
                allServiceAgreementCheckbox.checked = false;
            }
            checkAllAgreementStatus(); // 결제 대행 서비스 약관 모두 동의와 기프트콘 구매 동의 체크 여부 확인
        });
    });

    // 기프트콘 구매 동의와 결제 대행 서비스 약관 모두 동의가 모두 체크되면, 주문정보/결제 대행 서비스 약관 모두 동의도 체크
    function checkAllAgreementStatus() {
        if (giftAgreementCheckbox.checked && allServiceAgreementCheckbox.checked) {
            allAgreementCheckbox.checked = true;
        } else {
            allAgreementCheckbox.checked = false;
        }
    }
});
