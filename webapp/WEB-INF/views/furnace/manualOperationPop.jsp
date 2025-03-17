<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recipe</title>
  <!-- furnace/recipeData -->
  <link rel="stylesheet" href="/donghwa/css/furnace/manualOperationPop.css">
   <jsp:include page="../include/pluginpage.jsp"/>
   <jsp:include page="../include/commonPopup.jsp"/>
  <style>
  
	.offbt {
	    width: 28px;
	    height: 27px;
	    background-color: red;
	    display: inline-block;
	    margin: 5px;
	    box-shadow: 0 0 3px rgba(0, 0, 0, 0.5);
	    transition: all 0.3s ease-in-out;
	    cursor: pointer; 
	}
	
	/* 호버 효과 */
	.offbt:hover {
	    background-color: darkred; 
	    transform: scale(1.1); 
	    box-shadow: 0 0 5px rgba(255, 0, 0, 0.7);
	}
	
	.off-pumping{
		position: absolute;
	    left: 365px;
	    top: 94px;
	}

	.off-high-vavuum{
		position: absolute;
	    left: 365px;
	    top: 138px;
	}
	

	
	.off-evacuate-fine{
		position: absolute;
	    left: 365px;
	    top: 181px;
	}		
	
	.off-evacuate-high{
		position: absolute;
	    left: 365px;
	    top: 224px;
	}
	
	
	.off-fastcooling{
		position: absolute;
	    left: 365px;
	    top: 569px;
	}
	
	
	.off-manual-leaktest{
						
		position: absolute;
	    left: 365px;
	    top: 612px;
	}	
	
	
	
	   
  </style>
</head>
<body>
	
	
	

  <div class="manual-operation-box"></div>
  <div class="manual-operation-header"></div>
  <div class="manual-operation-main"></div>

  <div class="manual-operation">Manual Operation</div>
  <div class="auto"></div>
  <div class="plc-auto"></div>
  <div class="auto2">Auto</div>
  <div class="manual"></div>
  <div class="plc-manual"></div>
  <div class="manual2">Manual</div>
  
  <div class="pumping 			asd-pumping"></div>
  <div class="plc-pumping 		asd-pumping"></div>
  <div class="pumping-station   asd-pumping">Pumping station</div>
  
  
  <div class="high-vacuum-pump asd-high-vacuum-pump"></div>
  <div class="plc-high-vacuum-pump asd-high-vacuum-pump"></div>
  <div class="high-vacuum-pump2 asd-high-vacuum-pump">High vacuum pump</div>
  
  
  <div class="evacuate-fine 		asd-evacuate-fine"></div>
  <div class="plc-evacuate-fine 	asd-evacuate-fine"></div>
  <div class="evacuate-fine-vaccum 	asd-evacuate-fine">Evacuate Fine Vaccum</div>
  
  
  <div class="evacuate-high 			asd-evacuate-high"></div>
  <div class="plc-evacuate-high 		asd-evacuate-high"></div>
  <div class="evacuate-high-vaccum 		asd-evacuate-high">Evacuate High Vaccum</div>
  
  
  <div class="fur-pre-control 			asd-fur-pre-control"></div>
  <div class="plc-fur-pre-control 		asd-fur-pre-control"></div>
  <div class="furnace-pressure-control	asd-fur-pre-control">Furnace Pressure Control</div>
  
  
  <div class="fur-hit 			asd-fur-hit"></div>
  <div class="plc-fur-hit 		asd-fur-hit"></div>
  <div class="furnace-heating 	asd-fur-hit">Furnace heating</div>
  
  
  <div class="n-2 asd-n-2"></div>
  <div class="plc-n-2 asd-n-2"></div>
  <div class="n-2-inlet asd-n-2">N2-Inlet</div>
  
  
  <div class="ar 			asd-ar"></div>
  <div class="plc-ar 		asd-ar"></div>
  <div class="ar-inlet 		asd-ar">Ar Inlet</div>
  
  
  <div class="venting asd-venting asd-venting"></div>
  <div class="plc-venting asd-venting"></div>
  <div class="venting2 asd-venting">Venting</div>
  
  
  <div class="venting-n-2 asd-venting-n-2"></div>
  <div class="plc-venting-n-2 asd-venting-n-2"></div>
  <div class="venting-n-22" style="color: #d3d3d3;">Venting N2</div>

  
  
  <div class="venting-ar asd-venting-ar"></div>
  <div class="plc-venting-ar asd-venting-ar"></div>
  <div class="venting-ar2 asd-venting-ar">Venting Ar</div>
  
  
  <div class="fastcooling asd-fastcooling"></div>
  <div class="plc-fastcooling asd-fastcooling"></div>
  <div class="fastcooling2 asd-fastcooling">Fastcooling</div>
  
  
  <div class="manual-leaktest asd-manual-leaktest"></div>
  <div class="plc-manual-leaktest asd-manual-leaktest"></div>
  <div class="manual-leaktest2 asd-manual-leaktest">Manual leaktest</div>
  
  
  <div class="open-lid asd-open-lid"></div>
  <div class="plc-open-lid asd-open-lid"></div>
  <div class="open-lid-clamps asd-open-lid">Open Lid Clamps</div>
  
  
  <div class="close-lid asd-close-lid"></div>
  <div class="plc-close-lid asd-close-lid"></div>
  <div class="close-lid-clamps asd-close-lid">Close Lid Clamps</div>


	<div class="off-pumping offbt"></div>
	
	<div class="off-high-vavuum offbt"></div>
	
	<div class="off-evacuate-fine offbt"></div>
	
	<div class="off-evacuate-high offbt"></div>

	<div class="off-manual-leaktest offbt"></div>
	
	<div class="off-fastcooling offbt"></div>
		
<script>

var overviewInterval;

//로드
$(function(){
	overviewListView();
	overviewInterval = setInterval("overviewListView()", 1000);
});


//OPC값 알람 조회
function overviewListView() {
    $.ajax({
        url: "/donghwa/furnace/manualOperation/view",
        type: "post",
        dataType: "json",
        success: function (result) {
            var data = result.multiValues;

            for (let key in data) {

                for (let keys in data[key]) {
                    var d = data[key];

                    if (d[keys].action == "v") {
                        v(keys, d[keys].value);
                    } else if (d[keys].action == "c") {
                        c(keys, d[keys].value);
                    } else if (d[keys].action == "off") {
                    	console.log("OFF 값 확인:", keys, d[keys].value);
                    	off(keys, d[keys].value);
                    } else if (d[keys].action == "value") {
                        value(keys, d[keys].value);
                    } else if (d[keys].action == "asd") {
                        asd(keys, d[keys].value);
                    } else if (d[keys].action == "plc") {
                        plc(keys, d[keys].value);
                    }
                }
            }
        }
    });
}


function v(keys, value) {
    if (keys === "auto") {
        $("." + keys).attr("onclick", "digitalSet('DONGHWA.FURNACE.MANUAL_OPERATION', '"+keys+"')")
                     .css("cursor", "pointer");  
    }
    if (keys === "manual") {
        $("." + keys).attr("onclick", "digitalSet('DONGHWA.FURNACE.MANUAL_OPERATION', '"+keys+"')")
                     .css("cursor", "pointer");  
    }
}





function value(keys, value){
	
	$("."+keys).text(value);
	$("."+keys).css("text-align","center");
	$("."+keys).css("font-size","12pt");

}



function off(keys, value){
	 if (value == true) {
	        $("." + keys).css("background-color", "green"); 
	    } else {
	        $("." + keys).css("background-color", ""); 
	    }
	 $("."+keys).attr("onclick","digitalSet('DONGHWA.FURNACE.MANUAL_OPERATION','"+keys+"')");	
}


function asd(keys, value) {
	/*	console.log("asd() 호출: keys =", keys, ", value =", value);*/


	
    if (value == true) {

		var valuesArray = keys.split("-");
		var rtnValue = "";
		var i=0;
		for(i<0;i<valuesArray.length; i++){
			if(i!=0){
				if(valuesArray.length > 2 && i < valuesArray.length-1){
					rtnValue += valuesArray[i]+"-";
				}else{
					rtnValue += valuesArray[i];
				}
			}
		}
//		rtnValue = rtnValue.substring(0,rtnValue.length-1);

//		console.log(rtnValue);

		$("." + keys).css("color", "#000000");
        $("." + keys).removeAttr("disabled"); 
        $("."+keys).attr("onclick","digitalSet('DONGHWA.FURNACE.MANUAL_OPERATION','"+rtnValue+"')");
        $("." + keys).css("cursor", "pointer");
    } else {
        $("." + keys).css("color", "#D3D3D3");
        $("." + keys).attr("disabled", true);
        $("." + keys).removeAttr("onclick");
        $("." + keys).css("cursor", "");
    }
}


function plc(keys, value) {
    if(keys.indexOf("plc-evacuate-high") != -1){
	//	console.log("plc() 호출: keys =", keys, ", value =", value);
    }
    if (value == true) {
        $("." + keys).css("background-color", "green"); 
    } else {
        $("." + keys).css("background-color", ""); 
    }
}


</script>  
</body>
</html>
