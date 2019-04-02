<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="8468277188-blbc1ofh6q6i0ot0t70o52ph8488qekr.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>   
  </head>
  <script>
  
	  function onSignIn(googleUser) {
	        // Useful data for your client-side scripts:
	        var profile = googleUser.getBasicProfile();
	         console.log("ID: " + profile.getId()); // Don't send this directly to your server!
	         console.log('Full Name: ' + profile.getName());
	         console.log('Given Name: ' + profile.getGivenName());
	         console.log('Family Name: ' + profile.getFamilyName());
	         console.log("Image URL: " + profile.getImageUrl());
	         console.log("Email: " + profile.getEmail());

	        // The ID token you need to pass to your backend:
	        var id_token = googleUser.getAuthResponse().id_token;
	         console.log("ID Token: " + id_token);
	      }
	  
	  function signOut() {
		    var auth2 = gapi.auth2.getAuthInstance();
		    auth2.signOut().then(function () {
		      console.log('User signed out.');
		    });
		  }
    </script>
  <body>
    <div class="g-signin2" data-onsuccess="onSignIn"></div>
    <a href="#" onclick="signOut();">Sign out</a>
  </body>
  
</html>