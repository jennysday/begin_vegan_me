<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> <!-- 에러 발생용 페이지로 구현했다는 의미 -->   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 에러 화면(ArithmeticExpt)</title>
</head>
<body bgcolor="black" text="pink">
	
	<table align ="center" width="80%" border="1" cellspacing="0" cellpading="0">
		<tr>
			<td align="center" ><b>기본 에러 화면입니다</b></td>
		</tr>	
	</table>
	
	<table align ="center" width="80%" height="400" border="1" cellspacing="0" cellpading="0">
		<tr>
			<td align="center" >
				Message : ${exception.message} 
			</td>
		</tr>	
	</table>

</body>
</html>