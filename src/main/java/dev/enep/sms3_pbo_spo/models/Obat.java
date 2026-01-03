/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.models;

import java.sql.Date;

/**
 *
 * @author raffi
 */
public class Obat {
    private int id, stok;
    private String nama;
    private Date expired_date;

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

    @Override
    public String toString() {
        return "KategoriObat{" + "id=" + id + ", stok=" + stok + ", nama=" + nama + ", expired_date=" + expired_date + '}';
    }
}
