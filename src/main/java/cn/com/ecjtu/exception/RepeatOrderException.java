package cn.com.ecjtu.exception;

public class RepeatOrderException extends RuntimeException{
    public RepeatOrderException() {

    }

    public RepeatOrderException(String message) {
        super(message);
    }

    public RepeatOrderException(String message, Throwable cause) {
        super(message, cause);
    }

    public RepeatOrderException(Throwable cause) {
        super(cause);
    }
}

