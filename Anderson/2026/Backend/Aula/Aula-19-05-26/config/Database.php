<?php
class Database {
    private static $instance = null;
    
    public static function getConnection() {
        if (!self::$instance) {
            self::$instance = new PDO("mysql:host=localhost;dbname=revenda_carros", "root", "", [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
            ]);
        }
        return self::$instance;
    }
}