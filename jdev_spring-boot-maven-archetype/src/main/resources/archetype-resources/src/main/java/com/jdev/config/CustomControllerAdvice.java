package com.jdev.config;

import com.jdev.dto.response.ErrorType;
import com.jdev.dto.response.ResponseDto;
import com.jdev.utils.HttpUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.util.Pair;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Slf4j

@RestControllerAdvice
public class CustomControllerAdvice {

    private static final String DELIMITER = "__";
    private static final List<Pair<String, String>> LIST_OF_REQUIRED_RESPONSE_HTTP_HEADERS = new ArrayList<>();

    static {
        LIST_OF_REQUIRED_RESPONSE_HTTP_HEADERS.add(Pair.of(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN,
                DELIMITER + HttpHeaders.ORIGIN));
        LIST_OF_REQUIRED_RESPONSE_HTTP_HEADERS.add(Pair.of(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS,
                HttpHeaders.CONTENT_DISPOSITION));
        LIST_OF_REQUIRED_RESPONSE_HTTP_HEADERS.add(Pair.of(HttpHeaders.CONTENT_TYPE,
                MimeTypeUtils.APPLICATION_JSON_VALUE + "; charset=" + StandardCharsets.UTF_8));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ResponseDto<String>> exceptionExceptionHandler(Exception e, HttpServletRequest httpServletRequest) {
        log.error("-----CustomControllerAdvice.exceptionExceptionHandler-----", e);
        return new ResponseEntity<>(ResponseDto.error(ErrorType.COMMON_SERVER_ERROR),
                HttpUtils.fillRequiredHeaders(httpServletRequest),
                HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
