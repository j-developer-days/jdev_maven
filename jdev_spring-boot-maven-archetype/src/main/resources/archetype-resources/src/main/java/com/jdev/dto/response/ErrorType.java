package com.jdev.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum ErrorType {
    E1(""),
    COMMON_SERVER_ERROR("error.serverError"),
    SIZE_LIMIT_EXCEEDED("error.sizeLimitExceeded");
    private final String translationCode;
}
