<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./vars.css">
<link rel="stylesheet" href="/donghwa/css/furnace/automaticProgramPop4.css">
  
  
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
   .automatic-text, .programmer-text, .startconditions-text, .batch-data-text {
    transition: all 0.3s ease;
    cursor: pointer;
	}
	
	.automatic-text:hover,
	.programmer-text:hover,
	.startconditions-text:hover,
	.batch-data-text:hover {
	    color: white;
	    transform: scale(1.05);
	}
   
   
   </style>
  <title>Document</title>
</head>
<body>

    <div class="auto-pro-box"></div>
    <div class="auto-pro-header"></div>
    <div class="auto-pro-main"></div>
    <div class="automatic-program">Automatic program</div>

    <div class="automatic"></div>
    <div class="automatic-text" onclick="popupClick('/donghwa/furnace/automaticProgramPop1', 502, 379.8, 730, 235);">Automatic</div>
    <div class="programmer"></div>
    <div class="programmer-text" onclick="popupClick('/donghwa/furnace/automaticProgramPop2', 502, 379.8, 730, 235);">Programmer</div>
    <div class="start-conditions"></div>
    <div class="startconditions-text"onclick="popupClick('/donghwa/furnace/automaticProgramPop3', 502, 379.8, 730, 235);">Startconditions</div>
    <div class="batch-data"></div>
    <div class="batch-data-text" onclick="popupClick('/donghwa/furnace/automaticProgramPop4', 502, 379.8, 730, 235);">Batch data</div>
    <div class="program-number-box"></div>
    <div class="program-number-text">Program Number</div>
    <div class="program-name-box"></div>
    <div class="program-name-text">Program Name</div>
    <div class="program-comment-box"></div>
    <div class="program-comment-text">Program Comment</div>
    <div class="id-box"></div>
    <div class="id-text">ID 0</div>
    <div class="program-number-value"></div>
    <div class="program-name-value"></div>
    <div class="program-comment-value"></div>
    <div class="id-value"></div>
    <div class="start"></div>
    <div class="start-text">Start</div>
    <div class="start-delay"></div>
    <div class="start-delay-text">Start delay</div>
    <div class="reset"></div>
    <div class="reset-text">Reset</div>
    <div class="_1"></div>
    <div class="_2"></div>
    <div class="_12"></div>
    <div class="_22"></div>
    <div class="_3"></div>

    <script>
  var popup;
  
  function modalClick(location){
      const modal = document.querySelector('.'+location);
      modal.style.display="";
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
          if (submenu.classList.contains('active')) {
            submenu.style.maxHeight = submenu.scrollHeight + "px";
          } else {
            submenu.style.maxHeight = null;
          }
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
    	popup.close();
      location.href = url;
    }

    function popupClick(url, popupWidth, popupHeight, customLeft, customTop) {
        // 브라우저 창 크기 가져오기
        var browserWidth = window.innerWidth; // 브라우저 가로 크기
        var browserHeight = window.innerHeight; // 브라우저 세로 크기

        // 팝업창 위치 계산
//        var popupLeft = customLeft !== null ? customLeft : (browserWidth - popupWidth) / 2 + window.screenX;
//       var popupTop = customTop !== null ? customTop : (browserHeight - popupHeight) / 2 + window.screenY;

        // 팝업창 열기
        popup = window.open(
            url,
            "popupWindow",
            "width=" + popupWidth + 
            ",height=" + popupHeight + 
            ",left=" + customLeft + 
            ",top=" + customTop + 
            ",menubar=no,toolbar=no,scrollbars=no,status=no,location=no,directories=no,resizable=no"
        );

      
        if (!popup || popup.closed || typeof popup.closed == "undefined") {
            alert("팝업이 차단되었습니다. 팝업 차단 설정을 확인해주세요.");
        }
    }

//0117 돌림



  </script>
</body>
</html>