<%--
  Class Name : EgovQustnrRespondInfoRegist.jsp
  Description : 설문조사 등록 페이지
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
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images_old/egovframework/com/uss/olp/qri/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>샘플 포털 > 포털서비스관리 > 설문관리 > 설문지</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrRespondInfoVO" staticJavascript="false" xhtml="true" cdata="false"/>

	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/jqueryui.css' />">
	<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
	<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>

<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrRespondInfo(){

	//document.getElementById("qestnrBeginDe").value = "2008-01-01";
	//document.getElementById("qestnrEndDe").value = "2008-01-30";
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrRespondInfo(){
	location.href = "<c:url value='/uss/olp/qri/EgovQustnrRespondInfoList.do'/>";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrRespondInfo(){
	var varFrom = document.getElementById("qustnrRespondInfoVO");

	if(confirm("<spring:message code="common.save.msg" />")){

		varFrom.action =  "<c:url value='/uss/olp/qri/EgovQustnrRespondInfoRegist.do'/>";
		
		if(varFrom.qestnrCn.value == "" ||
				varFrom.qestnrTmplatId.value == "" ||
				varFrom.qestnrId.value == ""  
				){
			alert("설문지정보를  입력해주세요!");
			varFrom.qestnrCn.focus();
			return;
			
		}

		if(varFrom.qestnrQesitmCn.value == "" ||
				varFrom.qestnrQesitmId.value == "" 
				){
			alert("설문문항정보를  입력해주세요!");
			varFrom.qestnrQesitmCn.focus();
			return;
			
		}

		if(!validateQustnrRespondInfoVO(varFrom)){ 			
			return;
		}else{
			varFrom.submit();
		} 
	}
}

/* ********************************************************
 * 설문지정보 팝업창열기
 ******************************************************** */
 function fn_egov_QustnrManageListPopup_QustnrItemManage(){
	
	var sParam = "";
	sParam = sParam + "searchCondition=QESTNR_ID";
	sParam = sParam + "&searchKeyword=" + document.getElementById("qestnrId").value;
 	
 	var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px; " src="' + "<c:url value='/uss/olp/qmc/EgovQustnrManageListPopup.do'/>?" + sParam + '" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 1124,
        height: 800,
        title: "설문관리정보 팝업"
	});
	$dialog.dialog('open');
 	
 }
 /* ********************************************************
  * 설문지문항정보 팝업창열기
  ******************************************************** */
  function fn_egov_QustnrQestnManageListPopup_QustnrItemManage(){

	var sParam = "";
	sParam = sParam + "searchCondition=QESTNR_ID";
	sParam = sParam + "&searchKeyword=" + document.getElementById("qestnrId").value;
  		
	var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px; " src="' + "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageListPopup.do'/>?" + sParam + '" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 1024,
        height: 800,
        title: "설문문항정보 팝업"
	});
	$dialog.dialog('open');
  	
  }
/* ********************************************************
 * 설문항목정보 팝업창열기
 ******************************************************** */
function fn_egov_QustnrItemManageListPopup_QustnrItemManage(){

	var sParam = "";
	sParam = sParam + "searchCondition=QUSTNR_QESITM_ID";
	sParam = sParam + "&searchKeyword=" + document.getElementById("qestnrQesitmId").value;

  	window.showModalDialog("<c:url value='/uss/olp/qim/EgovQustnrItemManageListPopup.do'/>?" + sParam, self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	
}

/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrRespondInfo()">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

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
                                        <li>설문지</li>
                                    </ul>
                                </div>
                                <!--// Location -->

								<form:form modelAttribute="qustnrRespondInfoVO" name="qustnrRespondInfoVO" action="" method="post">

                                <h1 class="tit_1">포털서비스관리</h1>

                                <p class="txt_1">포털시스템에서 제공되는 서비스들에 대한 컨텐츠를 관리합니다.</p>

                                <h2 class="tit_2">설문관리</h2>

                                <h3 class="tit_3">설문지</h3>

                                <div class="board_view2">
                                    <table summary="이 표는 설문조사 대상 정보를 제공하며, 설문관리정보, 설문문항정보, 설문유형, 성문항목정보, 응답자답변내용, 기타답변내용, 응답자명 정보로 구성되어 있습니다 .">
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="qestnrCn">설문관리정보</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="f_search2 w_500">
                                                    <input type="text" name="qestnrCn" id="qestnrCn" title="설문관리정보 입력" value="" maxlength="4000">
                                                    <button type="button" class="btn" onClick="fn_egov_QustnrManageListPopup_QustnrItemManage()"></button>
                                                    <input name="qestnrId" id="qestnrId" type="hidden" value="">
													<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="">
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="qestnrQesitmCn">설문문항정보</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="f_search2 w_500">
                                                    <input type="text" name="qestnrQesitmCn" id="qestnrQesitmCn" title="설문문항정보 입력" value="" maxlength="4000">
                                                    <button type="button" class="btn" onClick="fn_egov_QustnrQestnManageListPopup_QustnrItemManage()"></button>
                                                    <input name="qestnrQesitmId" id="qestnrQesitmId" type="hidden" value="">
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <span class="min">설문유형</span>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <div id="divQestnTyCode"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="qustnrIemCn">설문항목정보</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="f_search2 w_500">
                                                    <input type="text" name="qustnrIemCn" id="qustnrIemCn" title="설문항목정보 입력" value="" maxlength="4000">
                                                    <button type="button" class="btn" onClick="fn_egov_QustnrItemManageListPopup_QustnrItemManage()"></button>
                                                    <input name="qustnrIemId" id="qustnrIemId" type="hidden" value="">
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="rescts">응답자답변내용<br>(주관식)</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <textarea name="respondAnswerCn" id="rescts" cols="30" rows="10" class="f_txtar w_full h_80" title="응답자답변내용 입력"></textarea>
                                                <div><form:errors path="respondAnswerCn" cssClass="error" /></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="etc">기타답변내용</label>
                                            </td>
                                            <td>
                                                <textarea name="etcAnswerCn" id="etc" cols="30" rows="10" class="f_txtar w_full h_80" title="기타답변내용 입력"></textarea>
                                                <div><form:errors path="etcAnswerCn" cssClass="error" /></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="resnm">응답자명</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input class="f_txt" type="text" id="resnm" name="respondNm" value="" maxlength="50">
                                                <div><form:errors path="respondNm" cssClass="error" /></div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  시작-->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="fn_egov_save_QustnrRespondInfo(document.forms[0]); return false;">저장</a><!-- 저장 -->
                                        <a href="<c:url value='/uss/olp/qri/EgovQustnrRespondInfoList.do'/>" class="btn btn_blue_46 w_100">목록</a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- 목록/저장버튼  끝-->
                                
                                <input name="cmd" type="hidden" value="<c:out value='save'/>">
								</form:form>
                                
                                <!--// 게시판 -->
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