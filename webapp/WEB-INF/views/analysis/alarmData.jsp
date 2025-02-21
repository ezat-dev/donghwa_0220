<%@ page session="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../include/pluginpage.jsp"/>
<head>
    <meta charset="UTF-8">
    <title>ALARM DATA</title>

    <!-- 스타일링 추가 -->
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        /* 팝업 창 크기와 스타일 설정 */
        .popup-container {
            width: 800px;
            height: 700px;
            margin: 50px auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            overflow: hidden;
        }

        /* 타이틀 스타일 */
        .popup-title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }

        /* Tabulator 테이블 스타일 */
        #tabulator-table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        /* 테이블 셀 스타일 */
        #tabulator-table th, #tabulator-table td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        /* 테이블 헤더 스타일 */
        #tabulator-table th {
            background-color: #007bff;
            color: white;
        }

        /* 데이터 없을 때 표시 메시지 스타일 */
        .countDATA {
            text-align: center;
            font-size: 16px;
            margin-top: 20px;
            color: #333;
        }

        /* 로딩/에러 메시지 */
        .loading-message, .error-message {
            text-align: center;
            color: #ff0000;
            font-size: 18px;
            font-weight: bold;
            display: none;
        }
    </style>
</head>
<body>

    <div class="popup-container">
        <div class="popup-title">
            실시간 알람 데이터
        </div>

        <!-- 테이블 및 로딩/에러 메시지 -->
        <div class="loading-message">데이터를 로딩 중입니다...</div>
        <div class="error-message">데이터를 가져오는 데 실패했습니다.</div>

        <!-- Tabulator 테이블 -->
        <div id="tabulator-table"></div>

        <!-- 조회된 데이터 수 -->
        <div class="countDATA">조회된 데이터 수 : 0</div>
    </div>

    <script>
        $(document).ready(function () {
            // 페이지 로드 시 자동으로 데이터 요청
            $.ajax({
                url: "/donghwa/analysis/alarmHistory/alarmlist", 
                method: "POST",
                dataType: "json",
                data: {}, // 날짜 값을 전달하지 않음
                beforeSend: function() {
                    $(".loading-message").show();
                },
                success: function(data) {
                    $(".loading-message").hide();
                    table.setData(data);
                    document.querySelector(".countDATA").textContent = "조회된 데이터 수 : " + data.length;
                    console.log("서버에서 받아온 데이터:", data);
                },
                error: function() {
                    $(".loading-message").hide();
                    $(".error-message").show();
                }
            });
        });

        var tableData = []; 

        var table = new Tabulator("#tabulator-table", {
            height: 600,
            data: tableData, 
            layout:"fitColumns",
            selectable:true,
            tooltips:true,
            selectableRangeMode:"click",
            reactiveData:true,
            headerHozAlign:"center",
            columns: [
                { title: "TAGENAME", field: "tagName", width: 340, hozAlign:"center"},
                { title: "ALARMDESC", field: "alarmDesc", width: 730, hozAlign:"center"},
                { title: "START TIME", field: "time", width: 360, hozAlign:"center"},
                { title: "END TIME", field: "lead_alarmtime", width: 360, hozAlign:"center"},
            ],
            placeholder: "검색 결과가 없습니다.", 
        });
    </script>

</body>
</html>
