<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/donghwa/css/process/pressureSwitchesPop.css">
  <jsp:include page="../include/pluginpage.jsp"/>
  <jsp:include page="../include/commonPopup.jsp"/>
  
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
 
    <div class="pre-switches-box"></div>
    <div class="pre-switches-header"></div>
    <div class="pre-switches-main"></div>

    <div class="pressure-switches">Pressure switches</div>
    <div class="box-1"></div>
    <div class="_1"></div>
    <div class="ps-10-2-comp-air">PS 10.2 Comp. air</div>
    <div class="box-2"></div>
    <div class="_2"></div>
    <div class="ps-10-3-comp-air">PS 10.3 Comp. air</div>
    <div class="box-3"></div>
    <div class="_3"></div>
    <div class="ps-13-102-n-2">PS 13.102 N2</div>
    <div class="box-4"></div>
    <div class="_4"></div>
    <div class="ps-13-202-ar">PS 13.202 Ar</div>
 
  <script>

var overviewInterval;

//로드
$(function(){
	overviewListView();
	overviewInterval = setInterval("overviewListView()", 1000);
});

//OPC값 알람 조회
function overviewListView(){
	$.ajax({
		url:"/donghwa/process/pressureSwitchesPop/view",
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

	$("."+keys).attr("onclick","digitalSet('DONGHWA.PROCESS_VALUES.PRESSURE_SWITCHES','"+keys+"')");
	$("."+keys).css("cursor","pointer");
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
	$("."+keys).css("font-size","12pt");

}

</script>  
</body>
</html>