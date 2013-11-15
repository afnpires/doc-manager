package com.docmanager;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * User: ptorrao
 * Date: 13/11/13
 */
public class TestForm {

    @NotEmpty
    private String messageFromUser;

    public String getMessageFromUser() {
        return messageFromUser;
    }

    public void setMessageFromUser(String messageFromUser) {
        this.messageFromUser = messageFromUser;
    }
}