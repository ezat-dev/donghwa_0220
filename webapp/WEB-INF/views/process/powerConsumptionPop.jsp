<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/donghwa/css/process/powerConsumptionPop.css">
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
   </style>
  <title>Document</title>
</head>
<body>
  
      <div class="power-con-box"></div>
      <div class="power-con-header"></div>
      <div class="power-con-main"></div>
      
      <div class="power-consumption">Power Consumption</div>
      <div class="voltage"></div>
      <div class="voltage2">Voltage</div>
      <div class="vol-box-1"></div>
      <div class="u-l-1-l-2">U L1 - L2</div>
      <div class="vol-val-1"></div>
      <div class="vol-box-2"></div>
      <div class="u-l-2-l-3">U L2 - L3</div>
      <div class="vol-val-2"></div>
      <div class="vol-box-3"></div>
      <div class="u-l-3-l-1">U L3 - L1</div>
      <div class="vol-val-3"></div>
      <div class="act-power"></div>
      <div class="active-power">Active Power</div>
      <div class="act-power-box-1"></div>
      <div class="p-l-1">P L1</div>
      <div class="act-power-val-1"></div>
      <div class="act-power-box-2"></div>
      <div class="p-l-2">P L2</div>
      <div class="act-power-val-2"></div>
      <div class="act-power-box-3"></div>
      <div class="p-l-3">P L3</div>
      <div class="act-power-val-3"></div>
      <div class="act-power-box-4"></div>
      <div class="p-total">P total</div>
      <div class="act-power-val-4"></div>
      <div class="cur"></div>
      <div class="current">Current</div>
      <div class="cur-box-1"></div>
      <div class="i-l-1">I L1</div>
      <div class="cur-val-1"></div>
      <div class="cur-box-2"></div>
      <div class="i-l-2">I L2</div>
      <div class="cur-val-2"></div>
      <div class="cur-box-3"></div>
      <div class="i-l-3">I L3</div>
      <div class="cur-val-3"></div>
      <div class="rea-power"></div>
      <div class="reactive-power">Reactive Power</div>
      <div class="rea-power-box-1"></div>
      <div class="q-l-1">Q L1</div>
      <div class="rea-power-val-1"></div>
      <div class="rea-power-box-2"></div>
      <div class="q-l-2">Q L2</div>
      <div class="rea-power-val-2"></div>
      <div class="rea-power-box-3"></div>
      <div class="q-l-3">Q L3</div>
      <div class="rea-power-val-3"></div>
      <div class="rea-power-box-4"></div>
      <div class="q-total">Q total</div>
      <div class="rea-power-val-4"></div>
      <div class="batch"></div>
      <div class="power-consumption-batch">Power Consumption Batch</div>
      <div class="batch-box-1"></div>
      <div class="w">W</div>
      <div class="batch-val-1"></div>
      <div class="app-power"></div>
      <div class="apparent-power">Apparent Power</div>
      <div class="app-power-box-1"></div>
      <div class="s-l-1">S L1</div>
      <div class="app-power-val-1"></div>
      <div class="app-power-box-2"></div>
      <div class="s-l-2">S L2</div>
      <div class="app-power-val-2"></div>
      <div class="app-power-box-3"></div>
      <div class="s-l-3">S L3</div>
      <div class="app-power-val-3"></div>
      <div class="app-power-box-4"></div>
      <div class="s-total">S total</div>
      <div class="app-power-val-4"></div>

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
			url:"/donghwa/process/powerConsumptionPop/view",
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
	  
	    if (value == true) {
	        $("."+keys).css({
	            "background-color": "green",
	            "color": "white",
	            "font-size": "20px" 
	        });
	    } else {
	        $("."+keys).css({
	            "background-color": "#E3E3E3",
	            "color": "black",
	            "font-size": "20px" 
	        });
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
		$("."+keys).css("font-size","20px");
	
	}

</script>
</body>
</html>