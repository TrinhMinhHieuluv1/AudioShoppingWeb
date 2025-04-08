package model;

public class Brand {
    
    private int brand_ID;
    private String brand_Name;

    public Brand(int brand_ID, String brand_Name) {
        this.brand_ID = brand_ID;
        this.brand_Name = brand_Name;
    }

    public int getBrand_ID() {
        return brand_ID;
    }

    public void setBrand_ID(int brand_ID) {
        this.brand_ID = brand_ID;
    }

    public String getBrand_Name() {
        return brand_Name;
    }

    public void setBrand_Name(String brand_Name) {
        this.brand_Name = brand_Name;
    }
    
}
