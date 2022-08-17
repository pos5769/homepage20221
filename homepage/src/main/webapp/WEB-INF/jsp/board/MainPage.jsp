<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KJH's Portfolio</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');
    </style>
    <link href="/asset/front/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="/asset/PORTFOLIO/css/allstyle.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="/asset/PORTFOLIO/js/scroll.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <div id="__next">
        <div id="root">
<%@ include file="/WEB-INF/jsp/board/Header.jsp" %>
            <div class="Masthead_masthead" id="portfolio">
                <div class="Masthead_content">
                    <div class="Masthead_title">
                        - Kim Jin Hwan -
                        <br>
                        Web Developer Portfolio
                    </div>
                    <hr class="Masthead_divider">
                    <div class="Masthead_description">
                        저의 홈페이지에 방문해 주셔서 감사합니다:)
                        <br>
                        저는 개발을 꾸준히 하고 있는 웹 개발자입니다.
                        <br>
                        부족하지만 앞으로 한걸음씩 나아가는 개발자가 되겠습니다.
                    </div>
                    <div class="Masthead_find-out-more"><a href="#about-me">더 알아보기 ↓</a></div>
                </div>
            </div>
            <article class="AboutMe_aboutme" id="about-me">
                <div class="AboutMe_content">
                    <div class="SectionTitle_sectiontitle">
                        <div class="SectionTitle_text" style="color: #000000; border-bottom-color: #000000">ABOUT ME</div>
                        <div class="SectionTitle_link_wrapper">
                            <img class="SectionTitle_link" src="/asset/PORTFOLIO/images/black-link.png" alt="">
                        </div>
                    </div>
                    <div class="AboutMe_basic_infos">
                        <div class="AboutMe_basic_info_wrapper">
                            <div class="AboutMe_basic_info">
                                <div class="AboutMe_icon_img_wrapper">
                                    <img class="AboutMe_icon_img" src="/asset/PORTFOLIO/images/person-fill.svg" alt="">
                                </div>
                                <div class="AboutMe_field">
                                    <div class="AboutMe_field_label">이름</div>
                                    <div class="AboutMe_field_value">김진환</div>
                                </div>
                            </div>
                        </div>
                        <div class="AboutMe_basic_info_wrapper">
                            <div class="AboutMe_basic_info">
                                <div class="AboutMe_icon_img_wrapper">
                                    <img class="AboutMe_icon_img" src="/asset/PORTFOLIO/images/calendar-fill.svg" alt="">
                                </div>
                                <div class="AboutMe_field">
                                    <div class="AboutMe_field_label">생년월일</div>
                                    <div class="AboutMe_field_value">95.10.09</div>
                                </div>
                            </div>
                        </div>
                        <div class="AboutMe_basic_info_wrapper">
                            <div class="AboutMe_basic_info">
                                <div class="AboutMe_icon_img_wrapper">
                                    <img class="AboutMe_icon_img" src="/asset/PORTFOLIO/images/geo-alt-fill.svg" alt="">
                                </div>
                                <div class="AboutMe_field">
                                    <div class="AboutMe_field_label">주소지</div>
                                    <div class="AboutMe_field_value">경상북도 포항시</div>
                                </div>
                            </div>
                        </div>
                        <div class="AboutMe_basic_info_wrapper">
                            <div class="AboutMe_basic_info">
                                <div class="AboutMe_icon_img_wrapper">
                                    <img class="AboutMe_icon_img" src="/asset/PORTFOLIO/images/telephone-fill.svg" alt="">
                                </div>
                                <div class="AboutMe_field">
                                    <div class="AboutMe_field_label">연락처</div>
                                    <div class="AboutMe_field_value">010-5094-2760</div>
                                </div>
                            </div>
                        </div>
                        <div class="AboutMe_basic_info_wrapper">
                            <div class="AboutMe_basic_info">
                                <div class="AboutMe_icon_img_wrapper">
                                    <img class="AboutMe_icon_img" src="/asset/PORTFOLIO/images/envelope-fill.svg" alt="">
                                </div>
                                <div class="AboutMe_field">
                                    <div class="AboutMe_field_label">이메일</div>
                                    <div class="AboutMe_field_value">
                                        <a class="AboutMe_email" href="mailto:pos5769@naver.com">pos5769@nate.com</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="AboutMe_basic_info_wrapper">
                            <div class="AboutMe_basic_info">
                                <div class="AboutMe_icon_img_wrapper">
                                    <img class="AboutMe_icon_img" src="/asset/PORTFOLIO/images/pencil-fill.svg" alt="">
                                </div>
                                <div class="AboutMe_field">
                                    <div class="AboutMe_field_label">학력</div>
                                    <div class="AboutMe_field_value">
                                        한남대학교
                                        <br>
                                        (멀티미디어공학전공)
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
            <article class="Skills_skills" id="skills">
                <div class="Skills_content">
                    <div class="SectionTitle_sectiontitle">
                        <div class="SectionTitle_text" style="color:#000000; border-bottom-color:#000000">SKILLS</div>
                        <div class="SectionTitle_link_wrapper">
                            <img class="SectionTitle_link" src="/asset/PORTFOLIO/images/black-link.png" alt="">
                        </div>
                    </div>
                    <div class="Skills_tech_stacks_container">
                        <div class="Skills_tech_stacks">
                            <div class="Skills_title">Frontend</div>
                            <img class="Skills_img" src="/asset/PORTFOLIO/images/frontend.png" alt="">
                        </div>
                        <div class="Skills_tech_stacks">
                            <div class="Skills_title">Backend</div>
                            <img class="Skills_img" src="/asset/PORTFOLIO/images/backend.png" alt="">
                        </div>
                        <div class="Skills_tech_stacks">
                            <div class="Skills_title">Others</div>
                            <img class="Skills_img" src="/asset/PORTFOLIO/images/others.png" alt="">
                        </div>
                        <div class="Skills_tech_stacks">
                            <div class="Skills_title">Certificate</div>
                            <img class="Skills_img" src="/asset/PORTFOLIO/images/certificate.png" alt="">
                        </div>
                    </div>
                </div>
            </article>
            <article class="Archiving_archiving" id="archiving">
                <div class="Archiving_content">
                    <div class="SectionTitle_sectiontitle">
                        <div class="SectionTitle_text" style="color:#000000; border-bottom-color:#000000">ARCHIVING</div>
                        <div class="SectionTitle_link_wrapper">
                            <img class="SectionTitle_link" src="/asset/PORTFOLIO/images/black-link.png" alt="">
                        </div>
                    </div>
                    <div class="Archiving_container">
                        <a href="https://github.com/pos5769">
                            <div class="Archiving_git-hub">
                            <div class="Archiving_img_wrapper">
                                <img class="Archiving_img" src="/asset/PORTFOLIO/images/github.png" alt="">
                            </div>
                            <div class="Archiving_url">github.com/pos5769</div>
                            <div class="Archiving_description">
                                <p>
                                    <b>소스 코드 저장소</b>
                                    입니다.
                                </p>
                                <ul>
                                    <li>
                                        프로젝트, 프로그램, 앱의 소스 코드
                                    </li>
                                    <li>
                                        혼자서 코딩 연습을 위해 끄적이던 소스 코드
                                    </li>
                                    <li>
                                        학부 시절 수강한 수업들의 코딩 과제 소스 코드
                                    </li>
                                </ul>
                            </div>
                            </div>
                        </a>
                        <a href="https://pos5769.tistory.com">
                            <div class="Archiving_tistory">
                                <div class="Archiving_img_wrapper">
                                    <img class="Archiving_img" src="/asset/PORTFOLIO/images/tistory.png" alt="">
                                </div>
                                <div class="Archiving_url">pos5769.tistory.com</div>
                                <div class="Archiving_description">
                                    <p>
                                        <b>공부 및 지식 공유 목적의 블로그</b>
                                        입니다.
                                    </p>
                                    <ul>
                                        <li>
                                            공부한 것을 나의 것으로 만들기 위한 기록
                                        </li>
                                        <li>
                                            웹 개발자의 길을 걸으며 공부한 웹 관련 지식 정리
                                        </li>
                                        <li>
                                            학부 시절 배운 수업들의 내용 복습 겸 정리
                                        </li>
                                        <li>
                                            내가 스스로 배우고 터득한 지식을 정리
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </article>
            <div class="PageUpButton_pageupbutton">
                <a href="#portfolio"><img class="PageUpButton_img" src="/asset/PORTFOLIO/images/page-up.svg" alt=""></a>
            </div>
<%@ include file="/WEB-INF/jsp/board/Footer.jsp" %>
        </div> 
    </div>
</body>
</html>