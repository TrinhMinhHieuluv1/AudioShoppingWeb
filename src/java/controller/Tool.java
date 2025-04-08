package controller;

import java.util.List;
import model.Brand;
import model.Category;

public class Tool {
    
    public Category getCategoryByID(List<Category> list, int category_ID) {
        for (Category category : list) {
            if (category.getCategory_ID() == category_ID) {
                return category;
            }
        }
        return null;
    }
    
    public Brand getBrandByID(List<Brand> list, int brand_ID) {
        for (Brand brand : list) {
            if (brand.getBrand_ID()== brand_ID) {
                return brand;
            }
        }
        return null;
    }
}
