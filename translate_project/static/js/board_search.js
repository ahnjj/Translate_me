$(document).ready(function () {
    $('#bdSearchFrm').on('submit', function () {
        // submit 이벤트 기본 기능 : 페이지 새로고침
        // 페이지 ㅅ해로고침 되지 않도록
        event.preventDefault();

        // 폼에 입력한 값들을 쿼리 스트링 방식의 데이터로 변환
        // type=bookname&keyword=자전거
        // serializer() 사용 : 쿼리 스트링 방식의 데이터로 변환
        let formData = $(this).serialize();

        $.ajax({
            type: "post",
            // url: "/book/get_data/",
            url: "http://127.0.0.1:8000/board/search/",
            data: formData,
            datatype: 'json',
            success: function (result) {
                console.log(result)
                console.log(result.bd_list_json)
                let bd_list = result.bd_list_json;
                //반환된 결과를 searchResultBox에 테이블 형태로 출력 (삽입)
                // div 태그에 삽입 : append()
                // 실행할 때마다 append() 이전 결과 뒤에 계속 append 됨 그래서 삭제하고 다시 시작
                $('#searchResultBox').empty()

                // 테이블 태그 문자열로 생성
                const str = `
                    <table id ="bd_list">
                        <tr> 
                            <th>제목</th>
                            <th>내용</th>
                            <th>카테고리</th>
                            <th>언어</th>
                        </tr>
                `
                $('#searchResultBox').append(str);
                //데이터 추출해서 append
                if (bd_list.length == 0) {
                    $('#bd_list').append('<tr align="center"><td colspan="7">찾는 게시물이 없습니다.</td></tr>')
                } else {
                    for (let i = 0; i < bd_list.length; i++) {
                        const boardDetailURL = 'http://127.0.0.1:8000/board/detail/';
                        const link = `<a href="${boardDetailURL}${bd_list[i].pk}/">${bd_list[i].pk}</a>`;
                        $('#bd_list').append('<tr><td>' +
                            link + '</td><td>' +
                            bd_list[i].fields.board_title + '</td><td>' +
                            bd_list[i].fields.board_main_txt + '</td><td>' +
                            bd_list[i].fields.category + '</td><td>' +
                            bd_list[i].fields.language + '</td></tr>'
                        );
                    }
                }
                $('#bd_list').append('</table>');
                //반환된 결과를 받앗 result_box에 출력
            },
            error: function () {
                //오류 발생했을때
                alert("오류 발생")
            },
            complete: function () {
                // 완료 되었을 때 수행된 함수
            }
        });
    })
});