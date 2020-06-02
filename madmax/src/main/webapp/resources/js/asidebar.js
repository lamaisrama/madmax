/*이전화면*/
function fn_goBack() {
	window.history.go(-1);
}
			
/* 파일함의 파일명으로 검색하기 */
$(document).ready(function(){
	$("#searchFileName").on("keyup", function() {
		var value = $(this).val().toLowerCase();
			$("#fileListTable tr").filter(function() {
			console.log($(this).children().eq(0).text());
			$(this).toggle($(this).children().eq(0).text().toLowerCase().indexOf(value) > -1)
		});
	});
});

/*전체보기> 참여자 이름으로 검색하기*/
$(document).ready(function(){
    $("#searchMember").on("keyup", function() {
      var value = $(this).val().toLowerCase();
        $(".pjJoinAllMemberList").filter(function() {
          console.log($(this).text());
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
  });

/*$(document).ready(function(){
	$("#invitationSearch").on("keyup", function() {
		var value = $(this).val().toLowerCase();
			$(".m-0").filter(function() {
				console.log($(this).children().eq(1).text());
				$(this).toggle($(this).children().eq(1).text().toLowerCase().indexOf(value) > -1)
			});
	});
});*/

/*프로젝트 참여자 전체보기 클릭 후 (나)에 대한 나가기 버튼*/
$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip();
});


/*파일함에서 파일다운로드 스크립트*/
//	function fileDownload(pjNo,ori,rename){
//		ori=encodeURIComponent(ori);
//		location.href="${path}selectedProject/fileDownload.do?pjNo="+pjNo+"&ori="+ori+"&rename="+rename;
//	}
	
	
/* 프로젝트 나가기 */
function exitFunction() {
	var exitBtn = document.getElementById("exitBtn");
	if (confirm("프로젝트에서 나가시겠습니까?")) {
		/*확인 누르면 프로젝트에서 나간다*/
	} else {
		/*취소 누르면 취소임~~~~~*/
	}

}