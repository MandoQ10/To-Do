function presentPopUp() {
   document.getElementById("create-to-do-pop-up").style.display="block";
}

function dismissPopUp(){
    document.getElementById("create-to-do-pop-up").style.display="none";
}

function toggleStrikedThroughText(isChecked, toDoID){
    let toDo = document.getElementById('title-' + toDoID);
  
    if(isChecked){
        toDo.style.textDecoration = "line-through";
    }else{
        toDo.style.textDecoration = "none";
    }
}

var allToDoCheckBoxes = document.querySelectorAll("#update-completion");

console.log(allToDoCheckBoxes.length)
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
