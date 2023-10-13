// 로그인 되어있지않으면 유저메뉴 안보이게
document.addEventListener("DOMContentLoaded", function() {
    var bodyClass = document.body.className;

    if (bodyClass.indexOf("logged-out") !== -1) {
        var userMenu = document.querySelector(".dropdown");
        userMenu.style.display = "none";
    }
});