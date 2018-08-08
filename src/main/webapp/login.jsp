<%--
  Created by IntelliJ IDEA.
  User: Letian Wang
  Date: 2018/7/22
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>login</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
    <style>
        .bg{
            position:fixed;
            top: 0;
            left: 0;
            width:100%;
            height:100%;
            min-width: 1000px;
            z-index:-10;
            zoom: 1;
            background-repeat: no-repeat;
            background-size: cover;
            -webkit-background-size: cover;
            -o-background-size: cover;
            background-position: center 0;
        }

        .login_main{
            width: 700px;
            height: 300px;
            position: fixed;
            left: 50%;
            top: 50%;
            z-index: 11;
            /*设定这个div的margin-top的负值为自身的高度的一半,margin-left的值也是自身的宽度的一半的负值.*/
            /*宽为400,那么margin-top为-200px*/
            /*高为200那么margin-left为-100px;*/
            margin: -150px 0 0 -350px;
        }

        .login_title{
            position: absolute;
            z-index: 111;
            height: 25%;
            width: 100%;

        }

        .input{
            position: absolute;
            top: 20%;
            height: 45%;
            width: 60%;
            margin-left: 20%;
            margin-right: 20%;
        }

        .login_submit{
            position: absolute;
            top: 70%;
            height: 20%;
            width: 60%;
            margin-left: 20%;
            margin-right: 20%;
        }
    </style>
</head>
<body>
<!--导航-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Picture house</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${root}/userController/home">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Detail</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" id="quit">quit</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<!--导航结束-->

<div class="bg" style="background-image: url(img/v2-c044b1267effaa083f1d019cc3469eb8_r.jpg);">
    <div class="login_main">
        <div class="login_title">
            <p class="h1 text-center">login</p>
        </div>
        <div class="input">
            <div class="input-group mb-3">
                <input id="name" type="text" class="form-control" placeholder="username" aria-label="Recipient's username" aria-describedby="basic-addon2">
            </div>
            <div style="height: 20px;"></div>
            <div class="input-group mb-3">
                <input id="psw" type="password" class="form-control" placeholder="userpassword" aria-label="Recipient's username" aria-describedby="basic-addon2">
            </div>
        </div>
        <div class="login_submit">
            <button id="submit" type="button" class="btn btn-primary btn-lg btn-block">submit button</button>
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function(){
        $("#submit").click(function(){
            var name = $("#name").val();
            var psw = $("#psw").val();
            $.ajax({
                type:"get",
                url:"${root}/userController/userLogin",
                data:{
                    name:name,
                    psw:psw,
                    method:"userLogin"
                },
                dataType:"json",
                success:function (json) {
            		console.log(json);
                    if(json=='1'){
                        alert("登陆成功");
                        var user="<%=session.getAttribute("user")%>";
                        window.location.href ="${root}/userController/home";
                    }else if(json=='2'){
                        alert("密码错误");
                    }else if(json=='0'){
                        alert("账户不存在");
                    }
            	},
                error:function(data){
                    console.log(data.msg);
                }
            });
        });


        $("#quit").click(function(){
            alert("quit");
            <%session.invalidate (); %>
        });
    });

</script>
</html>
