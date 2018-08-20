package cn.com.ecjtu.exception;

public class OverTimeException extends RuntimeException {
    public OverTimeException() {

    }

    public OverTimeException(String message) {
        super(message);
    }

    public OverTimeException(String message, Throwable cause) {
        super(message, cause);
    }

    public OverTimeException(Throwable cause) {
        super(cause);
    }
}
