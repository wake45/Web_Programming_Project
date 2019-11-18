package classes;

//jsp에서 getter setter용도로 사용할 java클래스입니다.

public class Info {
	private String name;
	private String subject;
	private String day;
	private String time;
	private String classroom;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getClassroom() {
		return classroom;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
}
