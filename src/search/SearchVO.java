package search;

public class SearchVO {
	private	String numOfRows; //한 페이지 결과 수 
	private	String pageNo; //페이지 번호 
	private	String depPlaceId; //출발지 ID
	private	String arrPlaceId; //도착치 ID 
	private	String depPlandTime; //출발일 
	private	String trainGradeCode; //차량종류코드00	//입력변수 (출/도착지기반 열차정보 조회) DB필요 

	private	String traingradename; //차량 종류명 (KTX,무궁화)	//출력변수 -> 고객에게 최종적으로 전달될 값 DB필요 
	private	String depplandtime; //출발시간 
	private	String arrplandtime; // 도착시간 
	private	String depplacename; // 출발지 
	private	String arrplacename; //도착지 
	private	String adultcharge; //운임 
	private	String trainno; //열차번호 
	
	private	String numOfRows2; //시도별 기차역 목록조회 한 페이지 결과 수 
	private	String pageNo2; //시도별 기차역 페이지 번호 

	private	String citycode; //시/도 ID //DB필요 
	private	String cityname; //도시명 //DB필요
	private	String nodeid;	//기차역 ID	//DB필요 
	private	String nodename; 	//기차역명 	//DB 필요 
	
	
	
	public String getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(String numOfRows) {
		this.numOfRows = numOfRows;
	}
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public String getDepPlaceId() {
		return depPlaceId;
	}
	public void setDepPlaceId(String depPlaceId) {
		this.depPlaceId = depPlaceId;
	}
	public String getArrPlaceId() {
		return arrPlaceId;
	}
	public void setArrPlaceId(String arrPlaceId) {
		this.arrPlaceId = arrPlaceId;
	}
	public String getDepPlandTime() {
		return depPlandTime;
	}
	public void setDepPlandTime(String depPlandTime) {
		this.depPlandTime = depPlandTime;
	}
	public String getTrainGradeCode() {
		return trainGradeCode;
	}
	public void setTrainGradeCode(String trainGradeCode) {
		this.trainGradeCode = trainGradeCode;
	}
	public String getTraingradename() {
		return traingradename;
	}
	public void setTraingradename(String traingradename) {
		this.traingradename = traingradename;
	}
	public String getDepplandtime() {
		return depplandtime;
	}
	public void setDepplandtime(String depplandtime) {
		this.depplandtime = depplandtime;
	}
	public String getArrplandtime() {
		return arrplandtime;
	}
	public void setArrplandtime(String arrplandtime) {
		this.arrplandtime = arrplandtime;
	}
	public String getDepplacename() {
		return depplacename;
	}
	public void setDepplacename(String depplacename) {
		this.depplacename = depplacename;
	}
	public String getArrplacename() {
		return arrplacename;
	}
	public void setArrplacename(String arrplacename) {
		this.arrplacename = arrplacename;
	}
	public String getAdultcharge() {
		return adultcharge;
	}
	public void setAdultcharge(String adultcharge) {
		this.adultcharge = adultcharge;
	}
	public String getTrainno() {
		return trainno;
	}
	public void setTrainno(String trainno) {
		this.trainno = trainno;
	}
	public String getNumOfRows2() {
		return numOfRows2;
	}
	public void setNumOfRows2(String numOfRows2) {
		this.numOfRows2 = numOfRows2;
	}
	public String getPageNo2() {
		return pageNo2;
	}
	public void setPageNo2(String pageNo2) {
		this.pageNo2 = pageNo2;
	}
	public String getCitycode() {
		return citycode;
	}
	public void setCitycode(String citycode) {
		this.citycode = citycode;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	public String getNodeid() {
		return nodeid;
	}
	public void setNodeid(String nodeid) {
		this.nodeid = nodeid;
	}
	public String getNodename() {
		return nodename;
	}
	public void setNodename(String nodename) {
		this.nodename = nodename;
	}
	
	
	
	
}

