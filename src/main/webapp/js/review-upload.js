
const dataList = ["빨간색", "파란색", "빨간문어"];
 
const $search = document.querySelector("#search");
const $autoComplete = document.querySelector(".autocomplete");

let nowIndex = 0;

$search.onkeyup = (event) => {
  // 검색어
  const value = $search.value.trim();

  // 자동완성 필터링
  const matchDataList = value
    ? dataList.filter((label) => label.includes(value))
    : [];

  switch (event.keyCode) {
    // UP KEY
    case 38:
      nowIndex = Math.max(nowIndex - 1, 0);
      break;

    // DOWN KEY
    case 40:
      nowIndex = Math.min(nowIndex + 1, matchDataList.length - 1);
      break;

    // ENTER KEY
    case 13:
      document.querySelector("#search").value = matchDataList[nowIndex] || "";

      // 초기화
      nowIndex = 0;
      matchDataList.length = 0;
      break;
      
    // 그외 다시 초기화
    default:
      nowIndex = 0;
      break;
  }

  // 리스트 보여주기
  showList(matchDataList, value, nowIndex);
};

const showList = (data, value, nowIndex) => {
  // 정규식으로 변환
  const regex = new RegExp(`(${value})`, "g");
  
  $autoComplete.innerHTML = data
    .map(
      (label, index) => `
      <div class='${nowIndex === index ? "active" : ""}'>
        ${label.replace(regex, "<mark>$1</mark>")}
      </div>
    `
    )
    .join("");
};




/* 수정하기 버튼 눌렀을 때 */
function submit(){
	
	const submitBtn = document.getElementById('submit');
	
	
	 // btn1 숨기기 (visibility: hidden)

	  if(submitBtn.style.visibility !== 'hidden') {

	   		 submitBtn.style.visibility = 'hidden';

	  }

	  // btn` 보이기 (visibility: visible)

	  else {

	    submitBtn.style.visibility = 'visible';

	  }
	
}

function edit() {

	var inputs = document.getElementsByClassName('write');
	
		for(var i = 0; i < inputs.length; i++) {
			
			if(inputs[i].readOnly = true) {
				
				inputs[i].readOnly = false;
			} else {
				inputs[i].readOnly = true;
			}
		}
}
