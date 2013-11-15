package com.docmanager.init;

import com.docmanager.config.ApplicationConfiguration;
import com.docmanager.config.PersistenceConfiguration;
import com.docmanager.config.SecurityConfiguration;
import com.docmanager.config.WebConfiguration;
import com.opensymphony.sitemesh.webapp.SiteMeshFilter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.Filter;

/**
 * User: ptorrao
 * Date: 13/11/13
 */
public class DocManagerWebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] { SecurityConfiguration.class };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] { ApplicationConfiguration.class, WebConfiguration.class, PersistenceConfiguration.class };
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" };
    }

    @Override
    protected Filter[] getServletFilters() {

        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");

        //return new Filter[] { characterEncodingFilter, new SiteMeshFilter() };
        return new Filter[] { characterEncodingFilter, new SiteMeshFilter() };
    }
}