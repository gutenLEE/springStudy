<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=ege"/>
<meta name ="viewport" content="user-scalable=no, inital-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,width=device-width">
   <title>Kakao JavaScript SDK</title>
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
            

            
            document.getElementById("kakaoIdentity").innerHTML = res.id;
            // 닉네임 설정
            
            document.getElementById("kakaoNickName").innerHTML = res.properties.nickname;
            //프로필 이미지 
            
            document.getElementById("kakaoProfileImg").src = res.properties.profile_image;
            //썸네일 이미지 
            
            document.getElementById("kakaoThumbnailImg").src = res.properties.thumbnail_image;
            
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
	<card>
	   <div>카카오 아이디 : <span id ="kakaoIdentity"></span></div>
	   <div>닉네임 : <span id ="kakaoNickName"></span></div>
	   <div>프로필 이미지 : <img src="" id ="kakaoProfileImg"></span></div>
	   <div>썸네일 이미지: <img src="" id ="kakaoThumbnailImg"></span></div>
	</card>
   <br/>
   <a id="kakao-login-btn"></a>
</body>
</html>