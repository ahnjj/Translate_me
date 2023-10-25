function toggleMeaning(button) {
    var meaning = button.previousElementSibling; // 같은 계위의 앞 요소 선택
    console.log(meaning)
    if (meaning !== null) { 
        if (meaning.style.display === "none") {
            meaning.style.display = "inline"; 
            button.textContent = "숨기기";
        } else {
            meaning.style.display = "none"; 
            button.textContent = "보기";
        }
    }
};

$(document).ready(function(){
    
    $("#language-select").change(function () {
        // 선택한 언어 값을 가져와서 현재 URL에 파라미터로 추가
        var selectedLanguage = $(this).val();
        var currentUrl = window.location.href;
        var newUrl;

        if (currentUrl.includes("?")) {
            newUrl = currentUrl + "&language=" + selectedLanguage;
        } else {
            newUrl = currentUrl + "?language=" + selectedLanguage;
        }

        window.location.href = newUrl; // 새로운 URL로 이동
    });

    $("a.to-another-page").on("click", function(){
        event.preventDefault()
        const total_pages = $("#num-of-pages").text();
        while (true){
            page = prompt("이동할 페이지를 입력하세요(1 ~ " + total_pages + ")");
            if (page == null){
                break;
            } else {
                page = parseInt(page);
                if (page<=parseInt(total_pages)&&page>=1){
                    window.location.href = "http://127.0.0.1:8000/vocabulary_list/?page=" + String(page)
                    break;
                } else {
                    alert("1 ~ " + total_pages + " 사이의 숫자를 입력하세요");
                };
            };
        };
        
    });
});