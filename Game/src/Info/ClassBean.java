package Info;

public class ClassBean {
	private int class_id;
	private String class_department;
	private int class_score;
	private String class_name;
	
	public void setClass_id(int class_id){
		this.class_id = class_id;
	}
	public int getClass_id(){
		return class_id;
	}
	
	public void setClass_score(int class_score){
		this.class_score = class_score;
	}
	public int getClass_score(){
		return class_score;
	}
	
	public void setClass_name(String class_name){
		this.class_name = class_name;
	}
	public String getClass_name(){
		return class_name;
	}
	public void setClass_department(String class_department) {
		this.class_department = class_department;
	}
	public String getClass_department() {
		return class_department;
	}
	

}
