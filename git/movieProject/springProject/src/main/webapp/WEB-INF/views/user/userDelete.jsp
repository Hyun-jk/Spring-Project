<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 중앙 컨텐츠 시작 -->
<style type="text/css">
span,  ul, li, fieldset {
	font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
}

.wrap-login{ position:relative;padding:50px 250px 0;}
.wrap-login h3{height:auto;margin:0;background:none;line-height:1.2;text-align:left; color:#222222; font-size:15px;}
.wrap-login h3 >  strong{ color:#fb4357;}
.sect-login{ width:541px; }
.wrap-login .tab-menu-round > li{ width:100px;}
.box-login{
	padding:30px 0px 0 70px; 
	border-top:2px solid #898987; 
	border-bottom:2px solid #898987; 
	height: 266px;
}

.box-login button[type="submit"] > span {display:block;width:258px;height:36px; border:1px solid #ffff; color:#f8f8f8; font-size:15px; font-weight:500;}
.box-login .login > button[type="submit"] {
position:absolute;
top:0; 
left:198px; 
display:block; 
width:100px; 
height:86px; 
padding:2px; 
background:#fb4357; 
line-height:78px; 
text-align:center;

}

.sect-login > .box-login fieldset {position:relative;}

/*버튼*/
.box-login button[type="submit"] {
    width: 150px;
    height: 42px;
    line-height: 37px;
    left: 0;
    border: none;
    position: static;
    margin-top: 30px;
    margin-left:120px;
    padding: 2px;
    background: #fb4357;
    text-align: center;
    color: white;
    font-weight: 800;
    font-size: 15px;
}
button, button[type='submit'], input[type='button'] {
    cursor: pointer;
    margin: 0;
    padding: 0;
}

/*히든*/
.wrap-login h3 {
    height: auto;
    margin: 0;
    background: none;
    line-height: 1.2;
    text-align: left;
    color: #222222;
    font-size: 15px;
}
.hidden {
    font: 0/0 a;
    overflow: hidden;
    position: absolute;
    visibility: hidden;
    width: 0;
    zoom: 1;
}
h3 {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

div[class^="sect-"] {
    clear: both;
    zoom: 1;
}

.sect-login {
    width: 541px;
}

div[class^="sect-"]:after {
    content: '';
    clear: both;
    display: block;
}
/*로그인*/
.box-login .login {
    position: relative;
    margin-top: 15px;
}
.box-login .login input[type="text"], .box-login .login input[type="password"] {
    width: 215px;
}
.box-login .login input[type="text"] {
    margin-bottom: 5px;
    background: url(../images/sprite/sprite_icon.png) 12px -230px no-repeat;
}
/*로그인 칸*/
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

form {
    display: block;
}
body, input, textarea, select, button, table {
    font-size: 13px;
    line-height: 1.2;
    color: #666;
    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-weight: 400;
}
input,form, select, img {
    vertical-align: middle;
}
button, input {
    overflow: visible;
}
input[type="hidden" i] {
    appearance: none;
    background-color: initial;
    cursor: default;
    display: none !important;
    padding: initial;
    border: initial;
    border-color: initial;
    border-radius: initial;
}

.box-login .login input[type="text"], .box-login .login input[type="password"] {
    width: 215px;
}
.box-login .login input[type="text"] {
    margin-bottom: 5px;
    background: url(../images/sprite/sprite_icon.png) 12px -230px no-repeat;
}
.box-login .login input[type="text"], .box-login .login input[type="password"] {
    display: block;
    width: 135px;
    height: 35px;
    padding: 0 5px 0 40px;
    border: 2px solid #b5b5b5;
    line-height: 33px;
}

input, select, img {
    vertical-align: middle;
}

button, input {
    overflow: visible;
}
input {
    writing-mode: horizontal-tb !important;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-weight: ;
    font-stretch: ;
    font-size: ;
    font-family: ;
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: auto;
    -webkit-rtl-ordering: logical;
    cursor: text;
    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
    margin: 0em;
}
.sect-login > .box-login fieldset {
    position: relative;
    display: block;
    margin-inline-start: 2px;
    margin-inline-end: 2px;
    padding-block-start: 20px;
    padding-inline-start: 0.75em;
    padding-inline-end: 0.75em;
    padding-block-end: 0.625em;
    min-inline-size: min-content;
}

body, input, textarea, select, button, table {
    line-height: 1.2;
    color: #666;
    font-weight: 400;
}

button, input[type='submit'], input[type='button'] {
    cursor: pointer;
    margin: 0;
    padding: 0;
}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
body, input, textarea, select, button, table {
    font-size: 13px;
    line-height: 1.2;
    color: #666;
    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-weight: 400;
}
body {
    line-height: 1;
    color: black;
}
.wrap-login .tab-menu-round > li {
    width: 100px;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}
ol, ul {
    list-style: none;
}
.tab-menu-round > li > a {
    display: block;
    color: #ffffff;
    font-size: 13px;
    font-weight: 500;
}
label{
	padding:20px 15px 15px 10px;
}
input[type="password"] {
    width: 215px;
    margin-top:16px;
}
input[name="id"]{
	width:215px;
	margin-top:16px;
	margin-left:11.5px;
}

</style>
<!--중앙 컨텐츠 시작-->
<div class="wrap-login">
	<div class="sect-login">
		<h4>회원탈퇴</h4>
		<br>
		<div class="box-login">
			<h3 class="hidden">회원탈퇴</h3>
			<form:form modelAttribute="memberVO" action="delete.do"
				id="delete_form">
				<form:errors element="div" cssClass="error-color" />
				<fieldset>
					<p class="marginCheck3">그동안 저희의 서비스를 이용해주셔서 감사합니다.</p>
					<ul>
						<li>
							<form:label path="id" class="deleteTit">아이디</form:label> 
							<form:input path="id" name="id" class="deleteContent" style="margin-left: 14px;" placeholder="아이디를 입력해주세요."/> 
							<form:errors path="id" cssClass="error-color" />
						</li>
						<li style="clear: both;">
							<form:label path="mem_pw" class="deleteTit">비밀번호</form:label>
							<form:password path="mem_pw" class="deleteContent" placeholder="비밀번호를 입력해주세요."/>
							<form:errors path="mem_pw" cssClass="error-color" />
						</li>
					</ul>
					<div class="login-option">
						<form:button>회원탈퇴</form:button>
					</div>
				</fieldset>
			</form:form>
		</div>
	</div>
</div>
<!--중앙 컨텐츠 끝-->