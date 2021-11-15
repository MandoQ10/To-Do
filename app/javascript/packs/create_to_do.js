function presentPopUp() {
   document.getElementById("create-to-do-pop-up").style.display="block";
}

function dismissPopUp(){
    document.getElementById("create-to-do-pop-up").style.display="none"
}

var allToDoCheckBoxes = document.querySelectorAll("input[type='checkbox']");

function updateCompletion(checkBox){
    $.ajax({
        type: "PATCH",
        url: "/to_do_entries/" + checkBox.value,
        data: {to_do_entry: {id: checkBox.value, completed: checkBox.checked}},
        datatype: "html",
        async: true,
    });
    console.log(checkBox.checked);
    console.log(checkBox.value);
}

allToDoCheckBoxes.forEach(checkBox => {
    checkBox.addEventListener('click', function () { updateCompletion(checkBox)});
});

document.getElementById("present-pop-up").addEventListener("click", presentPopUp);
document.getElementById("dismiss-create-popup").addEventListener("click", dismissPopUp);