package com.microservice.app.serviceImpl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


public enum JsonConverter {
    INSTANCE;
    private static ObjectMapper mapper = null;

    public String asJsonString(Object obj) {
        String jsonString = null;
        if (mapper == null) {
            mapper = new ObjectMapper();
        }
        try {
            jsonString = mapper.writeValueAsString(obj);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonString;
    }

    public JsonNode stringToJson(String jsonString) {
        JsonNode node = null;
        if (mapper == null) {
            mapper = new ObjectMapper();
        }
        try {
            node = mapper.readTree(jsonString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return node;
    }
}
