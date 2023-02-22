<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js2/test9.html</title>

<body>
폼이벤트 reset, submit : <br>
<form action="test1.html" method="get" onreset="alert('리셋')"
onsubmit="alert('전송')">
아이디 : <input type="text" name="id"><br>
<input type="reset" value="리셋">
<input type="submit" value="전송">
</form>
</body>
</html>