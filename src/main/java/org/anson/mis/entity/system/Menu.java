package org.anson.mis.entity.system;

import org.anson.mis.entity.BaseEntity;

public class Menu extends BaseEntity {
    private Menu parentMenu;
    private String no;
    private String name;
    private String iconUrl;
    private Boolean isContent;
    private Integer level;
    private String description;
    private Boolean isDisplay;

    public Menu() {
    }

    public Menu getParentMenu() {
        return parentMenu;
    }

    public void setParentMenu(Menu parentMenu) {
        this.parentMenu = parentMenu;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    public Boolean getContent() {
        return isContent;
    }

    public void setContent(Boolean content) {
        isContent = content;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getDisplay() {
        return isDisplay;
    }

    public void setDisplay(Boolean display) {
        isDisplay = display;
    }
}
