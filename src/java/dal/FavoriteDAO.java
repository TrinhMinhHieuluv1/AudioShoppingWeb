package dal;

import java.util.List;
import model.Product;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FavoriteDAO extends DBContext{
    public List<Product> selectFavoriteProductsByUsername(User user) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [FAVORITE] WHERE username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getUsername());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
