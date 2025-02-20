<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./vars.css">
<link rel="stylesheet" href="/donghwa/css/furnace/automaticProgramPop1.css">
  
  
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
   
   .automatic2, .programmer2, .startconditions2, .batch-data {
    transition: all 0.3s ease; 
    cursor: pointer; 
	}
	
	.automatic2:hover,
	.programmer2:hover,
	.startconditions2:hover,
	.batch-data:hover {
	  
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
    <div class="programmer"></div>
    <div class="startconditions"></div>
    <div class="batchdata"></div>
    <div class="automatic2" onclick="popupClick('/donghwa/furnace/automaticProgramPop1', 502, 379.8, 730, 235);">Automatic</div>
    <div class="programmer2" onclick="popupClick('/donghwa/furnace/automaticProgramPop2', 502, 379.8, 730, 235);">Programmer</div>
    <div class="startconditions2"onclick="popupClick('/donghwa/furnace/automaticProgramPop3', 502, 379.8, 730, 235);">Startconditions</div>
    <div class="batch-data" onclick="popupClick('/donghwa/furnace/automaticProgramPop4', 502, 379.8, 730, 235);">Batch data</div>
    <div class="id-0"></div>
    <div class="id-1"></div>
    <div class="id-2"></div>
    <div class="id-3"></div>
    <div class="id-4"></div>
    <div class="id-5"></div>
    <div class="id-6"></div>
    <div class="id-7"></div>
    <div class="id-8"></div>
    <div class="id-9"></div>
    <div class="id-10"></div>
    <div class="id-02"></div>
    <div class="id-12"></div>
    <div class="id-22"></div>
    <div class="id"></div>
    <div class="id2"></div>
    <div class="id3"></div>
    <div class="id4"></div>
    <div class="id5"></div>
    <div class="id6"></div>
    <div class="id7"></div>
    <div class="id8"></div>
    <div class="id-03">ID 0</div>
    <div class="id-13">ID 1</div>
    <div class="id-23">ID 2</div>
    <div class="id-32">ID 3</div>
    <div class="id-42">ID 4</div>
    <div class="id-52">ID 5</div>
    <div class="id-62">ID 6</div>
    <div class="id-72">ID 7</div>
    <div class="id-82">ID 8</div>
    <div class="id-92">ID 9</div>
    <div class="id-102">ID 10</div>
  
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