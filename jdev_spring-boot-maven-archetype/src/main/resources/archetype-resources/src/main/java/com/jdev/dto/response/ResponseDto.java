package com.jdev.dto.response;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
@Data
public class ResponseDto<T> {

    private T response;
    private Error error;

    public static final ResponseDto<String> SUCCESS_RESPONSE = ResponseDto.success("1");

    public static <T> ResponseDto<T> success(final T response) {
        final ResponseDto<T> responseDto = new ResponseDto<>();
        responseDto.setResponse(response);
        return responseDto;
    }

    public static ResponseDto<String> error(String errorMessage) {
        final ResponseDto<String> responseDto = new ResponseDto<>();
        ResponseDto<String>.Error error = responseDto.new Error();
        error.errorMessage = errorMessage;
        responseDto.setError(error);
        return responseDto;
    }

    public static ResponseDto<String> error(ErrorType errorType) {
        final ResponseDto<String> responseDto = new ResponseDto<>();
        ResponseDto<String>.Error error = responseDto.new Error();
        error.translationCode = errorType.getTranslationCode();
        responseDto.setError(error);
        return responseDto;
    }

    @Data
    public class Error {
        private ErrorType errorType;
        private String translationCode;
        private String errorMessage;
    }

}
