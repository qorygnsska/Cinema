function psCheck() {
	var pw = document.getElementById("pw").value;
	var confirmpw = document.getElementById("confirmpw").value;
	var checkMsg = document.getElementById("checkMsg");

	if (pw === confirmpw) {
		checkMsg.style.color = "green";
		checkMsg.innerHTML = "비밀번호가 일치합니다.";
	} else {
		checkMsg.style.color = "red";
		checkMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
	}
}


function validateForm() {
	var pw = document.getElementById("pw").value;
	var confirmpw = document.getElementById("confirmpw").value;

	if (pw !== confirmpw) {
		alert("비밀번호가 일치하지 않습니다!!");
		return false;
	}

}