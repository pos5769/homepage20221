<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<title>수업용 게시판</title>
<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet"/>
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.tiny.cloud/1/0hpy3d7bzlro9w8403wx8h2ll04q3orji2ge00mgbyczocfk/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
<script>
$(function(){
    var plugins = [
        "advlist", "autolink", "lists", "link", "image", "charmap", "print", "preview", "anchor",
        "searchreplace", "visualblocks", "code", "fullscreen", "insertdatetime", "media", "table",
        "paste", "code", "help", "wordcount", "save"
    ];
    var edit_toolbar = 'formatselect fontselect fontsizeselect |'
               + ' forecolor backcolor |'
               + ' bold italic underline strikethrough |'
               + ' alignjustify alignleft aligncenter alignright |'
               + ' bullist numlist |'
               + ' table tabledelete |'
               + ' link image';

    tinymce.init({
    	language: "ko_KR", //한글판으로 변경
        selector: '#boardCn',
        height: 500,
        menubar: false,
        plugins: plugins,
        toolbar: edit_toolbar,
        
        /*** image upload ***/
        image_title: true,
        /* enable automatic uploads of images represented by blob or data URIs*/
        automatic_uploads: true,
        /*
            URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
            images_upload_url: 'postAcceptor.php',
            here we add custom filepicker only to Image dialog
        */
        file_picker_types: 'image',
        /* and here's our custom image picker*/
        file_picker_callback: function (cb, value, meta) {
            var input = document.createElement('input');
            input.setAttribute('type', 'file');
            input.setAttribute('accept', 'image/*');

            /*
            Note: In modern browsers input[type="file"] is functional without
            even adding it to the DOM, but that might not be the case in some older
            or quirky browsers like IE, so you might want to add it to the DOM
            just in case, and visually hide it. And do not forget do remove it
            once you do not need it anymore.
            */
            input.onchange = function () {
                var file = this.files[0];

                var reader = new FileReader();
                reader.onload = function () {
                    /*
                    Note: Now we need to register the blob in TinyMCEs image blob
                    registry. In the next release this part hopefully won't be
                    necessary, as we are looking to handle it internally.
                    */
                    var id = 'blobid' + (new Date()).getTime();
                    var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
                    var base64 = reader.result.split(',')[1];
                    var blobInfo = blobCache.create(id, file, base64);
                    blobCache.add(blobInfo);

                    /* call the callback and populate the Title field with the file name */
                    cb(blobInfo.blobUri(), { title: file.name });
                };
                reader.readAsDataURL(file);
            };
            input.click();
        },
        /*** image upload ***/
        
        content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
    });
});
</script>
</head>
<body>

<c:choose>
	<c:when test="${not empty searchVO.boardId}">
		<c:set var="actionUrl" value="/board/update.do"/>
	</c:when>
	<c:otherwise>
		<c:set var="actionUrl" value="/board/insert.do"/>
	</c:otherwise>
</c:choose>

<div class="container">
<div id="contents">
	<form action="${actionUrl}" method="post" id="frm" name="frm" onsubmit="return regist()" enctype="multipart/form-data">
		<input type="hidden" name="boardId" value="${result.boardId}"/>
		<input type="hidden" name="returnUrl" value="/board/boardRegist.do"/>
		
		<table class="chart2">
			<caption>게시글 작성</caption>
			<colgroup>
				<col style="width:120px" />
				<col />
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">제목</th>
				<td>
					<input type="text" id="boardSj" name="boardSj" title="제목입력" class="q3" value="<c:out value="${result.boardSj}"/>"/>
				</td>
			</tr>
				<tr>
					<th scope="row">공지여부</th>
					<td>
						<label for="noticeAtY">예 : </label>
						<input type="radio" id="noticeAtY" value="Y" name="noticeAt" <c:if test="${result.noticeAt eq 'Y'}">checked="checked"</c:if>/>
						&nbsp;&nbsp;&nbsp;
						<label for="noticeAtN">아니오 : </label>
						<!-- result.noticeAt ne 'Y' : 디폴트 값으로 이 값을 지정한다는 의미 -->
						<input type="radio" id="noticeAtN" value="N" name="noticeAt" <c:if test="${result.noticeAt ne 'Y'}">checked="checked"</c:if>/>
					</td>
				</tr>
				<tr>
					<th scope="row">비공개여부</th>
					<td>
						<label for="noticeAtY">예 : </label>
						<input type="radio" id="othbcAtY" value="Y" name="othbcAt" <c:if test="${result.othbcAt eq 'Y'}">checked="checked"</c:if>/>
						&nbsp;&nbsp;&nbsp;
						<label for="noticeAtN">아니오 : </label>
						<input type="radio" id="othbcAtN" value="N" name="othbcAt" <c:if test="${result.othbcAt ne 'Y'}">checked="checked"</c:if>/>
					</td>
				</tr>
				<tr>
					<th scope="row">작성자ID</th>
					<td>
						<c:out value="${USER_INFO.id}"/>
					</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td>
						<!-- textarea는 Enter을 치면 그 공간만큼 띄어쓰기가 되서 값이 출력됨 그래서 붙여서 써야 정상적인 값이 출력됨 -->
						<textarea id="boardCn" name="boardCn" rows="15" title="내용입력"><c:out value="${result.boardCn}"/></textarea>
					</td>
				</tr>
				<c:if test="${not empty result.atchFileId}">
					<tr>
						<th scope="row">기존<br/>첨부파일목록</th>
						<td>
							<c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.atchFileId}" />
							</c:import>
						</td>
					</tr>
				</c:if>
				
				<tr>
					<th scope="row">파일첨부</th>
					<td>
						<input type="file" name="file_1"/>
						<br/>
						<input type="file" name="file_2"/>
						<br/>
						<input type="file" name="file_3"/>
						<br/>
						<input type="file" name="file_4"/>
						<br/>
						<input type="file" name="file_5"/>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="btn-cont ar">
			<c:choose>
				<c:when test="${not empty searchVO.boardId}">
					<c:url var="uptUrl" value="/board/update.do">
						<c:param name="boardId" value="${result.boardId}"/>
					</c:url>
					<a href="${uptUrl}" id="btn-reg" class="btn">수정</a>
					
					<c:url var="delUrl" value="/board/delete.do">
						<c:param name="boardId" value="${result.boardId}"/>
					</c:url>
					<a href="${delUrl}" id="btn-del" class="btn"><i class="ico-del"></i>삭제</a>
				</c:when>
				<c:otherwise>
					<a href="#none" id="btn-reg" class="btn spot">등록</a>
				</c:otherwise>
			</c:choose>
			<c:url var="listUrl" value="/board/selectList.do"/>
			<a href="${listUrl}" class="btn">취소</a>
		</div>
	</form>
</div>
</div>
<script>
$(document).ready(function(){
	//게시 글 등록
	$("#btn-reg").click(function(){
		$("#frm").submit();
		return false; // 데이터를 한번만 들어갈 수 있게 해주는 부분
	});
	
	//게시 글 삭제
	$("#btn-del").click(function(){
		if(!confirm("삭제하시겠습니까?")){ // 한번 더 묻는 과정을 만들어서 실수 없이 확실하게 처리하게 하기 위해서
			return false;
		}
	});
});
	
function regist(){
	if(!$("#boardSj").val()){
		alert("제목을 입력해주세요.");
		return false;
	}
	
	//에디터 내용 저장
	$("#boardCn").val(tinymce.activeEditor.getContent());
	
}
</script>
</body>
</html>