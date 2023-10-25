function toggleMeaning(button) {
    var meaning = button.previousElementSibling; // 같은 계위의 앞 요소 선택
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

    $('#apply-button').click(function(event) {
        event.preventDefault();  // 폼 제출 방지
        // 선택한 언어 값을 가져옴
        var selectedLanguage = $('#language-select').val();

        // AJAX 요청을 통해 선택한 언어에 따른 데이터를 가져옴
        $.get('/vocabulary_list/', { language: selectedLanguage }, function(data) {
            // 테이블을 새로운 단어 목록으로 업데이트
            var wordList = data.words;
            var tableBody = $('#voca_list tbody');
            tableBody.empty();

            $.each(wordList, function(index, word) {
                var row = '<tr>' +
                          '<td>' + word.vocabulary_name + '</td>' +
                          '<td class="hidden-meaning">' +
                              '<span style="display: none;">' + word.vocabulary_meaning + '</span>' +
                              '<button class="btn btn-primary toggle-meaning-btn" onclick="toggleMeaning(this)">보기</button>' +
                          '</td>' +
                          '<td>' + word.language_id + '</td>' +
                          '<td>단어 수정</td>' +
                          '<td>학습완료</td>' +
                          '<td>삭제</td>' +
                          '</tr>';
                tableBody.append(row);
            });
        });
    });

   
});
