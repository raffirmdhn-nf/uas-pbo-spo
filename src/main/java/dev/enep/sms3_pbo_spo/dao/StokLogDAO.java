/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.dao;

import dev.enep.sms3_pbo_spo.models.StokLog;
import dev.enep.sms3_pbo_spo.utils.KoneksiDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author raffi
 */
public class StokLogDAO {

    public List<StokLog> findAll(int lastId, int limit) throws SQLException {
        String sql = "SELECT sl.id, sl.keterangan, sl.stok_awal, sl.stok_akhir, sl.obat_id, o.nama as obat_nama, u.username as user_nama, sl.created_at "
                + "FROM stok_log sl "
                + "LEFT JOIN obat o ON sl.obat_id = o.id "
                + "LEFT JOIN users u ON sl.user_id = u.id "
                + "ORDER BY sl.id DESC";
        List<StokLog> list = new ArrayList<>();
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    StokLog sl = new StokLog();
                    sl.setId(rs.getInt("id"));
                    sl.setKeterangan(rs.getString("keterangan"));
                    sl.setStok_awal(rs.getInt("stok_awal"));
                    sl.setStok_akhir(rs.getInt("stok_akhir"));
                    sl.setObat_id(rs.getInt("obat_id"));
                    sl.setObat_nama(rs.getString("obat_nama"));
                    sl.setUser_nama(rs.getString("user_nama"));
                    sl.setCreated_at(rs.getTimestamp("created_at"));

                    list.add(sl);
                }
            }
            return list;
        }
    }
    
    public List<Object[]> getStokLogPerBulan(int tahun) throws SQLException {
        String sql = "SELECT "
                + "    EXTRACT(MONTH FROM created_at)::integer as bulan, "
                + "    COUNT(CASE WHEN keterangan ILIKE 'Tambah%' THEN 1 END) as stok_masuk, "
                + "    COUNT(CASE WHEN keterangan ILIKE 'Kurangi%' THEN 1 END) as stok_keluar "
                + "FROM stok_log "
                + "WHERE EXTRACT(YEAR FROM created_at) = ? "
                + "GROUP BY EXTRACT(MONTH FROM created_at) "
                + "ORDER BY bulan";

        List<Object[]> data = new ArrayList<>();
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, tahun);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Object[] row = new Object[3];
                    row[0] = rs.getInt("bulan");      // Bulan (1-12)
                    row[1] = rs.getInt("stok_masuk");  // Jumlah stok masuk
                    row[2] = rs.getInt("stok_keluar"); // Jumlah stok keluar
                    data.add(row);
                }
            }
        }
        return data;
    }

    public List<Integer> getAvailableYears() throws SQLException {
        String sql = "SELECT DISTINCT YEAR(created_at) as tahun "
                + "FROM stok_log "
                + "ORDER BY tahun DESC";

        List<Integer> years = new ArrayList<>();
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                years.add(rs.getInt("tahun"));
            }
        }
        return years;
    }
}
