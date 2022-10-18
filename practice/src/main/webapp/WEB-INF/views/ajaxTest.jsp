<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h1>월요일은 없어졌으면 좋겠어용</h1>
<script>
    //최종적으로 cross-origin 문제를 해결해야 함
    
     //실제 전송할 데이터
     //아무래도 규모가 커지면 배열이나, JSON 덩어리를 보내게 되는 경우가 자주 발생
    // var myData =["Roze","Jenni","Risa","Yumi"];
    
    var myData = [
        {
            name:"미정",
            age:20,
            friends:["혜림","수현","유미"]
        },
        {
            name:"금규",
            age:40,
            friends:["동석","로제","제니"]
        },
        {
            name:"지영",
            age:20,
            friends:["마동석","김수현","흥치피"]
        }
    ];
    
     $.ajax({
        method:"post",
        url:"/sample/suhyun/post",  // 서버쪽에 꼭 @ResponseBody가 있기를...
        data:JSON.stringify(myData),
        contentType : "application/json; charset=utf-8",
        dataType:"text",  // 요건 항상 일단 text로 하는 게 디버깅에 유리
        success:function(data){
            console.log(data);
        },
        error: function (xhr, status, error) {
            console.log("code: " + xhr.status)
            console.log("message: " + xhr.responseText)
            console.log("error: " + error);
        }
     });
</script>
</body>
</html>