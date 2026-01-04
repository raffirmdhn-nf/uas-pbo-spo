/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.dao;

import dev.enep.sms3_pbo_spo.models.Users;
import dev.enep.sms3_pbo_spo.utils.KoneksiDB;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author raffi
 */
public class AutentikasiDao {

    public Users login(String username, String password) throws SQLException {
        String sql = "SELECT id, username, password, role, created_at, updated_at FROM users WHERE username = ? AND password = ? AND deleted_at IS NULL";
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users u = new Users();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setRole(rs.getString("role"));
                u.setCreated_at(rs.getTimestamp("created_at"));
                u.setUpdated_at(rs.getTimestamp("updated_at"));
                return u;
            }

        }
        return null;
    }

    public String register(Users user) throws SQLException {
        try (Connection c = KoneksiDB.getConnection();) {

            // cek user
            try (PreparedStatement ps = c.prepareStatement("SELECT 1 FROM users WHERE username = ?")) {
                ps.setString(1, user.getUsername());

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return "USERNAME_EXISTS";
                    }
                }
            }

            // insert user
            try (PreparedStatement ps = c.prepareStatement("INSERT INTO users (username, password, role) VALUES(?, ?, ?)")) {
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getPassword());
                ps.setString(3, "user");
                int affected = ps.executeUpdate();
                return affected > 0 ? "REGISTER_SUCCESS" : "REGISTER_FAILED";
            }
        }
    }

}
