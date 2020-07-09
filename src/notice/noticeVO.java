package notice;

import java.sql.Date;
import java.sql.Timestamp;

public class noticeVO {
 private int num;
 private String id;
 private String passwd;
 private String title;
 private String content;
 private Timestamp date;
 private int count;

 public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPasswd() {
	return passwd;
}
public void setPasswd(String passwd) {
	this.passwd = passwd;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Timestamp  getDate() {
	return date;
}
public void setDate(Timestamp  date) {
	this.date = date;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}

}
