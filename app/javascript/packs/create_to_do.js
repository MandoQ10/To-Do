function presentPopUp() {
   document.getElementById("create-to-do-pop-up").style.display="block";
}

function dismissPopUp(){
    document.getElementById("create-to-do-pop-up").style.display="none";
}

function toggleStrikedThroughText(isChecked, toDoID){
    let toDo = document.getElementById('title-' + toDoID);
    let toDoCard = toDo.parentElement.parentElement;

    if(isChecked){
        toDoCard.style.backgroundColor = "rgb(156, 154, 154)";
        toDo.style.textDecoration = "line-through";
    }else{
        toDoCard.style.backgroundColor = "white";
        toDo.style.textDecoration = "none";
    }
}

var allToDoCheckBoxes = document.querySelectorAll(".completion-checkbox");

function updateCompletion(checkBox){
    $.ajax({
        type: "PATCH",
        url: "/to_do_entries/" + checkBox.value,
        data: {
            to_do_entry:{
                completed: checkBox.checked
            }},
        datatype: "html",
        async: true,
    });
}

allToDoCheckBoxes.forEach(checkBox => {
    checkBox.addEventListener('click', function () { updateCompletion(checkBox)});
    toggleStrikedThroughText(checkBox.checked, checkBox.value);
});

document.getElementById("present-pop-up").addEventListener("click", presentPopUp);
document.getElementById("dismiss-create-popup").addEventListener("click", dismissPopUp);
