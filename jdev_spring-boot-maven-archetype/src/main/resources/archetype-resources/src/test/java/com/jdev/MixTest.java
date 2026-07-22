package com.jdev;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class MixTest {

    @Test
    void test_() {
        System.out.println("run UT");
        int sum = 2 + 2;
        Assertions.assertEquals(4, sum);
    }

}
