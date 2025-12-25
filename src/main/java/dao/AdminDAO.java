/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import util.DBConnection;

public class AdminDAO {

    // Cek Login Admin
    public boolean login(String username, String password) {
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, username);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                // Jika ada data, berarti login sukses
                return rs.next();
            }
            
        } catch (SQLException e) {
            System.out.println("Error Login Admin: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}