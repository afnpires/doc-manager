package com.docmanager.formatter;

import com.docmanager.api.DocumentTypeDao;
import com.docmanager.model.DocumentType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.Locale;

@Component
public class DocumentTypeFormatter implements Formatter<DocumentType> {

    @Autowired
    private DocumentTypeDao documentTypeDao;
    //Some service class which can give the Actor after
    //fetching from Database

    @Override
    public String print(DocumentType documentType, Locale locale) {
        return documentType.getName();
    }

    @Override
    public DocumentType parse(String documentTypeId, Locale locale) throws ParseException {
        int id = Integer.parseInt(documentTypeId);
        return documentTypeDao.find(id);
        //Else you can just return a new object by setting some values
        //which you deem fit.
    }
}
