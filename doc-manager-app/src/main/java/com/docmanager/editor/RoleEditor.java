package com.docmanager.editor;

import com.docmanager.api.RoleDao;
import com.docmanager.model.Role;

import java.beans.PropertyEditorSupport;

public class RoleEditor extends PropertyEditorSupport {

    private RoleDao roleDao;

    public RoleEditor(RoleDao roleDao) {
        this.roleDao = roleDao;
    }

    @Override
    public void setAsText(String text) {
        int roleId = Integer.parseInt(text);
        Role role = roleDao.find(roleId);
        this.setValue(role);
    }

    public String getAsText() {
        Role role = (Role) this.getValue();
        return role.getName();
    }

}
