package com.nhom01.hoda.mapper;

import java.sql.ResultSet;

public interface RowMapper<T> {
    
    T mapRow(ResultSet resultSet);
    
}
