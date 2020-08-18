package com.howtodoinjava.restful;

import java.io.IOException;

public interface FixMessageWriter {
    void write(final String key, final String val) throws IOException;
}
