$(document).ready(function(){

    // $("a.to-another-page").on("click", function(){
    //     event.preventDefault()
    //     const total_pages = $("#num-of-pages").text();
    //     while (true){
    //         page = prompt("이동할 페이지를 입력하세요(1 ~ " + total_pages + ")");
    //         if (page == null){
    //             break;
    //         } else {
    //             page = parseInt(page);
    //             if (page<=parseInt(total_pages)&&page>=1){
    //                 window.location.href = "http://127.0.0.1:8000/vocabulary_list/?page=" + String(page)
    //                 break;
    //             } else {
    //                 alert("1 ~ " + total_pages + " 사이의 숫자를 입력하세요");
    //             };
    //         };
    //     };
    // });
    
    $("#voca-form").on("submit", function(){
        let lang_disabled = false;
        if ($("#id_language_id").is(":disabled")){
            lang_disabled = true
            $("#id_language_id").prop("disabled", false);
        };
        result = check_form(this);
        lang_input = result["lang_input"];
        validity = result["validity"];
        if (!validity){
            lang_dk = {
                "kor": "한국어",
                "eng": "영어",
                "jp": "일본어",
                "ch": "중국어"
            };
            if (!confirm("입력한 단어의 언어는 " + lang_dk[lang_input] + "가 아닌 것 같습니다.\n그래도 등록하시겠습니까?")){
                if (lang_disabled){
                    $("#id_language_id").prop("disabled", true);
                };
                return false;
            }
        };
    });
});

function check_form(form){
    lang_d = {
        "1": "kor",
        "2": "eng",
        "3": "jp",
        "4": "ch"
    };
    word = $(form).find("#id_vocabulary_name").val();
    lang_input = lang_d[$(form).find("#id_language_id").val()];
    lang_sense = possible_lang(word);
    return {"lang_input": lang_input, "validity": lang_sense[lang_input]}
};

function unicode_fct(l, i){
    n = l.charCodeAt(i);
    if ((0x3130<=n && 0x318F>=n) ||
        (0xAC00<=n && 0xD7A3>=n)){
        return "kor";
    } else if ((0x41<=n && 0x5A>=n) ||
               (0x61<=n && 0x7A>=n)){
        return "eng";
    } else if ((0x3040<=n && 0x309F>=n) ||
               (0x30A0<=n && 0x30FF>=n)){
        return "jp";
    } else if ((0x3400<=n && 0x4DBF>=n) ||
               (0x4E00<=n && 0x9FBF>=n) ||
               (0xF900<=n && 0xFAFF>=n) ||
               (0x20000<=n && 0x2A6DF>=n) ||
               (0x2F800<=n && 0x2FA1F>=n)){
        return "cc";
    } else {
        return "etc";
    };
};

function possible_lang(string){
    let pl = {
        "kor": false,
        "eng": false,
        "jp": false,
        "ch": false
    };
    for (i=0; i<string.length; i++){
        rlt = unicode_fct(string, i);
        if (rlt == "kor"){
            pl["kor"] = true;
        } else if (rlt == "eng"){
            pl["eng"] = true;
        } else if (rlt == "jp"){
            pl["jp"] = true;
            pl["ch"] = false;
            break;
        } else if (rlt == "cc"){
            pl["jp"] = true;
            pl["ch"] = true;
        };
    };
    return pl;
};