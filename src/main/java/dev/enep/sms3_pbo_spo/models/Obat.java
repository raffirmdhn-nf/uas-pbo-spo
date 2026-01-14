/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.models;

import dev.enep.sms3_pbo_spo.utils.Formatter;
import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author raffi
 */
public class Obat {

    private int id, stok, kategori_id;
    private String nama, kategori_nama;
    private Date expired_date;
    private Timestamp updated_at;

    public Obat() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStok() {
        return stok;
    }

    public void setStok(int stok) {
        this.stok = stok;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public Date getExpired_date() {
        return expired_date;
    }

    public void setExpired_date(Date expired_date) {
        this.expired_date = expired_date;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    public int getKategori_id() {
        return kategori_id;
    }

    public void setKategori_id(int kategori_id) {
        this.kategori_id = kategori_id;
    }

    public String getKategori_nama() {
        return kategori_nama;
    }

    public void setKategori_nama(String kategori_nama) {
        this.kategori_nama = kategori_nama;
    }

    // --- getter formatted ---
    public String getFormattedExpiredDate() {
        return Formatter.formatDate(expired_date);
    }

    public String getFormattedUpdatedAt() {
        return Formatter.formatTimestamp(updated_at);
    }
}
