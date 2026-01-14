/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.dao;

import dev.enep.sms3_pbo_spo.models.Obat;
import dev.enep.sms3_pbo_spo.utils.KoneksiDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author noval
 */
public class ObatDAO {

    public void insert(Obat o) throws Exception {
        String sql = "INSERT INTO obat (nama, stok, expired_date, kategori_id) VALUES (?, ?, ?, 1)";

        try {
            Connection c = KoneksiDB.getConnection();
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, o.getNama());
            ps.setInt(2, o.getStok());
            ps.setDate(3, o.getExpired_date());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Obat> findAll() throws Exception {
        List<Obat> list = new ArrayList<>();
        String sql = "SELECT obat.id, obat.nama, obat.stok, obat.expired_date, obat.created_at, obat.updated_at, obat.kategori_id, kategori.nama as kategori_nama FROM obat LEFT JOIN kategori ON obat.kategori_id = kategori.id WHERE obat.deleted_at IS NULL ORDER BY id";

        try {
            Connection c = KoneksiDB.getConnection();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                Obat o = new Obat();
                o.setId(rs.getInt("id"));
                o.setNama(rs.getString("nama"));
                o.setStok(rs.getInt("stok"));
                o.setExpired_date(rs.getDate("expired_date"));
                o.setUpdated_at(rs.getTimestamp("updated_at"));
                o.setKategori_id(rs.getInt("kategori_id"));
                o.setKategori_nama(rs.getString("kategori_nama"));

                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Obat findById(int id) throws Exception {
        Obat obat = new Obat();
        String sql = "SELECT obat.id, obat.nama, obat.stok, obat.expired_date, obat.created_at, obat.updated_at, obat.kategori_id, kategori.nama as kategori_nama FROM obat LEFT JOIN kategori ON obat.kategori_id = kategori.id WHERE obat.id = ? AND obat.deleted_at IS NULL";

        try {
            Connection c = KoneksiDB.getConnection();
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                obat.setId(rs.getInt("id"));
                obat.setNama(rs.getString("nama"));
                obat.setStok(rs.getInt("stok"));
                obat.setExpired_date(rs.getDate("expired_date"));
                obat.setKategori_id(rs.getInt("kategori_id"));
                obat.setKategori_nama(rs.getString("kategori_nama"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return obat;
    }

    public void softDelete(int id) throws Exception {
        String sql = "UPDATE obat SET deleted_at = CURRENT_TIMESTAMP WHERE id = ?";
        Connection c = KoneksiDB.getConnection();
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    public void update(Obat o, Obat oldO, int userId) throws Exception {
        try (Connection c = KoneksiDB.getConnection()) {
            // Update obat
            String sqlUpdate = "UPDATE obat SET nama = ?, stok = ?, expired_date = ?, kategori_id = ? WHERE id = ?";
            try (PreparedStatement ps = c.prepareStatement(sqlUpdate)) {
                ps.setString(1, o.getNama());
                ps.setInt(2, o.getStok());
                ps.setDate(3, o.getExpired_date());
                ps.setInt(4, o.getKategori_id());
                ps.setInt(5, o.getId());
                ps.executeUpdate();
            }

            // Insert log jika stok berubah
            if (oldO.getStok() != o.getStok()) {
                String sqlLog = "INSERT INTO stok_log (keterangan, stok_awal, stok_akhir, obat_id, user_id) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement psLog = c.prepareStatement(sqlLog)) {
                    psLog.setString(1, "Perubahan stok"); // bisa ganti sesuai kebutuhan
                    psLog.setInt(2, oldO.getStok());
                    psLog.setInt(3, o.getStok());
                    psLog.setInt(4, o.getId());
                    psLog.setInt(5, userId);
                    psLog.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void tambahStok(Obat o, int userId) throws Exception {
        try (Connection c = KoneksiDB.getConnection()) {
            // Update stok
            try (PreparedStatement ps = c.prepareStatement("UPDATE obat SET stok = stok + 1 WHERE id = ?")) {
                ps.setInt(1, o.getId());
                ps.executeUpdate();
            }

            // Insert log
            try (PreparedStatement psLog = c.prepareStatement(
                    "INSERT INTO stok_log (keterangan, stok_awal, stok_akhir, obat_id, user_id) VALUES (?, ?, ?, ?, ?)")) {
                psLog.setString(1, "Tambah 1 stok");
                psLog.setInt(2, o.getStok());
                psLog.setInt(3, o.getStok() + 1);
                psLog.setInt(4, o.getId());
                psLog.setInt(5, userId);
                psLog.executeUpdate();
            }
        }
    }

    public void kurangStok(Obat o, int userId) throws Exception {
        try (Connection c = KoneksiDB.getConnection()) {
            // Update stok
            try (PreparedStatement ps = c.prepareStatement("UPDATE obat SET stok = stok - 1 WHERE id = ?")) {
                ps.setInt(1, o.getId());
                ps.executeUpdate();
            }

            // Insert log
            try (PreparedStatement psLog = c.prepareStatement(
                    "INSERT INTO stok_log (keterangan, stok_awal, stok_akhir, obat_id, user_id) VALUES (?, ?, ?, ?, ?)")) {
                psLog.setString(1, "Kurangi 1 stok");
                psLog.setInt(2, o.getStok());
                psLog.setInt(3, o.getStok() - 1);
                psLog.setInt(4, o.getId());
                psLog.setInt(5, userId);
                psLog.executeUpdate();
            }
        }
    }

    public void soft(int parseInt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
