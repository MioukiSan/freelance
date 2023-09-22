<?php
require_once '../includes/db.php';

if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $password = $_POST['pass'];

    // Validate input (you can add more validation as needed)
    if (empty($email) || empty($password)) {
        echo "Email and password are required.";
    } else {
        // Check if the email exists in the database
        $sql = "SELECT * FROM users WHERE email = '$email' OR number = '$email'";
        $result = $conn->query($sql);

        if ($result->num_rows === 1) {
            $row = $result->fetch_assoc();
            $stored_password = $row['password'];
            $user_type = $row['user_type'];

            // Compare the provided password to the stored password
            if ($password === $stored_password) {
                $_SESSION['user_id'] = $row['user_id'];
                $_SESSION['email'] = $row['email'];
                $_SESSION['user_type'] = $user_type;

                // Redirect based on user type
                if ($user_type === 'Admin') {
                    header("location: ../dashboard_admin.php");
                } elseif ($user_type === 'Seller') {
                    header("location: ../index.php");
                } elseif ($user_type === 'Buyer') {
                    header("location: ../index.php");
                } else {
                    echo "Unknown user type. Please contact the administrator.";
                }
                exit();
            } else {
                echo '<script>alert("Incorrect password. Please try again.")</script>';
                header("location: ../index.php");
                exit;
            }
        } else {
            echo '<script>alert("Email not found. Register first.")</script>';
            header("location: ../index.php");
            exit();
        }
    }
}
?>
