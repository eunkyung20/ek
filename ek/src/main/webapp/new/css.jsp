<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
  font-family: 'Montserrat', sans-serif;
  background:white;
}

.container{
  display:block;
  max-width:680px;
  width:80%;
  margin:120px auto;
}

h1{
  color:#e91e63;
  font-size:48px;
  letter-spacing:-3px;
  text-align:center;
  margin:120px 0 80px 0 ;
  transition:.2s linear;
}

.links{
  list-style-type:none;
  li{
     display:inline-block;
     margin:0 20px 0 0;
     transition:.2s linear;
     &:nth-child(2){
        opacity : .6;
        &:hover{
           opacity : 1;
        }
     }
     &:nth-child(3){
        opacity : .6;
        float:right;
         &:hover{
           opacity : 1;
         }
     }
     a{
        text-decoration:none;
        color:#0f132a;
        font-weight:bolder;
        text-align:center;
        cursor : pointer;
     }
   }
}


form{
  width:100%;
  max-width:680px;
  margin:40px auto 10px;
  .input__block{
     margin:20px auto;
     display:block;
     position:relative;
     &.first-input__block{
        &::before{
          content:"";
          position:absolute;
          top:-15px;
          left:50px;
          display:block;
          width:0;
          height:0;
        background:transparent;
          border-left:15px solid transparent;
          border-right:15px solid transparent;
          border-bottom:15px solid rgba(#0f132a,.1);
          transition:.2s linear;
        }
     }
     &.signup-input__block{
      &::before{
        content:"";
        position:absolute;
        top:-15px;
        left:150px;
        display:block;
        width:0;
        height:0;
        background:transparent;
        border-left:15px solid transparent;
        border-right:15px solid transparent;
        border-bottom:15px solid rgba(#0f132a,.1);
        transition:.2s linear;
        }
     }
     input{
        display:block;
        width:90%;
        max-width:680px;
        height:50px;
        margin:0 auto;
        border-radius:8px;
        border:none;
        background: rgba(#0f132a,.1);
        color : rgba(#0f132a,.3);
        padding:0 0 0 15px;
        font-size:14px;
        font-family: 'Montserrat', sans-serif;
        &:focus,
        &:active{
          outline:none;
          border:none;
          color : rgba(#0f132a,1);
        }
       &.repeat__password{
         opacity : 0;
         display : none;
         transition:.2s linear;
       }
     }
  }
  
  .signin__btn{
     background:#e91e63;
     color:white;
     display:block;
     width:92.5%;
     max-width:680px;
     height:50px;
     border-radius:8px;
     margin:0 auto;
     border:none;
     cursor:pointer;
     font-size:14px;
     font-family: 'Montserrat', sans-serif;
     box-shadow:0 15px 30px rgba(#e91e63,.36);
    transition:.2s linear;
    &:hover{
      box-shadow:0 0 0 rgba(#e91e63,.0);
    }
  }
}

.separator{
  display:block;
  margin:30px auto 10px;
  text-align:center;
  height:40px;
  position:relative;
  background:transparent;
  color: rgba(#0f132a,.4);
  font-size:13px;
  width:90%;
  max-width:680px;
  &::before{
    content:"";
    position:absolute;
    top:8px;
    left:0;
    background: rgba(#0f132a,.2);
    height:1px;
    width:45%;
  }
  &::after{
    content:"";
    position:absolute;
    top:8px;
    right:0;
    background: rgba(#0f132a,.2);
    height:1px;
    width:45%;
  }
}

.google__btn,
.github__btn{
   display:block;
   width:90%;
   max-width:680px;
   margin:20px auto;
   height:50px;
   cursor:pointer;
   font-size:14px;
   font-family: 'Montserrat', sans-serif;
   border-radius:8px;
   border:none;
   line-height:40px;
   &.google__btn{
      background:#5b90f0;
      color:white;
      box-shadow:0 15px 30px rgba(#5b90f0,.36);
      transition:.2s linear;
      .fa{
          font-size:20px;
          padding:0 5px 0 0 ;
      }
     &:hover{
       box-shadow:0 0 0 rgba(#5b90f0,.0);
     }
   }
   &.github__btn{
      background:#25282d;
      color:white;
      box-shadow:0 15px 30px rgba(#25282d,.36);
      transition:.2s linear;
      .fa{
          font-size:20px;
          padding:0 5px 0 0 ;
      }
     &:hover{
       box-shadow:0 0 0 rgba(#25282d,.0);
     }
   }
}

footer{
  p{
    text-align:center;
    .fa{
      color: #e91e63;
    }
    a{
      text-decoration:none;
      font-size:17px;
      margin:0 5px;
      .fa-facebook{
         color:#3b5998;
      }
      .fa-twitter{
         color:#1da1f2;
      }
      .fa-instagram{
        color:#f77737;
      }
      .fa-linkedin{
        color:#0077b5;
      }
      .fa-behance{
        color:#1769ff;
      }
    }
    
  }
}
</style>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
    let signup = $(".links").find("li").find("#signup") ; 
    let signin = $(".links").find("li").find("#signin") ;
    let reset  = $(".links").find("li").find("#reset")  ; 
    let first_input = $("form").find(".first-input");
    let hidden_input = $("form").find(".input__block").find("#repeat__password");
    let signin_btn  = $("form").find(".signin__btn");
  
    //----------- sign up ---------------------
    signup.on("click",function(e){
      e.preventDefault();
      $(this).parent().parent().siblings("h1").text("SIGN UP");
      $(this).parent().css("opacity","1");
      $(this).parent().siblings().css("opacity",".6");
      first_input.removeClass("first-input__block").addClass("signup-input__block");
      hidden_input.css({
        "opacity" : "1",
        "display" : "block"
      });
      signin_btn.text("Sign up");
    });
    
  
   //----------- sign in ---------------------
   signin.on("click",function(e){
      e.preventDefault();
      $(this).parent().parent().siblings("h1").text("SIGN IN");
      $(this).parent().css("opacity","1");
      $(this).parent().siblings().css("opacity",".6");
      first_input.addClass("first-input__block")
        .removeClass("signup-input__block");
      hidden_input.css({
        "opacity" : "0",
        "display" : "none"
      });
      signin_btn.text("Sign in");
    });
   
   //----------- reset ---------------------
   reset.on("click",function(e){
     e.preventDefault();
     $(this).parent().parent().siblings("form")
     .find(".input__block").find(".input").val("");
   })
});
</script>


<div class="container">
  <!-- Heading -->
  <h1>SIGN IN</h1>
  
  <!-- Links -->
  <ul class="links">
    <li>
      <a href="#" id="signin">SIGN IN</a>
    </li>
    <li>
      <a href="#" id="signup">SIGN UP</a>
    </li>
    <li>
      <a href="#" id="reset">RESET</a>
    </li>
  </ul>
  
  <!-- Form -->
  <form  action="" method="post">
    <!-- email input -->
    <div class="first-input input__block first-input__block">
       <input type="email" placeholder="Email" class="input" id="email"   />
    </div>
    <!-- password input -->
    <div class="input__block">
       <input type="password" placeholder="Password" class="input" id="password"    />
    </div>
    <!-- repeat password input -->
    <div class="input__block">
       <input type="password" placeholder="Repeat password" class="input repeat__password" id="repeat__password"    />
    </div>
    <!-- sign in button -->
    <button class="signin__btn">
      Sign in
    </button>
  </form>
  <!-- separator -->
  <div class="separator">
    <p>OR</p>
  </div>
  <!-- google button -->
  <button class="google__btn">
    <i class="fa fa-google"></i>
    Sign in with Google
  </button>
  <!-- google button -->
  <button class="github__btn">
    <i class="fa fa-github"></i>
    Sign in with GitHub
  </button>
</div>

<footer>
  <p>
    Thank you for watching
    <i class="fa fa-heart"></i> 
    <i class="fa fa-heart"></i> 
    <i class="fa fa-heart"></i> 
  </p>
  <p>
    Chouaib Blgn :
    <a href="https://www.facebook.com/chouaib45" >
      <i class="fa fa-facebook"></i>
    </a>
    <a href="http://twitter.com/chouaibblgn45">
      <i class="fa fa-twitter"></i> 
    </a>
    <a href="http://instagram.com/chouaib_blgn">
      <i class="fa fa-instagram"></i> 
    </a>
    <a href="http://linkedin.com/in/chouaibblgn/">
      <i class="fa fa-linkedin"></i>
    </a>
    <a href="https://www.behance.net/geek30">
      <i class="fa fa-behance"></i>
    </a>
  </p>
</footer>
</body>
</html>