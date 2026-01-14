/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.dao;

import dev.enep.sms3_pbo_spo.models.KategoriObat;
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
public class KategoriObatDAO {

    public void insert(KategoriObat k) throws Exception {
        String sql = "INSERT INTO kategori (nama, deskripsi) VALUES (?, ?)";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, k.getNama());
            ps.setString(2, k.getDeskripsi());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<KategoriObat> findAll() throws Exception {
        List<KategoriObat> list = new ArrayList<>();
        String sql = "SELECT id, nama, deskripsi, created_at, updated_at FROM kategori WHERE deleted_at IS NULL";

        try (Connection c = KoneksiDB.getConnection(); Statement st = c.createStatement(); ResultSet rs = st.executeQuery(sql);) {
            while (rs.next()) {
                KategoriObat k = new KategoriObat();
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

    public KategoriObat findById(int id) throws Exception {
        KategoriObat kategori = new KategoriObat();
        String sql = "SELECT id, nama, deskripsi, created_at, updated_at FROM kategori WHERE id = ? AND deleted_at IS NULL";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                kategori.setId(rs.getInt("id"));
                kategori.setNama(rs.getString("nama"));
                kategori.setDeskripsi(rs.getString("deskripsi"));
                kategori.setCreated_at(rs.getTimestamp("created_at"));
                kategori.setUpdated_at(rs.getTimestamp("updated_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kategori;
    }

    public void softDelete(int id) throws Exception {
        String sql = "UPDATE kategori SET deleted_at = CURRENT_TIMESTAMP WHERE id = ?";
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(KategoriObat k) throws Exception {
        String sql = "UPDATE kategori SET nama = ?, deskripsi = ? WHERE id = ?";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setString(1, k.getNama());
            ps.setString(2, k.getDeskripsi());
            ps.setInt(3, k.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
