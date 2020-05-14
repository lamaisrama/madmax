/**
 * 
 */

    let selectUser ="";
    let deleteUser="";
	let userList = [];
    
    $(function(){

    	$("li").on("click", function(){
            $(this).children().slideToggle(100);
        });
        $(".un").on("click", function(e){
        	e.stopPropagation();
        })
    	
    	//$(document).on("click",".un",function(e){
            $('.info li').on('click',function(e){
            console.log($('user-container li'));
            $('li').css("backgroundColor", "white");
            $(e.target).css("backgroundColor","lightgrey");
            selectUser = e.target.innerHTML;
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
            
            const selectedUsers = document.getElementsByName('userInfo');
            let flag=false;
            $.each(selectedUsers, function(i,item){
                if(item.value == selectUser){
                    alert('이미 추가된 회원입니다.');
                    $('li').css("backgroundColor", "white");
                    flag=true;
                }
            });
            
            if(!flag){
                const opt=document.getElementsByName('appr-method');
                let selectedOpt=""; let unselectedOpt="";
                $.each(opt, function(i, item){
                	                	
                    if(item.checked) selectedOpt=item.value;
                    else unselectedOpt=item.value;
                });
                
            	if(selectedOpt=='receiving'){
            		var receivingLine=document.getElementsByClassName('userReceivingInfo');
            		if(receivingLine.length>0){
            			alert('수신인은 한명만 지정할 수 있습니다.');
            			return;
            		}
        			let tr = $("<tr>").addClass('userLineInfo').on('click', userRemove(this));
        			let td = $("<td>")
        			const apprOpt=$("<select>").addClass('apprType').attr('name','apprType').css('display','none')
        						.append($('<option>').attr('value',selectedOpt));
        			const lineInfo = $('<input>').addClass('userReceivingInfo').addClass('userInfo').attr('type','text')
					.attr('name','userInfo').attr('value',selectUser).attr('disabled',true);
        			let td1= $("<td>").html("부서명");
        			let td2 = $("<td>").append(apprOpt).append(lineInfo);
        			$("#receiving-table").append(tr.append(td1).append(td2));
        			selectUser="";
        			return;
            	}
                let selectedOptVal = selectedOpt=='approval'?'결재':'합의';
                let unselectedOptVal = unselectedOpt=='approval'?'결재':'합의';
                let tr=$("<tr>").addClass('userLineInfo').on('click', userRemove(this));
                let td_select=$("<td>");                
                let td_input=$("<td>");
                let td_button=$("<td>");
                const apprOpt=$("<select>").addClass('apprType').attr('name','apprType')
                					.append($('<option>').attr('value',selectedOpt).html(selectedOptVal))
                					.append($('<option>').attr('value',unselectedOpt).html(unselectedOptVal));
                const lineInfo=$('<input>').addClass('userInfo').attr('type','text')
                					.attr('name','userInfo').attr('value',selectUser).attr('disabled',true);

                const up_btn=$("<button>").attr('type','button').addClass('btn').addClass('btn-light').addClass('btn-sm').addClass('mr-1').html('▲');
                up_btn.on('click',this,lineUp);
                const down_btn=$("<button>").attr('type','button').addClass('btn').addClass('btn-light').addClass('btn-sm').addClass('mr-1').html('▼');
                down_btn.on('click',this,lineDown);
                $(td_select).append(apprOpt);
                $(td_input).append(lineInfo);
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
    }
    
    
    function lineUp(e){
    	const target = $(e.target).parent().parent();
    	$(target).prev().before($(target));
    }
    
    
    function lineDown(e){
    	const target = $(e.target).parent().parent(); 
    	$(target).next().after($(target));
    	
    }
    
    function sendLine(){
    	const userInfo = $(".userInfo"); 
    	$.each(userInfo, function(i,item){
    		const apprStep=i+1;
    		const apprTypes = $(".apprType");
    		const apprType=apprTypes[i].value;
    		const username=item.value;
    		userList.push(new apprLineInfo(apprStep, apprType, username));
    	});
    	var data = JSON.stringify(userList);
    	opener.addApprLine(userList);
    	userList=[];
    	window.close();
    }	
    
    function apprLineInfo(apprStep, apprType, userName){
    	this.apprStep=apprStep;
    	this.apprType=apprType;
    	this.userName=userName;
    }