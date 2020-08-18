package com.howtodoinjava.restful;

import org.dom4j.DocumentException;
import org.xml.sax.SAXException;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.json.JsonWriter;
import javax.json.stream.JsonGenerator;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

@Path("/")
public class UserManagementModule
{

    @GET
    @Path("/user-management/users")
    public Response getAllUsers()
    {
        String result = "<h1>RESTful Demo Application</h1>In real world application, a collection of users will be returned !!";
        return Response.status(200).entity(result).build();
    }

    @POST
    @Path("/resources/fix-parsing")
    public String getResult(@FormParam("input") String input,
                            @FormParam("format") String format,
                            @FormParam("resource") String resource) throws IOException, FixMessageParser.ParseException, SAXException, DocumentException {

        //return resource;
        FixMessageParser parser = new StdFixMessageParser();
        //String path = "C:\\Users\\小年\\Desktop\\演示文件\\FIX.xml";

        final Map<Integer, FixTagTranslator> loadedTranslators = XmlParserUtils.loadBuiltinTranslators(resource);


        if(format.equals("0")){

            StringBuilder result = new StringBuilder();
            SimpleFixMessageWriter writeToString = new SimpleFixMessageWriter(result);
            parser.parse(input, writeToString, loadedTranslators);
            return result.toString();

        }else if(format.equals("1")){

            JsonObjectBuilder jsonBuilder = Json.createObjectBuilder();
            JsonFixMessageWriter writeToJson = new JsonFixMessageWriter(jsonBuilder);
            parser.parse(input, writeToJson, loadedTranslators);
            final JsonObject jsonObject = jsonBuilder.build();
            final Map<String, Boolean> map = new HashMap<>();
            map.put(JsonGenerator.PRETTY_PRINTING, Boolean.TRUE);
            try (final StringWriter stringWriter = new StringWriter();
                 final JsonWriter jsonWriter = Json.createWriterFactory(map).createWriter(stringWriter)) {
                if (null != jsonWriter) {
                    jsonWriter.write(jsonObject);
                }
                return String.valueOf(stringWriter);
            }

        }
        return "";
    }

}