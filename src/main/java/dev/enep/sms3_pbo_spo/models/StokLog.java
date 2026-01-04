/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.models;

import dev.enep.sms3_pbo_spo.utils.Formatter;
import java.sql.Timestamp;

/**
 *
 * @author raffi
 */
public class StokLog {

    private int id, stok_awal, stok_akhir, obat_id, user_id;
    private String keterangan, obat_nama, user_nama;
    private Timestamp created_at;

    public StokLog() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStok_awal() {
        return stok_awal;
    }

    public void setStok_awal(int stok_awal) {
        this.stok_awal = stok_awal;
    }

    public int getStok_akhir() {
        return stok_akhir;
    }

    public void setStok_akhir(int stok_akhir) {
        this.stok_akhir = stok_akhir;
    }

    public int getObat_id() {
        return obat_id;
    }

    public void setObat_id(int obat_id) {
        this.obat_id = obat_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getKeterangan() {
        return keterangan;
    }

    public void setKeterangan(String keterangan) {
        this.keterangan = keterangan;
    }

    public String getObat_nama() {
        return obat_nama;
    }

    public void setObat_nama(String obat_nama) {
        this.obat_nama = obat_nama;
    }

    public String getUser_nama() {
        return user_nama;
    }

    public void setUser_nama(String user_nama) {
        this.user_nama = user_nama;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    // --- formatted getter ---
    public String getFormattedCreatedAt() {
        return Formatter.formatTimestamp(created_at);
    }
}
