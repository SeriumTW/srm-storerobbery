const div = document.getElementById("countDiv");

$(document).ready(function(){
    window.addEventListener('message', function(event){
        var eventData = event.data;
        if (eventData.action == "ui") {
            div.style.display = "block";
            div.innerHTML = 'The robbery ends with: <span id="count"></span>';
            let count = eventData.count;
            let number = document.getElementById("count");
            number.innerHTML = count ? count : "";
            updateProgress(count);
        }
        
        if (eventData.action == "cancel") {
            
            $('#countDiv').html("")
            $('#countDiv').hide()
            this.setInterval(hideDiv(),1000)
        }

    });
});


function hideDiv() {
    div.innerHTML = "";
    div.style.display = "none"; 
}

function updateProgress(newValue) {
    progressValue = newValue;
  
    if (progressValue == 0) {
        div.style.display = "none";
        div.innerHTML = "";

    } else {
        div.style.display = "block";
    }
}