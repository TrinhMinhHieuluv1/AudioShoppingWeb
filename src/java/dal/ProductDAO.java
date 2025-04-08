package dal;

import controller.Tool;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

public class ProductDAO extends DBContext {
    
    Tool tool = new Tool();
    CategoryDAO cDAO = new CategoryDAO();
    BrandDAO bDAO = new BrandDAO();
    
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM PRODUCT";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("product_ID"),
                        rs.getString("product_Name"),
                        rs.getString("product_Image"),
                        rs.getString("description"),
                        tool.getCategoryByID(cDAO.getAllCategory(), rs.getInt("category_ID")),
                        tool.getBrandByID(bDAO.getAllBrand(), rs.getInt("brand_ID")),
                        rs.getInt("price"), rs.getInt("discount"),
                        rs.getInt("quantity"), rs.getInt("sold"),
                        rs.getDate("release_Date"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Product selectAProductByID(int id) {
        String sql = "SELECT * FROM PRODUCT WHERE product_ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("product_ID"),
                        rs.getString("product_Name"),
                        rs.getString("product_Image"),
                        rs.getString("description"),
                        tool.getCategoryByID(cDAO.getAllCategory(), rs.getInt("category_ID")),
                        tool.getBrandByID(bDAO.getAllBrand(), rs.getInt("brand_ID")),
                        rs.getInt("price"), rs.getInt("discount"),
                        rs.getInt("quantity"), rs.getInt("sold"),
                        rs.getDate("release_Date"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void addAProduct(Product p) {
        String sql = "INSERT INTO PRODUCT VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getProduct_Name());
            st.setInt(2, p.getCategory().getCategory_ID());
            st.setInt(3, p.getBrand().getBrand_ID());
            st.setInt(4, p.getPrice());
            st.setInt(5, p.getDiscount());
            st.setString(6, p.getProduct_Image());
            st.setString(7, p.getDescription());
            st.setInt(8, p.getQuantity());
            st.setInt(9, p.getSold());
            st.setDate(10, p.getReleaseDate());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteAProductByID(int id) {
        String sql = "DELETE FROM PRODUCT WHERE product_ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateAProductByID(Product p) {
        String sql = "UPDATE PRODUCT SET product_Name=?, category_ID=?,"
                + " brand_ID=?, price=?, discount=?, product_Image=?, description=?,"
                + "quantity = ?, sold=?, release_Date=? WHERE product_ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getProduct_Name());
            st.setInt(2, p.getCategory().getCategory_ID());
            st.setInt(3, p.getBrand().getBrand_ID());
            st.setInt(4, p.getPrice());
            st.setInt(5, p.getDiscount());
            st.setString(6, p.getProduct_Image());
            st.setString(7, p.getDescription());
            st.setInt(8, p.getQuantity());
            st.setInt(9, p.getSold());
            st.setDate(10, p.getReleaseDate());
            st.setInt(11, p.getProduct_ID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public List<Product> selectTop5SaleProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP(5) * FROM PRODUCT WHERE (discount != 0) ORDER BY discount DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("product_ID"),
                        rs.getString("product_Name"),
                        rs.getString("product_Image"),
                        rs.getString("description"),
                        tool.getCategoryByID(cDAO.getAllCategory(), rs.getInt("category_ID")),
                        tool.getBrandByID(bDAO.getAllBrand(), rs.getInt("brand_ID")),
                        rs.getInt("price"), rs.getInt("discount"),
                        rs.getInt("quantity"), rs.getInt("sold"),
                        rs.getDate("release_Date"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> selectTop2NewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP(2) * FROM PRODUCT ORDER BY release_Date DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("product_ID"),
                        rs.getString("product_Name"),
                        rs.getString("product_Image"),
                        rs.getString("description"),
                        tool.getCategoryByID(cDAO.getAllCategory(), rs.getInt("category_ID")),
                        tool.getBrandByID(bDAO.getAllBrand(), rs.getInt("brand_ID")),
                        rs.getInt("price"), rs.getInt("discount"),
                        rs.getInt("quantity"), rs.getInt("sold"),
                        rs.getDate("release_Date"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> selectTop4BestSellerProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP(4) * FROM PRODUCT ORDER BY sold DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("product_ID"),
                        rs.getString("product_Name"),
                        rs.getString("product_Image"),
                        rs.getString("description"),
                        tool.getCategoryByID(cDAO.getAllCategory(), rs.getInt("category_ID")),
                        tool.getBrandByID(bDAO.getAllBrand(), rs.getInt("brand_ID")),
                        rs.getInt("price"), rs.getInt("discount"),
                        rs.getInt("quantity"), rs.getInt("sold"),
                        rs.getDate("release_Date"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> selectProductsWithConditions(String keyword_raw, String category_ID_raw, String brand_ID_raw, String price_raw, String sortby_raw) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM PRODUCT WHERE (1=1)";
        try {
            if (keyword_raw != null) {
                sql = sql + " AND (product_Name LIKE '%" + keyword_raw + "%')";
            }
            
            if (category_ID_raw != null && !category_ID_raw.isEmpty()) {
                try {
                    int category_ID = Integer.parseInt(category_ID_raw);
                    sql = sql + " AND (category_ID = " + category_ID + ")";
                } catch (NumberFormatException e) {
                    System.out.println(e);
                }
            }
            
            if (brand_ID_raw != null && !brand_ID_raw.isEmpty()) {
                try {
                    int brand_ID = Integer.parseInt(brand_ID_raw);
                    sql = sql + " AND (brand_ID = " + brand_ID + ")";
                } catch (NumberFormatException e) {
                    System.out.println(e);
                }
            }
            
            if (price_raw != null && !price_raw.isEmpty()) {
                try {
                    String[] price = price_raw.split("-");
                    int priceFrom = Integer.parseInt(price[0]);
                    int priceTo = Integer.parseInt(price[1]);
                    sql = sql + " AND ((CAST(price AS BIGINT)*(100-discount)/100) BETWEEN " + (priceFrom * 1000000) + " AND " + (priceTo * 1000000) + ")";
                } catch (Exception e) {
                }
            }
            
            if (sortby_raw != null && !sortby_raw.isEmpty()) {
                switch (sortby_raw) {
                    case "cheapest": {
                        sql = sql + " ORDER BY (CAST(price AS BIGINT)*(100-discount)/100)";
                        break;
                    }
                    case "expensive": {
                        sql = sql + " ORDER BY (CAST(price AS BIGINT)*(100-discount)/100) DESC";
                        break;
                    }
                    case "latest": {
                        sql = sql + " ORDER BY release_Date DESC";
                        break;
                    }
                    case "oldest": {
                        sql = sql + " ORDER BY release_Date";
                        break;
                    }
                    case "sold": {
                        sql = sql + " ORDER BY sold DESC";
                        break;
                    }
                }
            }
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("product_ID"),
                        rs.getString("product_Name"),
                        rs.getString("product_Image"),
                        rs.getString("description"),
                        tool.getCategoryByID(cDAO.getAllCategory(), rs.getInt("category_ID")),
                        tool.getBrandByID(bDAO.getAllBrand(), rs.getInt("brand_ID")),
                        rs.getInt("price"), rs.getInt("discount"),
                        rs.getInt("quantity"), rs.getInt("sold"),
                        rs.getDate("release_Date"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public int[] numberOfProductsByCategory_ID() {
        int[] arr = new int[10];
        String sql = "SELECT COUNT(*) AS [numOfProducts] FROM PRODUCT WHERE (category_ID=?)";
        for (int i = 1; i <= 4; i++) {
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, i);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    arr[i] = rs.getInt("numOfProducts");
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return arr;
    }
    
    public List<Product> getRelativeProduct(Product product) {
        List<Product> list = new ArrayList<>();
        if (list.size() < 4) {
            String sql = "SELECT * FROM PRODUCT WHERE (category_ID=?) AND (brand_ID=?) AND (price BETWEEN ? AND ?) AND (product_ID !=?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, product.getCategory().getCategory_ID());
                st.setInt(2, product.getBrand().getBrand_ID());
                st.setInt(3, product.getPrice() - 1000000);
                st.setInt(4, product.getPrice() + 1000000);
                st.setInt(5, product.getProduct_ID());
                ResultSet rs = st.executeQuery();
                while (rs.next() && list.size() < 4) {
                    Product p = new Product(rs.getInt("product_ID"),
                            rs.getString("product_Name"),
                            rs.getString("product_Image"),
                            rs.getString("description"),
                            tool.getCategoryByID(cDAO.getAllCategory(), rs.getInt("category_ID")),
                            tool.getBrandByID(bDAO.getAllBrand(), rs.getInt("brand_ID")),
                            rs.getInt("price"), rs.getInt("discount"),
                            rs.getInt("quantity"), rs.getInt("sold"),
                            rs.getDate("release_Date"));
                    list.add(p);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        if (list.size() < 4) {
            String sql = "SELECT * FROM PRODUCT WHERE (((category_ID=?) AND (price BETWEEN ? AND ?)) OR ((brand_ID=?) AND (price BETWEEN ? AND ?)) OR ((category_ID=?) AND (brand_ID=?))) AND (product_ID !=?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, product.getCategory().getCategory_ID());
                st.setInt(2, product.getPrice() - 1000000);
                st.setInt(3, product.getPrice() + 1000000);
                st.setInt(4, product.getBrand().getBrand_ID());
                st.setInt(5, product.getPrice() - 1000000);
                st.setInt(6, product.getPrice() + 1000000);
                st.setInt(7, product.getCategory().getCategory_ID());
                st.setInt(8, product.getBrand().getBrand_ID());
                st.setInt(9, product.getProduct_ID());
                ResultSet rs = st.executeQuery();
                while (rs.next() && list.size() < 4) {
                    Product p = new Product(rs.getInt("product_ID"),
                            rs.getString("product_Name"),
                            rs.getString("product_Image"),
                            rs.getString("description"),
                            tool.getCategoryByID(cDAO.getAllCategory(), rs.getInt("category_ID")),
                            tool.getBrandByID(bDAO.getAllBrand(), rs.getInt("brand_ID")),
                            rs.getInt("price"), rs.getInt("discount"),
                            rs.getInt("quantity"), rs.getInt("sold"),
                            rs.getDate("release_Date"));
                    list.add(p);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        if (list.size() < 4) {
            String sql = "SELECT * FROM PRODUCT WHERE ((category_ID=?) OR (brand_ID=?) OR (price BETWEEN ? AND ?)) AND (product_ID !=?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, product.getCategory().getCategory_ID());
                st.setInt(2, product.getBrand().getBrand_ID());
                st.setInt(3, product.getPrice() - 1000000);
                st.setInt(4, product.getPrice() + 1000000);
                st.setInt(5, product.getProduct_ID());
                ResultSet rs = st.executeQuery();
                while (rs.next() && list.size() < 4) {
                    Product p = new Product(rs.getInt("product_ID"),
                            rs.getString("product_Name"),
                            rs.getString("product_Image"),
                            rs.getString("description"),
                            tool.getCategoryByID(cDAO.getAllCategory(), rs.getInt("category_ID")),
                            tool.getBrandByID(bDAO.getAllBrand(), rs.getInt("brand_ID")),
                            rs.getInt("price"), rs.getInt("discount"),
                            rs.getInt("quantity"), rs.getInt("sold"),
                            rs.getDate("release_Date"));
                    boolean add = true;
                    for (Product product1 : list) {
                        if (p.getProduct_ID() == product1.getProduct_ID()) {
                            add = false;
                            break;
                        }
                    }
                    if (add) {
                        list.add(p);
                    }
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return list;
    }   
}
