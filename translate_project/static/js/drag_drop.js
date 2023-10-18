var score = 0;
var game_stage = 1;


function dragMoveListener(event) {
    var target = event.target;
    var x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx;
    var y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;

    target.style.transform = 'translate(' + x + 'px, ' + y + 'px)';
    target.setAttribute('data-x', x);
    target.setAttribute('data-y', y);
}

// 단어카드를 맞게 드래그 했을 때(클릭 중)
function onDragEnter(event) {
    var draggableElement = event.relatedTarget;
    var dropzoneElement = event.target;
    score += 1;

    dropzoneElement.classList.add("drop-target");  // 타겟에 적용
    draggableElement.classList.add("can-drop"); // 단어 카드에 적용
    if (score == 8){
        setTimeout(function() {
            window.alert("정답 입니다"); // 정답
         
       
        // 다음 단계 페이지로 이동
        let next_stage = confirm("다음 단계로 넘어가시겠습니까?");
        if (next_stage == true){
            // 백엔드쪽으로 페이지 번호 넘기기 - test
            // game_stage += 1;
            // $('input[name=stage_no]').attr('value',game_stage);
            // document.location.submit()
            // test 코드 끝
            document.write(stage_no)
        }
         }, 2000);
    }
}
// 단어카드가 정답 칸에 없을 때(나갔을 때, 맞지 않는 곳에 있을 때)
function onDragLeave(event) {
    event.target.classList.remove("drop-target"); // 타겟에 이벤트 적용 해제
    event.relatedTarget.classList.remove("can-drop"); // 단어 카드에 이벤트 적용 해제
    event.relatedTarget.classList.add("back"); // 단어 카드 원래 자리로

}

// 답에 맞게 드랍했을 때(드래그 하고 클릭 뗐을 때)
function onDrop(event) {
    event.target.classList.remove("drop-target");
}


// 드롭 존마다 설정
document.addEventListener("DOMContentLoaded", event => {
    window.dragMoveListener = dragMoveListener;

    interact("#dropzoneA").dropzone({
        accept: ".itemA",
        overlap: 0.75,
        ondragenter: onDragEnter,
        ondragleave: onDragLeave,
        ondrop: onDrop
    });

    interact("#dropzoneB").dropzone({
        accept: ".itemB",
        overlap: 0.75,
        ondragenter: onDragEnter,
        ondragleave: onDragLeave,
        ondrop: onDrop
    });

    interact("#dropzoneC").dropzone({
        accept: ".itemC",
        overlap: 0.75,
        ondragenter: onDragEnter,
        ondragleave: onDragLeave,
        ondrop: onDrop
    });
    interact("#dropzoneD").dropzone({
        accept: ".itemD",
        overlap: 0.75,
        ondragenter: onDragEnter,
        ondragleave: onDragLeave,
        ondrop: onDrop
    });
    interact("#dropzoneE").dropzone({
        accept: ".itemE",
        overlap: 0.75,
        ondragenter: onDragEnter,
        ondragleave: onDragLeave,
        ondrop: onDrop
    });
    interact("#dropzoneF").dropzone({
        accept: ".itemF",
        overlap: 0.75,
        ondragenter: onDragEnter,
        ondragleave: onDragLeave,
        ondrop: onDrop
    });
    interact("#dropzoneG").dropzone({
        accept: ".itemG",
        overlap: 0.75,
        ondragenter: onDragEnter,
        ondragleave: onDragLeave,
        ondrop: onDrop
    });
    interact("#dropzoneH").dropzone({
        accept: ".itemH",
        overlap: 0.75,
        ondragenter: onDragEnter,
        ondragleave: onDragLeave,
        ondrop: onDrop
    });

    // draggable아이템(단어들)
    interact(".draggable").draggable({
        inertia: true,
        autoScroll: true,
        modifiers: [
            interact.modifiers.restrictRect({
                restriction: "parent",
                endOnly: true
            })
        ],
        // 움직일 수 있도록
        listeners: { 
            move: dragMoveListener
        }
    });
});