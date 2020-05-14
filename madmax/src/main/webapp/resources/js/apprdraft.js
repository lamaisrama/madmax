/**
 * 
 */
		let selectedUser="";
		

		function addApprLine(apprLineList){
			$("#apprTbl-dept").children().not($(".title")).not($(".writerInfo")).remove();
            $("#apprTbl-user").children().not($(".writerInfo")).remove();
            $("#agreeTbl-dept").children().not($(".title")).remove();
            $("#agreeTbl-user").children().remove();
            $(".line-container").find("input").remove();
            $("#receivingInfo").html("");
			$.each(apprLineList, function(i,item){
				console.log(i);
				console.log(item);
				if(item.apprType=='approval'){
					$("#apprTbl-dept").append($("<th>").addClass('line').html(item.apprStep));
					$("#apprTbl-user").append($("<td>").attr('height','60').html(item.userName+"<br>"+"jobtitle"));
					
				}else if(item.apprType=="aggree"){
					
					$("#agreeTbl-dept").append($("<th>").addClass('line').html(item.apprStep));
					$("#agreeTbl-user").append($("<td>").attr('height','60').html(item.userName+"<br>"+"jobtitle"));
					
				}else {
					$("#receivingInfo")
							.append($("<span>").addClass("badge").html(item.userName))
							.append($("<input>").attr('type', 'hidden').attr('name','receivingInfo').attr('value',""+item.userName+","));
				}	
				
				var inputValue=$("<input>").attr("type","hidden").attr("name","apprLine").attr("value",""+item.apprStep+","+item.apprType+","+item.userName);
				$(".line-container").append(inputValue);
			});
			
		}
		
		function closePage(){
			var flag=confirm('정말 닫겠습니까? 작성하신 내용은 저장되지 않습니다.');
			if(flag) window.close();
		}	
		