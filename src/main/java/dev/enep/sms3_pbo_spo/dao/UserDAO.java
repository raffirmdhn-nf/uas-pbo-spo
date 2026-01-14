/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.dao;

import dev.enep.sms3_pbo_spo.models.Users;
import dev.enep.sms3_pbo_spo.utils.KoneksiDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class UserDAO {

    public void insert(Users u) throws Exception {
        String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getRole());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Users> findAll() throws Exception {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT id, nama, password, role, created_at, updated_at FROM users WHERE deleted_at IS NULL";

        try (Connection c = KoneksiDB.getConnection(); Statement st = c.createStatement(); ResultSet rs = st.executeQuery(sql);) {
            while (rs.next()) {
                Users u = new Users();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("usernama"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                u.setCreated_at(rs.getTimestamp("created_at"));
                u.setUpdated_at(rs.getTimestamp("updated_at"));

                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Users findById(int id) throws Exception {
        Users u = new Users();
        String sql = "SELECT id, nama, password, role, created_at, updated_at FROM users WHERE id = ? AND deleted_at IS NULL";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("usernama"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                u.setCreated_at(rs.getTimestamp("created_at"));
                u.setUpdated_at(rs.getTimestamp("updated_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }

    public void softDelete(int id) throws Exception {
        String sql = "UPDATE user SET deleted_at = CURRENT_TIMESTAMP WHERE id = ?";
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(Users u) throws Exception {
        String sql = "UPDATE users SET nama = ?, password = ?, role = ? WHERE id = ?";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getRole());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
