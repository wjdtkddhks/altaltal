<%@page import="com.spring.altaltal.freeboard.PageInfo"%>
<%@page import="com.spring.altaltal.FeedbackVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	ArrayList<FeedbackVO> feedbackList = (ArrayList<FeedbackVO>)request.getAttribute("feedbackList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	int number = listCount-((nowPage-1)*10);
	
	String topic = (String)request.getAttribute("topic");
	String keyword = (String)request.getAttribute("keyword");
%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewpoint" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>관리자_ 피드백리스트</title>
<style type="text/css">
#page-wrapper{
	padding-bottom: 150px;
}

h2 {
	text-align: center;
}
.container {
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  width: 850px;
}
#emptyArea{
	min-height: 80%;
	padding-bottom: 150px;
}

/* @media (min-width: 768px) {
  .container {
    width: 750px;
  }
}

@media (min-width: 992px) {
  .container {
    width: 970px;
  }
}

@media (min-width: 1200px) {
  .container {
    width: 850px;
  }
} */

.member_change {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background-color:#ffffff;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:12px;
	font-weight:bold;
	padding:6px 11px;
	text-decoration:none !important;<!-- important:강제로 지정하기 -->
	text-shadow:0px 1px 0px #ffffff;
	margin-right: 13%;
}
.member_change {
	background-color:#f6f6f6;
}
.member_change {
	position:relative;
	top:1px;
}

/*#tr_top {
	background: orange;
	text-align: center;
}*/

#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
}

#emptyArea {
	margin: auto;
	width: 500px;
	text-align: center;
}
.thead-line1 {
	border-top: 1px solid #ccc;
	border-bottom : 1px solid #ccc;
}
.table{
	border-bottom : 1px solid #ccc;
}
.table>tbody>tr>td{
vertical-align: middle !important;
}

.form-control {
	width : 160px;
}
 .search {
-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background-color:#ffffff;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;

	font-family:Arial;
	font-size:12px;
	font-weight:bold;
	padding:5px 11px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
#makguli_insert{
	width: 5%;
	float: right;
	margin-bottom: 10px;
}
</style>
<script>
	function searchCheck(){
		if($("#topic").val() == null || $("#topic").val() == ""){
			alert("검색 주제를 선택해주세요.");
			return false;
		}
		
		if($("#keyword").val() == null ||$("#keyword").val() == ""){
			alert("키워드를 입력해주세요.");
			return false;
		}
		return true;
	}
	
</script>
</head>


<body>
<jsp:include page="../../menubar.jsp" flush="true" />

	<!-- 게시판 리스트 -->
<div id="page-wrapper">
  <jsp:include page="../admin_sidebar.jsp" flush="true" ></jsp:include>
	<section id="listForm">
		<br/><h2>피드백리스트</h2><br/>

  <div class="container">		
  <table class="table table-sm table-hover">
    <colgroup>
      <col width="10%">  <!-- 번호 -->
      <col width="20%">   <!--  작성자   -->
      <col width="25%"> <!-- 이메일 -->
      <col width="12%"> <!-- 작성일 -->
      <col width="12%"> <!-- 상태 -->
      <col width="20%">  <!-- 수정, 삭제 버튼 -->
    </colgroup>

<%
if(feedbackList != null && listCount > 0){
%>
	<thead class="thead-line1">
			<tr style="font-weight:580; text-align:center" >
				<td>번호</td>
				<td>작성자</td>
				<td>이메일</td>
				<td>작성일</td>
				<td>상태</td>
				<td>&nbsp;</td>
			</tr>
	</thead>
	<tbody>
			<%
		for(int i=0; i<feedbackList.size(); i++){
			
	%>
			<tr align='center'>
				<td><%=number %></td>
				<td><%=feedbackList.get(i).getFeedback_writer() %></td>
				<td><%=feedbackList.get(i).getFeedback_email() %></td>
				<td><%=feedbackList.get(i).getFeedback_date() %></td>
				<td><%=	feedbackList.get(i).getFeedback_status() %></td>
				<td><button class="member_change" 
				onclick="location.href='./getFeedback.ad?feedback_num=<%=feedbackList.get(i).getFeedback_num() %>';">처리</button>
				<button class="member_change" 
				onclick="location.href='./deleteFeedback.ad?feedback_num=<%=feedbackList.get(i).getFeedback_num() %>';">삭제</button></td>
			</tr>
			<%number--;} %>
		</tbody>
		</table>
		</div>
	
	<div class="container">

          <form class="form-inline" action="./AdminMakguliSearch.ad" method="POST" onsubmit="return searchCheck();" >
              <center>
                          <select class="form-control" name="topic" id="topic">
                              <option value="name" >이름</option>
                              <option value="email" >이메일</option>
                              <option value="status" >상태</option>
                          </select>


                         <div class="input-group custom-search-form">
                              <input id="keyword" type="text" name="keyword" class="form-control" placeholder="Search...">
                                  <span class="input-group-btn">
                                      <button class="btn btn-default" type="submit">
                                        <i class="glyphicon glyphicon-search"></i>
                                      </button>
                                  </span>
                          </div>
          </form>
      </div>
	</section>


	<section id="pageList">
	<div class="text-center">
	<ul class="pagination">
		<%if(nowPage<=1){ %>
		<li><a>«</a></li>&nbsp;
		<%}else{ %>
		<li><a href="feedbackList.ad?page=<%=nowPage-1 %>&topic=<%=topic%>&keyword=<%=keyword%>">«</a></li>&nbsp;
		<%} %>
		
		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		<li><a><%=a %></a></li>
		<%}else{ %>
		<li><a href="feedbackList.ad?page=<%=nowPage-1 %>&topic=<%=topic%>&keyword=<%=keyword%>"><%=a %>
		</a></li>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		<li><a>»</a></li>
		<%}else{ %>
		<li><a href="feedbackList.ad?page=<%=nowPage-1 %>&topic=<%=topic%>&keyword=<%=keyword%>">»</a></li>
		<%} %>
		</ul>
	</div>
	</section>
	<%
    }
	else
	{
	%>
	<section id="emptyArea">등록된 피드백이 없습니다.<br/><br/>
	</section>
	<%
	}
%>
</div>
<jsp:include page="../../footer.jsp" flush="true"></jsp:include>
</body>
</html>