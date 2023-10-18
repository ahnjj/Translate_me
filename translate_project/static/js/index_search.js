$(document).ready(function(){
    $("#index_search").on('submit', function(){
        event.preventDefault();
        let input_data = $(this).serialize();
        $.ajax({
            data: input_data,
            type: 'post',
            datatype: 'json',
            url: 'http://127.0.0.1:8000/search/',
            success: function(result){
                // 성공시 가져온 result를 가지고 수행할 명령
                $('#result_box').html(result)
            },
            error: function(){
                // 오류 발생하면 실행할 명령
                alert('검색 오류 발생')
            },
            complete: function(){

            }
        })
    })
})