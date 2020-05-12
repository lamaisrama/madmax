/**
 * 
 */

		function addApprLine(apprLineList){
			$("#apprTbl-dept").children().not($(".title")).not($(".writerInfo")).remove();
            $("#apprTbl-user").children().not($(".writerInfo")).remove();
            $("#agreeTbl-dept").children().not($(".title")).remove();
            $("#agreeTbl-user").children().remove();
            $(".line-container").find("input").remove();
        
			$.each(apprLineList, function(i,item){
				console.log(i);
				console.log(item);
				if(item.apprType=='approval'){
					$("#apprTbl-dept").append($("<th>").addClass('line').html(item.apprStep));
					$("#apprTbl-user").append($("<td>").attr('height','60').html(item.userName+"<br>"+"jobtitle"));
					
				}else{
					$("#agreeTbl-dept").append($("<th>").addClass('line').html(item.apprStep));
					$("#agreeTbl-user").append($("<td>").attr('height','60').html(item.userName+"<br>"+"jobtitle"));
				}				
				var inputValue=$("<input>").attr("type","hidden").attr("name","apprLine").attr("value",""+item.apprStep+","+item.apprType+","+item.userName);
				$(".line-container").append(inputValue);
			});
			
			
		}
		
		
		function closePage(){
			if(confirm('정말 닫겠습니까? 작성하신 내용은 저장되지 않습니다.')){window.close();};
			
		}	