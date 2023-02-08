<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<link rel="stylesheet" href="/project_catmoa/resources/assets/css/donate-detail.css">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
    <meta name="keywords" content="" />
	<title>CatMoa Home</title>
	<link rel="Stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
	<jsp:include page="/WEB-INF/views/module/common-css.jsp" />
	
</head>
<body>
<!--<div class="se-pre-con"></div>-->
<div class="theme-layout">
	
	<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />
	
	<!-- ======= header ======= -->
	<jsp:include page="/WEB-INF/views/module/topbar.jsp" />
	<!-- End header -->	
		
	<section>
		<div class="gap gray-bg">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="row" id="page-contents">
							<jsp:include page="/WEB-INF/views/module/left-sidebar.jsp" />
							
							<div class="col-lg-6">
							
									<h1>후원참여신청서</h1>
    <div class="main">
        <div class="top">
            <div class="title">
                <h2>길냥이 후원</h2>
                <p>길고양이와 더불어 살아갈 수 있는 문화를 만들어가고있습니다. </p>
            </div>
            <p>후원해주시는 기부금은 길고양이 사료, TNR, 치료비등의 목적으로 사용됩니다.</p>
            <img src="/project_catmoa/resources/assets/images/cat.svg">
            <p>* CatMoa는 예비 사회적 기업으로 운영되고 있어 기부금영수증 발행이 어렵습니다.</p>
                
        </div>
        <div class="text">
            변경 및 취소 등 후원 관련 문의는 <strong>catmoa@naver.com</strong>으로<br>성함, 연락처와 함께 문의사항을 기재해주세요.
        </div>
    </div>
    <section class="info_company">
        <h2>※ 기관정보</h2>
        <div>
            <dl>
                <dt>기관명</dt>
                <dd>CatMoa</dd>
            </dl>
            <dl>
                <dt>기관정보</dt>
                <dd>010-8756-8369</dd>
            </dl>
        </div>
    </section> 
    
    <form class="donate-detail-info" action="donateInfo" method="post">
    
    <section class="info_pesonal">
        <h2>※ 회원정보</h2>
        <div class="formBox">
        
            	<label for="donateId" class="donateId">아이디
            		${ loginuser.userId }
		                <input type="hidden" name="userId" value="${ loginuser.userId }">
            	</label>
                <label for="name" class="name">회원명<span>*필수항목</span></label>
                <input id="name" name = "name" type="text" placeholder="예:홍길동" required="required">
          
                <label for="tel">휴대전화<span>*필수항목</span></label>
                <input type="tel" id="tel" name="tel" class="tel1" list="dataList_id" placeholder="예:010">
                <datalist id="dataList_id">
                    <option value="010"></option>
                    <option value="011"></option>
                    <option value="016"></option>
                    <option value="017"></option>
                    <option value="018"></option>
                    <option value="019"></option>
                </datalist>
                <input id="tel" name = "tel" class="tel2" type="text" placeholder="예:1234" required="required">
                <input id="tel" name = "tel" type="text" placeholder="예:5678" required="required">
        
          <!--   <form>
                <label for="email" class="email">이메일<span>*필수항목</span></label>
                <input id="email" name = "email" type="text" placeholder="예:catmoa@naver.com" required="required">
            </form> -->

                <label for="donate_adress" class="donate_adress">주소<span>*필수항목</span></label>
                <input id="donatePostcodeAdress" type="text" placeholder="우편번호" required="required">
                <input type="button" onclick="donateExecDaumpostcodeAddress()" value="우편번호 찾기"> <br>
                <input id="donateRoadAdress" type="text" placeholder="예: 서울시 서초구 효령로 2길 10" required="required">
                <input id="donateDetailAdress" type="text" placeholder="상세주소를 입력하세요.(00동 00호)" required="required">
                <input id="donateExtraAddress" type="text" placeholder="참고항목">

                <label for="money" class="money">후원금액<span>*필수항목</span></label>
                <input id="money" name = "donationSum" type="text" placeholder="예:10000" required="required">

            
        </div>
    </section>
        
    <section class="tabs">
        <h2>※ 결제정보</h2>
        <ul class="tab_menu">
            <li><a class="deposit-without-bankbookb" href="#">무통장 입금</a></li>
            <li><a class="account-transfer" href="#">계좌이체</a></li>
            <li><a class="kakao-pay" href="#">카카오페이</a></li>
            <li><a class="card" href="#">신용카드</a></li>
        </ul>
        
       <!--  <div class="card-detaiil">
           <input type="bank" id="card-company" class="card-company" list="cardList_id" placeholder="선택">
                <datalist id="cardlist_id">
                    <option value="신한카드"></option>
                    <option value="KB국민카드"></option>
                    <option value="비씨카드"></option>
                    <option value="삼성카드"></option>
                    <option value="현대카드"></option>
                    <option value="NH농협카드"></option>
                    <option value="우리카드"></option>
                    <option value="하나SK카드"></option>
                    <option value="롯데카드"></option>
                    <option value="외환카드"></option>
                    <option value="시티카드"></option>
                    <option value="기타카드"></option>
                </datalist>
        </div> -->
        
        <!-- 결제창 -->
	
    	<!-- 결제창 끝 -->


		<!-- 후원하기 -->

	<!-- Button trigger modal -->
		<button  type="submit" id="writemoney" class="btn btn-primary" class="w-100 btn btn-warning btn-lg">
		  결제하기
		</button>
		
		</form>
	    
	   
	
		 <!-- Modal -->
		<!-- <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
		      </div>
		      <div class="modal-body">
		        <p>보내주신 사랑 소중하게 사용하겠습니다.</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" type="submit" id="myM">닫기</button>
		        <button type="button" class="btn btn-primary">확인했습니다.</button>
		      </div>
		    </div>
		  </div>
		</div> -->
		
		<!-- 후원하기 끝 -->
<!-- _click(nmp.front.order.order_sheet.account()) _stopDefault _doPayButton -->
	<div class="contlist">

        </div>
    </section>

    
    <section>

    </section>
								</div>
							<jsp:include page="/WEB-INF/views/module/right-sidebar.jsp" />
						</div>	
					</div>
				</div>
			</div>
		</div>	
	</section>

	<!-- ======= header ======= -->
	<jsp:include page="/WEB-INF/views/module/footer.jsp" />
	<!-- End header -->	

</div>

<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/project_catmoa/resources/assets/js/donate-detail.js"></script>
<script src="/project_catmoa/resources/assets/js/donate-modal.js"></script> 

  <!-- iamport.payment.js -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
<script type="text/javascript">


    
   
});
</script>


</body>


</html>

























