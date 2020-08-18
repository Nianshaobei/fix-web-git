<html>
<head>
    <meta charset="utf-8">
    <title>test input</title>
    <script src="https://cdn.staticfile.org/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#submit-button").click(function(){
                $.post("/rest/resources/fix-parsing", {
                        input: $("#input").val(),
                        format: $("#format").val(),
                        resource: $("#resource").val()
                    },
                    function(data,status){
                        if (status == "success") {
                            $("p").append(data);
                        } else {
                            alert("连接数据库失败！");
                        }
                    });
            });
        });
    </script>
</head>
<body>
<form method="POST" >
    FIX message: <input type="text" id="input">
    <br>
    Format: <input type="text" id="format">
    <br>
    Configuration: <input type="text" id="resource">
    <input type="button" value="Submit" id="submit-button"/>
</form>
<p>Result:</p>
</body>
</html>