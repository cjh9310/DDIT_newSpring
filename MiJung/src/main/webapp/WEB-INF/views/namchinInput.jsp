<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보통 입력화면은 GET방식으로</title>
<link rel="shortcut icon" href="http://ticketimage.interpark.com/PlayDictionary/DATA/PlayDic/PlayDicUpload/040004/10/01/0400041001_19697_02425.gif" type="image/x-icon">
<!-- CDN으로 제공되는 건 CDN으로 편하게 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
    <div id="disp" style="border:1px solid black"></div>

<script>
	var vdisp = document.querySelector("#disp");
    //window.onload와 거의 같다고 생각해도 무방(실제는 조금 이벤트가 빨리 발생 DomContentLoaded)
    
    //리스트 출력하는 AJAX를 바끄로 꺼내
    function dispList(){
    	$.ajax({
			type:"get",
			url:"/sample/hyerim/list",
			dataType:"json", 
			beforeSend:(xhr)=>{ // 시큐리티 사용시 토근을 헤더에 담는데 사용
				xhr.setRequestHeader(header, token);
			},
			success:(rslt)=>{
				console.log("너머온값",rslt); // 요게 있어야 항상 디버깅이 편함
				var vtblStr = "<table border>";
				vtblStr += "<tr><th>ID</th><th>이름</th></tr>";
			    //배열 데이터 반복
				for(var i=0; i<rslt.length; i++){
					vtblStr += "<tr>";
					vtblStr += `<td>\${rslt[i].namId}</td>`;
					vtblStr += `<td>\${rslt[i].namTel}</td>`;					
					vtblStr += "</tr>";
				}		
			    vtblStr += "</table>";
				vdisp.innerHTML = vtblStr;	
				
				//window.open으로 하깅스
				$("tr").on("click",function(){
					var namId = this.children[0].innerHTML;
					window.open("${webPath}/hyerim/getNam?namId="+namId,"yumi","left=200,top=50,width=300,height=500")
					
				});
				
				/*시퀀스상 테이블 tr에 이벤트를 주려면 테이블이 만들어진 후에				
				$("tr").on("click",function(){
					//어떤 DOM 객체든 jQuery메소드를 쓰려면 $()로 묶어주면 끝
					 //console.log($(this));
					 //console.log(this.children[0].innerHTML);
					 //console.log($(this).children().eq(0).html());
					 var chinId = this.children[0].innerHTML;
					 $.ajax({
							type:"get",
							url:"/sample/hyerim/" + chinId,
							dataType:"json", // 보통 받아온 데이터에 JSON.parse를 할지 안할지 여부
							beforeSend:(xhr)=>{ // 시큐리티 사용시 토근을 헤더에 담는데 사용
								xhr.setRequestHeader(header, token);
							},
							success:(rslt)=>{
								console.log(rslt); // 요게 있어야 항상 디버깅이 편함
								$("input[name=namId]").val(rslt.namId);
								$("input[name=namName]").val(rslt.namName);
								$("input[name=namTel]").val(rslt.namTel);
								$("input[name=namGrade]").val(rslt.namGrade);								
							},
							error:(request,status,error)=>{
								alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						});
				});
				*/
				
			},
			error:(request,status,error)=>{
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
    }
    
    $(function(){
    	dispList();
    })


	var header = '${_csrf.headerName}';
    var token =  '${_csrf.token}';


</script>
</body>
</html>