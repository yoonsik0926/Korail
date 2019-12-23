<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr class="tb-row">
					<td width="100" class="tb-title" style="padding-top: 5px; text-align: center;"
						 colspan="2" >혜&nbsp;&nbsp;&nbsp;&nbsp;택</td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title" style="padding-top: 5px;"
						>구&nbsp;&nbsp;&nbsp;&nbsp;분</td>
					<td  style="padding: 5px 1% 5px 10px;">
						<select name="majorLocationNum">
						<option class="boxTF" value="">:: 카테고리 선택 ::</option>
						<c:forEach var="vo" items="${tourCategory}">
							<option class="boxTF" value="${vo.cateNum}" >${vo.cateName}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td class="tb-content"><input type="text" name="subject"
						maxlength="100" class="boxTF" style="padding: 5px 5px;"
						value="${dto.subject}"></td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					<td class="tb-content">
						<textarea name="content" id="content" style="width:95%; height: 100px;">${dto.content}</textarea>
					</td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">시작일</td>
					<td class="tb-content"><input type="text" name="sDate"
						maxlength="100" class="boxTF" style="padding: 5px 5px;" readonly="readonly"
						value="${dto.sDate}"></td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">종료일</td>
					<td class="tb-content"><input type="text" name="eDate"
						maxlength="100" class="boxTF" style="padding: 5px 5px;"
						value="${dto.eDate}"></td>
				</tr>

</table>
</body>
</html>