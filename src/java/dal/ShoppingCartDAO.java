package dal;

import model.ShoppingCart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ShoppingCartItem;
import model.User;

public class ShoppingCartDAO extends DBContext {

    public List<ShoppingCartItem> getAllItemsByUsername(String username) {
        ProductDAO pdao = new ProductDAO();
        List<ShoppingCartItem> list = new ArrayList<>();
        String sql = "SELECT * FROM [SHOPPING_CART] WHERE username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShoppingCartItem item = new ShoppingCartItem(pdao.selectAProductByID(rs.getInt("product_ID")), rs.getInt("quantity"));
                list.add(item);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addItem(User user, ShoppingCartItem item) {
        String sql = "INSERT INTO [SHOPPING_CART] VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getUsername());
            st.setInt(2, item.getProduct().getProduct_ID());
            st.setInt(3, item.getQuantity());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteItemByUsernameAndProduct_ID(User user, ShoppingCartItem item) {
        String sql = "DELETE FROM [SHOPPING_CART] WHERE (username=?) AND (product_ID=?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getUsername());
            st.setInt(2, item.getProduct().getProduct_ID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateItemByUsernameAndProductID(User user, ShoppingCartItem item) {
        String sql = "UPDATE [SHOPPING_CART] SET quantity=? WHERE (username=?) AND (product_ID=?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, item.getQuantity());
            st.setString(2, user.getUsername());
            st.setInt(3, item.getProduct().getProduct_ID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
  
}
