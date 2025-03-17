<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./vars.css">
  <link rel="stylesheet" href="/donghwa/css/parameter/timerPop.css">
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
    <div class="timer-box"></div>
    <div class="timer-header"></div>
    <div class="timer-main"></div>
    
    <div class="timer-text">Timer</div>
    <div class="no"></div>
    <div class="description"></div>
    <div class="set-point"></div>
    <div class="actual-value"></div>
    <div class="_1"></div>
    <div class="box-1"></div>
    <div class="box-1-point"></div>
    <div class="box-1-val"></div>
    <div class="_2"></div>
    <div class="box-2"></div>
    <div class="box-2-point"></div>
    <div class="box-2-val"></div>
    <div class="_3"></div>
    <div class="box-3"></div>
    <div class="box-3-point"></div>
    <div class="box-3-val"></div>
    <div class="_6"></div>
    <div class="box-6"></div>
    <div class="box-6-point"></div>
    <div class="box-6-val"></div>
    <div class="_8"></div>
    <div class="box-8"></div>
    <div class="box-8-point"></div>
    <div class="box-8-val"></div>
    <div class="_82">8</div>
    <div class="no2">No.</div>
    <div class="overpressure-leaktest-furnace">Overpressure leaktest furnace</div>
    <div class="pumptime-prolongation-leaktest-furnace">
        Pumptime prolongation leaktest furnace
    </div>
    <div class="vacuum-leaktest-furnace">Vacuum leaktest furnace</div>
    <div class="monitoring-pumping-time-furnace">
        Monitoring pumping time furnace
    </div>
    <div class="_12">1</div>
    <div class="_22">2</div>
    <div class="_32">3</div>
    <div class="_62">6</div>
    <div class="monitoring-filling-time-process-gas">
        Monitoring filling time process gas
    </div>
    <div class="description2">Description</div>
    <div class="setpoint">Setpoint</div>
    <div class="actual-value2">Actual value</div>

<script>
    var overviewInterval;
    var previousValue = null;  // box-2-point의 이전 값

    $(function() {
        overviewListView();
        overviewInterval = setInterval(overviewListView, 1500);
    });

    function overviewListView() {
        $.ajax({
            url: "/donghwa/parameter/timerPop/view",
            type: "post",
            dataType: "json",
            success: function(result) {
                var data = result.multiValues;

                for (let key in data) {
                    for (let keys in data[key]) {
                        var d = data[key];

                        if (d[keys].action == "v") {
                            v(keys, d[keys].value);
                        } else if (d[keys].action == "c") {
                            c(keys, d[keys].value);
                        } else if (d[keys].action == "b") {
                            b(keys, d[keys].value);
                        } else if (d[keys].action == "value") {
                            value(keys, d[keys].value);
                        }
                    }
                }
            }
        });
    }

    function v(keys, value) {
        if (value == true) {
            $("." + keys).css("background-color", "green");
            $("." + keys).css("color", "white");
        } else {
            $("." + keys).css("background-color", "#A9A9A9");
            $("." + keys).css("color", "black");
        }

        $("." + keys).attr("onclick", "digitalSet('DONGHWA.PARAMETER.TIMER','" + keys + "')");
        $("." + keys).css("cursor", "pointer");
    }

    function value(keys, value) {
        if (!$("div").hasClass("anlog-popup-div-color")) {
            $("." + keys).text(value);
        }

        $("." + keys).css("display", "");
        $("." + keys).css("text-align", "center");
        $("." + keys).css("font-size", "21pt");
        $("." + keys).css("padding-top", "5px");
        $("." + keys).css("cursor", "pointer");

        // box-2-val 수정 불가능하게 만들기
        if (keys === "box-2-val") {
            $("." + keys).css("pointer-events", "none");  
            $("." + keys).css("color", "gray");  
            $("." + keys).attr("ondblclick", "");  
        }

        // box-3-val 수정 불가능하게 만들기
        if (keys === "box-3-val") {
            $("." + keys).css("pointer-events", "none"); 
            $("." + keys).css("color", "gray");  
            $("." + keys).attr("ondblclick", ""); 
        }

   
    }


    
</script>

</body>

</html>