package com.merrill.information.dao.entity;

import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable {
    private Long id;

    private Long fromId;

    private Long toId;

    private Date sendtime;

    private Byte outline;

    private String content;

    public Message(Long id, Long fromId, Long toId, Date sendtime, Byte outline, String content) {
        this.id = id;
        this.fromId = fromId;
        this.toId = toId;
        this.sendtime = sendtime;
        this.outline = outline;
        this.content = content;
    }

    public Long getId() {
        return id;
    }

    public Long getFromId() {
        return fromId;
    }

    public Long getToId() {
        return toId;
    }

    public Date getSendtime() {
        return sendtime;
    }

    public Byte getOutline() {
        return outline;
    }

    public String getContent() {
        return content;
    }
}