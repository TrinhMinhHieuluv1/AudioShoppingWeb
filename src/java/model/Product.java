package model;

//import java.util.List;
import java.sql.Date;

public class Product {

    private int product_ID;
    private String product_Name, product_Image, description;
    private Category category;
    private Brand brand;
    private int quantity, sold, discount, price;
    private Date releaseDate;

    public Product(int product_ID, String product_Name, String product_Image, String description, Category category, Brand brand, int price, int discount, int quantity, int sold, Date releaseDate) {
        this.product_ID = product_ID;
        this.product_Name = product_Name;
        this.product_Image = product_Image;
        this.description = description;
        this.category = category;
        this.brand = brand;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.sold = sold;
        this.releaseDate = releaseDate;
    }

    public int getProduct_ID() {
        return product_ID;
    }

    public void setProduct_ID(int product_ID) {
        this.product_ID = product_ID;
    }

    public String getProduct_Name() {
        return product_Name;
    }

    public void setProduct_Name(String product_Name) {
        this.product_Name = product_Name;
    }

    public String getProduct_Image() {
        return product_Image;
    }

    public void setProduct_Image(String product_Image) {
        this.product_Image = product_Image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    @Override
    public String toString() {
        return "Product{" + "product_ID=" + product_ID + ", product_Name=" + product_Name + ", product_Image=" + product_Image + ", description=" + description + ", category=" + category + ", brand=" + brand + ", price=" + price + ", quantity=" + quantity + ", sold=" + sold + ", discount=" + discount + '}';
    }
    
}

