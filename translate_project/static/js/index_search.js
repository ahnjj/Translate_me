$(document).ready(function(){
    $("#search_all").on("click", function(){
        if ($(this).is(":checked")) {
            $("#result_all").prop("checked", true);
            $("#kor_result").prop("checked", true);
            $("#eng_result").prop("checked", true);
            $("#eng_result").prop("disabled", false);
            $("#jp_result").prop("checked", true);
            $("#jp_result").prop("disabled", false);
            $("#ch_result").prop("checked", true);
            $("#ch_result").prop("disabled", false);
        };
    });
    $("#kor_search").on("click" ,function(){
        if ($(this).is(":checked")) {
            $("#result_all").prop("checked", true);
            $("#kor_result").prop("checked", true);
            $("#eng_result").prop("checked", true);
            $("#eng_result").prop("disabled", false);
            $("#jp_result").prop("checked", true);
            $("#jp_result").prop("disabled", false);
            $("#ch_result").prop("checked", true);
            $("#ch_result").prop("disabled", false);
        };
    });
    $("#eng_search").on("click", function(){
        if ($(this).is(":checked")) {
            $("#result_all").prop("checked", true);
            $("#kor_result").prop("checked", true);
            $("#eng_result").prop("checked", true);
            $("#eng_result").prop("disabled", false);
            $("#jp_result").prop("checked", false);
            $("#jp_result").prop("disabled", true);
            $("#ch_result").prop("checked", false);
            $("#ch_result").prop("disabled", true);
        };
    });
    $("#jp_search").on("click", function(){
        if ($(this).is(":checked")) {
            $("#result_all").prop("checked", true);
            $("#kor_result").prop("checked", true);
            $("#eng_result").prop("checked", false);
            $("#eng_result").prop("disabled", true);
            $("#jp_result").prop("checked", true);
            $("#jp_result").prop("disabled", false);
            $("#ch_result").prop("checked", false);
            $("#ch_result").prop("disabled", true);
        };
    });
    $("#ch_search").on("click", function(){
        if ($(this).is(":checked")) {
            $("#result_all").prop("checked", true);
            $("#kor_result").prop("checked", true);
            $("#eng_result").prop("checked", false);
            $("#eng_result").prop("disabled", true);
            $("#jp_result").prop("checked", false);
            $("#jp_result").prop("disabled", true);
            $("#ch_result").prop("checked", true);
            $("#ch_result").prop("disabled", false);
        };
    });
    $("#result_all").on("click", function(){
        if ($(this).is(":checked")) {
            $("#kor_result").prop("checked", true);
            if (!$("#eng_result").is(":disabled")){
                $("#eng_result").prop("checked", true);
            };
            if (!$("#jp_result").is(":disabled")){
                $("#jp_result").prop("checked", true);
            };
            if (!$("#ch_result").is(":disabled")){
                $("#ch_result").prop("checked", true);
            };
        } else {
            $("#kor_result").prop("checked", false);
            if (!$("#eng_result").is(":disabled")){
                $("#eng_result").prop("checked", false);
            };
            if (!$("#jp_result").is(":disabled")){
                $("#jp_result").prop("checked", false);
            };
            if (!$("#ch_result").is(":disabled")){
                $("#ch_result").prop("checked", false);
            };
        };
    });
    $("input[id$='_result']").on("click", function(){
        if (($("#kor_result").is(":disabled")||$("#kor_result").is(":checked"))&&
            ($("#eng_result").is(":disabled")||$("#eng_result").is(":checked"))&&
            ($("#jp_result").is(":disabled")||$("#jp_result").is(":checked"))&&
            ($("#ch_result").is(":disabled")||$("#ch_result").is(":checked"))){
            $("#result_all").prop("checked", true);
        } else {
            $("#result_all").prop("checked", false);
        };
    });
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
                let offset = $("#result_box").offset();
                $("html, body").animate({scrollTop: offset.top}, 400);
            },
            error: function(){
                // 오류 발생하면 실행할 명령
                alert('검색 오류 발생')
            },
            complete: function(){

            }
        });
    });
});