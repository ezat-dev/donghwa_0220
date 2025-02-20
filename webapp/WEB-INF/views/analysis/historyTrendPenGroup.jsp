<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>History Trend</title>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

 
<%@ include file="../include/mainHeader.jsp" %>
<%@ include file="../include/mainFooter.jsp" %>
<jsp:include page="../include/pluginpage.jsp"/>
<style>

html, body {
    height: 100%;
    margin: 0;
    font-family: Arial, sans-serif;
}

.container {
    display: flex;
    height: 100%;
    padding: 30px;
}

.left {
    flex: 3;
    background-color: #f8f9fa;
    border-right: 1px solid #c0c7cf;
    box-sizing: border-box;
    display: flex;
    align-items: center;
    margin-left: 10px;
}

.left h2 {
    margin-top: 0;
    margin-bottom: 20px;
    color: #333;
    font-size: 18px;
}

.pen-settings {
    display: flex;
    flex-direction: column;
    width: 100%;
}

.pen-settings label {
    margin-bottom: 5px;
    font-weight: bold;
    color: #555;
}

.pen-settings input[type="text"],
.pen-settings select,
.pen-settings input[type="color"],
.pen-settings button {
    margin-bottom: 15px;
    padding: 8px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.pen-settings select {
    height: 380px;
}

.pen-settings input[type="color"],
.pen-settings button {
    width: 590px;
    height: 40px;
    margin-left: 5px;
}

.pen-settings button {
    background-color: white;
    color: black;
    border: 1px solid black;
    cursor: pointer;
    transition: background-color 0.3s;
}

.pen-settings button:hover {
    background-color: #f0f0f0;
}

.right {
    flex: 7;
    background-color: #f8f9fa;
    padding: 10px;
    position: relative;
    display: flex;
    align-items: center;
    height:80%;
}

#container {
    width: 90%;
    height: 90%;
    margin: 0 auto;
}

.pen-group-settings {
    display: flex;
    align-items: center;
    height: 80px;
    gap: 10px;
}

.pen-group-settings label {
    margin: 0;
    font-weight: bold;
}

.pen-group-settings select {
    margin: 0;
    height: 36px;
    width: 150px;
}

.btn-container {
    display: flex;
    gap: 10px;
    height: 40px;
    width: 340px;
    margin-left: 5px;
}

.pen-group-settings button {
    font-size: 12px;
    font-weight: bold;
}

#pen-list, #pen-search {
    width: 580px;
}

#pen-list {
    font-size: 15px;
}

</style>
</head>
<body style="background-color: #f8f9fa;">
<div class="container">
    <div class="left">
        <div class="pen-settings">
            <div class="pen-group-settings">
                <label for="pen-group">Pen Group:</label>
                <select id="pen-group"></select>
                <div class="btn-container">
                    <button id="load-pen-group"><i class="fas fa-save"></i> LOAD PEN GROUP</button>
                    <button id="delete-pen-group"><i class="fas fa-trash"></i> DELETE PEN GROUP</button>
                </div>
            </div>
            <h2>Pen Groups Settings</h2>
            <label for="pen-search">Search Pen:</label>
            <input type="text" id="pen-search" placeholder="Search Pen...">
            <label for="pen-list">Pen List:</label>
            <select id="pen-list" multiple></select>
            <label for="pen-color">Color:</label>
            <input type="color" id="pen-color" value="#ff0000">
         
			     
			<label for="pen-name">Pen Name:</label>
			<input type="text" id="pen-name" placeholder="Enter Pen Name...">
		

            <button type="button" id="add-button">Add</button>
        </div>
    </div>
    <div class="right">
        <div id="container"></div>
    </div>
</div>


    <script>
//전역변수
var seriesArray = [];
    
//로드
$(document).ready(function() {
	getPenGroupSelect();
});



//이벤트

//로드 펜 그룹 클릭
$("#load-pen-group").on("click",function(){
	//펜 리스트에 펜이름 적용
	getPenGroupList();
	
	//트렌드에 적용
	getPenGroupChartData();
	
	setTimeout(function(){
		getPenGroupChart();
	},500);
});


$("#pen-list").on("change", function(e) {
    var penName = $(this).val(); // 선택된 옵션 값 가져오기
//    console.log("Pen Name:", penName);
    
    if(penName == "c1"){
    	penName = "TIC 4.1.1";
    }else if(penName == "c3"){
    	penName = "TIC 4.1.2";	
    }else if(penName == "c5"){
    	penName = "TIC 4.3.1";	
    }else if(penName == "c7"){
    	penName = "TIC 4.3.2";	
    }else if(penName == "c9"){
    	penName = "TIC 4.5.1";	
    }else if(penName == "c11"){
    	penName = "TIC 4.5.2";	
    }else if(penName == "c13"){
    	penName = "TI 4.6.1";	
    }

    $("#pen-name").val(penName); // 입력 필드에 값 설정
});


$("#add-button").on("click", function() {
    var penGroup = $("#pen-group").val(); // 선택한 Pen 그룹
    var penColor = $("#pen-color").val(); // Pen 색상
    var penName = $("#pen-name").val(); // 입력한 Pen 이름

    if(penName == "TIC 4.1.1"){
    	penName = "c1";
    }else if(penName == "TIC 4.1.2"){
    	penName = "c3";
    }else if(penName == "TIC 4.3.1"){
    	penName = "c5";
    }else if(penName == "TIC 4.3.2"){
    	penName = "c7";
    }else if(penName == "TIC 4.5.1"){
    	penName = "c9";
    }else if(penName == "TIC 4.5.2"){
    	penName = "c11";
    }else if(penName == "TI 4.6.1"){
    	penName = "c13";
    }
    
    // 필수 값 확인
    if (!penGroup || !penName) {
        alert("Pen 그룹과 이름을 모두 입력해주세요.");
        return;
    }

    // 데이터 전송
    console.log("보내는 값:", {
        penGroup: penGroup,
        penColor: penColor,
        penName: penName
    });

    $.ajax({
        url: "/donghwa/analysis/penGroupPenAdd", // 서버 엔드포인트
        type: "POST",
        dataType: "json",
        data: {
            "penGroup": penGroup,
            "penColor": penColor,
            "penName": penName
        },
        success: function(response) {
            if (response.success) {
                alert("Pen 데이터가 성공적으로 추가되었습니다.");
                // 추가 작업: 성공 시 필요한 UI 업데이트
                getPenGroupList(); // Pen 목록 새로고침
            } else {
                alert("Pen 데이터를 추가하는 데 실패했습니다.");
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Error:", jqXHR, textStatus, errorThrown);
            alert("서버 요청 중 오류가 발생했습니다.");
        }
    });
});


//함수
	function unix_timestamp(t){
	    var date = new Date(t*1000);
	    var year = date.getFullYear();
	    var month = "0" + (date.getMonth()+1);
	    var day = "0" + date.getDate();
	    var hour = "0" + date.getHours();
	    var minute = "0" + date.getMinutes();
	    var second = "0" + date.getSeconds();
	    return year + "-" + month.substr(-2) + "-" + day.substr(-2) + "</br> " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
	}
	
	function unix_timestamp_tooltip(t){
	    var date = new Date(t*1000);
	    var year = date.getFullYear();
	    var month = "0" + (date.getMonth()+1);
	    var day = "0" + date.getDate();
	    var hour = "0" + date.getHours();
	    var minute = "0" + date.getMinutes();
	    var second = "0" + date.getSeconds();
	    return year + "-" + month.substr(-2) + "-" + day.substr(-2) + " " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
	}	
	
	function unix_timestamp_onClick(t){
	    var date = new Date(t*1000);
	    var year = date.getFullYear();
	    var month = "0" + (date.getMonth()+1);
	    var day = "0" + date.getDate();
	    var hour = "0" + date.getHours();
	    var minute = "0" + date.getMinutes();
	    var second = "0" + date.getSeconds();
	    return year + "-" + month.substr(-2) + "-" + day.substr(-2) + " " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
	}	



//펜 select태그 로드
function getPenGroupSelect(){
    $.ajax({
        url: "/donghwa/analysis/historyTrendPenGroupSelect",
        method: "POST",
        data: {},
        dataType: "json",
        success: function(data) {
        	var result = data.result;
        	
        	var option = "";
        	$("#pen-group").empty();
        	var penName = "";
        	
        	for(var i=0; i<result.length; i++){
        		option = "<option value='"+result[i]+"'>"+result[i]+"</option>";
        		$("#pen-group").append(option);
        	}
        }
    });
}

//펜 select태그의 펜 목록 조회(Pen List)
function getPenGroupList(){
	var selectedGroup = $("#pen-group").val();
    
    $.ajax({
        url: "/donghwa/analysis/historyTrendPenGroupList",
        method: "POST",
        data: {"pen_group_name": selectedGroup},
        dataType: "json",
        success: function(data) {
            var result = data.result;
            
            var option = "";
            $("#pen-list").empty();
            
            for(var i=0; i<result.length; i++){
            	//2025-02-20 수정
                var penInfoName = "";
            	
            	if(result[i].pen_info_name == "c1"){
            		penInfoName = "TIC 4.1.1";
            	}else if(result[i].pen_info_name == "c3"){
            		penInfoName = "TIC 4.1.2";
            	}else if(result[i].pen_info_name == "c5"){
            		penInfoName = "TIC 4.3.1";
            	}else if(result[i].pen_info_name == "c7"){
            		penInfoName = "TIC 4.3.2";
            	}else if(result[i].pen_info_name == "c9"){
            		penInfoName = "TIC 4.5.1";
            	}else if(result[i].pen_info_name == "c11"){
            		penInfoName = "TIC 4.5.2";
            	}else if(result[i].pen_info_name == "c13"){
            		penInfoName = "TI 4.6.1";
            	}
            	
            	if(result[i].pen_info_yn == 'Y'){
            		option = "<option value='"+result[i].pen_info_name+"' style='background-color:lightgray;'>"+penInfoName+"</option>";
            	}else if(result[i].pen_info_yn == 'N'){
            		option = "<option value='"+result[i].pen_info_name+"'>"+penInfoName+"</option>";
            	}
            	
            	$("#pen-list").append(option);	
            }
            
            
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Error fetching data:', textStatus, errorThrown);
        }
    });
}

//선택한 펜의 차트 조회
function getPenGroupChartData(){
	//날짜, 시간은 추후 input태그로 변경
	var sdate = "2024-08-01";
	var stime = "00:00";
	var edate = "2024-09-12";
	var etime = "23:59";
	var selectedGroup = $("#pen-group").val();
	
	var sdateTime = sdate+" "+stime+":00";
	var edateTime = edate+" "+etime+":59";
	
	$.ajax({
		url:"/donghwa/analysis/historyTrendPenGroupChart",
		type:"post",
		dataType:"json",
		data:{
			"sdateTime":sdateTime,
			"edateTime":edateTime,
			"pen_group_name":selectedGroup
		},
		success:function(result){
			var data = result.data;			
			var groupConcatSplit = data.groupConcat.split(",");

			var dataKeys = Object.keys(data);
			var dataValues = Object.values(data);
			
			var idx = 0;
			var idx2 = 0;
			
			for(var i=0; i<dataKeys.length; i++){
				for(var j=0; j<groupConcatSplit.length; j++){
					if(dataKeys[i] == groupConcatSplit[j]){
						console.log(dataValues[i]);
						
						seriesArray[idx] = dataValues[i];
						idx++;
					}					
				}
			}
			
			var chart = $("#container").highcharts();
			
			if(typeof chart != "undefined"){
				for(var i=0; i<dataKeys.length; i++){
					for(var j=0; j<groupConcatSplit.length; j++){
						if(dataKeys[i] == groupConcatSplit[j]){
							seriesArray[idx2] = dataValues[i];
							idx2++;
						}					
					}
				}			
				chart.redraw();
			}			
			
		}
	});
	
}

//하이차트 설정
function getPenGroupChart(){
	
    const chart = Highcharts.chart('container', {
    	chart: {
    		type:"spline",        		
    		panning:true,
            panKey:"shift",
            zoomType:"x",
			styleMode: true        
    	},
    	time:{
    		timezone: "Asia/Seoul",
    		useUTC: false
    	},
        yAxis: [{
//        	className: 'highcharts-color-0',
        	crosshair:{
        		width:3,
        		color:'#5D5D5D',
        		zIndex:5
        	},
            title: {
                text: 'Temper(℃)'
            },
            labels:{
            	style:{
            		fontSize:"14pt"
            	}
            }
        }],
        xAxis: {
        	crosshair:{
        		width:3,
        		color:'#5D5D5D',
        		zIndex:5
        	},
//			tickAmount:11,
            	labels:{
            		//x축 날짜포맷
					formatter:function(){
            			return unix_timestamp(this.value);
            		},
            		style:{
            			fontSize:"11pt"
            		}
            	},
        	allowDecimals:false
//        	tickmarkPlacement:'on',
//        	max:datetimeJson[datetimeJson.length-1],
//        	startOnTick:false
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },
        plotOptions: {
            series: {
            	selected:true,
            	marker:{
                	radius:1
            	}
            }
        },
        tooltip:{
        	split:true,

	        shared: true,

    		style:{
    			fontSize:"14pt"
    		}
        },
        series: seriesArray,
        responsive: {
            rules: [{
                condition: {
                    maxWidth: 1200
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        },
        exporting:{
            menuItemDefinitions: {
                // Custom definition
                label: {
                    onclick: function () {
                        this.renderer.label(
                            'You just clicked a custom menu item',
                            100,
                            100
                        )
                            .attr({
                                fill: '#a4edba',
                                r: 5,
                                padding: 10,
                                zIndex: 10
                            })
                            .css({
                                fontSize: '1.5em'
                            })
                            .add();
                    },
                    text: 'Show label'
                }
            },
            buttons: {
                contextButton: {
                    menuItems: ['downloadPNG', 'downloadPDF', 'downloadXLS', 'separator']
                }
            }
        },
        legend:{
            itemStyle:{
                fontSize: "11pt"
            }
		}
    });
    
}



</script>
</body>
</html>