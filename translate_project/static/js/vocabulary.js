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
}