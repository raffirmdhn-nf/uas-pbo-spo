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
        String sql = "SELECT id, nama, stok, expired_date, created_at, updated_at FROM obat WHERE deleted_at IS NULL";

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
                
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Obat findById(int id) throws Exception {
        Obat obat = new Obat();
        String sql = "SELECT id, nama, stok, expired_date, created_at, updated_at FROM obat WHERE id = ? AND deleted_at IS NULL";

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

    public void update(Obat o) throws Exception {
        String sql = "UPDATE obat SET nama = ?, stok = ?, expired_date = ? WHERE id = ?";

        try {
            Connection c = KoneksiDB.getConnection();
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, o.getNama());
            ps.setInt(2, o.getStok());
            ps.setDate(3, o.getExpired_date());
            ps.setInt(4, o.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
