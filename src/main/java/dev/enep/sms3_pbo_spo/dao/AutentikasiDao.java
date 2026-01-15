/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.dao;

import dev.enep.sms3_pbo_spo.models.User;
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

    public User login(String username, String password) throws SQLException {
        String sql = "SELECT "
                + "u.id, u.username, u.role_id, r.nama as role_nama, u.created_at, u.updated_at "
                + "FROM users u "
                + "JOIN role r ON r.id = u.role_id "
                + "WHERE u.username = ? AND u.password = MD5(?) AND u.deleted_at IS NULL";
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setRole_id(rs.getInt("role_id"));
                u.setRole_nama(rs.getString("role_nama"));
                u.setCreated_at(rs.getTimestamp("created_at"));
                u.setUpdated_at(rs.getTimestamp("updated_at"));

                return u;
            }

        }
        return null;
    }

    public String register(User user) throws SQLException {
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
            try (PreparedStatement ps = c.prepareStatement("INSERT INTO users (username, password, role_id) VALUES(?, ?, ?)")) {
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getPassword());
                ps.setInt(3, 1);
                int affected = ps.executeUpdate();
                return affected > 0 ? "REGISTER_SUCCESS" : "REGISTER_FAILED";
            }
        }
    }

}
