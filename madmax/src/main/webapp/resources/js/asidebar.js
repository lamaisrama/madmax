
/*프로젝트 참여자 전체보기 클릭 후 (나)에 대한 버튼*/

$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip();
});

function exitFunction() {
	var exitBtn = document.getElementById("exitBtn");
	if (confirm("프로젝트에서 나가시겠습니까?")) {

	} else {
	}

}