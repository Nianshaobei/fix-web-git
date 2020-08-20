<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>FIX parsing web</title>
    <link rel="stylesheet" href="css/amazeui.min.css">
    <link rel="stylesheet" href="css/app.css">
    <script src="https://cdn.staticfile.org/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<%--    <script src="js/amazeui.min.js"></script>--%>

    <script>
        $(document).ready(function(){
            $("#submit-button").click(function(){
                $.post("/rest/resources/fix-parsing", {
                        message: $("#message").val(),
                        // format: $("#format").val(),
                        format: $('input:radio:checked').val(),
                        resource: $("#resource").val()
                    },
                    function(data,status){
                        if (status === "success") {
                            $("#result").append("<br>"+data);
                        } else {
                            alert("连接数据库失败！");
                        }
                    });
            });
        });
    </script>
</head>
<body>
<form method="post" class="am-form am-form-horizontal" data-am-validator>
    <fieldset>
        <legend>FIX PARSING</legend>
        <div class="am-form-group">
            <label for="message" class="am-u-sm-2 am-form-label">FIX message:</label>
            <div class="am-u-sm-10">
                <input type="text" id="message" placeholder="Enter your FIX message" required>
            </div>
        </div>

        <div class="am-form-group">
            <label class="am-u-sm-2 am-form-label">Format:</label>
            <div class="am-u-sm-10">
                <label class="am-radio-inline">
                    <input type="radio" name="format" value="0" id="format1"> Simple
                </label>
                <label class="am-radio-inline">
                    <input type="radio" name="format" value="1" id="format2"> Json
                </label>
            </div>
        </div>

        <div class="am-form-group">
            <label for="resource" class="am-u-sm-2 am-form-label">Configuration:</label>
            <div class="am-u-sm-10">
                <input type="text" id="resource" placeholder="Enter your configurations" required>
            </div>
        </div>

        <div class="am-form-group">
            <div class="am-u-sm-10 am-u-sm-offset-2">
                <button type="button" class="am-btn am-btn-default" id="submit-button">Submit</button>
            </div>
        </div>

        <section class="am-panel am-panel-default">
            <header class="am-panel-hd">
                <h3 class="am-panel-title">Result</h3>
            </header>
            <div class="am-panel-bd">
                <pre id="result"></pre>
            </div>
        </section>

    </fieldset>
</form>
</body>
</html>