<%--
  Class Name : EgovQustnrRespondManageDetail.jsp
  Description : 응답자정보 상세보기
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
   
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images_old/egovframework/com/uss/olp/qrm/"/>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>샘플 포털 > 포털서비스관리 > 설문관리 > 설문응답결과</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>

<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrRespondManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrRespondManage(){
	location.href = "<c:url value='/uss/olp/qrm/EgovQustnrRespondManageList.do'/>";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_QustnrRespondManage(){
	var vFrom = document.QustnrRespondManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/olp/qrm/EgovQustnrRespondManageModify.do'/>";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_QustnrRespondManage(){
	var vFrom = document.QustnrRespondManageForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/olp/qrm/EgovQustnrRespondManageDetail.do'/>";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrRespondManage();">

    <!-- Skip navigation -->
    <a href="#contents" class="skip_navi">본문 바로가기</a>

    <div class="wrap">
        <!-- header start -->
	    <c:import url="/sym/mms/EgovHeader.do" />
	    <!-- //header end -->

        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <!-- Left menu -->
	                    <c:import url="/sym/mms/EgovMenuLeft.do" />
	                    <!--// Left menu -->
        
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 <!-- Location -->
                                <div class="location">
                                    <ul>
                                        <li><a class="home" href="">Home</a></li>
                                        <li><a href="">포털서비스관리</a></li>
                                        <li><a href="">설문관리</a></li>
                                        <li>설문응답결과</li>
                                    </ul>
                                </div>
                                <!--// Location -->

                                <h1 class="tit_1">포털서비스관리</h1>

                                <p class="txt_1">포털시스템에서 제공되는 서비스들에 대한 컨텐츠를 관리합니다.</p>

                                <h2 class="tit_2">설문관리</h2>

                                <h3 class="tit_3">설문응답결과</h3>

                                <div class="board_view2">
                                
                                	<form name="QustnrRespondManageForm" action="<c:url value='/uss/olp/qim/EgovQustnrItemManageModify.do'/>" method="post">
                                	
                                    <table>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <span class="min">설문관리정보</span>
                                            </td>
                                            <td>
                                            	<c:out value="${fn:replace(resultList[0].qestnrSj , crlf , '<br/>')}" escapeXml="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <span class="min">성별</span>
                                            </td>
                                            <td>
                                            	<c:forEach items="${comCode014}" var="comCodeList" varStatus="status">
													<c:if test="${comCodeList.code eq resultList[0].sexdstnCode}">
														<c:out value="${fn:replace(comCodeList.codeNm , crlf , '<br/>')}" escapeXml="false" />
													</c:if>
												</c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <span class="min">직업</span>
                                            </td>
                                            <td>
                                            	<c:forEach items="${comCode034}" var="comCodeList" varStatus="status">
													<c:if test="${comCodeList.code eq resultList[0].occpTyCode}">
														<c:out value="${fn:replace(comCodeList.codeNm , crlf , '<br/>')}" escapeXml="false" />
													</c:if>
												</c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <span class="min">생년월일</span>
                                            </td>
                                            <td>
                                                ${fn:substring(resultList[0].brthdy, 0, 4)}-
                                                ${fn:substring(resultList[0].brthdy, 4, 6)}-
                                                ${fn:substring(resultList[0].brthdy, 6, 8)}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <span class="min">응답자명</span>
                                            </td>
                                            <td>
                                            	<c:out value="${fn:replace(resultList[0].respondNm , crlf , '<br/>')}" escapeXml="false" />
                                            </td>
                                        </tr> 
                                        
                                        <tr>
                                            <td class="lb">
                                                <span class="min">전화번호</span>
                                            </td>
                                            <td>
                                            	<c:out value="${fn:replace(resultList[0].areaNo , crlf , '<br/>')}" escapeXml="false" />-
                                            	<c:out value="${fn:replace(resultList[0].middleTelno , crlf , '<br/>')}" escapeXml="false" />-
                                            	<c:out value="${fn:replace(resultList[0].endTelno , crlf , '<br/>')}" escapeXml="false" />
                                            </td>
                                        </tr> 
                                        
                                                                             
                                    </table>
                                    
                                    <input name="qestnrRespondId" type="hidden" value="<c:out value="${resultList[0].qestnrRespondId}" />">
                                    <input name="cmd" type="hidden" value="">
                                    <div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
                                    </form>
                                    
                                </div>

								<!-- 목록/저장버튼  시작-->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <form name="formDelete" action="<c:url value='/uss/olp/qrm/EgovQustnrRespondManageDetail.do'/>" method="post">
                                        	<a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="fn_egov_delete_QustnrRespondManage(); return false;"><spring:message code="button.delete" /></a><!-- 삭제 -->
                                        	<input name="qestnrRespondId" type="hidden" value="${resultList[0].qestnrRespondId}">
                                        	<input name="cmd" type="hidden" value="del">
                                        </form>
                                    </div>

                                    <div class="right_col btn1">
                                        <form name="formUpdt" action="<c:url value='/uss/olp/qrm/EgovQustnrRespondManageModify.do'/>" method="post" style="display: inline;">
                                        	<a href="#LINK" class="btn btn_blue_46 w_100" onclick="fn_egov_modify_QustnrRespondManage(); return false;"><spring:message code="button.update" /></a><!-- 수정 -->
                                        	<input name="qestnrRespondId" type="hidden" value="${resultList[0].qestnrRespondId}">
                                        </form>
                                        <form name="formList" action="<c:url value='/uss/olp/qrm/EgovQustnrRespondManageList.do'/>" method="post" style="display: inline; padding-left: 10px;">
                                        	<a href="#LINK" class="btn btn_blue_46 w_100" onclick="fn_egov_list_QustnrRespondManage(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
                                        </form>
                                    </div>
                                </div>
                                <!-- 목록/저장버튼  끝-->
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer 시작 -->
	    <c:import url="/sym/mms/EgovFooter.do" />
	    <!-- //footer 끝 -->
    </div>
    
</body>
</html>