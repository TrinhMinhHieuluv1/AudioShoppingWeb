/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Others;

/**
 *
 * @author HP
 */
public class Tools {
    
    public String URLToSearchByCondition(String query, String newCondition) {
        String newURL = "/audio/shop";
        if (query == null || query.isEmpty()) {
            return newURL + "?" + newCondition;
        }
        String[] conditions = query.split("&");
        String newAttribute = newCondition.split("=")[0];
        boolean hadCondition = false;
        for (int i = 0; i < conditions.length; i++) {
            if (i == 0) {
                newURL = newURL + "?";
            }
            if (conditions[i].startsWith(newAttribute)) {
                newURL = newURL + newCondition;
                hadCondition = true;
            } else {
                newURL = newURL + conditions[i];
            }
            if (i != conditions.length - 1) {
                newURL = newURL + "&";
            }
        }
        if (!hadCondition) {
            newURL = newURL + "&" + newCondition;
        }
        return newURL;
    } 
}
