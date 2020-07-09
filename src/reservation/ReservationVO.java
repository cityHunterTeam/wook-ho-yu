package reservation;

import java.sql.Timestamp;

public class ReservationVO {
	int num;
	String depplacename;
	String arrplacename;
	String traingradename;
	Timestamp depplandtime;
	Timestamp reser_date;
	int adultcharge;
	String seat;
	String reser_email;
	String reser_id;
	int count;
	
	

	
	public ReservationVO(String depplacename, String arrplacename, String traingradename, Timestamp depplandtime,
			int adultcharge) {
		super();
		this.depplacename = depplacename;
		this.arrplacename = arrplacename;
		this.traingradename = traingradename;
		this.depplandtime = depplandtime;
		this.adultcharge = adultcharge;
	}
	
	public ReservationVO() {
		
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public Timestamp getReser_date() {
		return reser_date;
	}
	public void setReser_date(Timestamp reser_date) {
		this.reser_date = reser_date;
	}
	public int getAdultcharge() {
		return adultcharge;
	}
	public void setAdultcharge(int adultcharge) {
		this.adultcharge = adultcharge;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getReser_email() {
		return reser_email;
	}
	public void setReser_email(String reser_email) {
		this.reser_email = reser_email;
	}
	public String getReser_id() {
		return reser_id;
	}
	public void setReser_id(String reser_id) {
		this.reser_id = reser_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	public Timestamp getDepplandtime() {
		return depplandtime;
	}

	public void setDepplandtime(Timestamp depplandtime) {
		this.depplandtime = depplandtime;
	}

	public String getTraingradename() {
		return traingradename;
	}

	public void setTraingradename(String traingradename) {
		this.traingradename = traingradename;
	}

	
}


