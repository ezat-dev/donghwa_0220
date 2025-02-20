<%@ page session="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>작업실적</title>
    <%@ include file="../include/mainHeader.jsp" %>
    <jsp:include page="../include/pluginpage.jsp"/>
    <%@ include file="../include/tbFooter.jsp" %>
    <style>

        hr {
            width: 95%;
            margin: 10px 2.5% 2% 2.5%;
        }
        label > select {
            width: 150px;
            height: 30px;
            font-size: 14pt;
        }
        
        label > input {
         	width: 150px;
            height: 28px;
            font-size: 14pt;
        }

        
        
        #menu_bar {
            padding-top: 3%;
            background: #123478;
        }
       
        legend {
            border: 0px;
            width: 7%;
            font-size: 15px;
            margin-bottom: 0px;
            padding-left: 2%;
            text-align: left;
        }
        .input_d {
            font-size: 14pt;
            font-weight: 700;
            color: black;
            height: 35px;
        }

        div > button {
            width: 120px;
            height: 30px;
            margin-left: 5px;
            border: 1px solid black; 
            color: #123478;
            font-size: 14pt;
            font-weight: 700;
        }
        div > button:hover {     
            background: #798cb3;
            border: 1px solid #798cb3;
            color: white; 
        }
       
        .countDATA {
            width: 90%;
            text-align: right;
            color: black;
            margin: 0 auto;
            margin-bottom: 3px;
            font-size: 15pt;
        }
        #contents{
        width: 70%;
        margin:0 auto;
        margin-top: 120px;
        
   
        }
       
       
        .del_btn {
            background: transparent;
            border: 0px;
            color: #123478;
            font-size: 20px;
        }
       
        #back_div {
            text-align: right;
            padding-right: 2%;
            padding-top: 2%;
        }
        #back_btn {
            float: right;
            background-color: transparent;
            border: 0px;
            color: #123478;
        }
        #table_file {
            -ms-overflow-style: none;
            height: 650px;
        }
        #table_file::-webkit-scrollbar { display: none; }
        #cate_list {
            border-collapse: collapse;
        }
        #cate_list th {
            position: sticky;
            top: 0;
        }
        .list_input{
        height: 85px;
        }
        
        .input_d{
        margin-left:160px;
        margin-top:5px;
        }
    </style>
</head>

<body data-offset="60" data-target=".navbar" style="overflow-y: hidden">
<div id="wrap">
    <div id="body2">
		<div id="menu_bar">
		
		</div>
        <div id="contents">
          
         
            <fieldset class="list_input">
                <legend style="font-size: 15pt;">검색조건</legend>
                <div class="input_d">
                  
                    <label class="marginl" style="margin-left: 15px;"> 시작 날짜 : 
					    <input type="text" class="datetimeSet" id="sdate" 
					    name="to_date" style="font-size: 14pt; font-weight: 700; text-align: center; width: 150px;" placeholder=""/>
					    
					</label>
					
					<label style="margin-left: 15px;"> 종료 날짜 : 
					    <input type="text" class="datetimeSet" id="edate" 
					    name="to_date" style="font-size: 14pt; font-weight: 700; text-align: center; width: 150px;" placeholder=""/>
					    
					</label>

                    <button id="searchbtn" style="margin-left: 100px;">조회</button>
                
                

                </div>
            </fieldset>
            <div id="table_file">
                <div class="countDATA">조회된 데이터 수 : </div>
                <div id="tabulator-table"></div> 
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        var today = new Date();
        var yesterday = new Date();
        yesterday.setDate(today.getDate() - 1);

        var formatDate = function (date) {
            var year = date.getFullYear();
            var month = ("0" + (date.getMonth() + 1)).slice(-2);
            var day = ("0" + date.getDate()).slice(-2);
            return year + "-" + month + "-" + day;
        };

        $("#sdate").val(formatDate(yesterday));
        $("#edate").val(formatDate(today));

        $("#searchbtn").click();
    });

    var tableData = []; 

    var table = new Tabulator("#tabulator-table", {
        height: 650,
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

    document.getElementById("searchbtn").addEventListener("click", function() {
        var sdate = $("#sdate").val(); 
        var edate = $("#edate").val(); 

        console.log("선택한 날짜:", sdate);
        console.log("선택한 끝:", edate);

        $.ajax({
            url: "/donghwa/analysis/alarmHistory/alarmlist", 
            method: "POST",
            dataType: "json",
            data: {
                'sdate': sdate,
                'edate': edate
            },
            success: function(data) {
                table.setData(data); 
                document.querySelector(".countDATA").textContent = "조회된 데이터 수 : " + data.length;
                console.log("서버에서 받아온 데이터:", data);
            },
            error: function() {
                alert("데이터를 가져오는 데 실패했습니다.");
            }
        });
    });
</script>



</body>
</html>
