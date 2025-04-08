package model;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
    
    private List<ShoppingCartItem> list;
    User user;

    public ShoppingCart(User user) {
        this.list = new ArrayList<>();
        this.user = user;
    }

    public List<ShoppingCartItem> getList() {
        return list;
    }

    public void setList(List<ShoppingCartItem> list) {
        this.list = list;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
