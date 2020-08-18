package com.howtodoinjava.restful;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.xml.sax.SAXException;

class Dom4JReaderUtils {

    Dom4JReaderUtils() {
    }

    private static Logger logger = Logger.getLogger(Dom4JReaderUtils.class);

    static Document getDocument(String resource) throws SAXException {

        Document document = null;
        try {
            document = DocumentHelper.parseText(resource);
        } catch (DocumentException e) {
            logger.error("Document failed!", e);
        }

        return document;
    }
}