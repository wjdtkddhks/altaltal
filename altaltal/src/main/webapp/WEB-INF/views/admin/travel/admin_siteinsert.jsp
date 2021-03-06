<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.spring.altaltal.travel.CourseVO"%>
<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		if(session.getAttribute("admin") == null){
			out.print("<script>");
			out.print("alert('관리자만 추가가 가능합니다.')");
			out.print("location.href='./main.me'");
			out.print("</script>");
		}
		
		CourseVO vo =(CourseVO)request.getAttribute("vo");
		
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewpoint" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//cdn.ckeditor.com/4.10.0/basic/ckeditor.js"></script>

<title>관리자_여행장소 추가</title>
<style type="text/css">
#page-wrapper{
	padding-bottom: 180px;
}
.write_section{
 padding: 10px 10px;
}


h3 {
   text-align: center;
   padding-top: 10px;
   padding-bottom: 10px;
}

table {
   margin: auto;
   width: 350px;
}

.td_left {
   width: 150px;
   background: orange;
}

.td_right {
   width: 300px;
   background: skyblue;
}
.form-control {
	width : 100px;
}
.board_view {
margin:auto; 
width:60%;
border-top:1px solid #ccc;
   
border-bottom:1px solid #ccc;
margin-bottom: 5px;
}
.board_view tbody th {
text-align:left;
background:#f7f7f7;
color:#3b3a3a
}
.board_view tbody th.list_tit {
font-size:13px;
color:#000;
letter-spacing:0.1px
}
.board_view tbody .no_line_b th, .board_view tbody .no_line_b td {
border-bottom:none
}
.board_view tbody th, .board_view tbody td {
padding:15px 0 16px 16px;
border-bottom:1px solid #ccc
}
.board_view tbody td.view_text {
border-top:1px solid #ccc; 
border-bottom:1px solid #ccc;
padding:18px 15px 18px 15px;
}
.board_view tbody th.th_file {
padding:0 0 0 15px;
 vertical-align:middle
}
 
 .view_button {
 position: absolute;
 right: 17%;
 }
.button{
 
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
   text-decoration:none !important;
   text-shadow:0px 1px 0px #ffffff;
 }

.button:hover {
   background-color:#f6f6f6;
}
.button:active {
   position:relative;
   top:1px;
}
</style>
</head>
<body>
<jsp:include page="../../menubar.jsp" flush="true" />

   <!-- 게시판 등록 -->
<div id="page-wrapper">
<jsp:include page="../admin_sidebar.jsp" flush="true" ></jsp:include>
          <form action="./siteInsert.ad" method="post" name="boardform" enctype='multipart/form-data' >
          <input type="hidden" name="course_num" value="<%=vo.getCourse_num() %>" />
   <table class="board_view">
      <colgroup>
         <col width="30%">
         <col width="70%"/>
         </colgroup>
         <caption><h3>여행장소 추가</h3></caption>
         <tbody>
         <tr>
             <th scope="row">코스명</th>
             <td><%=vo.getCourse_name() %></td>
         </tr>
         <tr>
            <th scope="row">코스순서</th>
            <td><select class="form-control" name="site_order" >
			                <option value="1">1</option>
			                <option value="2">2</option>
			                <option value="3">3</option>
			                <option value="4">4</option>
			                <option value="5">5</option>
                     </select>
            </td>
         </tr>
         <tr>
            <th scope="row">장소명</th>
            <td><input type="text" id="site_name" name="site_name" /></td>
         </tr>
         <tr>
            <th scope="row">위도</th>
            <td><input type="text" id="site_maplat" name="site_maplat" placeholder=" ex) 37.515942" /></td>
         </tr>
         <tr>
            <th scope="row">경도</th>
            <td><input type="text" id="site_maplng" name="site_maplng" placeholder=" ex) 126.996016" /></td>
         </tr>
         <tr>
            <th scope="row">소개</th>
            <td><textarea id="site_content" name="site_content" cols='80' rows='10' placeholder="장소 소개,,," ></textarea></td>
         </tr>
         <tr>
            <th scope="row">사진파일</th>
            <td><input type="file" id="site_img" name="site_img" /></td>
         </tr>
         </tbody>
   </table>
   <br/>
       <div class="view_button">
       <button type="submit" class="button" >작성</button>&nbsp;&nbsp;
       <button type="button" class="button" onclick="location.href='adminCourse.ad?course_num=<%=vo.getCourse_num()%>'">해당 여행코스</button>
        </div>
   </form>
  </div>
<jsp:include page="../../footer.jsp" flush="true" />
</body>
</html>