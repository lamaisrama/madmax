
		function addApprLine(apprLineList){
			$("#apprTbl-dept").children().not($(".title")).not($(".writerInfo")).remove();
            $("#apprTbl-user").children().not($(".writerInfo")).remove();
            $("#agreeTbl-dept").children().not($(".title")).remove();
            $("#agreeTbl-user").children().remove();
            $(".line-container").find("input").remove();
            $("#receivingInfo").html("");
			$.each(apprLineList, function(i,item){
				console.log(i, item);
				if(item.apprType=='approval'){
					$("#apprTbl-dept").append($("<th>").addClass('line').html(item.deptName));
					$("#apprTbl-user").append($("<td>").attr('height','60').html(item.userName+"<br>"+item.jobName));
					var inputValue=$("<input>").attr("type","hidden").attr("name","apprLine").attr("value",""+item.userId+","+item.apprType);
					$(".line-container").append(inputValue);
					
				}else if(item.apprType=="agree"){
					$("#agreeTbl-dept").append($("<th>").addClass('line').html(item.deptName));
					$("#agreeTbl-user").append($("<td>").attr('height','60').html(item.userName+"<br>"+item.jobName));
					var inputValue=$("<input>").attr("type","hidden").attr("name","apprLine").attr("value",""+item.userId+","+item.apprType);
					
				}else {
					$("#receivingInfo")
							.append($("<span>").addClass("badge").addClass("badge-dark").html(item.userName));
					var inputValue=$("<input>").attr("type","hidden").attr("name","receivingLine").attr("value",""+item.userId+","+item.apprType);
				}	
				
				$(".line-container").append(inputValue);
			});
			
		}
		
		function closePage(){
			var flag=confirm('정말 닫겠습니까? 작성하신 내용은 저장되지 않습니다.');
			if(flag) window.close();
		}	
		