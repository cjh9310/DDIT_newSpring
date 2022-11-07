<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유미의 요청</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<p>${yumiDa}</p>
	<form action="" id="myForm" >
	     <!-- 프로그램적으로는 필요한 데 구지 따용자에게 보여 줄 필요가 없을 때 hidden 사용 -->
	     <input type="hidden" name="namId" value="${yumiDa.namId}">
		이름<input type="text" name="namName" value="${yumiDa.namName}"><br>
		등급<input type="text" name="namGrade" value="${yumiDa.namGrade}"><br>
		전화<input type="text" name="namTel" value="${yumiDa.namTel}"><br>
		<input type="submit"  value ="뜽록" id="btn">
		<input type="button"  value ="수정" id="btnUp">
		<input type="button"  value="삭제" id="btnDel">
		<!-- submit에는 onclick을 사용하지 않음! -->
    </form>
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

$("#btnDel").on("click",()=>{
	$.ajax({
		type:"delete",  // RESTFUL에서 일반적으로 PUT은 UPDATE 수정에 사용
		url:"/sample/hyerim/delete",
		data: JSON.stringify({
			namId:$("input[name=namId]").val()
		}),
		contentType : "application/json; charset=utf-8",
		dataType:"text", // 보통 받아온 데이터에 JSON.parse를 할지 안할지 여부
		beforeSend:(xhr)=>{ // 시큐리티 사용시 토근을 헤더에 담는데 사용
			xhr.setRequestHeader(header, token);
		},
		success:(rslt)=>{
			console.log("너머온값",rslt); // 요게 있어야 항상 디버깅이 편함
			//location.href = location.href; // 현재 페이지 새로 고침, href는 캐쉬된 걸 줄 수도 있음
			//location.replace(location.href); // DB에 변화가 생겼다면 이걸 쓰는 거이 마즘
			//dispList(); // ajax로 리스트 다시 가져와서 div#disp 에 뿌리깅
			//opener.location.replace(opener.location.href); 요것보단 아래 방식으롱
			opener.dispList(); // 되면 좋고 안되면 말고 심정으로.. 요런식 자주 썼으면 좋겠어용
			opener.focus();
			window.close();

		},
		error:(request,status,error)=>{
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
});

$("#btnUp").on("click",()=>{
	//put은 쿼리스트링 안됨?
	$.ajax({
		type:"put",  // RESTFUL에서 일반적으로 PUT은 UPDATE 수정에 사용
		url:"/sample/hyerim/update",
		data: JSON.stringify({
			namId:$("input[name=namId]").val(),
			namName:$("input[name=namName]").val(),
			namTel:$("input[name=namTel]").val(),
			namGrade:$("input[name=namGrade]").val(),
		}),
		contentType : "application/json; charset=utf-8",
		dataType:"text", // 보통 받아온 데이터에 JSON.parse를 할지 안할지 여부
		beforeSend:(xhr)=>{ // 시큐리티 사용시 토근을 헤더에 담는데 사용
			xhr.setRequestHeader(header, token);
		},
		success:(rslt)=>{
			console.log("너머온값",rslt); // 요게 있어야 항상 디버깅이 편함
			//location.href = location.href; // 현재 페이지 새로 고침
			//location.replace(location.href); // DB에 변화가 생겼다면 이걸 쓰는 거이 마즘, 
			//안타깝지만 잘되는 뎅 SPA (Single Page Application) 가 무너짐 
			//dispList(); // ajax로 리스트 다시 가져와서 div#disp 에 뿌리깅
			//swal("Good job!", "아주 잘 수정되었어용!", "success");
			//opener.location.replace(opener.location.href);
			opener.dispList(); // 되면 좋고 안되면 말고 심정으로.. 요런식 자주 썼으면 좋겠어용
			window.close(); // 자기 자신 닫기
		},
		error:(request,status,error)=>{
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
});



$("#myForm").on("submit",()=>{
	event.preventDefault();  // form 전송 안되겡

	/*  인코딩메소드           디코딩메소드
	   escape                 unescape          어쭈 옛날꺼
	   encodeURI              decodeURI         몇년전 옛날꺼
	   encodeURIComponent     decodeURIComponent 최근꺼
	*/
	alert(decodeURIComponent($("#myForm").serialize())); // 항상 궁금하면 찍어 봄
	$.ajax({
		type:"post",
		url:"/sample/hyerim/insert",
		data:$("#myForm").serialize(),    // 넘길 데이타
		dataType:"text", // 보통 받아온 데이터에 JSON.parse를 할지 안할지 여부
		beforeSend:(xhr)=>{ // 시큐리티 사용시 토근을 헤더에 담는데 사용
			xhr.setRequestHeader(header, token);
		},
		success:(rslt)=>{
			console.log("너머온값",rslt); // 요게 있어야 항상 디버깅이 편함
		},
		error:(request,status,error)=>{
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
})


 /* ajax는 이미 추상화를 해버린 jquery ajax를 쓰면 일관성이 있어서 편함    
const cForm = document.querySelector("#myForm");
cForm.addEventListener("submit",()=>{
	event.preventDefault();  
	var v_ajax = new XMLHttpRequest(); 
    v_ajax.open("post","/sample/hyerim/insert",true);
	//일반 post방식일 때 아래 줄이 필요
	v_ajax.setRequestHeader("content-type","application/x-www-form-urlencoded")
	v_ajax.setRequestHeader(header, token);
	
	v_ajax.onreadystatechange = ()=>{
    	if(v_ajax.readyState == 4 && v_ajax.status == 200){  
           console.log(v_ajax.responseText)               
    	}
	}
	v_ajax.send();
});
*/


</script>
</body>
</html>