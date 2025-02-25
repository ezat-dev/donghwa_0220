<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <%@ include file="../include/mainHeader.jsp" %>
  <jsp:include page="../include/pluginpage.jsp"/>
  <link rel="stylesheet" href="/donghwa/css/furnace/saveToRecipe.css">
  <title>Insert title here</title>
</head>
<body style="background-color: #CCCCCC;">



  <div class="fastcooling-box"></div>
  <div class="fastcooling-header"></div>
  <div class="save-to-plc" id="save-to-plc">Save to PLC</div>
  <div class="select-furnace">Select furnace</div>
 
 
 <div class="furnace">
  <label for="furnace-select">Furnace</label>
  <select id="furnace_select2" class="select_furnace">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
  </select>
</div>
  
  <button class="save" id="ok_btn">Save</button>
  <button class="back">Back</button>

	<div class="save_popup" style="display:none;">
  <span class="close_btn" id="close_btn">X</span>
  <div class="content">
    <h2>Sent recipe</h2>
    <input type="text" id="input1" placeholder="input1" class="input_field" readonly>
    <input type="text" id="input2" placeholder="input2" class="input_field" readonly>
    <input type="text" id="input3" placeholder="input3" class="input_field" readonly>
    <textarea class="large_input" readonly>Sending recipe...</textarea>
    
    <div class="loading-container">
      <div class="loading-bar" id="loadingBar"></div>
    </div>
    
    <div class="button-container">
    <button class="ok_btn" id="ok_close_btn" onclick="valueDigitalSend();">OK</button>

      <button class="retry_btn"id="retry_btn">Retry</button>
    </div>
  </div>
</div>




<script>
let sessionData;

function fetchSessionData() {
    $.ajax({
        url: "/donghwa/furnace/getSessionData",
        type: "GET",
        success: function (response) {
            sessionData = response;  // sessionData에 값을 할당

            const dataString = sessionData.dataString;
            const dataNumber = sessionData.dataNumber;
            
            console.log('data:', sessionData.data);
            console.log('dataString:', sessionData.dataString);
            console.log('dataNumber:', sessionData.dataNumber);  

            if (dataString) {
                $("#input2").val("Name: " + (dataString.find(item => item.nodeId === "string_name")?.valueString || ""));
                $("#input3").val("Comment: " + (dataString.find(item => item.nodeId === "string_comment")?.valueString || ""));
            }

            if (dataNumber) {
                $("#input1").val("Number: " + (dataNumber.find(item => item.nodeId === "string_recipeNumber")?.valueString || ""));
            }
        },
        error: function (xhr, status, error) {
            console.error("세션 데이터 가져오기 오류:", error);
        }
    });
}

function sendPlc(data, callback) {
    $.ajax({
        url: "/donghwa/furnace/recipe/plcWrite",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(data),
        success: function(response) {
            console.log('plcWrite 서버 응답:', response);
            callback(true); 
        },
        error: function(xhr, status, error) {
            console.error('plcWrite AJAX 에러:', status, error);
            callback(false);  
        }
    });
}


	
function sendPlcString(dataString, callback) {
    $.ajax({
        url: "/donghwa/furnace/recipe/plcWriteString",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(dataString),
        success: function(response) {
            console.log('sendPlcString 서버 응답:', response);
            callback(true); 
        },
        error: function(xhr, status, error) {
            console.error('plcWriteString AJAX 에러:', status, error);
            callback(false);  
        }
    });
}

document.getElementById("retry_btn").addEventListener("click", function() {
    let loadingBar = document.getElementById("loadingBar");
    let width = 0;
    let textArea = document.querySelector(".large_input");

    let interval = setInterval(function() {
        if (width < 400) {  
            width += 3;
            loadingBar.style.width = width + "px";
        } else {
            clearInterval(interval);
            textArea.value = "Sending recipe... 완료되었습니다.";
        }
    }, 30); // 30ms마다 3px씩 증가
});

$('#retry_btn').click(function() {
    if (sessionData) {  // sessionData가 정의되었는지 확인
        sendPlc(sessionData.data, function(success) {
            if (success) {
                showMessage("Sending recipe... 진행중. SD");
            } else {
                showMessage("Sending recipe... 실패. SD");
            }
        });

        sendPlcString(sessionData.dataString, function(success) {
            if (success) {
                showMessage("Sending recipe... 진행중. SS");
            } else {
                showMessage("Sending recipe... 실패. SS");
            }
        });
    } else {
        console.error("세션 데이터가 정의되지 않았습니다.");
    }
});

function showMessage(message) {
    let textArea = document.querySelector(".large_input"); 
    textArea.value = message; 
}

function handleBackButtonClick() {
    $(".back").click(function () {
        window.history.back();
    });
}

$(document).ready(function () {
    fetchSessionData();
    handleBackButtonClick();

    $("#ok_btn").click(function() {
        $(".save_popup").show(); // 팝업 표시
        startLoadingBarAndSendData(); // 진행 바 애니메이션 및 PLC 데이터 전송
    });

    $("#close_btn").click(function () {
        $(".save_popup").hide();  
    });

    $("#ok_close_btn").click(function () {
        $(".save_popup").hide();  
    });
});

function startLoadingBarAndSendData() {
    // 진행 바 애니메이션
    let loadingBar = document.getElementById("loadingBar");
    let width = 0;
    let textArea = document.querySelector(".large_input");

    let interval = setInterval(function() {
        if (width < 400) {  
            width += 3;
            loadingBar.style.width = width + "px";
        } else {
            clearInterval(interval);
            textArea.value = "Sending recipe... 완료되었습니다."; // 완료 메시지
        }
    }, 30); // 30ms마다 3px씩 증가

    // PLC 데이터 전송
    if (sessionData) {  // sessionData가 정의되었는지 확인
        sendPlc(sessionData.data, function(success) {
            if (success) {
                showMessage("Sending recipe... 진행중. SD");
            } else {
                showMessage("Sending recipe... 실패. SD");
            }
        });

        sendPlcString(sessionData.dataString, function(success) {
            if (success) {
                showMessage("Sending recipe... 진행중. SS");
            } else {
                showMessage("Sending recipe... 실패. SS");
            }
        });
    } else {
        console.error("세션 데이터가 정의되지 않았습니다.");
    }
}

function valueDigitalSend() {
    var sendTagDir = "DONGHWA.PLC.M";  // 고정값
    var sendTagName = "M8000";          // 고정값
    var sendTagValue = true;            // 1을 true로 설정

    console.log(sendTagDir);
    console.log(sendTagName);
    console.log(sendTagValue);

    $.ajax({
        url: "/donghwa/common/valueDigitalSet",
        type: "post",
        dataType: "json",
        data: {
            "sendTagDir": sendTagDir,
            "sendTagName": sendTagName,
            "sendTagValue": sendTagValue
        },
        success: function(result) {
            console.log(result);
       
           
        },
        error: function(xhr, status, error) {
            console.error("전송 실패", status, error);
   
           
        }
    });
}

</script>


</body>
</html>
