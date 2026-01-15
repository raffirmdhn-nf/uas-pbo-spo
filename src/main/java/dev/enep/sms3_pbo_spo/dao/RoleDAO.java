/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.dao;

import dev.enep.sms3_pbo_spo.models.KategoriObat;
import dev.enep.sms3_pbo_spo.models.Role;
import dev.enep.sms3_pbo_spo.utils.KoneksiDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author raffi
 */
public class RoleDAO {

    public List<Role> findAll() {
        List<Role> list = new ArrayList<>();
        String sql = "SELECT id, nama FROM role";
        try (Connection c = KoneksiDB.getConnection(); Statement st = c.createStatement(); ResultSet rs = st.executeQuery(sql);) {
            while (rs.next()) {
                Role k = new Role();
                k.setId(rs.getInt("id"));
                k.setNama(rs.getString("nama"));

                list.add(k);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
