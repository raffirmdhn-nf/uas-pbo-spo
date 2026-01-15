/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.dao;

import dev.enep.sms3_pbo_spo.models.User;
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

    public void insert(User u) throws Exception {
        String sql = "INSERT INTO users (username, password, role_id) VALUES (?, MD5(?), ?)";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setInt(3, u.getRole_id());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<User> findAll() throws Exception {
        List<User> list = new ArrayList<>();
        String sql = "SELECT "
                + "u.id, u.username, u.role_id, r.nama as role_nama, u.created_at, u.updated_at "
                + "FROM users u "
                + "JOIN role r ON r.id = u.role_id "
                + "WHERE u.deleted_at IS NULL ORDER BY u.id ASC";

        try (Connection c = KoneksiDB.getConnection(); Statement st = c.createStatement(); ResultSet rs = st.executeQuery(sql);) {
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setRole_id(rs.getInt("role_id"));
                u.setRole_nama(rs.getString("role_nama"));
                u.setCreated_at(rs.getTimestamp("created_at"));
                u.setUpdated_at(rs.getTimestamp("updated_at"));

                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public User findById(int id) throws Exception {
        User u = new User();
        String sql = "SELECT "
                + "u.id, u.username, u.role_id, r.nama as role_nama, u.created_at, u.updated_at "
                + "FROM users u "
                + "JOIN role r ON r.id = u.role_id "
                + "WHERE u.id = ? AND u.deleted_at IS NULL";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setRole_id(rs.getInt("role_id"));
                u.setRole_nama(rs.getString("role_nama"));
                u.setCreated_at(rs.getTimestamp("created_at"));
                u.setUpdated_at(rs.getTimestamp("updated_at"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }

    public void softDelete(int id) throws Exception {
        String sql = "UPDATE users SET deleted_at = CURRENT_TIMESTAMP WHERE id = ?";
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(User u) throws Exception {
        String sql = "UPDATE users SET username = ?, password = MD5(?), role_id = ? WHERE id = ?";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setInt(3, u.getRole_id());
            ps.setInt(4, u.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
