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
}
