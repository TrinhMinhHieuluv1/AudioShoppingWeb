package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.User;

public class UserDAO extends DBContext {

    public User checkAuthen(String username, String password) {
        String sql = "SELECT * FROM [USER] WHERE username = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(username, password, rs.getString("name"),
                        rs.getString("gender"), rs.getDate("dob"),
                        rs.getString("address"), rs.getString("phone"),
                        rs.getString("mail"), rs.getString("avatar"),
                        rs.getBoolean("role"), rs.getInt("spending"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [USER]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getString("gender"),
                        rs.getDate("dob"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("mail"),
                        rs.getString("avatar"),
                        rs.getBoolean("role"),
                        rs.getInt("spending"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public User selectAUserByUsername(String username) {
        String sql = "SELECT * FROM [USER] WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getString("gender"),
                        rs.getDate("dob"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("mail"),
                        rs.getString("avatar"),
                        rs.getBoolean("role"),
                        rs.getInt("spending"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addUser(User userToAdd) {
        String sql = "INSERT INTO [USER] VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userToAdd.getUsername());
            st.setString(2, userToAdd.getPassword());
            st.setString(3, userToAdd.getName());
            st.setString(4, userToAdd.getGender());
            st.setDate(5, userToAdd.getDob());
            st.setString(6, userToAdd.getAddress());
            st.setString(7, userToAdd.getPhone());
            st.setString(8, userToAdd.getMail());
            st.setString(9, userToAdd.getAvatar());
            st.setBoolean(10, userToAdd.isRole());
            st.setInt(11, userToAdd.getSpending());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteAUserByUsername(String username) {
        String sql = "DELETE FROM [USER] WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateAUserByID(User userToUpdate) {
        String sql = "UPDATE [USER] SET password=?, name=?,"
                + "gender=?, dob=?, address=?, phone=?, mail=?,"
                + " avatar=?, role=?, spending = ? WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userToUpdate.getPassword());
            st.setString(2, userToUpdate.getName());
            st.setString(3, userToUpdate.getGender());
            st.setDate(4, userToUpdate.getDob());
            st.setString(5, userToUpdate.getAddress());
            st.setString(6, userToUpdate.getPhone());
            st.setString(7, userToUpdate.getMail());
            st.setString(8, userToUpdate.getAvatar());
            st.setBoolean(9, userToUpdate.isRole());
            st.setInt(10, userToUpdate.getSpending());
            st.setString(11, userToUpdate.getUsername());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
