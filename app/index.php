<?php
require_once __DIR__ . '/config.php';

// Display instance info (in ECS, this will show task info)
echo "<h1>ECS Containerized App</h1>";
echo "<p>Updated version!</p>";
echo "<p><strong>Container ID:</strong> " . gethostname() . "</p>";
echo "<p><strong>Server Time:</strong> " . date('Y-m-d H:i:s') . "</p>";

// Database connection test
try {
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    
    if ($conn->connect_error) {
        throw new Exception($conn->connect_error);
    }
    
    echo "<p><strong>Database:</strong> ✓ Connected to MySQL " . $conn->server_info . "</p>";
    
    // Simple query to prove it works
    $result = $conn->query("SELECT NOW() as db_time");
    $row = $result->fetch_assoc();
    echo "<p><strong>DB Server Time:</strong> " . $row['db_time'] . "</p>";
    
    $conn->close();
    
} catch (Exception $e) {
    echo "<p><strong>Database:</strong> ✗ Connection failed: " . $e->getMessage() . "</p>";
}
?>