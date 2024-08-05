$(function(){

	$('.left--section').removeClass('selected');
	$('.left--section--menu').addClass('success');
	$('.left--menu--info').addClass('success');
	$('.left--section--seat').addClass('selected');
	

	const seat = $('div.seat');
	let startRow = 'A';
	let input = "";
	for(let row = 0; row < 10; row++){
		let rowNum = String.fromCharCode(startRow.charCodeAt(0) + row);
	
		input += "<div class='seat--row' style='top:" + (25*row) + "px;'>";
		input += "<div class='seat--row--name'>";
		input += "<span>"+ rowNum + "</span>";
		input += "</div>";
		input += "<div class='seat--group'>";
		
		let seatCol = 0;
		for(let col = 1; col <= 15; col++){
			
			seatCol += 22;
			
			if((col == 4) || (col == 13)){
				seatCol = seatCol + 30;
			}else if (col != 1){
				seatCol = seatCol + 8;
			}
			input += "<button style='left:" + seatCol + "px;'>";
			input += col;
			input += "</button>";
						
			
		} 
		input += "</div>";
		input += "</div>";	
	}
	
	seat.append(input);
	
	
	
	
	
	
});