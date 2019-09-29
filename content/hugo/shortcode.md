# 1. short code 란?
markdown 내에 html을 편리하게 넣는 방법이다.  

shortcode 정보
# 2. 이미지 포스팅
- 관련 short code : img-post.html
- 사용방법

{{< img-post path = "folder" file = "파일명" alt = "alt명" type = "정렬방법" >}}

- path : 이미지 파일이 존재하는 폴더를 명시
- file : 이미지 파일이름 명시(확장자 포함)
- alt : 이미지 별칭 명시
- type : 정렬 방법 명시(center, left, right)
- 실 사용예시
{{< img-post path = "/img/react/1" file = "1_5.png" alt = "downloadInfo" type = "center" >}}

