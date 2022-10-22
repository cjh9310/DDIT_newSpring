<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초간단 채팅</title>
<style>
	#id_chatwin {
		width:300px;
		height:300px;
		background-color:black;
		border:1px solid pink;
		color:yellow;
		overflow:scroll;
	}
</style>
</head>
<body>
	<h1>간단히 대화라도 할깡</h1>
	<div>
		<div id="id_chatwin"></div>
		<input type="text" id="id_message" /> 
		<input type="button" id="id_send" value="떤쏭"> 
		<input type="button" id="id_exit" value="나갈령">
	</div>
</body>
<script>
	    const c_alpha="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		const f_ranID=()=>{
			let ranID ="";
			for(let i=1; i< (Math.ceil(Math.random()*5)+4); i++){
				ranID += c_alpha[Math.floor(Math.random()*c_alpha.length)];
			}
			return ranID;
		}

		let webSocket;
		let myId = f_ranID();
		const c_chatWin = document.querySelector("#id_chatwin");
		const c_message = document.querySelector("#id_message");		
		const c_send = document.querySelector("#id_send");
		const c_exit = document.querySelector("#id_exit");

		c_send.addEventListener("click", ()=>{
			send();
		});
		// 연결 끊깅
		c_exit.addEventListener("click", function () {
			disconnect();
		});

		//연결
		connect();
		function connect() {
			//세팅이 ip로 되어 있어야 제대로 됨, localhost로 하면 혼자 채팅 독백
			webSocket = new WebSocket("ws://192.168.141.3:8004/sample/ws-chat"); // End Point
			//이벤트에 이벤트핸들러 뜽록 
			webSocket.onopen = onOpen;
			webSocket.onmessage = onMessage;
		}

		//연결 시
		function onOpen() {
			webSocket.send(myId + "님 이프짱.");
		} 
		function send() {
			let msg = c_message.value;
			webSocket.send(myId + ":" + msg);
			c_message.value = "";
		}
		function onMessage() {
			let data = event.data;
			c_chatWin.innerHTML = c_chatWin.innerHTML + "<br/>" + data;
		}
		function disconnect() {
			webSocket.send(myId + "님이 뛰쳐나갔쪙");
			webSocket.close();
		}
</script>
</body>
</html>