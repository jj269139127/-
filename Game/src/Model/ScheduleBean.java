package Model;

public class ScheduleBean {
	int Schedule_id;
	public int getSchedule_id() {
		return Schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		Schedule_id = schedule_id;
	}
	public String getSchedule_address() {
		return Schedule_address;
	}
	public void setSchedule_address(String schedule_address) {
		Schedule_address = schedule_address;
	}
	public String getSchedule_starttime() {
		return Schedule_starttime;
	}
	public void setSchedule_starttime(String schedule_starttime) {
		Schedule_starttime = schedule_starttime;
	}
	public String getSchedule_endtime() {
		return Schedule_endtime;
	}
	public void setSchedule_endtime(String schedule_endtime) {
		Schedule_endtime = schedule_endtime;
	}
	public int getProject_id() {
		return Project_id;
	}
	public void setProject_id(int project_id) {
		Project_id = project_id;
	}
	String Schedule_address;
	String Schedule_starttime;
	String Schedule_endtime;
	int Project_id;

}
