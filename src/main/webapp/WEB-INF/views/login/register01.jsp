<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form action="/member/join/signup.do" method="post" id="agreeForm" name="agreeForm" autocomplete="off">
	<input type="hidden" id="agree4" name="agree4" value="Y">
	<section id="contents" class="content">
	
		<!-- title-box02 -->
		<div class="title-box02">
			<h2 class="page-title02">약관 동의</h2>
			<p class="txt fc04 mt25">이용약관과 개인정보처리방침에 대한 안내를 읽고 동의 해주세요.</p>
		</div>
		<!-- //title-box02 -->

		<div class="agree_info is-line mt80">
			<div class="list-sort">
				<p class="chk-type01">
					<input type="checkbox" id="c01" name="c01">
					<label for="c01"><span></span>모든 약관을 확인하고 전체 동의함</label>
				</p>
			</div>

			<section>
				<h3 class="h3-title01 mt60">(필수) 아웃백 회원 약관</h3>
				<!-- 20210726 수정:s (웹접근성) -->
				<iframe src="/main.do?menuIdx=153" frameborder="0" class="agree-iframe mt20" title="(필수) 아웃백 회원 약관 안내문"></iframe>
				<!-- //20210726 수정:e -->

				<!-- radio-type01 -->
				<div class="mt15 al-r">
					<p class="radio-type01">
						<input id="agree1_1" name="agree1" checked="true" type="radio" value="N"><label for="agree1_1"><span></span>동의하지 않음</label>
					</p>
					<p class="radio-type01">
						<input id="agree1_2" name="agree1" type="radio" value="Y">
						<label for="agree1_2"><span></span>동의함</label>
					</p>
				</div>
				<!-- //radio-type01 -->
			</section>

			<section>
				<h3 class="h3-title01 mt60">(필수) 딜리버리 서비스 이용약관</h3>

				<iframe src="/main.do?menuIdx=290" frameborder="0" class="agree-iframe mt20"></iframe>

				<!-- radio-type01 -->
				<div class="mt15 al-r">
					<p class="radio-type01">
						<input id="agree5_1" name="agree5" checked="true" type="radio" value="N"><label for="agree5_1"><span></span>동의하지 않음</label>
					</p>
					<p class="radio-type01">
						<input id="agree5_2" name="agree5" type="radio" value="Y"><label for="agree5_2"><span></span>동의함</label>
					</p>
				</div>
				<!-- //radio-type01 -->
			</section>

			<section>
				<h3 class="h3-title01 mt60">(필수) 개인정보 수집 및 이용에 대한 동의</h3>
				<!-- text-border-list -->
				<table class="text-border-list mt20">
					<caption>입력 테이블</caption>
					<colgroup>
						<col width="33%">
						<col width="33%">
						<col width="*">
					</colgroup>
					<!-- 20210726 수정:s (웹접근성) -->
					<thead>
						<tr>
							<th scope="col">목적</th>
							<th scope="col">항목</th>
							<th scope="col">보유기간</th>
						</tr>
					</thead>
					<!-- //20210726 수정:e -->
					<tbody>
						<tr>
							<td>이용자 식별 및<br> 본인 여부 확인
							</td>
							<td>성명, 생년월일, 성별, 아이디, 비밀번호, 포인트 비밀번호,<br> 휴대전화 번호,
								이메일, 부메랑 카드 번호, CI, DI
							</td>
							<td rowspan="4">회원 탈퇴 후 3개월</td>
						</tr>
						<tr>
							<td>불만 처리 등 민원 처리</td>
							<td>성명, 아이디, 휴대전화 번호, 서비스 이용기록,<br> 이메일, 부메랑 카드 번호
							</td>
						</tr>
						<tr>
							<td>서비스 제공에 관한 계약 이행<br>및 서비스 제공에 따른 콘텐츠 제공
							</td>
							<td>성명, 아이디, 휴대전화 번호, 서비스 이용 기록,<br> 이메일, 주소, 부메랑 카드 번호
							</td>
						</tr>
						<tr>
							<td>불량회원의 부정 이용 방지와<br>비인가 사용 방지
							</td>
							<td>IP, 서비스 이용 기록, 접속 로그, 쿠키</td>
						</tr>
						<tr>
							<td>캥거루페이 간편결제 이용 시 <br>(결제수단 인증 및 등록/충전/결제/환불)
							</td>
							<td style="height: 100px;">본인인증 정보(이름, 생년월일, 휴대전화번호, 성별,
								내/외국인 여부, CI), 카드 정보(카드번호, 카드비밀번호 앞 2자리, 유효기간(월/년도), CVC), 캥거루페이
								결제수단 등록 정보(마스킹된 카드번호, 캥거루페이 결제 비밀번호)</td>
							<td>카드사에 전달 후 별도 저장하지 않음</td>
						</tr>
					</tbody>
				</table>
				<!-- //text-border-list -->
				<!-- radio-type01 -->
				<div class="mt15 al-r">
					<p class="radio-type01">
						<input id="agree2_1" name="agree2" checked="true" type="radio" value="N"><label for="agree2_1"><span></span>동의하지 않음</label>
					</p>
					<p class="radio-type01">
						<input id="agree2_2" name="agree2" type="radio" value="Y">
						<label for="agree2_2"><span></span>동의함</label>
					</p>
				</div>
				<!-- //radio-type01 -->
			</section>

			<section>
				<h3 class="h3-title01 mt60">(필수) 개인정보 처리 위탁에 대한 동의</h3>
				<!-- text-border-list -->
				<table class="text-border-list mt20">
					<caption>입력 테이블</caption>
					<colgroup>
						<col width="50%">
						<col width="50%">
					</colgroup>
					<!-- 20210726 수정:s (웹접근성) -->
					<thead>
						<tr>
							<th scope="col">수탁자</th>
							<th scope="col">목적</th>
						</tr>
					</thead>
					<!-- //20210726 수정:e -->
					<tbody>
						<tr>
							<td>㈜ 플립 커뮤니케이션즈</td>
							<td>신규 서비스 개발, 웹사이트 및 시스템 관리, 마케팅 및 이벤트 정보 전달</td>
						</tr>
						<tr>
							<td>㈜ 밀버스</td>
							<td>멤버쉽 회원 관리 및 서비스 기획</td>
						</tr>
						<tr>
							<td>㈜ 드림애드</td>
							<td>멤버십 회원 대상 이벤트 경품 발송</td>
						</tr>
						<tr>
							<td>NICE평가정보 ㈜</td>
							<td>아이핀 본인확인 서비스 제공</td>
						</tr>
						<tr>
							<td>㈜ 베스핀글로벌</td>
							<td>AWS 인프라 유지보수 업무(장애 대응 서비스)</td>
						</tr>
						<tr>
							<td>㈜ 한국페이즈서비스</td>
							<td>결제대행</td>
						</tr>
						<tr>
							<td>Amazon Web Services, Inc</td>
							<td>서비스 이용 기록 또는 수집된 개인정보 보관(국내 이전)</td>
						</tr>
						<tr>
							<td>㈜트랜스코스모스코리아</td>
							<td>딜리버리 서비스 이용 기록 관리</td>
						</tr>
						<tr>
							<td>㈜푸드테크</td>
							<td>주문정보 중개</td>
						</tr>
						<tr>
							<td>한국정보통신㈜</td>
							<td>서비스 이용 기록 또는 수집된 개인정보 보관, 캥거루페이 결제 수단(카드) <br>등록,
								신용카드 및 캥거루페이를 통한 결제 처리 및 상담, 민원 처리
							</td>
						</tr>
					</tbody>
				</table>
				<!-- //text-border-list -->
				<!-- radio-type01 -->
				<div class="mt15 al-r">
					<p class="radio-type01">
						<input id="agree3_1" name="agree3" checked="true" type="radio" value="N"><label for="agree3_1"><span></span>동의하지 않음</label>
					</p>
					<p class="radio-type01">
						<input id="agree3_2" name="agree3" type="radio" value="Y">
						<label for="agree3_2"><span></span>동의함</label>
					</p>
				</div>
				<!-- //radio-type01 -->
			</section>
			<!-- btn-box -->
			<div class="btn-box al-c">
				<div class="one-btn">
					<a href="#" class="btn-01 type-04">확인</a>
				</div>
			</div>
			<!-- //btn-box -->

		</div>

	</section>
</form>