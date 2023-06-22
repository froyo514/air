<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<link rel="stylesheet" href="/resources/css/list.css">
<title>Insert title here</title>
<script>
$(function(){
	$(".write_btn").on("click",function() {
		self.location = "/board/register";
		/* let form = $('<form></form>');
		form.attr("method","get");
		form.attr("action", "/board/registerForm");
		form.submit(); */
	});
	let result = '<c:out value="${result}"/>';
	checkModal(result);
	history.replaceState({}, null, null);
	function checkModal(result) {
		if(result === '' || history.state){
			return;
		}
		if(parseInt(result) > 0) {
			result = parseInt(result) + " 번이 등록되었습니다.";
		} else {
			result = "처리가 완료 되었습니다.";
		}
		alert(result);
	}
	/* if (result != "") {
		result += "번 글이 등록되었습니다.";
		alert(result);
		} */
		$(".get").on("click", function(e){
			e.preventDefault();
			let form = $('<form></form>');
			form.attr("method","get");
			form.attr("action","/board/get");
			form.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
			form.append("<input type='hidden' name='pageNum' value='" + <c:out value = "${pageDTO.criteria.pageNum}"/> +"'>");
			form.append("<input type='hidden' name='amount' value='" + <c:out value = "${pageDTO.criteria.amount}"/> +"'>");
			form.appendTo('body');
			form.submit();
	});
			
			$(".paginate_button a").on("click", function(e){
				e.preventDefault();
				let form = $('<form></form>');
				form.attr("method","get");
				form.attr("action","/board/list");
				form.append("<input type='hidden' name='pageNum' value='" + $(this).attr("href") + "' >"); 
				form.append("<input type='hidden' name='amount' value='" + <c:out value = "${pageDTO.criteria.amount}"/> +"'>");
				form.appendTo('body');
				form.submit();
		 
		 }); 

			
				let list = new Array();
				<c:forEach items="${list}" var="board">
					list.push(<c:out value="${board.bno}" />);
				</c:forEach>
				$.getJSON("/replies/cnt", {list:list}, function(data){
					let keys = Object.keys(data);
					$(keys).each( function(i,bno){
						let replyCnt = data[bno]
						let text = $("a[name=" + bno +"]").text().trim() + "[" + replyCnt +"]";
						$("a[name=" + bno +"]").text(text);
					});
				});
			

			
				$.getJSON("/board/getAttachListOnList", {list: list}, function(data) {
					console.log(data);
					let html = "";
					let keys = Object.keys(data).sort((a, b) => Number(b)-Number(a));
					$(keys).each (function(i, bno) {
						let attach = data[bno];
						console.log (bno);
						if (attach[0] != null) {
							if (attach[0].filetype) {
							let fileCallPath = encodeURIComponent(attach[0].uploadpath+ "\\s_"+attach[0].uuid +"_"+attach[0].filename); 
							html = "<img src='/display?filename="+fileCallPath+"' width='50px' height='50px'>";
						} else {
							html = "<img src='/resources/img/attach.png' width='50px' height='50px'>";
						}
						$("#"+bno).html(html);
					}
				});
		});			
						
			
						
						
						
						
						
				
});


</script>
</head>
<body>
<table class="board_table">
 	<thead>
         <tr class="table_title">
           <th>번호</th>
           <th>제목</th>
           <th>작성자</th>
           <th>첨부파일</th>
           <th>수정일</th>
          </tr>
    </thead>
    <tbody class="board_content">
    	<c:forEach items="${list}" var="board">
    		<tr class="tr_list">
    			<td><c:out value="${board.bno}"/></td>
    			<td>
    				<a class="get" href='<c:out value="${board.bno}"/>' name='<c:out value="${board.bno}"/>'>
    					<c:out value="${board.title}"/>	
    				</a>
    			</td>
    			<td><c:out value="${board.writer}"/></td>
    			<td id='<c:out value="${board.bno}"/>'></td>
    			<td>
    				<c:choose>
    					<c:when test="${board.regdate == board.updatedate }">
    						<fmt:formatDate pattern="YY-MM-dd hh:mm" value="${board.regdate }"/>
    					</c:when>
    					<c:otherwise>
    						<fmt:formatDate pattern="YY-MM-dd hh:mm" value="${board.updatedate }"/>
    					</c:otherwise>
    				</c:choose>
    			</td>  
    		</tr>
    	</c:forEach>
    </tbody>
   </table>
   <!-- page -->
  <div class="board_page">
  	<ul class="pagination">
  		<c:if test="${pageDTO.prev}">
  			<li class="paginate_button previous">
  				<a href="${pageDTO.startPage-1 }">Prev</a>
  			</li>
  		</c:if>
  		<c:forEach var="num" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
			<li class="paginate_button ${pageDTO.criteria.pageNum==num ? 'active_list':'' }">  		
  				<a href="${num}">${num}</a>
  			</li>
  		</c:forEach>
  		<c:if test="${pageDTO.next}">
  			<li class="paginate_button next">
  				<a href="${pageDTO.endPage+1 }">Next</a>
  			</li>
  		</c:if>
  	</ul>  
  </div>
   <div class="board_bottom">
   		<button class="write_btn" id="write_btn">글쓰기</button>
   </div> 
  <%@include file="../includes/footer.jsp" %>
