package code;

public enum ValidationCode implements Code{

	LOC_GOV_CD_ERROR("9999", "자치단체코드 오류");

	private String code;
	private String message;

	private ValidationCode(String code, String message) {
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
