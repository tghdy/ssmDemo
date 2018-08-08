<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js">
    </script>
    <script>
        function getid() {
            var id = $("#id").val();
            alert(id);
            $.ajax({
                type:"get",
                url:"${root}/userController/select",
                data:{
                    id:id,
                    method:"selectUser"
                },
                dataType:"json",
                success:function (json) {
                    console.log(json);
                },
                error:function(data){
                    console.log(data.msg);
                }
            });
        }
    </script>
</head>
<body>
<input id="id" type="text">
<button onclick="getid()">get</button>
</body>
</html>