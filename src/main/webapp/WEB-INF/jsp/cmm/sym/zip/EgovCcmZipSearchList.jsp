<%--
  Class Name : EgovCcmZipSearchList.jsp
  Description : EgovCcmZipSearchList 화면(system)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.04.01   이중호              최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 
    since    : 
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>

<title>우편번호 찾기</title>

<script type="text/javaScript" language="JavaScript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_pageview(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/sym/cmm/EgovCcmZipSearchList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 조회 처리 
 ******************************************************** */
function fn_egov_search_Zip(){
	document.listForm.pageIndex.value = 1;
   	document.listForm.submit();
}
/* ********************************************************
 * 결과 우편번호,주소 반환 
 ******************************************************** */
function fn_egov_return_Zip(zip,addr){
	
	var retVal   = new Object();
	var sZip     = zip;
	var vZip     = zip.substring(0,3)+"-"+zip.substring(3,6);
	var sAddr    = addr.replace("/^\s+|\s+$/g","");
	retVal.sZip  = sZip;
	retVal.vZip  = vZip;
	retVal.sAddr = sAddr;
	
	parent.parent.document.mberManageVO.zip_view.value = retVal.vZip;
	parent.parent.document.mberManageVO.adres.value = retVal.sAddr;
	
	fn_egov_cancel_popup();
}

/* ********************************************************
 * 취소처리
 ******************************************************** */
function fn_egov_cancel_popup() {
	
	parent.parent.fn_egov_modal_remove();
}
//-->
</script>

</head>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

	<form name="listForm" action="<c:url value='/sym/cmm/EgovCcmZipSearchList.do'/>" method="post">
	
	<input name="searchCondition" type="hidden" size="35" value="4" /> 
	
	<div class="wrap">
		<div class="pop_header">
			<h1>우편번호 찾기</h1>
			<button type="button" class="close" onclick="fn_egov_cancel_popup(); return false;">닫기</button>
		</div>
		
		<div class="pop_container">
			<div class="condition2">
				<label for="dong_name" class="lb mr20">동명을 입력하시오.</label>
                <span class="f_search3">
                    <input id="dong_name" class="w_250" name="searchKeyword" type="text" value="${searchVO.searchKeyword}" maxlength="20" title="동명"/>
                    <button type="button" class="btn" onclick="javascript:fn_egov_search_Zip();">조회</button><!-- 조회 -->
                </span>
            </div>

            <!-- 게시판 -->
            <div class="board_list2">
                <table summary="우편번호 건색 결과를 알려주는 테이블입니다.우편번호 및 주소 내용을 담고 있습니다">
                    <colgroup>
                        <col style="width: 110px;">
                        <col style="width: auto;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">우편번호</th>
                            <th scope="col">주소</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
                    	<tr onclick="javascript:fn_egov_return_Zip( '${resultInfo.zip}', '${resultInfo.ctprvnNm} ${resultInfo.signguNm} ${resultInfo.emdNm} ${resultInfo.liBuldNm}');">
                            <td><c:out value='${fn:substring(resultInfo.zip, 0,3)}'/>-<c:out value='${fn:substring(resultInfo.zip, 3,6)}'/></td>
                            <td class="al"><a href="" class="lnk">${resultInfo.ctprvnNm} ${resultInfo.signguNm} ${resultInfo.emdNm} ${resultInfo.liBuldNm} ${resultInfo.lnbrDongHo}</a></td>
                        </tr>
                    	</c:forEach>
                    	
                    </tbody>
                </table>
            </div>

			<!-- 페이징 -->
            <div class="board_list_bot">
                <div class="paging" id="paging_div">
                    <ul>
                        <ui:pagination paginationInfo = "${paginationInfo}" type="renew" jsFunction="fn_egov_pageview" />
                    </ul>
                </div>
            </div>
            <!-- // 페이징 끝 -->
            
            <!--// 게시판 -->
        </div>
    </div>
    
    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
    
</body>
</html>