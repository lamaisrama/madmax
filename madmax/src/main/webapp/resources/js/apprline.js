/**
 * 
 */

    let selectUser ="";
    let deleteUser="";
    $(function(){
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

            if(document.getElementById('apprOpt').checked==""&&document.getElementById('consentOpt').checked==""){
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
                console.log(selectedOpt+unselectedOpt);
                let tr=$("<tr>").addClass('userLineInfo').on('click', userRemove(this));
                let td_select=$("<td>");                
                let td_input=$("<td>");
                let td_button=$("<td>");
                const apprOpt=$("<select>").attr('name','apprType').append($('<option>').attr('value',selectedOpt).html(selectedOpt)).append($('<option>').attr('value',unselectedOpt).html(unselectedOpt));
                const lineInfo=$('<input>').attr('type','text').attr('name','userInfo').attr('value',selectUser).attr('disabled',true);
                const up_btn=$("<button>").attr('type','button').addClass('btn').addClass('btn-light').addClass('btn-sm').addClass('mr-1').on('click',lineUp).html('▲');
                const down_btn=$("<button>").attr('type','button').addClass('btn').addClass('btn-light').addClass('btn-sm').addClass('mr-1').on('click',lineDown).html('▼');
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
    
    function lineUp(){
    	
    }
    function lineDown(){
    	
    }