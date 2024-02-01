<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./../css/my-review.css" />
    <link rel="stylesheet" href="./../css/header.css" />
    <link rel="stylesheet" href="./../css/menu.css" />
    
    <title>내 독후감</title>
    <script src="https://kit.fontawesome.com/a54a73652a.js" crossorigin="anonymous"></script>
  
</head>

<body>
    

    <main>
        <header>
        <!-- 헤더 입니다 -->
        <div class="header">
            <img src="./../assets/logo.svg" class="h-logo">
            <p class="h-logo-name">livre</p>
        </div>

        <div class="header-right">
            <a href="#">로그인</a>
            <a href="#">회원가입</a>
        </div>
        </header>

    <!--  
    
    메뉴 바 사용하는 사람들만 주석 풀어서 사용 해 주세요
    사용하지 않는 페이지는 삭제하고 쓰기 (+css)
     --> 
    
    <div class="menu-bar">
              <ul class="menu">
                <li class="menu-item"><a>홈</a></li>
                <li class="menu-item active"><a>독후감 검색</a></li>
                <li class="menu-item"><a>내 독후감</a></li>
                <li class="menu-item"><a>마이 페이지</a></li>
                <li class="menu-item"><a>이용약관</a></li>
                <li class="menu-item"><a>contact us</a></li>
              </ul>
        </div>  
    </main>

    <section>
     
     <!-- index.jsp를 복사 후 section 내부를 삭제하고 코드를 작성 해 주세요 + (index.css도 삭제) -->
     
     <!-- 독후감 검색창 -->
               <div class="search-box-p">
            <div class="searchbox-btn">
            <input class="search-box" placeholder="내 독후감 검색">
            <button type="button" class="search-btn">
                <img src="./../assets/red-search.svg">
            </button>
        </div>
        </div>
       
       <!-- 추가하기, 삭제하기 버튼 -->
        <div class="plus-del">
            <button class="plus"><i class="fa-solid fa-plus"></i> 추가하기</button>
            <button class="del"><i class="fa-regular fa-trash-can"></i> 삭제하기</button>
        </div>


		<!-- 내가 작성한 독후감 목록들 (최신순 조회가 기본값) -->
        <div class="my-review-list">
        
        
        <!-- 독후감 하나당 카드 하나 -->
            <a href="#">
                <div class="my-review">
                    <p class="book-name">데미안</p>
                    <div class="star-author">
                    
                    	<!-- 별 모양 사용자가 입력한 평점에 따라 동적으로 변경되어야 함 -->
                        <div class="star">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                        </div>
                        <div class="author">
                           헤르만 헤세 
                        </div>
                    </div>
    
                    <div class="content">
                        분량에 비해 읽기가 쉬운 책입니다. 기술의 확산과 필연성을 역설한 뒤 기술억제의 필요성을 주장하고 그 방안을 제안합니다. 기후변화와 같은 위기를 극복하기 위하여 기술 개발은 반드시 필요하지만 그 기술이 위험을 불러오기에 억제해야하는 궁지에 처하는데, 저자가 주장하듯이 올바른 길을 가기가 매우 어려워보입니다. 그럼에도 저자가 제시한 10개 층위의 기술억제 전략을 살펴보면 어려울지라도 불가능하지 않을 것이
                    </div>
    
                    <p class="publisher">한빛 출판사</p>
                </div>
            </a>

 <a href="#">
                <div class="my-review">
                    <p class="book-name">데미안</p>
                    <div class="star-author">
                    
                    	<!-- 별 모양 사용자가 입력한 평점에 따라 동적으로 변경되어야 함 -->
                        <div class="star">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                        </div>
                        <div class="author">
                           헤르만 헤세 
                        </div>
                    </div>
    
                    <div class="content">
                        분량에 비해 읽기가 쉬운 책입니다. 기술의 확산과 필연성을 역설한 뒤 기술억제의 필요성을 주장하고 그 방안을 제안합니다. 기후변화와 같은 위기를 극복하기 위하여 기술 개발은 반드시 필요하지만 그 기술이 위험을 불러오기에 억제해야하는 궁지에 처하는데, 저자가 주장하듯이 올바른 길을 가기가 매우 어려워보입니다. 그럼에도 저자가 제시한 10개 층위의 기술억제 전략을 살펴보면 어려울지라도 불가능하지 않을 것이
                    </div>
    
                    <p class="publisher">한빛 출판사</p>
                </div>
            </a>


 <a href="#">
                <div class="my-review">
                    <p class="book-name">데미안</p>
                    <div class="star-author">
                    
                    	<!-- 별 모양 사용자가 입력한 평점에 따라 동적으로 변경되어야 함 -->
                        <div class="star">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                        </div>
                        <div class="author">
                           헤르만 헤세 
                        </div>
                    </div>
    
                    <div class="content">
                        분량에 비해 읽기가 쉬운 책입니다. 기술의 확산과 필연성을 역설한 뒤 기술억제의 필요성을 주장하고 그 방안을 제안합니다. 기후변화와 같은 위기를 극복하기 위하여 기술 개발은 반드시 필요하지만 그 기술이 위험을 불러오기에 억제해야하는 궁지에 처하는데, 저자가 주장하듯이 올바른 길을 가기가 매우 어려워보입니다. 그럼에도 저자가 제시한 10개 층위의 기술억제 전략을 살펴보면 어려울지라도 불가능하지 않을 것이
                    </div>
    
                    <p class="publisher">한빛 출판사</p>
                </div>
            </a>


 <a href="#">
                <div class="my-review">
                    <p class="book-name">데미안</p>
                    <div class="star-author">
                    
                    	<!-- 별 모양 사용자가 입력한 평점에 따라 동적으로 변경되어야 함 -->
                        <div class="star">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                        </div>
                        <div class="author">
                           헤르만 헤세 
                        </div>
                    </div>
    
                    <div class="content">
                        분량에 비해 읽기가 쉬운 책입니다. 기술의 확산과 필연성을 역설한 뒤 기술억제의 필요성을 주장하고 그 방안을 제안합니다. 기후변화와 같은 위기를 극복하기 위하여 기술 개발은 반드시 필요하지만 그 기술이 위험을 불러오기에 억제해야하는 궁지에 처하는데, 저자가 주장하듯이 올바른 길을 가기가 매우 어려워보입니다. 그럼에도 저자가 제시한 10개 층위의 기술억제 전략을 살펴보면 어려울지라도 불가능하지 않을 것이
                    </div>
    
                    <p class="publisher">한빛 출판사</p>
                </div>
            </a>


 <a href="#">
                <div class="my-review">
                    <p class="book-name">데미안</p>
                    <div class="star-author">
                    
                    	<!-- 별 모양 사용자가 입력한 평점에 따라 동적으로 변경되어야 함 -->
                        <div class="star">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                        </div>
                        <div class="author">
                           헤르만 헤세 
                        </div>
                    </div>
    
                    <div class="content">
                        분량에 비해 읽기가 쉬운 책입니다. 기술의 확산과 필연성을 역설한 뒤 기술억제의 필요성을 주장하고 그 방안을 제안합니다. 기후변화와 같은 위기를 극복하기 위하여 기술 개발은 반드시 필요하지만 그 기술이 위험을 불러오기에 억제해야하는 궁지에 처하는데, 저자가 주장하듯이 올바른 길을 가기가 매우 어려워보입니다. 그럼에도 저자가 제시한 10개 층위의 기술억제 전략을 살펴보면 어려울지라도 불가능하지 않을 것이
                    </div>
    
                    <p class="publisher">한빛 출판사</p>
                </div>
            </a>


 <a href="#">
                <div class="my-review">
                    <p class="book-name">데미안</p>
                    <div class="star-author">
                    
                    	<!-- 별 모양 사용자가 입력한 평점에 따라 동적으로 변경되어야 함 -->
                        <div class="star">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                        </div>
                        <div class="author">
                           헤르만 헤세 
                        </div>
                    </div>
    
                    <div class="content">
                        분량에 비해 읽기가 쉬운 책입니다. 기술의 확산과 필연성을 역설한 뒤 기술억제의 필요성을 주장하고 그 방안을 제안합니다. 기후변화와 같은 위기를 극복하기 위하여 기술 개발은 반드시 필요하지만 그 기술이 위험을 불러오기에 억제해야하는 궁지에 처하는데, 저자가 주장하듯이 올바른 길을 가기가 매우 어려워보입니다. 그럼에도 저자가 제시한 10개 층위의 기술억제 전략을 살펴보면 어려울지라도 불가능하지 않을 것이
                    </div>
    
                    <p class="publisher">한빛 출판사</p>
                </div>
            </a>


 <a href="#">
                <div class="my-review">
                    <p class="book-name">데미안</p>
                    <div class="star-author">
                    
                    	<!-- 별 모양 사용자가 입력한 평점에 따라 동적으로 변경되어야 함 -->
                        <div class="star">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                        </div>
                        <div class="author">
                           헤르만 헤세 
                        </div>
                    </div>
    
                    <div class="content">
                        분량에 비해 읽기가 쉬운 책입니다. 기술의 확산과 필연성을 역설한 뒤 기술억제의 필요성을 주장하고 그 방안을 제안합니다. 기후변화와 같은 위기를 극복하기 위하여 기술 개발은 반드시 필요하지만 그 기술이 위험을 불러오기에 억제해야하는 궁지에 처하는데, 저자가 주장하듯이 올바른 길을 가기가 매우 어려워보입니다. 그럼에도 저자가 제시한 10개 층위의 기술억제 전략을 살펴보면 어려울지라도 불가능하지 않을 것이
                    </div>
    
                    <p class="publisher">한빛 출판사</p>
                </div>
            </a>


 <a href="#">
                <div class="my-review">
                    <p class="book-name">데미안</p>
                    <div class="star-author">
                    
                    	<!-- 별 모양 사용자가 입력한 평점에 따라 동적으로 변경되어야 함 -->
                        <div class="star">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                        </div>
                        <div class="author">
                           헤르만 헤세 
                        </div>
                    </div>
    
                    <div class="content">
                        분량에 비해 읽기가 쉬운 책입니다. 기술의 확산과 필연성을 역설한 뒤 기술억제의 필요성을 주장하고 그 방안을 제안합니다. 기후변화와 같은 위기를 극복하기 위하여 기술 개발은 반드시 필요하지만 그 기술이 위험을 불러오기에 억제해야하는 궁지에 처하는데, 저자가 주장하듯이 올바른 길을 가기가 매우 어려워보입니다. 그럼에도 저자가 제시한 10개 층위의 기술억제 전략을 살펴보면 어려울지라도 불가능하지 않을 것이
                    </div>
    
                    <p class="publisher">한빛 출판사</p>
                </div>
            </a>

 <a href="#">
                <div class="my-review">
                    <p class="book-name">데미안</p>
                    <div class="star-author">
                    
                    	<!-- 별 모양 사용자가 입력한 평점에 따라 동적으로 변경되어야 함 -->
                        <div class="star">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/fill-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                            <img src="./../assets/stroke-star.svg">
                        </div>
                        <div class="author">
                           헤르만 헤세 
                        </div>
                    </div>
    
                    <div class="content">
                        분량에 비해 읽기가 쉬운 책입니다. 기술의 확산과 필연성을 역설한 뒤 기술억제의 필요성을 주장하고 그 방안을 제안합니다. 기후변화와 같은 위기를 극복하기 위하여 기술 개발은 반드시 필요하지만 그 기술이 위험을 불러오기에 억제해야하는 궁지에 처하는데, 저자가 주장하듯이 올바른 길을 가기가 매우 어려워보입니다. 그럼에도 저자가 제시한 10개 층위의 기술억제 전략을 살펴보면 어려울지라도 불가능하지 않을 것이
                    </div>
    
                    <p class="publisher">한빛 출판사</p>
                </div>
            </a>

         
           
        </div>
        
    </section>

   
</body>
</html>