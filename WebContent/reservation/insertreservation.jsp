<%@page import="bean.UserDAO"%>
<%@page import="bean.UserDTO"%>
<%@page import="bean.ReservationDTO"%>
<%@page import="bean.ReservationDAO"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="bean.WorkerDAO"%>
<%@page import="bean.WorkerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <script src="../js/main.js"></script>

<!-- 사업자 세션 mid  -->
<!-- 인력 wnum  -->

<!-- resnum 알고리즘 생성
	regnum 세션id로 생성
	wnum 그대로
	resdate 기간 알고리즘 start end
	type 그대로
	etc 그대로
	state 그대로
 -->
<%

	String mid = request.getParameter("mid");
	UserDTO userDTO = new UserDTO();
	userDTO.setMid(mid);
	UserDAO userDAO = new UserDAO();
	userDAO.check(userDTO);
	String regNum = userDTO.getRegNum();
	
	/* 넘겨받은 인력번호(wnum)로 인력 id 불러오기 */
	int wnum = Integer.parseInt(request.getParameter("wnum"));
	WorkerDTO workerDTO = new WorkerDTO();
	workerDTO.setWnum(wnum);
	WorkerDAO workerDAO = new WorkerDAO();
	workerDAO.select(workerDTO);
	workerDTO.getMid();
	
	String type = request.getParameter("type");
	String etc = request.getParameter("etc");
	String state = request.getParameter("state");
	
	/* 예약날짜 입력 알고리즘(기간) */
	DateTimeFormatter fomatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	LocalDate start = LocalDate.parse(request.getParameter("start"));
	LocalDate end = LocalDate.parse(request.getParameter("end"));
	long index = ChronoUnit.DAYS.between(start, end);
	
	ReservationDTO reservationDTO = new ReservationDTO();
	ReservationDAO reservationDAO = new ReservationDAO();
	
	reservationDAO.firstRow(reservationDTO);
	int resgroup = reservationDTO.getResgroup() + 1;
	
	
	/* 예약번호 알고리즘(인력mid+현재날짜+고객mid) */
	for(int i=0; i<=index;i++){
		String resnum = workerDTO.getMid() + start.plusDays(i) + mid;
		reservationDTO.setResnum(resnum);
		reservationDTO.setRegnum(regNum);
		reservationDTO.setWnum(wnum);
		reservationDTO.setResdate(start.plusDays(i)+"");
		reservationDTO.setType(type);
		reservationDTO.setEtc(etc);
		reservationDTO.setState(state);
		reservationDTO.setResgroup(resgroup);		
		reservationDAO.insert(reservationDTO);
	}
	
%>

	<h1>예약요청이 완료되었습니다. 감사합니다.</h1>
	<button type="button" onclick = "main()">홈으로</button>
