package exception;

import code.Code;

public class CustomException extends RuntimeException {

	private String code;
	private String msg;

	public CustomException(Code code) {
		super(code.getMessage());
		this.code = code.getCode();
		this.msg = code.getMessage();
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String getMessage() {
		return msg;
	}

	public void setMessage(String message) {
		this.msg = message;
	}

}
