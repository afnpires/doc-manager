package com.docmanager.editor;

import com.docmanager.model.enums.FieldTypeEnum;

import java.beans.PropertyEditorSupport;

/**
 * author: jalexmach
 */
public class FieldTypeEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) {
        for (FieldTypeEnum fte : FieldTypeEnum.values()) {
            if (fte.name().equals(text)) {
                this.setValue(fte);
            }
        }
    }

    @Override
    public String getAsText() {
        FieldTypeEnum fieldTypeEnum = (FieldTypeEnum) this.getValue();
        return fieldTypeEnum.name();
    }

}
