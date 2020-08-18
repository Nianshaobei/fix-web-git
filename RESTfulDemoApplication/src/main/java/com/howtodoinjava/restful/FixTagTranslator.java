package com.howtodoinjava.restful;

public interface FixTagTranslator {
    String getName();

    String translateValue(final String value) throws FixMessageParser.ParseException;
}
