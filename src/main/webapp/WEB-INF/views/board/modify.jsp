<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");
		$('button').on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			
			if(operation === 'remove') {
				formObj.attr("action", "/board/remove");
			} else if(operation ==='list') {
				let pageNumTag = $("input[name='pageNum']").clone();
				let amountTag = $("input[name='amount']").clone();
				let typeTag = $("input[name='type']").clone();
				let keywordTag = $("input[name='keyword']").clone();
				formObj.empty();
				formObj.attr("action", "/board/list").attr("method", "get");
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(typeTag);
				formObj.append(keyword Tag);
			}else if (operation === 'modify'){
			let str = "";
			$(".uploadResult ul li").each (function(i, listItem) {
				let liObj = $(listItem);
			str += "<input type='hidden' name='attachList["+i+"].filename' value='"+liObj.data("filename")+"'>"; 
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+liObj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadpath' value='"+liObj.data("path")+"'>"; 
			str += "<input type='hidden' name='attachList["+i+"].filetype' value='"+ liObj.data("type")+"'>";
			});
			formObj.append(str).submit();
		}
			formObj.submit();
		});
		let bno = '<c:out value="${board.bno}" />';
		$.getJSON("/board/getAttachList/" + bno, 
		 	function(attachList) {
				console.log(attachList);
				let str = "";
				$(attachList).each( function(i, attach) {
					if (attach.filetype) {
						let fileCallPath = encodeURIComponent(attach.uploadpath + "\\s_" + attach.uuid + "_" + attach.filename);
						str += "<li data-path='" + attach.uploadpath + "' data-uuid='" + attach.uuid + "'";
						str += "	data-filename='" + attach.filename + "' data-type='" + attach.filetype + "'>";
						str += "	<div>";
						str += "		<span> " + attach.filename + "</span>";
						str += "		<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' ";
						str += "			class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";					
						str += "		<img src='/display?filename=" + fileCallPath + "'>";
						str += "	</div>";
						str += "</li>";
					} else {
						let fileCallPath = encodeURIComponent(attach.uploadpath + "\\" + attach.uuid + "_" + attach.filename);
						str += "<li data-path='" + attach.uploadpath + "' data-uuid='" + attach.uuid + "'"; 
						str += " 	data-filename='" + attach.filename + "' data-type='" + attach.filetype + "'>";
						str += "	<div>";
						str += "		<span> " + attach.filename + "</span>";
						str += "		<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' ";
						str += "			class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "		<img src='/resources/img/attach.png'/>";
						str += "	</div>";
						str += "</li>";
					}
				});
				$(".uploadResult ul").html(str);
		});
		
		$(".uploadResult").on("click", "button", function(e){
			console.log("delete file");
			if (confirm("Remove this file?")){
				let targetLi = $(this).closest("li");
				targetLi.remove();
		}	
		});		
		
		let regex = new RegExp("(.*)\.(exe|zip|alz)$");
		let maxSize = 5*1024*1024;
		function checkExtension(filename, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(filename)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$("#uploadFile").on("change", function(e){
			let formData = new FormData();
			let inputFile = $("#uploadFile");
			let files = inputFile[0].files;
			for (let i = 0; i <files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile",files[i]);
			}
			$.ajax({
				type:'post',
				url: '/uploadFileAjax',
				processData: false,
				contentType: false,
				data: formData,
				success:function(result){
					console.log(result);
					showUploadResult(result);
					}
				});
			
			});
		
		function showUploadResult(result){
			if(!result || result.length == 0) {return;}
			let uploadUL = $(".uploadResult ul");
			let str = "";
			$(result).each( function(i, obj) {
				if (obj.image) {
					let fileCallPath = encodeURIComponent(obj.uploadpath + "\\s_" + obj.uuid + "_" + obj.filename);
					str += "<li data-path='" + obj.uploadpath + "'";
					str += "	data-uuid='" + obj.uuid + "' data-filename='" + obj.filename + "' data-type='" + obj.image + "'>";
					str += "	<div>";
					str += "		<span> " + obj.filename + "</span>";
					str += "		<button type='button' data-file=\'" + fileCallPath + "\'";
					str += "			data-type='image' class='btn btn-warning btn-circle><i class='fa fa-times'>x</i></button><br>";
					str += "		<img src='/display?filename=" + fileCallPath + "'>";
					str += "	</div>";
					str += "</li>";
				} else {
					let fileCallPath = encodeURIComponent(obj.uploadpath + "\\" + obj.uuid + "_" + obj.filename);
					str += "<li data-path='" + obj.uploadpath + "'";
					str += "	data-uuid='" + obj.uuid + "' data-filename='" + obj.filename + "' data-type='" + obj.image + "'>";
					str += "	<div>";
					str += "		<span> " + obj.filename + "</span>";
					str += "		<button type='button' data-file=\'" + fileCallPath + "\'";
					str += "			data-type='file' class='btn btn-warning btn-circle><i class='fa fa-times'>x</i></button><br>";
					str += "		<img src='/resources/img/attach.png'/>";
					str += "	</div>";
					str += "</li>";
				}
			});
			uploadUL.append(str);
		}
		
});//close


</script>

<div class="wrapper_read">
    <div class="read_head">
		<h3>게시글 수정화면 입니다.</h3>
	</div>
	<div class="read_line"></div>
	<form action="/board/modify" method="post">
		<input type='hidden' name='pageNum' value='<c:out value="${criteria.pageNum}"/>'>
		<input type='hidden' name='amount' value='<c:out value="${criteria.amount}"/>'>
		<input type='hidden'  name='type' value='<c:out value="${criteria.type}"/>'>
		<input type='hidden'  name='keyword' value='<c:out value="${criteria.keyword}"/>'>
		<table class="read_table">
			<thead>
				<tr class="read_table_title">
					<th>번호</th>
					<td><input class="form-control" name="bno" 
						value='<c:out value="${board.bno}"/>' readonly="readonly"></td>
				</tr>
				<tr class="read_table_title">
					<th>제목</th>
					<td> <input class="form-control" name="title"
							value='<c:out value="${board.title}"/>'></td>
				</tr>
				<tr class="read_table_title">
					<th>작성자</th>
					<td><input class="form-control" name="writer"
							value='<c:out value="${board.writer}"/>' readonly="readonly"></td>
				</tr>
				<tr class="read_table_title">
					<th>작성일</th>
					<td><input class="form-control" name="regDate"
							value='<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>' readonly="readonly"></td>
				</tr>
			</thead>
		</table>
		<div class="read_table_content">
			<textarea class="read_content" name="content"><c:out value="${board.content}"/></textarea>
		</div>
		<div class="field1 get-th field-style">
			<label><b>첨부파일</b></label>
		</div>
		<div class="field2 get-th field-style uploadDiv">
			<input type="file" name="uplaodFile" id="uploadFile" class="file-input" multiple />
		</div>
		<div class="uploadResult">
			<ul></ul>
		</div>
		<c:if test="${auth.userid eq board.writer}">
			<button type="submit" data-oper='modify' class="read_button" >수정</button>
			<button type="submit" data-oper='remove' class="read_button" >삭제</button>
		</c:if>
		<button type="submit" data-oper="list" class="read_button">List</button>
	</form>
</div>

<%@include file="../includes/footer.jsp" %>








<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var formObj = $("form");
		$('button').on("click", function(e){
			e.preventDefatult();
			var operation = $(this).data("oper");
			console.log(operaion);
			
			if(operation ==='remove'){
				formObj.attr("action", "/board/remove");
			}else if(operation === 'list'){
				formObj.empty();
				formObj.attr("action","/board/list").attr("method","get");
			}
			formObj.submit();
			}
		});
	});
</script>
</head>
<body>

<div class= "wrapper_read">
	<div class="read_head">
		<h3>게시글 수정화면 입니다.</h3>
	</div>
	<div class = "read_line"></div>
	<form action="/board/modify" method="post">
		<input type='hidden' name='pageNum' value='<c:out value="${criteria.pageNum}"/>'>
		<input type='hidden' name='amount' value='<c:out value="${criteria.amount}"/>'>
		<table class = "read_table">
			<thead>
				<tr class="read_title">
					<th>번호</th>
					<td><input class="form-control" name="bno"
						value='<c:out value=${board.bno }"/>' readonly="readonly"></td>
					</tr>	
					
		</table>
	
	</form>
</div>



</body>
</html> --%>