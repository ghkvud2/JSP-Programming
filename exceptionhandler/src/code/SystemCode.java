package code;

public enum SystemCode implements Code{

	DB_ERROR("9999", "DB Error"), 
	FILE_WRITE_ERROR("9999", "File Write Error"), 
	FILE_READ_ERROR("9999", "File Read Error");

	private String code;
	private String message;

	private SystemCode(String code, String message) {
		this.code = code;
		this.message = message;
	}

	@Override
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
