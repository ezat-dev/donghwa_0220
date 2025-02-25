<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>동화엔텍</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
    }

    .header {
      background: #123478;
      width: 100%; 
      height: 65px;
      position: fixed;
      top: 0;
      left: 0;
      z-index: 10;
      text-align: center;
      color: white;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }

    .header .time_hd {
      font-size: 21px;
      font-weight: bold;
      position: absolute;
      right:30px;
      bottom:5px;
    }


    .header .date {
      font-size: 21px;
      position: absolute;
      right:30px;
      bottom:35px;
      font-weight: bold;
    }

    .hamburger-icon {
      width: 34px;
      height: 28.19px;
      position: absolute;
      left: 13px;
      top: 17px;
      cursor: pointer; 
      z-index: 3;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .hamburger-icon div {
      width: 100%;
      height: 4px;
      background-color: white;
      border-radius: 2px;
      margin-top: 1px;
    }

    .menu {
      width: 251px;
      height: calc(100% - 30px);  
      background: #123478;
      position: fixed;
      left: -350px;
      top: 40px;  
      transition: left 0.3s ease;
      padding: 20px;
      color: white;
      z-index: 1;
    }

    .menu.active {
      left: 0;
    }

    .submenu {
      max-height: 0;
      overflow: hidden;
      transition: max-height 0.3s ease;
      padding-left: 20px;
    }

    .submenu.active {
      max-height: 100px;
    }

    .menu > ul {
      list-style-type: none;
      padding: 0;
      margin: 0;
    }

    .menu > ul > li {
      margin-top: 22px;
      cursor: pointer;
      padding: 5px 0;
      font-size: 22px;  
    }

    .submenu li {
      padding: 5px 0;
      white-space: nowrap;
      font-size: 20px; 
    }

    .main-content {
      background-color: #123478;
      height: calc(100% - 60px); 
    }

  </style>
</head>

<body>
   <div class="header">
    <div class="time_hd" id="time_hd"></div>
    <div class="date" id="date"></div>
    <div class="hamburger-icon">
      <div></div>
      <div></div>
      <div></div>
    </div>
  </div>

 <div class="menu" id="hamburgerMenu">
  <ul>
    <li>
      Furnace
      <ul class="submenu">
        <li onclick="menuClick('/donghwa/');">Overview</li>
        <li onclick="popupClick('/donghwa/furnace/manualOperationPop', 311, 619, 730, 180);">Manual Operation</li> <!--가로 세로 오른쪽 시작 위쪽 시작 -->
		<li onclick="popupClick('/donghwa/furnace/operationPressPop', 410.5, 482.5, 730, 210);">Operation Press</li><!--길면 180 짧으면 225이상 -->
		<li onclick="popupClick('/donghwa/furnace/automaticProgramPop4', 502, 393, 730, 235);">Automatic program</li>

        <li onclick="menuClick('/donghwa/furnace/recipe');">Recipe</li>
      </ul>
    </li>
    <li>
      Process values
      <ul class="submenu">
        <li onclick="popupClick('/donghwa/process/temperaturePop', 779, 498, 680, 165);">Temperature</li>
		<li onclick="popupClick('/donghwa/process/pressurePop', 391, 441, 680, 180);">Pressure</li>
		<li onclick="popupClick('/donghwa/process/pressureSwitchesPop', 391, 249, 680, 204);">Pressure switches</li>
		<li onclick="popupClick('/donghwa/process/heaterPop', 507, 410, 680, 204);">Heater</li>
		<li onclick="popupClick('/donghwa/process/pressPop', 940, 490, 550, 160);">Press</li>
		<li onclick="popupClick('/donghwa/process/powerConsumptionPop', 902, 406, 550, 160);">Power Consumption</li>

      </ul>
    </li>
    <li>
      Analysis
      <ul class="submenu">
        <li onclick="menuClick('/donghwa/analysis/historyTrend');">Historytrends</li>
        <li onclick="menuClick('/donghwa/analysis/batchReport');">Batchreport</li>
        <li onclick="menuClick('/donghwa/analysis/alarmHistory');">Alarmhistory</li>
      </ul>
    </li>
    <li>
      Parameter
      <ul class="submenu">
        <li onclick="popupClick('/donghwa/parameter/limitSwitchesPop', 749, 282, 550, 200);">Limit switches</li>
        <li onclick="popupClick('/donghwa/parameter/fastcoolingPop', 539, 340, 600, 180);">Fastcooling</li>
        <li onclick="popupClick('/donghwa/parameter/timerPop', 734, 367, 600, 180);">Timer</li>
        <li onclick="popupClick('/', 505, 505, 584, 180);">Calibrate TC measuring syst</li>
      </ul>
    </li>
    <li>
      Documentation
      <ul class="submenu">
        <li>Functions</li>
        <li>Commissioning</li>
        <li>General operation</li>
        <li>Faults</li>
        <li>Circuit Diagram</li>
        <li>Reference list history trends</li>
      </ul>
    </li>
  </ul>
</div>





 <script>
  var popups = [];

  function modalClick(location) {
      document.querySelector('.' + location).style.display = "";
  }

  const hamburgerIcon = document.querySelector('.hamburger-icon');
  const menu = document.getElementById('hamburgerMenu');

  hamburgerIcon.addEventListener('click', () => {
      menu.classList.toggle('active');
  });

  const menuItems = document.querySelectorAll('.menu > ul > li');

  menuItems.forEach(item => {
      item.addEventListener('click', (event) => {
          menuItems.forEach(otherItem => {
              if (otherItem !== item) {
                  const submenu = otherItem.querySelector('.submenu');
                  if (submenu) {
                      submenu.classList.remove('active');
                      submenu.style.maxHeight = null;
                  }
              }
          });

          const submenu = item.querySelector('.submenu');
          if (submenu) {
              submenu.classList.toggle('active');
              submenu.style.maxHeight = submenu.classList.contains('active') ? submenu.scrollHeight + "px" : null;
          }

          event.stopPropagation();
      });
  });

  const historyTrendsItem = document.getElementById('historytrends');
  if (historyTrendsItem) {
      historyTrendsItem.addEventListener('click', () => {
          window.location.href = 'RecipeTrend';
      });
  }

  function menuClick(url) {
      location.href = url;
  }

  function popupClick(url, popupWidth, popupHeight, customLeft, customTop) {
      var popup = window.open(
          url,
          "popupWindow" + popups.length,
          "width=" + popupWidth + 
          ",height=" + popupHeight + 
          ",left=" + customLeft + 
          ",top=" + customTop + 
          ",menubar=no,toolbar=no,scrollbars=no,status=no,location=no,directories=no,resizable=no"
      );

      if (!popup || popup.closed || typeof popup.closed == "undefined") {
          alert("팝업이 차단되었습니다. 팝업 차단 설정을 확인해주세요.");
      } else {
          popups.push(popup);
      }
  }

  function closeAllPopups() {
      popups.forEach(popup => {
          if (popup && !popup.closed) {
              popup.close();
          }
      });
      popups = [];
  }

  function updatetime_hd() {
      var now = new Date();
      var hours = String(now.getHours()).padStart(2, '0');
      var minutes = String(now.getMinutes()).padStart(2, '0');
      var seconds = String(now.getSeconds()).padStart(2, '0');
      var time_hdString = hours + ':' + minutes + ':' + seconds;

      var year = now.getFullYear();
      var month = String(now.getMonth() + 1).padStart(2, '0');
      var day = String(now.getDate()).padStart(2, '0');
      var dateString = year + '-' + month + '-' + day;

      document.getElementById('time_hd').textContent = time_hdString;
      document.getElementById('date').textContent = dateString;
  }

  setInterval(updatetime_hd, 1000);
  updatetime_hd();
</script>

</body>
</html>