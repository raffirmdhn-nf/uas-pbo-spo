/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dev.enep.sms3_pbo_spo.utils;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 *
 * @author raffi
 */
public class Formatter {

    private static final String DEFAULT_DATE_FORMAT = "yyyy-MM-dd"; // untuk expired_date
    private static final String DEFAULT_TIMESTAMP_FORMAT = "dd/MM/yyyy HH:mm:ss"; // untuk updated_at

    // --- format Date ---
    public static String formatDate(Date date) {
        if (date == null) {
            return "";
        }
        return formatDate(date, DEFAULT_DATE_FORMAT);
    }

    public static String formatDate(Date date, String pattern) {
        if (date == null) {
            return "";
        }
        return new SimpleDateFormat(pattern).format(date);
    }

    // --- format Timestamp ---
    public static String formatTimestamp(Timestamp ts) {
        if (ts == null) {
            return "";
        }
        return formatTimestamp(ts, DEFAULT_TIMESTAMP_FORMAT);
    }

    public static String formatTimestamp(Timestamp ts, String pattern) {
        if (ts == null) {
            return "";
        }
        return new SimpleDateFormat(pattern).format(ts);
    }
}
