<%
/*
	파일명 : 회원가입
	프로그램 설명 : 회원가입 페이지

*/

%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="AC.js">
<meta property="og:url" content="https://midgo.jsp/member/join.html" />
<meta property="og:title" content="2022년1학기웹프로젝트" />
<meta property="og:description" content="2022년1학기웹프로젝트" />
<meta property="og:site_name" content="중간만갈까?페" />
<meta property="og:type" content="website" />
<style type="text/css">
h2{
    font: 0.75em "Gill Sans MT",'Nanum Barun Gothic',AppleGothic,sans-serif,Dotum;
    color: #353535;
    padding: 0;
    min-height: 30px;
    margin: 0px 0 20px;
    text-align: center;
    }
h3{
    font: 0.75em "Gill Sans MT",'Nanum Barun Gothic',AppleGothic,sans-serif,Dotum;
    margin: 0;
    padding: 50px 0 10px;
    font-size: 14px;
    color: #2e2e2e;
    font-weight: normal;
}
boardWrite type{
    font: 0.75em "Gill Sans MT",'Nanum Barun Gothic',AppleGothic,sans-serif,Dotum;
    color: #353535;
    padding: 0;
    table-layout: fixed;
    border-top: 1px solid #d7d5d5;
    border-bottom: 1px solid #d7d5d5;
    line-height: 180%;
    margin: 10px 0 0;
}

</style>
<title>회원가입</title>
</head>
<body>
	<div class="titleArea">
	<h2>JOIN</h2>
	</div>
	
	<h3 class=" ">기본정보</h3>
	
	<div class="boardWrite type">
		<table border="1" summary>
			<caption>회원 기본정보</caption>
			<tbody>
				<tr>
					<th scope="row">
						"아이디 "
						<img src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
					</th>
					<td>
						<input id="member_id" name="member_id" fw-filter="isFill&isFill&isMin[4]&isMax[16]&isIdentity" fw-label="아이디" maxlength="16" 0="disabled" value="" type="text" />
						<span id="idMsg"></span>
						" (영문소문자/숫자, 4~16자)"
					</td>
				</tr>
				<tr>
					<th scope="row">
						"비밀번호 "
						<img src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
					</th>
					<td>
					<input id="passwd" name="passwd" fw-filter="isFill&isMin[4]&isMax[16]" fw-label="비밀번호" autocomplete="off" maxlength="16" 0="disabled" value=""  type="password" />
					" (영문 대소문자/숫자 4자~16자)"
					</td>
				</tr>
				<tr>
					<th scope="row">
						"비밀번호 확인 "
						<img src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
					</th>
					<td>
						<input id="passwd_confirm" name="passwd_confirm" fw-filter="isFill&isMin[4]&isMax[16]" fw-label="비밀번호" maxlength="16" 0="disabled" value type="password">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>