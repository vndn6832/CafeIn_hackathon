26.07.2017
1. 홈에서 가맹점주 메뉴 등록 버튼 삭제
2. seeds 파일에 shop의 갯수를 10개로 늘리고 각각 위도와 경도를 부여

28.07.2017
1. Rating system 도입
2. Account 모델 삭제, User모델과의 1대1관계 삭제
3. User모델에 username 추가
4. index.html.erb에 있던 header를 application.html.erb로 옮김
5. css/main.css를 stylesheets/main.css로 옮김

30.07.2017
1. rating system css 수정 완료

03.08.2017
1. 좋아!, 싫어! 기능 구현 완료 but, 보완 필요함!

13.08.2017
1. 좋아!, 좋아! 취소 완료
2. cancancan, rolify 완료
3. comments가 메뉴와 함께 있으면 복잡하므로 따로 독립시킴!(pagination 추가시켜야 함)

16.08.2017
1. 장바구니 구현 완료(백엔드)
2. 카페 검색기능 구현 완료
3. comments 페이지에 pagination 구현 완료

17.08.2017
1. pay 페이지에서 수량이나 사이즈를 고르지 않을 경우 alert가 뜨며 DB에 저장되지 않음
2. 카페 평균 별점 표시
3. 한글화 진행중
4. Login이 필요한 경우 오류창이 아닌 Login 페이지로 이동하도록 설정