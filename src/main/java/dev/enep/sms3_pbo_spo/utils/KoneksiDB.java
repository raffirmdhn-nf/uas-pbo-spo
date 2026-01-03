package dev.enep.sms3_pbo_spo.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class KoneksiDB {

    public static Connection getConnection() {
        try {
            // Memastikan load driver karna deep package (package dev.enep.sms3_pbo_spo.utils)
            Class.forName("org.postgresql.Driver");
            
            String url = "jdbc:postgresql://localhost:5432/db_pbo_spo";
            String user = "postgres";
            String pass = "123"; //ganti    dengan password masing-masing

            return DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            e.printStackTrace(); // WAJIB
            System.out.println("Koneksi gagal: " + e.getMessage());
            return null;
        }
    }

    public static void main(String[] args) {
        if (KoneksiDB.getConnection() != null) {
            System.out.println("Koneksi berhasil");
        }
    }
}
