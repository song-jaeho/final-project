package kr.co.ducktube.vo.form;

public class UserSearchConditions {
	
	private String condition;
	private String value;
	
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public UserSearchConditions(String condition, String value) {
		super();
		this.condition = condition;
		this.value = value;
	}
	public UserSearchConditions() {
		super();
	}
}
