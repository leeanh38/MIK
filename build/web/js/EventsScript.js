/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function toggleSearchBar(){
    if(document.getElementById("searchBarToggle").style.display==='flex'){
        document.getElementById("searchBarToggle").style.display='none';
//        document.getElementById("searchBarToggle").style.height='0px';
    }
    else if(document.getElementById("searchBarToggle").style.display==='none'){
        document.getElementById("searchBarToggle").style.display='flex';
//        document.getElementById("searchBarToggle").style.height='100%';
    }
}

function toggleWhereMenu(id,id2){
    if(document.getElementById(id).className.trim() =='select2 select2-container select2-container--default'){
        document.getElementById(id).className='select2 select2-container select2-container--default select2-container--focus select2-container--below select2-container--open';
        document.getElementById(id2).setAttribute("aria-expander","true");
        document.getElementById(id2).setAttribute("aria-owns","select2-zipcode-results");
        document.getElementById(id2).setAttribute("aria-activedescendant","select2-zipcode-result-1aic-75");
    }
    else if(document.getElementById(id).className.trim() =='select2 select2-container select2-container--default select2-container--focus select2-container--below select2-container--open'){
        document.getElementById(id).className='select2 select2-container select2-container--default';
        document.getElementById(id2).setAttribute("aria-expander","false");
        document.getElementById(id2).setAttribute("aria-owns","");
        document.getElementById(id2).setAttribute("aria-activedescendant","");
    }
}

function toggleButtonEntrance(){
    if(document.getElementById("freeEntranceToggle").className.trim() =='toggle btn btn-default off'){
        document.getElementById("freeEntranceToggle").className='toggle btn btn-primary';
        document.getElementById("free_entry").value = "Yes";
        
    }
    else if(document.getElementById("freeEntranceToggle").className.trim() =='toggle btn btn-primary'){
        document.getElementById("freeEntranceToggle").className='toggle btn btn-default off';
        document.getElementById("free_entry").value = "No matter";
    }
}

function toggleButtonOccasion(){
    if(document.getElementById("occasionToggle").className.trim() =='toggle btn btn-default off'){
        document.getElementById("occasionToggle").className='toggle btn btn-primary';
        document.getElementById("dinner").value = "Yes";
    }
    else if(document.getElementById("occasionToggle").className.trim() =='toggle btn btn-primary'){
        document.getElementById("dinner").value = "No matter";
        document.getElementById("occasionToggle").className='toggle btn btn-default off';
    }
}

function setActive(id){
    var previousActive = document.getElementsByClassName("active")[0].id;
    if(previousActive !== ""){
        var classString = document.getElementById(previousActive).className.trim();
        classString = classString.replace(" active","");
        document.getElementById(previousActive).className = classString;
    }
    document.getElementById(id).className += " active";

    var selectedElement = document.getElementById(id);
    var selected = selectedElement.innerHTML;

    var date = document.getElementById("date");
    var today = new Date();
    var currentMonth = today.getMonth()+1;
    var currentYear = today.getFullYear();

    var selectedClassName = selectedElement.className;
    if(selectedClassName.includes("old")){
        currentMonth--;
        if(currentMonth==1){
            currentYear--;
        }
    }else if (selectedClassName.includes("new")){
        currentMonth++;
        if(currentMonth==12){
            currentYear++;
        }
    }
    
    var selectedMonth = (currentMonth < 10) ? "0" + currentMonth.toString() : currentMonth.toString();
    var selectedDay = (selected < 10) ? "0" + selected.toString() : selected.toString();
//    var sDate = new Date(currentYear + "-" + currentMonth + "-" + selected);
    date.value = currentYear + "/" + selectedMonth + "/" + selectedDay; 
//    date.value = sDate;
}
