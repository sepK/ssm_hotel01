package cn.com.ecjtu.exception;

public class ExtraException extends RuntimeException{
    public ExtraException() {

    }

    public ExtraException(String message) {
        super(message);
    }

    public ExtraException(String message, Throwable cause) {
        super(message, cause);
    }

    public ExtraException(Throwable cause) {
        super(cause);
    }
}
