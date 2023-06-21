package com.jdev.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j

@RestControllerAdvice
public class CustomControllerAdvice {

    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    String runtimeExceptionExceptionHandler(RuntimeException e) {
        log.error("-----CustomControllerAdvice.runtimeExceptionExceptionHandler-----", e);
        return e.getMessage();
    }

}
