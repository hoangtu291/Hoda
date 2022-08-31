package com.nhom01.hoda.dao;

import com.nhom01.hoda.mapper.RowMapper;
import java.util.List;

public interface IGenericDao<T> {
    <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters);
    void update(String sql, Object... parameters);
    Long insert(String sql, Object... parameters);
}
