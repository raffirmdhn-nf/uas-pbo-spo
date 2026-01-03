/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.dao;

import dev.enep.sms3_pbo_spo.models.Kategori;
import dev.enep.sms3_pbo_spo.utils.KoneksiDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author raffi
 */
public class KategoriDAO {

    public void insert(Kategori k) throws Exception {
        String sql = "INSERT INTO kategori (nama, deskripsi) VALUES (?, ?)";

        try {
            Connection c = KoneksiDB.getConnection();
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, k.getNama());
            ps.setString(2, k.getDeskripsi());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Kategori> findAll() throws Exception {
        List<Kategori> list = new ArrayList<>();
        String sql = "SELECT id, nama, deskripsi, created_at, updated_at FROM kategori WHERE deleted_at IS NULL";
        System.out.println("sql: " + sql);
        try {
            Connection c = KoneksiDB.getConnection();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                Kategori k = new Kategori();
                k.setId(rs.getInt("id"));
                k.setNama(rs.getString("nama"));
                k.setDeskripsi(rs.getString("deskripsi"));
                k.setCreated_at(rs.getTimestamp("created_at"));
                k.setUpdated_at(rs.getTimestamp("updated_at"));

                list.add(k);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void softDelete(int id) throws Exception {
        String sql = "UPDATE kategori SET deleted_at = CURRENT_TIMESTAMP WHERE id = ?";
        Connection c = KoneksiDB.getConnection();
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }
}
