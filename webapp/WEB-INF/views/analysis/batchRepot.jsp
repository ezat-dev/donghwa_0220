<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tabulator Table</title>
    <script src="https://unpkg.com/tabulator-tables/dist/js/tabulator.min.js"></script>
    <link href="https://unpkg.com/tabulator-tables/dist/css/tabulator.min.css" rel="stylesheet">
    <jsp:include page="../include/pluginpage.jsp"/>
    <%@ include file="../include/mainHeader.jsp" %>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            flex-direction: column;
        }
        #search {
            margin-bottom: 20px;
            padding: 10px;
            width: 300px;
            font-size: 16px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        #table-container {
            width: 80%;
            max-width: 1000px;
        }
    </style>
</head>
<body>

    <!-- 검색 입력창 -->
    <input type="text" id="search" placeholder="검색어 입력..." onkeyup="searchTable()">

    <!-- 테이블 -->
    <div id="table-container"></div>

    <script>
        // Tabulator 테이블 생성
        var table = new Tabulator("#table-container", {
            layout: "fitColumns",  // 컬럼 크기 자동 조정
            placeholder: "데이터가 없습니다.",  // 데이터 없을 때 표시
            columns: [
                { title: "ID", field: "id", sorter: "number", width: 100 },
                { title: "이름", field: "name", sorter: "string" },
                { title: "나이", field: "age", sorter: "number" },
                { title: "직업", field: "job", sorter: "string" }
            ]
        });

        // 검색 기능
        function searchTable() {
            var keyword = document.getElementById("search").value;
            table.setFilter(function (row) {
                return Object.values(row.getData()).some(val =>
                    String(val).toLowerCase().includes(keyword.toLowerCase())
                );
            });
        }
    </script>

</body>
</html>
