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
	
	for(let i = dayNumber; i < dayNumber+7; i++) {
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
		
		
		let className = "day";
		let dayweek;
		
		switch(d){
			case 0:
				className += " day-sun";		
				dayweek = "일";
				
				break;
				
			case 1:
				dayweek = "월";
				
				break;
			
			case 2:
				dayweek = "화";
				
				break;
			
			case 3:
				dayweek = "수";
				
				break;
			
			case 4:
				dayweek = "목";
				
				break;
			
			case 5:
				dayweek = "금";
				
				break;
				
			case 6:
				className += " day-sat";
				dayweek = "토";
				
				break;
				
			default:
				
				break;
		}
		
		input += "<li class='"+ className +"'><span class='dayweek'>" + dayweek + "</span><span class='dayd'>" + dd + "</span></li>";
	}
	
	input += "</ul>";
	
	date.append(input);
	
	
});