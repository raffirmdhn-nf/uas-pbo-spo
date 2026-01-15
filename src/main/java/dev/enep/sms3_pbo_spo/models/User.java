/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.models;

import dev.enep.sms3_pbo_spo.utils.Formatter;
import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 *
 * @author admin
 */
public class User implements Serializable {

    private int id, role_id;
    private String username, password, role_nama;
    private Timestamp deleted_at, created_at, updated_at;

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getRole_nama() {
        return role_nama;
    }

    public void setRole_nama(String role_nama) {
        this.role_nama = role_nama;
    }

    public Timestamp getDeleted_at() {
        return deleted_at;
    }

    public void setDeleted_at(Timestamp deleted_at) {
        this.deleted_at = deleted_at;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    // --- formatted getters ---
    public String getFormattedCreatedAt() {
        return Formatter.formatTimestamp(created_at);
    }

    public String getFormattedUpdatedAt() {
        return Formatter.formatTimestamp(updated_at);
    }

    public String getFormattedDeletedAt() {
        return Formatter.formatTimestamp(deleted_at);
    }
}
