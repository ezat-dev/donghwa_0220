<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../include/pluginpage.jsp"/>
 <link rel="stylesheet" href="/donghwa/css/process/heaterPop.css">
  
  
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
   </style>
  <title>Document</title>
</head>
<body>
  


  <div class="group-6">
  <div class="timer-main"></div>
  <div class="group-5">
    <div class="timer-header"></div>

    <div class="timer-text">Heater</div>
    <div class="description"></div>
    <div class="set-point"></div>
    <div class="actual-value"></div>
    <div class="box-1"></div>
    <div class="box-1-point"></div>
    <div class="box-1-val"></div>
    <div class="box-2"></div>
    <div class="box-2-point"></div>
    <div class="box-2-val"></div>
    <div class="box-3"></div>
    <div class="box-3-point"></div>
    <div class="box-3-val"></div>
    <div class="box-6"></div>
    <div class="box-6-point"></div>
    <div class="box-6-val"></div>
    <div class="box-8"></div>
    <div class="box-8-point"></div>
    <div class="box-8-val"></div>
    <div class="_1-1">1-1</div>
    <div class="_1-2">1-2</div>
    <div class="_2-1">2-1</div>
    <div class="_2-2">2-2</div>
    <div class="_3-1">3-1</div>
    <div class="box-82"></div>
    <div class="box-8-point2"></div>
    <div class="box-8-val2"></div>
    <div class="_3-2">3-2</div>
    <div class="heater">Heater</div>
    <div class="volltage">Volltage</div>
    <div class="current">Current</div>
  </div>
</div>

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
		url:"/donghwa/process/heaterPop/view",
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
/*
function c(keys, value){
//	$("."+keys).text(value);
	
	if(value == true){
		$("."+keys).css("background-color","red");
		$("."+keys).css("color","white");
	}else{
		$("."+keys).css("background-color","green");
		$("."+keys).css("color","black");
	}
	
}
*/

function value(keys, value){
	$("."+keys).text(value);
	$("."+keys).css("text-align","center");
	$("."+keys).css("font-size","20pt");
	
	
}

</script>  
 
  
</body>
</html>