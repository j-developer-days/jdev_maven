package com.jdev.restController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;

@RequiredArgsConstructor
@Slf4j

@RequestMapping(value = "/test", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
@RestController
public class TestRestController {

    private final static Map<String, LocalDateTime> TEST_MAP = new LinkedHashMap<>();

    @PostMapping
    public ResponseEntity<String> postTest() {
        log.info("postTest");
        final String uuid = UUID.randomUUID().toString();
        TEST_MAP.put(uuid, LocalDateTime.now());
        return ResponseEntity.created(URI.create("/" + uuid)).build();
    }

    @GetMapping("/get/{uuid}")
    public ResponseEntity<LocalDateTime> getTestById(@PathVariable("uuid") String uuid) {
        log.info("---getTestById---[{}]", uuid);
        final LocalDateTime localDateTime = TEST_MAP.get(uuid);
        return localDateTime == null ? ResponseEntity.notFound().build() : ResponseEntity.ok(localDateTime);
    }

    @GetMapping("/get-all")
    public ResponseEntity<Map<String, LocalDateTime>> getTestAll() {
        log.info("---getTestAll---");
        return ResponseEntity.ok(TEST_MAP);
    }

    @GetMapping("/check-exception")
    public ResponseEntity<String> checkException(
            @RequestParam(name = "isThrowException", required = false, defaultValue = "false") boolean isThrowException)
    {
        log.info("---checkException--- [{}]", isThrowException);
        if (isThrowException) {
            throw new RuntimeException("exception!");
        }
        return ResponseEntity.ok("Ok");
    }

}
