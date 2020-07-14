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
	
	public int getSeat_count() {
		return seat_count;
	}

	public void setSeat_count(int seat_count) {
		this.seat_count = seat_count;
	}

	String reser_id;
	int seat_count;
	int trainno; 
	

	
	public ReservationVO(String depplacename, String arrplacename, String traingradename, Timestamp depplandtime,
			int adultcharge,int trainno) {
		super();
		this.depplacename = depplacename;
		this.arrplacename = arrplacename;
		this.traingradename = traingradename;
		this.depplandtime = depplandtime;
		this.adultcharge = adultcharge;
		this.trainno = trainno;
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


	public Timestamp getDepplandtime() {
		return depplandtime;
	}

	public void setDepplandtime(Timestamp depplandtime) {
		this.depplandtime = depplandtime;
	}

	public int getTrainno() {
		return trainno;
	}

	public void setTrainno(int trainno) {
		this.trainno = trainno;
	}

	public String getTraingradename() {
		return traingradename;
	}

	public void setTraingradename(String traingradename) {
		this.traingradename = traingradename;
	}

	
}


