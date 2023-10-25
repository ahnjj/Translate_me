$(document).ready(function() {

    $("#quiz-form").submit(function(event) {
        event.preventDefault(); 

        hide = document.getElementById("showResultButton")
        hide.style.display = "none"; // "결과 보기" 버튼 한번 누르면숨기기

        userAnswers = []

        document.getElementsByClassName

        // 사용자가 입력한 값을 가져옵니다.
        $('.user-answer').each(function() {
            let answer = $(this).val();
            let vocabularyId = $(this).data('vocabulary_id');
            userAnswers.push({ id: vocabularyId, answer: answer });
        });


        csrftoken = getCookie('csrftoken')

        $.ajax({
            type: "POST",  
            url: /vocabulary_test/,  
            data: { answers: userAnswers },  
            // csrftoken js도 추가해줘야함 
            headers: {
                "X-CSRFToken": csrftoken
            },
            dataType: "json", 
            success: function(response) {

                var responseKeys = Object.keys(response);

                for (let i = 0; i < responseKeys.length; i++) {
                    var result = response['result_' + i];

                    var $resultElement = $('.result').eq(i);  

                    // 결과 텍스트 설정
                    $resultElement.text(result);  

                    // 이전 클릭할때 추가되어있는 클래스 추가
                    $resultElement.removeClass('correct incorrect');

                    if (result === '정답') {
                        $resultElement.addClass('correct');  // 정답 스타일 클래스 추가
                    } else {
                        $resultElement.addClass('incorrect');  // 오답 스타일 클래스 추가
                    }
                }

                var resultContainer = $("#result-container");
                resultContainer.html("결과: " + response.result);
            },
            error: function(xhr, status, error) {
                console.error("오류: " + error);
            }
        });
    });

});

function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // 이름으로 시작하는 쿠키를 찾습니다.
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
