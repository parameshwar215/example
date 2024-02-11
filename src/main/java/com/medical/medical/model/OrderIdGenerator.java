package com.medical.medical.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class OrderIdGenerator {
    private static final String ORDER_ID_PREFIX = "ORD";
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyyMMddHHmmss");

    public String generateOrderId() {
        String timestamp = DATE_FORMAT.format(new Date());
        // You can add additional logic to make the order ID even more unique if needed
        return ORDER_ID_PREFIX + timestamp;
    }
}

