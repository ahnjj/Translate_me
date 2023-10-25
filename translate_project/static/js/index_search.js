$(document).ready(function(){
    const synth = window.speechSynthesis;
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
    $(document).on('click', '.click_to_voice a', function(){
        // 읽기 기능 구현
        const pron_text = $(this).next(this).text();
        const text_lang = $(this).next(this).next(this).text();
        sayMessage(pron_text, text_lang);
    });
    // 읽기 멈춤 구현
    $(document).on('click', '.click_to_voice .stopsay', function(){
        window.speechSynthesis.cancel();  // 멈춤
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
                $('#result_box').html(result);
                let offset = $("#result_box").offset();
                $("html, body").animate({scrollTop: offset.top-120}, 400);
            },
            error: function(){
                // 오류 발생하면 실행할 명령
                alert('검색 오류 발생!');
            },
            complete: function(){
                
            }
        });
    });
});

function nothing(){
    event.preventDefault();
    return false;
};

function sayMessage(message, lang){
    // 영어 보이스 : Google US English
    // 중국어 보이스 : Google 普通话（中国大陆）
    // 일본어 보이스 : Google 日本語
    if (lang === "kor"){
        return false
    } else if (lang === "eng"){
        voice_name = "Google US English"
    } else if (lang === "jp"){
        voice_name = "Google 日本語"
    } else {
        voice_name = "普通话（中国大陆）"
    }
    
    const synth = window.speechSynthesis;
    const voice = synth.getVoices().find(voice => voice.name.includes(voice_name));
    const utterance = new SpeechSynthesisUtterance(message);

    utterance.voice = voice;
    utterance.lang = voice.lang;
    window.speechSynthesis.speak(utterance);  // 읽어주기
};

function is_ko(st){
    for (i=0; i<st.length; i++){
        uc = st.charCodeAt(i);
        if (0xAC00<=uc && 0xD7A3>=uc){
            return true
        };
    };
    return false;
};

function is_en(st){
    for (i=0; i<st.length; i++){
        uc = st.charCodeAt(i);
        if ((0x41<=uc && 0x5A>=uc)||
            (0x61<=uc && 0x7A>=uc)){
            return true
        };
    };
    return false;
};

function is_ja(st){
    for (i=0; i<st.length; i++){
        uc = st.charCodeAt(i);
        if ((0x3040<=uc && 0x309F>=uc) ||
            (0x30A0<=uc && 0x30FF>=uc)){
            return true
        };
    };
    return false;
};