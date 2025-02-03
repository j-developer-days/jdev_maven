package com.jdev.utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.data.util.Pair;
import org.springframework.http.HttpHeaders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.util.MultiValueMap;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class HttpUtils {

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

    public static void enrichHttpResponse(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        LIST_OF_REQUIRED_RESPONSE_HTTP_HEADERS.forEach(stringStringPair -> {
            if (httpServletResponse.getHeader(stringStringPair.getFirst()) == null) {
                httpServletResponse.setHeader(stringStringPair.getFirst(),
                        getHeader(stringStringPair.getSecond(), httpServletRequest));
            }
        });
    }

    public static MultiValueMap<String, String> fillRequiredHeaders(HttpServletRequest httpServletRequest) {
        MultiValueMap<String, String> linkedMultiValueMap = new LinkedMultiValueMap<>();
        HttpUtils.LIST_OF_REQUIRED_RESPONSE_HTTP_HEADERS.stream()
                .filter(stringStringPair -> !stringStringPair.getFirst()
                        .equals(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN))
                .forEach(stringStringPair -> linkedMultiValueMap.put(
                        stringStringPair.getFirst(),
                        getHeaderAsList(stringStringPair.getSecond(), httpServletRequest)));
        return linkedMultiValueMap;
    }

    private static String getHeader(String value, HttpServletRequest httpServletRequest) {
        return value.startsWith(DELIMITER) ? httpServletRequest.getHeader(value.substring(2)) : value;
    }

    private static List<String> getHeaderAsList(String value, HttpServletRequest httpServletRequest) {
        String header = getHeader(value, httpServletRequest);
        return header == null ? List.of() : List.of(header);
    }

}
