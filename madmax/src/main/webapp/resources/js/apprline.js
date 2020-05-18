
    let selectUser =[];
    let deleteUser="";
    let userList = [];
	
    $(function(){

    	$(".dept>li").on("click", function(){
            $(this).children().slideToggle(100);
        });

        $(".dept>li>ul.info").on("click", function(){
        	event.stopPropagation();
        	
        });
    	
	
        $('.info li').on('click',function(e){
	        $('li').css("backgroundColor", "white");
	        $(e.target).css("backgroundColor","lightgrey");
	        selectUser=(e.target.children[0].value).split(',');
	        console.log('selectUser:');
	        console.log(selectUser);
	        
        });
            
    	$(document).on("click",".userLineInfo",function(e){
            $(".userLineInfo").css('backgroundColor','white');
            $($(e.target).parent()[0]).css('backgroundColor','lightgrey');       
            deleteUser=$(e.target).parent()[0];
    	});	
    });

    function userAdd(){
            if(selectUser=="") {
            	alert('선택된 유저가 없습니다.');
            	return;
            }

            if(document.getElementById('apprOpt').checked==""
        			&&document.getElementById('agreeOpt').checked==""
        			&&document.getElementById('receiveOpt').checked==""){

            	alert('결재방법을 선택해주세요.');
                return false;
            }

            let flag=false;
            var selectedUsers = $(".userLineInfo");
            $.each(selectedUsers, function(i,item){
                if(selectUser[0]==$(item).find($("span"))[0].innerHTML){
                    alert('이미 추가된 회원입니다.');
                    $('li').css("backgroundColor", "white");
                    selectUser="";
                    flag=true;
                }
            });
            
            if(!flag){
                const opt=document.getElementsByName('appr-method');
                let selectedOpt=""; let unselectedOpt="";
                $.each(opt, function(i, item){
                    if(item.checked) selectedOpt=item.value;
                });
                
            	if(selectedOpt=='receiving'){
            		var receivingLine=document.getElementsByClassName('userReceivingInfo');
            		if(receivingLine.length>0){
            			alert('수신인은 한명만 지정할 수 있습니다.');
            			selectUser="";
            			return;
            		}
            		
        			let tr = $("<tr>").addClass('userReceivingInfo').addClass('userLineInfo').on('click', userRemove(this));
        			let td = $("<td>")	
        			
        			const apprOpt=$("<select>").addClass('apprType').attr('name','apprType').css('display','none')
        						.append($('<option>').attr('value',selectedOpt));
        			
        			const receivelineInfo = $("<input>").addClass('userInfo').attr('type','hidden').attr('value', selectUser[0]+","+selectUser[1]+","+selectUser[2]+","+selectUser[3]);
        			let td1= $("<td>").html(selectUser[3]);
        			let td2=$("<td>").append($("<span>").html(selectUser[0])).append($("<span>").html(" "+selectUser[2])).append(receivelineInfo);
        			$("#receiving-table").append(tr.append(td1).append(td2)).append(apprOpt);
        			selectUser="";
        			
        			$('li').css("backgroundColor", "white");
                    selectUser="";
        			
        			return;
            	}
            	
            	unselectedOpt=selectedOpt=='approval'?'agree':'approval';
                let selectedOptVal = selectedOpt=='approval'?'결재':'합의';
                let unselectedOptVal = unselectedOpt=='approval'?'결재':'합의';

                let tr=$("<tr>").addClass('userLineInfo').on('click', userRemove(this));
                let td_select=$("<td>");                
                let td_input=$("<td>");
                let td_button=$("<td>");
                const apprOpt=$("<select>").addClass('apprType').attr('name','apprType')
                					.append($('<option>').attr('value',selectedOpt).html(selectedOptVal))
                					.append($('<option>').attr('value',unselectedOpt).html(unselectedOptVal));
                const lineInfoText=$('<span>').html(selectUser[0]);
                const lineInfoText2=$('<span>').html(" "+selectUser[2]);
                const lineInfoInput=$("<input>").addClass('userInfo').attr('type','hidden').attr('value', selectUser[0]+","+selectUser[1]+","+selectUser[2]+","+selectUser[3]);
                const up_btn=$("<button>").attr('type','button').addClass('btn').addClass('btn-light').addClass('btn-sm').addClass('mr-1').html('▲');
                up_btn.on('click',this,lineUp);
                const down_btn=$("<button>").attr('type','button').addClass('btn').addClass('btn-light').addClass('btn-sm').addClass('mr-1').html('▼');
                down_btn.on('click',this,lineDown);
                $(td_select).append(apprOpt);
                $(td_input).append(lineInfoText).append(lineInfoText2).append(lineInfoInput);
                $(td_button).append(up_btn).append(down_btn);
                $(tr).append(td_select).append(td_input).append(td_button);
                $("#apprLine-table").append(tr);                
                $('li').css("backgroundColor", "white");
                selectUser="";
                
            }

        }
    
    function userRemove(){
    	$(deleteUser).remove();
    	deleteUser="";
    }
    
    function userReset(){
    	$("table tr").not("#lineInfo").not("#writerInfo").remove();
    	$('tr').css("backgroundColor", "white");
    	selectUser="";
    }
    
    
    function lineUp(e){
    	const target = $(e.target).parent().parent();
    	if(target.prev()[0].id!='writerInfo')
    	$(target).prev().before($(target));
    	$('tr').css("backgroundColor", "white");
    	$('td').css("backgroundColor", "white");
    	deleteUser="";
    }
    
    
    function lineDown(e){
    	const target = $(e.target).parent().parent();
    	console.log(target);
    	console.log(target.next().length);
    	if(target.next().length!=0){
    		$(target).next().after($(target));
    		$('tr').css("backgroundColor", "white");    	
    		$('td').css("backgroundColor", "white");
    		deleteUser="";
    	}
    }
    
    function sendLine(){
    	const userInfo = $(".userInfo"); 
    	$.each(userInfo, function(i,item){
    		const userArray=(item.value).split(',');
    		const apprTypes = $(".apprType");
    		const apprType=apprTypes[i].value;
    		userList.push(new apprLineInfo(apprType, userArray[0], userArray[1], userArray[2], userArray[3]));
    	});
    	var data = JSON.stringify(userList);
    	opener.addApprLine(userList);
    	userList=[];
    	window.close();
    }	
    
    function apprLineInfo(apprType, userName, userId, jobName, deptName){
    	this.apprType=apprType;
    	this.userName=userName;
    	this.userId=userId;
    	this.jobName=jobName;
    	this.deptName=deptName;
    }