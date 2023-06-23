<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/get.css">
<script src="/resources/js/reply.js"></script>   
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">		

<style>
.bigPictureWrapper{position: fixed/*absolute*/; display:none; left:0px; justify-content: center; align-items: center; top:0; width:100%; height:100%; 
	background-color: gray; z-index:1100; background:rgba(0,0,0,0.5);}
.bigPicture{position: relative;display: flex; justify-content: center; align-content: center; top:15%; left:0;}
.bigPicture img{width:650px;}
</style>

<script>
$(function() {

	const operForm = $("#operForm");
	$("#list_btn").on("click", function(e) {
		operForm.find("#bno").remove();
		operForm.attr("action","/board/list");
		operForm.submit();
	});
	
	$("#modify_btn").on("click", function(e) {
		operForm.attr("action","/board/modify")
		operForm.submit();
	});
	
	$("#addReplyBtn").on("click", function(){
		$("#reply").val("");
		$("#modalModBtn").hide();
		$("#modalRegisterBtn").show();
		$("#modalCloseBtn").show();
		$(".modal").modal("show");
	});
	
	$("#modalCloseBtn").on("click", function(){
		$(".modal").modal("hide");
	});
	
	$("#modalRegisterBtn").on("click", function(){
		let reply = {reply:$("#reply").val(),
			replyer: $("#replyer").val(),
			bno: '<c:out value = "${board.bno}"/>'
		
	};
	ReplyService.add(reply,
			function(result){
				alert(result);
				$(".modal").modal("hide");
				getReplyListWithPaging(pageNum);
			},
			function (error){
				alert(error);
			});
		});
	
	//modify the reply
	$(".reply").on("click","li #modify",function(e){
		let replyer = $(this).parent().closest('div').data("replyer");
		let rno = $(this).parent().closest('div').data("rno");
		let auth = "${auth.userid}";
		console.log(replyer);
		console.log(rno );
		if (auth !== replyer){
			return;
		}
		
	//alert('modify' + auth + ' ' + replyer + ' ' reno);
	ReplyService.get(rno, function(reply){
		
		alert("홍")
		console.log("replyer"+replyer)
		console.log("rno"+rno)
		$("#reply").val(reply.reply);
		$("#replyer").val(reply.replyer);
		$(".modal").data("rno",reply.rno);
		$("#modalModBtn").show();
		$("#modalRegisterBtn").hide();
		$(".modal").modal("show");
		
	});
		
	});
	
	$("#modalModBtn").on("click", function(e){
		let reply = { reply:$("#reply").val(),
				rno:$(".modal").data("rno")		
		};
		ReplyService.update(reply,
				function(result){
					alert(result);
					$(".modal").modal("hide");
					getReplyListWithPaging(pageNum);
				},
				function(error){
					alert(error);
		});
		
	});
	
	$(".reply").on("click", "#remove",function(e){
		let rno = $(this).parent().closest('div').data("rno");
		ReplyService.remove (rno,
			function(result){
				alert(result);
				getReplyList();
		},
		function (error){
				alert(error);
		});
	});
	//reply list with paging
	let pageNum = 1;
	let replyPageFooter = $(".panel-footer");
	
	getReplyListWithPaging(pageNum);
	function getReplyListWithPaging(pageNum){
		ReplyService.getReplyListWithPaging(
			{bno:'<c:out value="${board.bno}"/>', page: pageNum},
			function(replyCnt, list) {
				console.log("list:" + list);
				showReplyList(list)
				showReplyPaging(replyCnt);
			},
			function (error){
				alert(error);
			});
		}
	

	//paging
	replyPageFooter.on("click", "li a", function(e){
	e.preventDefault();
	console.log("page click");
	let targetPageNum = $(this).attr("href");
	console.log("targetPageNum: " + targetPageNum);
	pageNum = targetPageNum;
	getReplyListWithPaging(pageNum);
});
	
	
	function showReplyList(list){
		let str = "";
		let replyUL = $(".reply");
		if(list == null || list.length == 0 ){
			replyUL.html(str);
			return;
		}
		for(var i = 0, len = list.length || 0; i <len; i++){
			str +="<li>";
			str +=" <div>";
			str +=" 	<div class='header'><strong class='prmary-font'>"+list[i].replyer+"</strong>";
			str +="			<small class='pull-right text-muted'>"+ReplyService.displayTime(list[i].regdate)+"</small>";
			str +="		</div>";
			str +="		<div data-rno='" + list[i].rno + "' data-replyer='" +list[i].replyer + "'>";
			str +="			<strong id ='modify' class='primay-font'>"+list[i].reply+"</strong>";
			if ("${auth.userid}" === list[i].replyer ) {
			str +="		<button id='remove' type='button' class='close' date-rno='" + list[i].rno+"'>";
			str +="			<span>x</span></button>";
			}
			str +=" 	</div>";
			str +="	</div>";
			str +="</li>";
		}
		replyUL.html(str);
	}
	
	function showReplyPaging(replyCnt){
		let endNum = Math.ceil(pageNum / 10.0) * 10;
		let startNum = endNum -9;
		let prev = startNum !=1;
		let	next = false;
		let str = "";
		if (endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		if(endNum * 10 <replyCnt){
			next = true;
		}
		str +="<ul class='pagination'>";
		if(prev){
			str+="<li class='paginate_button'><a href='"+(startNum -1)+"'>Previous</a></li>";
		}
		for(let i = startNum ; i <= endNum; i++){
			let active = pageNum == i? "active_list":"";
			str+="<li class='paginate_button "+active+" '><a href='"+i+"'>"+i+"</a></li>";
		}
		if (next){
			str+= "<li class='paginate_button'><a href='"+(endNum + 1 )+"'>Next</a></li>";
		}
		str += "</ul></div>";
		console.log(str);
		replyPageFooter.html(str);
		}
	
		
			//reply list
			getReplyList();
			function getReplyList(){
				ReplyService.getList(
					{bno:'<c:out value = "${board.bno}"/>'},
					function(list){
						console.log("list: " + list);
						showReplyList(list);
					},
					function (error){
						alert(error);
				});
			}
			

	let bno = '<c:out value="${board.bno}"/>';
	$.getJSON("/board/getAttachList/"+bno, function (attachList) {
		console.log (attachList);
		let str = "";
		$ (attachList).each(function(i, attach) {
			if (attach. filetype) {
			let fileCallPath = encodeURIComponent (attach.uploadpath+ "\\s_"+attach.uuid +"_"+attach. filename);
			str += "<li data-path='"+attach.uploadpath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.filename + "'"; 
			str += "	data-type='"+attach.filetype+"'>";
			str += "  <div>";
			str += "	<span>"+attach. filename+"</span>";
			str += "	<img src='/display?filename="+fileCallPath+"'/>";
			str += "	</div>";
			str += "</li>";
		} else {
			str += "<li data-path='"+attach.uploadpath+"' data-uuid='"+attach.uuid+"'";
			str += "	 data-filename='"+attach.filename+"' data-type='"+attach.filetype+"'>";
			str += "  <div>";
			str += " 	<span>"+attach. filename+"</span>";
			str += "	<img src='/resources/img/attach.png'/>";
			str += " </div>";
			str + "</li>";
		}
		});
			$(".uploadResult ul").html(str);
		});
	

	function showImage (fileCallPath) {
		$(".bigPictureWrapper").css("display", "flex").show();
		$(".bigPicture").html("<img src='/display?filename="+fileCallPath+"'>") .animate({width: '100%', top:'0'}, 600);
	}
	$(".uploadResult").on("click", "li", function (e) {
		console.log("view image");
		let liObj = $(this);
		let path = encodeURIComponent (liObj.data("path") + "\\" + liObj.data("uuid") +"_" + liObj.data("filename"));
		if (liObj.data("type")) {
			showImage (path);
	} else {
		if (path.toLowerCase().endsWith('pdf')) {
		// new window
		window.open("/pdfviewer?filename="+path);
	
		} else {
			// download
			self.location = "/downloadFile?filename="+path;
		}
	}
	
});
	
	$(".bigPictureWrapper").on("click", function (e) { 
		$(".bigPictureWrapper").hide();
		$(".bigPicture").css("top", "15%");
	});
	

	
	
});
</script>

<div class="wrapper_read">
	<div class="read_head">
		<h3>게시글 읽기</h3>
	</div>
	<div class="read_line"></div>
	<table class="read_table">
		<thead>
			<tr class="read_table_title">
				<th>제목</th>
				<td>${board.title}</td>
			</tr>
			<tr class="read_table_title">
				<th>작성자</th>
				<td>${board.writer}</td>
			</tr>
			<tr class="read_table_title">
				<th>작성일</th>
				<td>
				<c:choose>
					<c:when test="${board.regdate } == ${board.updatedate }">
					<fmt:formatDate pattern="YY-MM-dd hh:mm" value="${board.regdate}"/>
					</c:when>
					<c:otherwise>
					<fmt:formatDate pattern="YY-MM-dd hh:mm" value="${board.updatedate}"/>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</thead>
	</table>
	<div class="read_table_content">
		<textarea class="read_content" name="content" readonly="readonly">${board.content}</textarea>
	</div>
	<div class="article-bottom">
		<div class="field3 get-th field-style">
			<p><b>첨부파일</b></p>
		</div>
		<div class="field3 get-td">
			<div class="uploadResult">
				<ul></ul>
			</div>
		</div>
	</div>
	<div class="read_bottom">
		<button class="read_button" id="list_btn">목록</button>
		<c:if test="${auth.userid eq board.writer}">
		<button class="read_button" id='modify_btn'>수정</button>
		</c:if>
		<form id='operForm' action="/board/modify" method="get">
			<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
			<input type='hidden'  name='pageNum' value='<c:out value="${criteria.pageNum}"/>'>
			<input type='hidden'  name='amount' value='<c:out value="${criteria.amount}"/>'>
			<input type='hidden'  name='type' value='<c:out value="${criteria.type}"/>'>
			<input type='hidden'  name='keyword' value='<c:out value="${criteria.keyword}"/>'>
		</form>
	</div>
	<div class="read_reply">
		<c:if test="${not empty auth}">	
		<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 작성</button>
		</c:if>
	</div>
	<div>
		<h4>댓글 목록</h4>
	</div>
	<div class="reply_list">
		<ul class="reply"></ul>
		<div class="panel-footer"></div>
	</div>
</div>
<!--  Modal -->
<div class="modal fade" tabindex="-1" role="dialog">
	<div class = "modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">REPLY MODAL</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="close">
					<span aria-hidden="true">&times;</span>
				</button>
		</div>
<div class="modal-body">
	<div class = "form-group">
		<label>Reply</label>
		<input class="form-control" id='reply' name='reply'>
	</div>
	<div class = "form-group">
		<label>Replyer</label>
		<input class="form-control" id='replyer' name='replyer' value="${auth.userid}" readonly="readonly">
	</div>
</div>
<div class="modal-footer">
	<button id = 'modalModBtn' type="button" class="btn btn-warning">Modify</button>
	<button id = 'modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
	<button id = 'modalCloseBtn' type="button" class="btn btn-info">Close</button>
	</div>
</div>
	<!-- /.modal-content-->
</div>
	<!-- /.modal-dialog-->
</div>
	<!-- /.modal-->
	<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
	</div>















	
