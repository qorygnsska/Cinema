$(function(){
	console.log("타니");
	
	const date = $('div.date');
	
	const curDate = new Date();
	const year = curDate.getFullYear();
	const month = curDate.getMonth();
	const day = curDate.getDate();
	const dayLabel = curDate.getDay(); // 요일 출력
	const dayNumber = Number(day);
	
	let monthCopy = month;
	
	console.log("year= ",year);
	console.log("month= ",month);
	console.log("day= ",day);
	console.log("dayLabel= ",dayLabel);
	console.log("dayNumber= ",dayNumber);
	
	const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"];
	
	let input = "<ul>"
	input += "<li class='year'>" + year + "</li>";
	input += "<li class='month'>" + (Number(month) +1) + "</li>";
	
	for(let i = dayNumber; i < dayNumber+14; i++) {
		let resultDay = new Date(year, month, i);
		let yyyy = resultDay.getFullYear();
		let mm = resultDay.getMonth();
		let dd = resultDay.getDate();
		let d = (Number(resultDay.getDay()));
		
		if(monthCopy !== mm){
			input += "<li class='year'>" + yyyy + "</li>";
			input += "<li class='month'>" + (Number(mm) +1) + "</li>";

			monthCopy = mm;
		}
		console.log(d);
		
		switch(d){
			case 0:
				input += "<li class='day day-sun'><span class='dayweek'>일</span><span class='dayd'>" + dd + "</span></li>";
				break;
				
			case 1:
				input += "<li class='day'><span class='dayweek'>월</span><span class='dayd'>" + dd + "</span></li>";
				break;
			
			case 2:
				input += "<li class='day'><span class='dayweek'>화</span><span class='dayd'>" + dd + "</span></li>";
				break;
			
			case 3:
				input += "<li class='day'><span class='dayweek'>수</span><span class='dayd'>" + dd + "</span></li>";
				break;
			
			case 4:
				input += "<li class='day'><span class='dayweek'>목</span><span class='dayd'>" + dd + "</span></li>";
				break;
			
			case 5:
				input += "<li class='day'><span class='dayweek'>금</span><span class='dayd'>" + dd + "</span></li>";
				break;
				
			case 6:
				input += "<li class='day day-sat'><span class='dayweek'>토</span><span class='dayd'>" + dd + "</span></li>";
				break;
				
			default:
				
				break;
		}
	}
	
	input += "</ul>";
	
	date.append(input);
	
	
});