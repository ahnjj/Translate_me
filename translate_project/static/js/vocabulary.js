$(document).ready(function() {
    var toggleAllButton = document.getElementById("toggle-all-button");

    // 전체 숨기기/보기 버튼에 클릭 이벤트 리스너를 추가합니다.
    toggleAllButton.addEventListener("click", function () {
        // 모든 숨기기/보기 버튼을 선택합니다.
        var toggleButtons = document.querySelectorAll(".toggle-meaning-btn");

        // 각 숨기기/보기 버튼을 클릭합니다.
        toggleButtons.forEach(function (button) {
            button.click(); // 각 버튼을 클릭하여 숨기기/보기 토글 작동
        });
    });
});

function toggleMeaning(button) {
    var meaning = button.previousElementSibling; // 뜻 span 요소 선택
    if (meaning.style.display === "none") {
        meaning.style.display = "inline"; // 뜻 보이기
        button.textContent = "숨기기";
    } else {
        meaning.style.display = "none"; // 뜻 숨기기
        button.textContent = "보기";
    }
}