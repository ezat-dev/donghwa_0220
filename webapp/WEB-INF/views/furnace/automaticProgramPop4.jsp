<%@ page session="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="/donghwa/css/furnace/automaticProgramPop4.css">
    <jsp:include page="../include/pluginpage.jsp"/>
  
  <style>
   a,
   button,
   input,
   select,
   h1,
   h2,
   h3,
   h4,
   h5,
   * {
       box-sizing: border-box;
       margin: 0;
       padding: 0;
       border: none;
       text-decoration: none;
       background: none;
   
       -webkit-font-smoothing: antialiased;
   }
   
   menu, ol, ul {
       list-style-type: none;
       margin: 0;
       padding: 0;
   }
   .automatic-text, .programmer-text, .startconditions-text, .batch-data-text {
    transition: all 0.3s ease;
    cursor: pointer;
	}
	
	.automatic-text:hover,
	.programmer-text:hover,
	.startconditions-text:hover,
	.batch-data-text:hover {
	    color: white;
	    transform: scale(1.05);
	}
   
   
   </style>
  <title>Document</title>
</head>
<body>

    <div class="auto-pro-box"></div>
    <div class="auto-pro-header"></div>
    <div class="auto-pro-main"></div>
    <div class="automatic-program">Automatic program</div>

    <div class="automatic"></div>
    <div class="automatic-text" onclick="popupClick('/donghwa/furnace/automaticProgramPop4', 508, 392, 730, 235);">Automatic</div>
    <div class="programmer"></div>
    <div class="programmer-text" onclick="popupClick('/donghwa/furnace/automaticProgramPop2', 508, 392, 730, 235);">Programmer</div>
    <div class="start-conditions"></div>
    <div class="startconditions-text"onclick="popupClick('/donghwa/furnace/automaticProgramPop3', 508, 392, 730, 235);">Startconditions</div>
    <div class="batch-data"></div>
    <div class="batch-data-text" onclick="popupClick('/donghwa/furnace/automaticProgramPop1', 508, 392, 730, 235);">Batch data</div>
    <div class="program-number-box"></div>
    <div class="program-number-text">Program Number</div>
    <div class="program-name-box"></div>
    <div class="program-name-text">Program Name</div>
    <div class="program-comment-box"></div>
    <div class="program-comment-text">Program Comment</div>
    <div class="id-box"></div>
    <div class="id-text">ID 0</div>
    <div class="program-number-value"></div>
    <div class="program-name-value"></div>
    <div class="program-comment-value"></div>
    <div class="id-value"></div>
    <div class="start"></div>
    <div class="start-text">Start</div>
    <div class="start-delay"></div>
    <div class="start-delay-text">Start delay</div>
    <div class="reset"></div>
    <div class="reset-text">Reset</div>
    <div class="_1 delayTime"></div>
    <div class="_2"></div>
    <div class="_12"></div>
    <div class="_22"></div>
    <div class="_3"></div>

   <script>


    var overviewInterval;

    //로드
    $(function(){
    	overviewListView();
    	overviewInterval = setInterval("overviewListView()", 500);
    });

  //OPC값 알람 조회
    function overviewListView(){
    	$.ajax({
    		url:"/donghwa/furnace/automaticProgramPop4/view",
    		type:"post",
    		dataType:"json",
    		success:function(result){				
    			var data = result.multiValues;
    			
            for(let key in data){
            	for(let keys in data[key]){
            		var d = data[key];

    					if(d[keys].action == "v"){
    						v(keys, d[keys].value);
    					}else if(d[keys].action == "c"){
    						c(keys, d[keys].value);
    					}else if(d[keys].action == "b"){
    						b(keys, d[keys].value);
    					}else if(d[keys].action == "value"){
    						value(keys, d[keys].value);
    					}

            	}                    	
            }
    		}
    	});
    }

    function v(keys, value){
    	if(value == true){
    		$("."+keys).css("background-color","green");
    		$("."+keys).css("color","white");
    	}else{
    		$("."+keys).css("background-color","#E3E3E3");
    		$("."+keys).css("color","black");
    	}

    
    }


    function value(keys, value){
        console.log("keys: ", keys);  // keys 값을 출력
        console.log("value: ", value);  // value 값을 출력

        $("."+keys).text(value);
        $("."+keys).css("text-align","center");
        $("."+keys).css("font-size","20pt");
    }

    
  var popup;
  
  function modalClick(location){
      const modal = document.querySelector('.'+location);
      modal.style.display="";
  }
  
  
  

     

    function menuClick(url) {
    	popup.close();
      location.href = url;
    }

    function popupClick(url, popupWidth, popupHeight, customLeft, customTop) {

        var browserWidth = window.innerWidth; // 브라우저 가로 크기
        var browserHeight = window.innerHeight; // 브라우저 세로 크기


        popup = window.open(
            url,
            "popupWindow",
            "width=" + popupWidth + 
            ",height=" + popupHeight + 
            ",left=" + customLeft + 
            ",top=" + customTop + 
            ",menubar=no,toolbar=no,scrollbars=no,status=no,location=no,directories=no,resizable=no"
        );

      
        if (!popup || popup.closed || typeof popup.closed == "undefined") {
            alert("팝업이 차단되었습니다. 팝업 차단 설정을 확인해주세요.");
        }
    }



 



  </script>
</body>
</html>