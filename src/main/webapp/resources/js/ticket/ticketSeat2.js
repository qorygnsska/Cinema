$(function(){
	const seat = $('div.seat');
	let startRow = 'A';
	let input = "";
	for(let row = 0; row < 10; row++){
		let rowNum = String.fromCharCode(startRow.charCodeAt(0) + row);
	
		input += "<div class='row' style='top:" + (16*row) + "px;'>";
		input += "<span>"+ rowNum + "</span>";
		input += "<div class='seat-group'>";
		for(let col = 1; col <= 15; col++){
			
			
			input += "<div style='left:" + (16*col) + "px;'>";
			input += "<span>" + col + "</span>";
			input += "</div>";
						
			
		} 
		input += "</div>";
		input += "</div>";	
	}
	
	seat.append(input);
});