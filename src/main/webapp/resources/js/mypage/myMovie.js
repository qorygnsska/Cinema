

function closereview(idx){
         const myreview = document.querySelector(".myreview");
            const myreviewbox = document.querySelector("#myreviewbox" + idx);
            
            myreview.style.visibility = 'hidden';
            myreviewbox.style.visibility = 'hidden';
            
        }
        
        

        function openreview(idx){
        	const myreview = document.querySelector(".myreview");
            const myreviewbox = document.querySelector("#myreviewbox" + idx);
         	console.log(idx);
            myreview.style.visibility = 'visible';
            myreviewbox.style.visibility = 'visible';
             
        }
        
        
        

		const now = new Date();
		console.log('현재시간:', now);
		
		const twentyMinutesInMillis = 20 * 60 * 1000; // 20분을 밀리초로 변환
		const pastDate = new Date(now.getTime() - twentyMinutesInMillis);
		console.log('20분 전 시간:', pastDate);
		
		var start = Array.from(document.querySelectorAll('.mymovie--start')).map(input => input.value);
		for(let i = 0; i < start.length; i++){
			const dstart = new Date(start[i]);
			console.log('시작시간 : ', dstart);
			
			const cancel = document.querySelector("#myMovie--cancel" + i);
			
			if(pastDate < dstart){
				cancel.style.visibility = 'visible';
			}else{
				cancel.style.visibility = 'hidden';
			}
			
		}
		

		const cancel = document.querySelectorAll('.myMovie--cancel');
    	const review = document.querySelectorAll('#reviewgo');
    	
    	for(let i = 0; i < cancel.length; i++){
    		if(cancel[i].style.visibility == 'visible'){
    			review[i].style.visibility = 'hidden';
    		}else{
    			review[i].style.visibility = 'visible';
    		}
    	}
