class Calendar{
	constructor(symptom, docId){
		this.now = new Date();
	    this.date = new Date(this.now.getFullYear(), this.now.getMonth(), this.now.getDate());
	    this.week = this.makeWeekArr(this.date);
	    this.symptom = symptom;
	    this.docId = docId;
	}
	makeWeekArr(date) {
	    let day = date.getDay();
	    let week = [];
	    for (let i = 0; i < 7; i++) {
	      let newDate = new Date(date.valueOf() + 86400000 * (i - day ));
	      week.push([i, newDate]);
	    }
	    return week;
  	};
  	onPressArrowLeft(){
	    let newDate = new Date(this.date.valueOf() - 86400000 * 7);
	    let newWeek = this.makeWeekArr(newDate);
	    this.date = newDate;
	    this.week = newWeek;
        renderCal(this);
  	};
	onPressArrowRight(){
	    let newDate = new Date(this.date.valueOf() + 86400000 * 7);
	    let newWeek = this.makeWeekArr(newDate);
	  	this.date = newDate;
	    this.week = newWeek;
        renderCal(this);
  	};
  	printWeek(){
		console.log(this.date);
	}
}

function init(symptom, docId){
	let cal = new Calendar(symptom, docId);
	let arrowLeft = document.querySelector(".arrowLeft");
	let arrowRight= document.querySelector(".arrowRight");
	arrowLeft.addEventListener("click", ()=>cal.onPressArrowLeft(cal.date));
	arrowRight.addEventListener("click",()=>cal.onPressArrowRight(cal.date));
    renderCal(cal);
    renderDate(cal.date.getFullYear(), cal.date.getMonth()+1, cal.date.getDate());
	sendRequest(cal.date.getFullYear(), cal.date.getMonth()+1, cal.date.getDate(), symptom, docId)
}
function selectDay(cal, e){
	let day = e.target.innerHTML;
	let month = cal.date.getMonth() + 1;
	let year = cal.date.getFullYear();
	renderDate(year, month, day);
	sendRequest(year,month,day, cal.symptom, cal.docId);
	
}
function sendRequest(year,month,day, symptom, docId){
	let httpRequest = new XMLHttpRequest();
	httpRequest.open("POST", "./components/calenderResponse.jsp", true);
	httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	let parameter = `year=${year}&month=${month}&day=${day}&symptom=${symptom}&docId=${docId}`
	httpRequest.send(parameter);
	httpRequest.onreadystatechange = function(){
		if(httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200){
			let todoWrapper = document.querySelector(".todoWrapper");
			todoWrapper.innerHTML = httpRequest.responseText;
		}
	}
}
function renderCal(cal){
    let newDate = new Date();
    let today = newDate.getDate();
    let yearMonth = document.querySelector(".yearMonth");
    let dayNumbers = document.querySelectorAll(".dayNumbers > span");
    
    yearMonth.innerHTML = cal.date.getFullYear() + " / " + (cal.date.getMonth()+1);
    dayNumbers.forEach((span, i)=> {
        span.innerHTML = cal.week[i][1].getDate();
        span.addEventListener("click", (e)=>selectDay(cal, e));
    })
    if(cal.date.getDate() == today){
        dayNumbers[cal.date.getDay()].classList.add("today")
    }else{
        dayNumbers[cal.date.getDay()].classList.remove("today");
    }
}
function renderDate(year, month, day){
	let selectedDate = document.querySelector(".selectedDate");
	selectedDate.innerHTML = `${month}월 ${day}일 시간표`;
}