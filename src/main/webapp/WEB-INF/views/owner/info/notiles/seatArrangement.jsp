<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 배치하기</title>

	<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/flick/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"
            integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">

	<style>
	    body {
	      display: flex;
	      flex-direction: column;
	      justify-content: center;
	      align-items: center;
	    }
	
	    #boxspace { 
	            width: 800px; 
	            height: 100px;
	            border:1px solid lightgray; 
	            border-radius: 10px;
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            position: relative;
	            margin-bottom: 10px;
	    }
	
	    #seatspace { 
	            background: #fafafd; 
	            width: 800px; 
	            height: 600px;
	            border:1px solid lightgray; 
	            border-radius: 10px;
	            display: flex;
	    }
	
	    .box {
	        position: absolute;
	        user-select: none;
	        transform: translate(-50%, -50%);
	        border-radius: 10px;
	        display: flex;
	        justify-content: center;
	        align-items: center;
	    }
	
	    .resize-handler {
	        height: 10px;
	        width: 10px;
	        background-color: lightgray;
	        position: absolute;
	        border-radius: 100px;
	        border: 1px solid #ffffff;
	        user-select: none;
	        display: none;
	    }
	    .resize-handler:hover {background-color: #0000cc;}
	    .resize-handler.rotate {cursor: url('https://findicons.com/files/icons/1620/crystal_project/16/rotate_ccw.png'), auto;}
	
	    :root {
	        /* id-1 */
	        --left-1: 65px;
	        --top-1: 50px;
	        --width-1: 75px;
	        --height-1: 75px;
	        --bg-1: yellow;
	        --zi-1: 1;
	
	        /* id-2 */
	        --left-2: 200px;
	        --top-2: 50px;
	        --width-2: 150px;
	        --height-2: 75px;
	        --bg-2: pink;
	        --zi-2: 2;
	
	        /* id-3 */
	        --left-3: 450px;
	        --top-3: 50px;
	        --width-3: 300px;
	        --height-3: 75px;
	        --bg-3: skyblue;
	        --zi-3: 3;
	
	        /* id-exit */
	        --left-4: 700px;
	        --top-4: 27px;
	        --width-4: 150px;
	        --height-4: 30px;
	        --bg-4: lightgray;
	        --zi-4: 4;
	    }
	    
	    #subBtn {
	    	color: white;
	    	background-color: #65A4BE;
	    	padding: 0.45rem 0.9rem;
	    	margin-top: 10px;
	    	border-style: none;
	    }
	  </style>

</head>
<body>

	<div id="boxspace">
<!--         <div class="box" data-id="1" style="left: var(--left-1); top: var(--top-1); z-index: var(--zi-1); width: var(--width-1); height: var(--height-1); background-color: var(--bg-1);"><P>T201</P></div> -->
<!--         <div class="box" data-id="2" style="left: var(--left-2); top: var(--top-2); z-index: var(--zi-2); width: var(--width-2); height: var(--height-2); background-color: var(--bg-2);"><P>T401</P></div> -->
<!--         <div class="box" data-id="3" style="left: var(--left-3); top: var(--top-3); z-index: var(--zi-3); width: var(--width-3); height: var(--height-3); background-color: var(--bg-3);"><P>R01</P></div> -->
        <div data-id="exit" class="box" style="left: var(--left-4); top: var(--top-4); z-index: var(--zi-4); width: var(--width-4); height: var(--height-4); background-color: var(--bg-4);"><P>출입구</P></div>
    </div>
    <div id="seatspace"></div>
    <button type="button" id="subBtn">저장</button>

</body>

<script src="${pageContext.request.contextPath }/resources/assets/js/seat-arrangement.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	// 파라미터 가져오기
    var t2 = <%= request.getParameter("t2") %>;
    var t4 = <%= request.getParameter("t4") %>;
    var t8 = <%= request.getParameter("t8") %>;

    // t2 좌석 수만큼 박스 생성하고 배치
    for (var i = 1; i <= t2; i++) {
      var box = document.createElement('div');
      box.className = 'box';
      box.textContent = '2인석-' + i;
      box.dataset.id = 'T20' + i;
      box.dataset.rotation = 0; // 초기 회전 각도를 0으로 설정
      box.style.cssText = "left: var(--left-1); top: var(--top-1); z-index: var(--zi-1); width: var(--width-1); height: var(--height-1); background-color: var(--bg-1)";
      document.getElementById('boxspace').appendChild(box);
    }
    
	 // t4 좌석 수만큼 박스 생성하고 배치
    for (var i = 1; i <= t4; i++) {
      var box = document.createElement('div');
      box.className = 'box';
      box.textContent = '4인석-' + i;
      box.dataset.id = 'T40' + i;
      box.dataset.rotation = 0; // 초기 회전 각도를 0으로 설정
      box.style.cssText = "left: var(--left-2); top: var(--top-2); z-index: var(--zi-2); width: var(--width-2); height: var(--height-2); background-color: var(--bg-2)";
      document.getElementById('boxspace').appendChild(box);
    }
 
	 // t8 좌석 수만큼 박스 생성하고 배치
    for (var i = 1; i <= t8; i++) {
      var box = document.createElement('div');
      box.className = 'box';
      box.textContent = '룸(8인석)-' + i;
      box.dataset.id = 'T80' + i;
      box.dataset.rotation = 0; // 초기 회전 각도를 0으로 설정
      box.style.cssText = "left: var(--left-3); top: var(--top-3); z-index: var(--zi-3); width: var(--width-3); height: var(--height-3); background-color: var(--bg-3)";
      document.getElementById('boxspace').appendChild(box);
    }
    
    $('.box').boxModeling({
        rotate: true,
// 	    resize: true,
        move: true,
    });
    
    $(function(){
        var subBtn = $("#subBtn");
        
        subBtn.on("click", function(){  
        	// 여러 가지 데이터를 객체에 담기
            var seatData = [];
            $(".box").each(function() {
                seatData.push({
                	seatCd: $(this).data('id'), // 박스의 ID 또는 다른 속성 데이터
					seatStyle: $(this).attr("style")
                });
            });
            
            console.log("seatData : " + JSON.stringify(seatData));

            $.ajax({
                type: "POST",
                url: "/owner/seatArrangement.do",
                beforeSend: function(xhr){
    				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
    			},
                data: JSON.stringify(seatData),  // 배열을 문자열로 변환하여 전송
                contentType: "application/json;charset=UTF-8",
                success: function(response) {
                    console.log(response);  
                    
                    Swal.fire({
					      title: '생성 완료',
					      icon: 'success',
					      text: '좌석 생성이 완료되었습니다!',
					    }).then((result) => {
				            if (result.isConfirmed) {
				                opener.parent.location.reload('/owner/seat.do');
				                window.close();
				                    }
				          });
                },
                error: function(error) {
                    console.error(error);  
                    
                    Swal.fire({
						title: '생성 에러',
					    icon: 'error',
					    text: '다시 시도해주세요!'
					}).then((result) => {
			            if (result.isConfirmed) {
			            	location.reload();
			                    }
			          });
                }

            });

        });
    });

</script>

</html>