package model;

public class Category {

    private int id;
    private String name;
    private int parentID;

    public Category(int id, String name) {
        super();
        this.id = id;
        this.name = name;
    }

    public Category(int id, String name, int parentID) {
        super();
        this.id = id;
        this.name = name;
        this.parentID = parentID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParentID() {
        return parentID;
    }

    public void setParentID(int parentID) {
        this.parentID = parentID;
    }

}
