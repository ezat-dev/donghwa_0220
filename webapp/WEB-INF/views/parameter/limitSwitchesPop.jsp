<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./vars.css">
  <link rel="stylesheet" href="/donghwa/css/parameter/limitSwitchesPop.css">
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
   
   .limitBox {
	  background: #ffffff;
	  width: 120px;

	  position: absolute;
	  left: 492px;
	  top: 118px;
	  display: flex;
	  align-items: center;
	  justify-content: space-between; 
	
	}
	
	.limit1, .txE, .limit2 {
	  margin: 0 6px;
	}
	
	   .hysBox {
	  background: #ffffff;
	  width: 120px;

	  position: absolute;
	  left: 645px;
	  top: 118px;
	  display: flex;
	  align-items: center;
	  justify-content: space-between; 

	}
	.txF{
	font-size:25px;
	}
	
	.hysBox1, .txE2, .hysBox2 {
	  margin: 0 6px;
	}
   </style>
  <title>Document</title>
</head>
<body>
 
    <div class="limit-switches-box"></div>
    <div class="limit-switches-header"></div>
    <div class="limit-switches-main"></div>

    <div class="no"></div>
    <div class="des"></div>
    <div class="limit-val"></div>
    <div class="hys"></div>
    <div class="unit"></div>
    <div class="_1"></div>
    <div class="des-box-1"></div>
    <div class="_12"></div>
    <div class="limit-val-1"></div>
    <div class="hys-val-1"></div>
    <div class="unit-val-1"></div>
    <div class="_2"></div>
    <div class="des-box-2"></div>
    <div class="_22"></div>
    <div class="limit-val-2"></div>
    <div class="hys-val-2"></div>
    <div class="unit-val-2"></div>
    <div class="_3"></div>
    <div class="des-box-3"></div>
    <div class="_32"></div>
    <div class="limit-val-3"></div>
    <div class="hys-val-3"></div>
    <div class="unit-val-3"></div>
    <div class="_4"></div>
    <div class="des-box-4"></div>
    <div class="_42"></div>
    <div class="limit-val-4"></div>
    <div class="hys-val-4"></div>
    <div class="unit-val-4"></div>
    <div class="limit-switches">Limit switches</div>
    <div class="no2">No.</div>
    <div class="vacuum-leaktest-furnace">Vacuum leaktest furnace</div>
    <div class="release-heating">Release Heating</div>
    <div class="furnace-temperature-for-bias-2">
      Furnace temperature for BIAS 2
    </div>
    <div class="release-heating2">Release heating</div>
    <div class="_13">1</div>
    <div class="_23">2</div>
    <div class="_33">3</div>
    <div class="_43">4</div>
    <div class="description">Description</div>
    <div class="limit-value">Limit value</div>
    <div class="hysteresis">Hysteresis</div>
    <div class="unit2">Unit</div>
    <div class="mbar">Torr</div>
    <div class="mbar2">mbar</div>
    <div class="mbar3">mbar</div>
    <div class="div">mbar</div>
    
    <div class="limitBox">
    <div class="limit1">0.0</div>
     <div class="txE txF">E</div>
    <div class="limit2">00</div>
    </div>
    
    <div class="hysBox">
    <div class="hys1">0.0</div>
     <div class="txE2 txF">E</div>
    <div class="hys2">00</div>
     </div>
    <script>

    var overviewInterval;

    //로드
    $(function(){
    	overviewListView();
    	overviewInterval = setInterval("overviewListView()", 500);
    });

    
    function setLimitRange() {
        const limit1 = document.querySelector('.limit1');

        
 
        let start = 0.9;
        let end = 9.9;
        
     
        limit1.textContent = start.toFixed(1);  
        limit1.textContent = end.toFixed(1);  
      }
    
  //OPC값 알람 조회
    function overviewListView(){
    	$.ajax({
    		url:"/donghwa/parameter/limitSwitchesPop/view",
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
//    	console.log(keys);
//    	console.log(value);
    	if(value == true){
    		$("."+keys).css("background-color","green");
    		$("."+keys).css("color","white");
    	}else{
    		$("."+keys).css("background-color","#A9A9A9");
    		$("."+keys).css("color","black");
    	}

    	$("."+keys).attr("onclick","digitalSet('DONGHWA.PARAMETER.LITMIT_SWITCHES','"+keys+"')");
    	$("."+keys).css("cursor","pointer");
    }
    /*
    function c(keys, value){
//    	$("."+keys).text(value);
    	
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
    	if(!$("div").hasClass("anlog-popup-div-color")){
    		$("."+keys).text(value);	
    	}
    	
    	$("."+keys).css("display","");
    	$("."+keys).css("text-align","center");
    //	$("."+keys).css("font-weight","700");
    	$("."+keys).css("font-size","18pt");
    	$("."+keys).css("padding-top","5px");
    	$("."+keys).attr("ondblclick","popupOpenAna('"+keys+"','DONGHWA.PARAMETER.LITMIT_SWITCHES')");
    	$("."+keys).css("cursor","pointer");
    	$("."+keys).attr("align-items","center");
    	$("."+keys).attr("margin-botoom","7px");

    }

  var popup;
  
  function modalClick(location){
      const modal = document.querySelector('.'+location);
      modal.style.display="";
  }
  
  
  


    

  

   

   

        

  </script>
</body>
</html>