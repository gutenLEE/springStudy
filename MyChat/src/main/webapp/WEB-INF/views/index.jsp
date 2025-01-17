<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <link rel="stylesheet" href="resources/reset.css">
    <style>
        .main-container{
            background:#F2F0EB;
            width: 500px;
            height: 600px;
            position: relative;
            margin: 0 auto;
            margin-top: 23px;
            border-radius: 8px;
            z-index : 0;
            padding-top: 100px;
        }
        a #kakao-login-btn{
        	position : absolute;
        	left : 140px;
        	top: 200px;
        }
        .clip {
  			clip-path: circle(55px at center);
		}
		.profile{
			display : flex;
			flex-direction : column;
			justify-content : center;
			align-items: center;
		}
		#kakaoNickName{
			margin-top: 30px;
			font-size : 2em;
		}
    </style>
    
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" >

	document.addEventListener("DOMContentLoaded", function(){
	
	      //카카오톡 Developer API 사이트에서 발급받은 JavaScript Key      
	      Kakao.init("5571ced1333411d4ef8b0a095b3b0856")
	      
	      //카카오 로그인 버튼을 생성합니다.      
	      Kakao.Auth.createLoginButton({
	      
	         container : "#kakao-login-btn"
	         ,success : function(authObj) {
	      
	         console.log(authObj);
	      
	         Kakao.API.request({
	      
	            url: "/v2/user/me"  //v1/user/me API는 종료   
	         
	            ,success :function(res){
	         
		            console.log(res);
		            var kakaoBtn = document.getElementById('kakao-login-btn');
					kakaoBtn.remove();
					
					const profileElem = document.querySelector('.kakaoThumbnailImg');
					profileElem.src = res.properties.thumbnail_image;
					profileElem.classList.add('clip');
					
					var nameElem = document.querySelector('#kakaoNickName');
					nameElem.innerHTML = res.properties.nickname;
		            // 아이디        
		            //document.getElementById("kakaoIdentity").innerHTML = res.id;
		            // 닉네임 설정
		            //document.getElementById("kakaoNickName").innerHTML = res.properties.nickname;

		            
		         }, fail : function(error){
		            	alert(JSON.stringify(error));
		            }
	         	});
	      	}
	      ,fail : function(error){
	         	alert(JSON.stringify(error));
	      }
	   });
	});
</script>
</head>
<body>
  <section>
      <div class="main-container">
      	<div class="profile">
		   <div><img src="" class ="kakaoThumbnailImg"></span></div>
		   <div><span id ="kakaoNickName"></span></div>
      	</div>
		   <a id="kakao-login-btn"></a>
      </div>
  </section>

</body>
</html>