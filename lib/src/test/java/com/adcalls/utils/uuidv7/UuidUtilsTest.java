package com.adcalls.utils.uuidv7;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

import java.util.UUID;

public class UuidUtilsTest {
    @Test void shouldReturnValidUUID() {
        UUID uuid = UuidUtils.randomV7();
        assertNotNull(uuid, "Generated UUID should not be null");
    }

    @Test void shouldHaveVersion7() {
        UUID uuid = UuidUtils.randomV7();
        assertEquals(7, uuid.version(), "UUID version should be 7");
    }

    @Test void shouldHaveCorrectVariant() {
        UUID uuid = UuidUtils.randomV7();
        assertEquals(2, uuid.variant(), "UUID variant should be 2 (RFC 4122)");
    }

    @Test void shouldGenerateDifferentUUIDs() {
        UUID uuid1 = UuidUtils.randomV7();
        UUID uuid2 = UuidUtils.randomV7();

        assertNotEquals(uuid1, uuid2, "Consecutive calls should generate different UUIDs");
    }
}
