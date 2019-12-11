<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="body-content-container">
     <div class="body-title">
         <h3>공지사항</h3>
     </div>
     
     <div id="sir_lbo" class="sir_lbo" style="padding: 0;
    margin: 0;
    font-size: 1.025em;">
      
	<table class="table table-hover" style="padding: 0;
    margin: 0;
    font-size: 1.025em;">
            <thead>
              <tr class="lbo_li lbo_legend lbo_legend_like">
                <th width="60" style="    padding-left: 1.5%;">번호</th>
                <th><span style="padding-left: 0;">제목</span></th>
                <th width="120"><span>작성자</span></th>
                <th width="100"><span>작성일</span></th>
                <th width="80"><span>조회수</span></th>
              </tr>
            </thead>
            <tbody>
            
              <tr class="lbo_li lbo_notice li_bg0 lbo_like">
                <td>1</td>
                <td style="text-align: left;">제목입니다1111111</td>
                <td>관리자</td>
                <td>2018-10-23</td>
                <td>123</td>
              </tr>
              
              
              <tr>
                <td>2</td>
                <td style="text-align: left;">제목입니다22222222</td>
                <td>겨레리</td>
                <td>2018-10-23</td>
                <td>1</td>
              </tr>
              <tr>
                <td>3</td>
                <td style="text-align: left;">제목입니다333333333333</td>
                <td>겨레리</td>
                <td>2018-10-23</td>
                <td>22</td>
              </tr>
            </tbody>
          </table>








     </div>
</div>
