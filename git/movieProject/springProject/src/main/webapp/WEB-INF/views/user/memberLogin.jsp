<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 중앙 컨텐츠 시작 -->
<style type="text/css">
span, ul, li, fieldset {
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
.box-login{padding:30px 0 0 132px; border-top:2px solid #898987; border-bottom:2px solid #898987; height: 266px;}

.box-login button[type="submit"] > span {display:block;width:249px;height:36px; border:1px solid #ffff; color:#f8f8f8; font-size:15px; font-weight:500;}
.box-login .login > button[type="submit"] {position:absolute; top:0; left:198px; display:block; width:100px; height:86px; padding:2px; background:#fb4357; line-height:78px; text-align:center;}
.sect-login > .box-login fieldset {position:relative;}

/*버튼*/
.box-login button[type="submit"] {
    width: 249px;
    height: 42px;
    line-height: 37px;
    left: 0;
    position: static;
    margin-top: 20px;
    padding: 0px;
    background: #fb4357;
    text-align: center;
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
.id-form, .pw-form {
    width: 215px;
}
.id-form {
    margin-bottom: 5px;
    background: url(../images/sprite/sprite_icon.png) 12px -230px no-repeat;
    background-image: url(../images/sprite/sprite_icon.png);
    background-position-x: 12px;
    background-position-y: -230px;
    background-size: initial;
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: initial;
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
body, form, textarea, select, button, table {
    font-size: 13px;
    line-height: 1.2;
    color: #666;
    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-weight: 400;
}
input,form, select, img {
    vertical-align: middle;
}
button, .id-form {
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

.id-form, .pw-form {
    display: block;
    width: 135px;
    height: 40px;
    padding: 0 5px 0 40px;
    border: 2px solid #b5b5b5;
    line-height: 33px;
}

form, select, img {
    vertical-align: middle;
}

button, .id-form {
    overflow: visible;
}
form {
    writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
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
    padding-block-start: 0.35em;
    padding-inline-start: 0.75em;
    padding-inline-end: 0.75em;
    padding-block-end: 0.625em;
    min-inline-size: min-content;
}

body, form, textarea, select, button, table {
    line-height: 1.2;
    color: #666;
    font-weight: 400;
}

.login-option input[type='button'] {
    cursor: pointer;
    margin: 0;
    padding: 0;
    background-color: white;
    border: 2px solid #7b7b7b;
    line-height: 20px;
    width: 48px;
    height: 22px;
}
/*비번*/
.id-form, .pw-form {
    width: 215px; 
}

/*탭*/
.tab-menu-round {
    clear: both;
    background: url(../images/common/bg/bg_tabmenu_grade.gif) 0 bottom repeat-x;
}
ol, ul {
    list-style: none;
}
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
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
body, form, textarea, select, button, table {
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
.tab-menu-round:after {
    content: '';
    clear: both;
    display: block;
}
.wrap-login .tab-menu-round > li {
    width: 100px;
}
.tab-menu-round > li.on {
    background: #fb4357;
}
.tab-menu-round > li:first-child {
    margin-left: 0;
}
.tab-menu-round > li {
    float: left;
    position: relative;
    line-height: 37px;
    margin-left: 1px;
    background: #898987;
    color: #fdfcf0;
    text-align: center;
}
/*탭 리스트*/
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
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
a {
    color: inherit;
    text-decoration: none;
}

.tab-menu-round > li {
    float: left;
    position: relative;
    line-height: 37px;
    margin-left: 1px;
    background: #898987;
    color: #fdfcf0;
    text-align: center;
}
ol, ul {
    list-style: none;
}

</style>
<div class="wrap-login">
	<div class="sect-login">
		<ul class="tab-menu-round">
			<li class="on">
                <a href="#">로그인</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/reserve/reserveStep1.do">예매</a>
            </li>
            <li>
                <a href="#">예매확인</a>
            </li>
        </ul>
		<div class="box-login">
			<h3 class="hidden">회원 로그인</h3>
			<form:form modelAttribute="memberVO" action="login.do" id="login_form">
			<form:errors element="div" cssClass="error-color"/>
			<fieldset>
			<legend class="hidden">회원 로그인</legend>
			<p>아이디와 비밀번호를 입력하신 후, 로그인 버튼을 클릭해주세요.</p>
			<div class="login">
				<ul>
					<li style="clear: both;">
						<form:label path="id" cssClass="hidden">아이디</form:label>
						<form:input path="id" cssClass="id-form" cssStyle="id-form"/>
						<form:errors path="id" cssClass="error-color"/><br>
					</li>
					<li style="clear: both;">
						<form:label path="mem_pw" cssClass="hidden">비밀번호</form:label>
						<form:password path="mem_pw" cssClass="pw-form" cssStyle="pw-form"/>
						<form:errors path="mem_pw" cssClass="error-color"/>
					</li>
				</ul>
			</div>
<br>
			<form:button id="submit" title="로그인"><span>로그인</span></form:button>
			<div class="login-option align-center" style="text-align: center;padding-right: 230px;"><br>
				<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'" id="home-button">
			</div>
			</fieldset>
			</form:form>
		</div>
	</div>
</div>