<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SEND</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* 팝업 오버레이 */
        #popupOverlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 999;
        }

        /* 팝업 */
        #commonPopup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 350px;
            height: 300px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-around;
            padding: 20px;
            text-align: center;
        }

        /* 닫기 버튼 */
        .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 22px;
            font-weight: bold;
            cursor: pointer;
            color: #888;
            background: none;
            border: none;
        }

        .close-btn:hover {
            color: #f44336;
        }

        /* 제목 */
        h3 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }

        /* 버튼 */
        .toggle-btn, .bt_on, .bt_off, .bt_send {
            padding: 12px 25px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 8px;
            border: none;
            transition: all 0.3s;
            width: 230px;
            height:50px;
            
        }

        .toggle-btn {
            margin-top: 15px;
            font-weight: bold;
        }

        .on-btn {
            background-color: #4CAF50;
            color: white;
        }

        .off-btn {
            background-color: #f44336;
            color: white;
        }

        .bt_on {
            background-color: #4CAF50;
            color: white;
        }

        .bt_off {
            background-color: #f44336;
            color: white;
        }

        .bt_send {
            background-color: #888888;
            color: white;
        }

        .toggle-btn:hover, .bt_on:hover, .bt_off:hover, .bt_send:hover {
            opacity: 0.8;
        }

        /* 로딩 스피너 스타일 */
        .spinner {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #3498db;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin-top: 20px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* 로딩 오버레이 */
        #loadingOverlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }
    </style>
</head>
<body>

<!-- 팝업 열기 버튼 -->
<button onclick="openPopup()" style="padding: 12px 30px; font-size: 16px; background-color: #3498db; color: white; border: none; border-radius: 8px; cursor: pointer;">
    팝업 열기
</button>

<!-- ON/OFF 상태 전환 버튼 -->
<button id="toggleButton" class="toggle-btn on-btn" onclick="togglePopup()">ON</button>

<!-- 로딩 오버레이 및 스피너 -->
<div id="loadingOverlay">
    <div class="spinner"></div>
</div>

<!-- 팝업 오버레이 -->
<div id="popupOverlay" onclick="closePopup()"></div>

<!-- 팝업 내용 -->
<div id="commonPopup">
    <button class="close-btn" onclick="closePopup()">✖</button>
    <h2>Manual Operation</h3>
    <button class="bt_on" type="button">ON</button>
    <button class="bt_off" type="button">OFF</button>
    
    <button class="bt_send" type="button" onclick="valueDigitalSend();">전송</button>
</div>

<script>
    var setTagDir = "";
    var setTagName = "";
    var setTagValue = 0;

    window.onload = function() {
        document.getElementById('popupOverlay').style.display = 'none';
        document.getElementById('commonPopup').style.display = 'none';
        document.getElementById('loadingOverlay').style.display = 'none'; // 로딩 스피너 숨기기
    };

    // ON/OFF 버튼 이벤트
    $(".bt_on").on("click", function(e){
        $(".bt_on").css("background-color","blue");
        $(".bt_off").css("background-color","#F0F0F0");
        setTagValue = 1;
    });

    $(".bt_off").on("click", function(e){
        $(".bt_off").css("background-color","blue");
        $(".bt_on").css("background-color","#F0F0F0");
        setTagValue = 0;
    });

    // 팝업 열기
    function openPopup() {
        document.getElementById('popupOverlay').style.display = 'block';
        document.getElementById('commonPopup').style.display = 'flex';
    }

    // 팝업 닫기
    function closePopup() {
        document.getElementById('popupOverlay').style.display = 'none';
        document.getElementById('commonPopup').style.display = 'none';
    }

    // ON/OFF 버튼 상태 토글
    function togglePopup() {
        var button = document.getElementById('toggleButton');
        if (button.classList.contains('on-btn')) {
            button.classList.remove('on-btn');
            button.classList.add('off-btn');
            button.textContent = 'OFF';
        } else {
            button.classList.remove('off-btn');
            button.classList.add('on-btn');
            button.textContent = 'ON';
        }
    }

    function digitalSet(tagDir, tagName){
        console.log(tagDir+"// "+tagName);
        setTagDir = tagDir;
        setTagName = tagName;

        openPopup();
    }

    // 전송 함수 (AJAX 포함)
    function valueDigitalSend() {
        var sendTagDir = setTagDir;
        var sendTagName = setTagName;
        var sendTagValue = setTagValue == 1 ? true : false;

        console.log(sendTagDir);
        console.log(sendTagName);
        console.log(sendTagValue);

        // 로딩 스피너 보이기
        document.getElementById('loadingOverlay').style.display = 'flex';

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
                // 로딩 스피너 숨기기
                document.getElementById('loadingOverlay').style.display = 'none';
            },
            error: function(xhr, status, error) {
                console.error("전송 실패", status, error);
                // 로딩 스피너 숨기기
                document.getElementById('loadingOverlay').style.display = 'none';
            }
        });
    }
</script>

</body>
</html>
