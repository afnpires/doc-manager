package com.docmanager.api;

import com.docmanager.model.Company;

import java.util.List;

public interface CompanyDao {

    Company insert (Company company);
    void delete(Company company);
    Company find(int id);
    List<Company> findAll();

}
