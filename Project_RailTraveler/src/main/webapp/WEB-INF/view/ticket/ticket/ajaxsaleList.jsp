<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<table class="table table-hover tb-board"
						style="padding: 0; margin: 0; font-size: 1.025em; text-align: center;">
						
						<thead style="text-align: center">
							<tr>

								<td width="200" colspan="6"
									style="background: #fbfbfb; text-align: left; vertical-align: bottom; font-size: 14px; border-radius: 5px;">
				

									
										<form name="searchForm"
										style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
										
										<select id="condition" name="condition" class="boxTF"
											style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
											<option value="all"
												${condition=="all"?"selected='selected'":""}>모두</option>
											<option value="created"
												${condition=="created"?"selected='selected'":""}>가입 날짜</option>
											<option value="name"
												${condition=="name"?"selected='selected'":""}>티켓이름</option>
											<option value="userId"
												${condition=="userId"?"selected='selected'":""}>사용자 ID</option>										
										</select> 
										
										<c:choose>
										<c:when test="${keyword=='undefined'}">
										<input id="keyword" type="text" name="keyword"
											 value="" class="boxTF"
											style="display: inline-block; height: 100%; width: 58%;">
										</c:when>
										<c:otherwise>
										<input id="keyword" type="text" name="keyword"
											 value="${keyword}" class="boxTF"
											style="display: inline-block; height: 100%; width: 58%;">
										</c:otherwise>
										</c:choose>
										<img src="<%=cp%>/resource/images/magnifying-glass.png"
											class="" onclick="searchSaleList();"
											style="padding: 6px; cursor: pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
									</form>
								</td>								
							</tr>
							<tr>
							<td width="200" colspan="8"
									style="background: #fbfbfb; text-align: left; font-size: 14px; border-radius: 5px;">
								<button class="btn" onclick="menuSelect('monthSearch');">기간별</button>
								<button class="btn" onclick="menuSelect('ticketSearch');">티켓별</button>
								</td>
							</tr>
							
							<tr class="lbo_li lbo_legend lbo_legend_like">
								<th width="50"><span>번호</span></th>
								<th width="120"><span style="padding-left: 10px;">티켓이름</span></th>
								<th width="70"><span>가격</span></th>
								<th width="80"><span>구매날짜</span></th>
								<th width="80"><span>구매자</span></th>

							</tr>
						</thead>
						<tbody style="border-bottom: 2px solid black;">
							<c:forEach var="vo" items="${saleList}">
								<tr>
								<td>${vo.listNum}</td>
								<td>${vo.tName}</td>
								<td>${vo.tprice}</td>
								<td>${vo.created}</td>
								<td>${vo.userId}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
						<tr height="35">
							<td align="center">${dataCount==0?"등록된 게시물이 없습니다.":paging}</td>
						</tr>
					</table>