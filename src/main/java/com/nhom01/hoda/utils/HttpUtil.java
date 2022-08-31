package com.nhom01.hoda.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.BufferedReader;
import java.io.IOException;

public class HttpUtil {
    
    public static <T> T toModel(BufferedReader reader, Class<T> tClass){
        try {
            StringBuilder stringBuilder = new StringBuilder();
            
            //  convert to json string
            String line = "";
            while ((line = reader.readLine()) != null) {
                stringBuilder.append(line);
            }
            
            return new ObjectMapper().readValue(stringBuilder.toString(), tClass);
        } catch (IOException ex) {
            return null;
        }
    }
}
