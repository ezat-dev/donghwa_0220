<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>권한 설정</title>
	<link href="https://unpkg.com/tabulator-tables@5.0.7/dist/css/tabulator.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://unpkg.com/tabulator-tables@5.0.7/dist/js/tabulator.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .tabulator {
            flex: 1;
            max-width: 500px;
        }
        .tabulator .tabulator-table {
            width: 100%;
            table-layout: fixed;
        }
        .tabulator .tabulator-row {
            display: flex;
            align-items: center;
        }
        .tabulator .tabulator-row:nth-child(odd) {
            background-color: #f7f7f7;
        }
    </style>
</head>
<body>

    <h2>권한 설정</h2>

    <div class="container">
        <div class="tabulator" id="example-table-1"></div>
        <div class="tabulator" id="example-table-2"></div>
    </div>

    <script>
        // Tabulator 설정
        var table1 = new Tabulator("#example-table-1", {
            height: "300px",
            layout: "fitColumns",
            columns: [
                { title: "관리 항목", field: "category", width: 250, hozAlign: "left" },
                {
                    title: "권한 설정",
                    field: "permission",
                    editor: "select",  
                    editorParams: {
                        values: [
                            {value: "없음", label: "없음"},
                            {value: "조회", label: "조회"},
                            {value: "저장", label: "저장"},
                            {value: "수정", label: "수정"}
                        ]
                    },
                    headerSort: false  // 정렬 비활성화
                }
            ],
            data: [
                { category: "품목관리", permission: "없음" },
                { category: "입고관리", permission: "없음" },
                { category: "출고관리", permission: "없음" },
                { category: "기타출고", permission: "없음" },
                { category: "제품별재고현황", permission: "없음" }
            ]
        });

        var table2 = new Tabulator("#example-table-2", {
            height: "300px",
            layout: "fitColumns",
            columns: [
                { title: "관리 항목", field: "category", width: 250, hozAlign: "left" },
                {
                    title: "권한 설정",
                    field: "permission",
                    editor: "select",  
                    editorParams: {
                        values: [
                            {value: "없음", label: "없음"},
                            {value: "조회", label: "조회"},
                            {value: "저장", label: "저장"},
                            {value: "수정", label: "수정"}
                        ]
                    },
                    headerSort: false  // 정렬 비활성화
                }
            ],
            data: [
                { category: "출고대기현황", permission: "없음" },
                { category: "담당자별공정작업현황", permission: "없음" },
                { category: "재고현황(개괄)", permission: "없음" },
                { category: "재고현황(상세정보)", permission: "없음" },
                { category: "입출고삭제현황", permission: "없음" }
            ]
        });
    </script>

</body>
</html>
