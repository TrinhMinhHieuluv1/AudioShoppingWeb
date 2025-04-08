package model;

public class Category {
    
    private int category_ID;
    private String category_Name;
    private String category_Image;

    public Category(int category_ID, String category_Name, String category_Image) {
        this.category_ID = category_ID;
        this.category_Name = category_Name;
        this.category_Image = category_Image;
    }

    public int getCategory_ID() {
        return category_ID;
    }

    public void setCategory_ID(int category_ID) {
        this.category_ID = category_ID;
    }

    public String getCategory_Name() {
        return category_Name;
    }

    public void setCategory_Name(String category_Name) {
        this.category_Name = category_Name;
    }

    public String getCategory_Image() {
        return category_Image;
    }

    public void setCategory_Image(String category_Image) {
        this.category_Image = category_Image;
    }
    
}
