package com.nhom01.hoda.dao;

import com.nhom01.hoda.model.LoginTypeModel;

public interface ILoginTypeDao {
    LoginTypeModel findTypeLoginByName(String name);
}
