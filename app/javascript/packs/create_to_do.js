function presentPopUp() {
   document.getElementById("create-to-do-pop-up").style.display="block";
}

function dismissPopUp(){
    document.getElementById("create-to-do-pop-up").style.display="none"
}

document.getElementById("present-pop-up").addEventListener("click", presentPopUp);
document.getElementById("dismiss-create-popup").addEventListener("click", dismissPopUp);