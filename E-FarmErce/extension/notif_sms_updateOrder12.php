<?php
require_once '../includes/db.php';

if (isset($_POST['change_status'])) {
    $status = $_POST['status'];
    $stat = $_POST['def_stat'];
    $mess = $_POST['message'];
    $number = $_POST['number'];
    $transact = $_POST['transact'];
    $ref = $_POST['order_ref'];

    if ($transact == 'Pick Up') {
        if ($stat == 'Pending') {
            $date = $_POST['date'] . '-' . $_POST['time'];
            $messdate = $mess . ' Date of Transaction: ' . $date;

            $stmt = $conn->prepare("UPDATE orders SET order_status = ?, order_delivery_date = ? WHERE order_reference = ?");
            $stmt->bind_param("sss", $status, $date, $ref);

            if ($stmt->execute()) {
                // Insert notification and send SMS message for each row
                $buyer_id = $_POST['buyer_id'];
                $seller_id = $_POST['seller_id'];

                // You can add your loop here to handle multiple rows

                // Insert notification
                $sqlNotif = "INSERT INTO notifications (seller_id, buyer_id, message, transact_code) VALUES (?, ?, ?, ?)";
                $stmtNotif = $conn->prepare($sqlNotif);
                $stmtNotif->bind_param("iiss", $seller_id, $buyer_id, $messdate, $ref);

                if ($stmtNotif->execute()) {
                    // Send SMS message
                    $ch = curl_init();
                    $parameters = array(
                        'apikey' => 'a98eb9abe2636f1d3c09370d98663a40',
                        'number' => $number,
                        'message' => $messdate,
                        'sendername' => ''
                    );

                    curl_setopt($ch, CURLOPT_URL, 'https://semaphore.co/api/v4/messages');
                    curl_setopt($ch, CURLOPT_POST, 1);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($parameters));
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

                    $output = curl_exec($ch);

                    if (curl_errno($ch)) {
                        echo 'CURL Error: ' . curl_error($ch);
                    } else {
                        echo "<script>alert('Registered Successfully! LOGIN'); window.location.href = document.referrer;</script>";
                    }

                    curl_close($ch);
                } else {
                    echo "Error inserting notification: ";
                }
            }
        }else{

            $stmt1 = $conn->prepare("UPDATE orders SET order_status = ? WHERE order_reference = ?");
            $stmt1->bind_param("ss", $status, $ref);

        if ($stmt1->execute()) {
            $buyer_id = $_POST['buyer_id'];
            $seller_id = $_POST['seller_id'];
            $sqlNotif = "INSERT INTO notifications (seller_id, buyer_id, message, transact_code) VALUES (?, ?, ?, ?)";
            
            $stmtNotif = $conn->prepare($sqlNotif);
            $stmtNotif->bind_param("iiss", $seller_id, $buyer_id, $mess, $ref);
            
            if ($stmtNotif->execute()) {
                $ch = curl_init();
                $parameters = array(
                    'apikey' => 'a98eb9abe2636f1d3c09370d98663a40',
                    'number' => $number,
                    'message' => $mess,
                    'sendername' => ''
                );
                
                curl_setopt($ch, CURLOPT_URL, 'https://semaphore.co/api/v4/messages');
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($parameters));
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                
                $output = curl_exec($ch);

                if (curl_errno($ch)) {
                    echo 'CURL Error: ' . curl_error($ch);
                } else {
                    echo "<script>alert('SUCCESSFULLY CHANGED'); window.location.href = document.referrer;</script>";
                }

                curl_close($ch);
            } else {
                echo "Error inserting notification: " . mysqli_error($conn);
            }

            $stmtNotif->close();
            }
        }

        }elseif($transact == 'Deliver'){
            if($stat == 'Pending'){
                $date = $_POST['date'];
                $messdate = $mess . 'Date of Transaction: ' . $date;
                $stmt = $conn->prepare("UPDATE orders SET order_status = ?, order_delivery_date = ? WHERE order_reference = ?");
                $stmt->bind_param("sss", $status, $date, $ref);
    
            if ($stmt->execute()) {
                $buyer_id = $_POST['buyer_id'];
                $seller_id = $_POST['seller_id'];
                $sqlNotif = "INSERT INTO notifications (seller_id, buyer_id, message, transact_code) VALUES (?, ?, ?, ?)";
                
                $stmtNotif = $conn->prepare($sqlNotif);
                $stmtNotif->bind_param("iiss", $seller_id, $buyer_id, $messdate, $ref);
                
                if ($stmtNotif->execute()) {
                    $ch = curl_init();
                    $parameters = array(
                        'apikey' => 'a98eb9abe2636f1d3c09370d98663a40',
                        'number' => $number,
                        'message' => $messdate,
                        'sendername' => ''
                    );
                    
                    curl_setopt($ch, CURLOPT_URL, 'https://semaphore.co/api/v4/messages');
                    curl_setopt($ch, CURLOPT_POST, 1);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($parameters));
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                    
                    $output = curl_exec($ch);
    
                    if (curl_errno($ch)) {
                        echo 'CURL Error: ' . curl_error($ch);
                    } else {
                        echo "<script>alert('Registered Successfully! LOGIN'); window.location.href = document.referrer;</script>";
                    }
    
                    curl_close($ch);
                } else {
                    echo "Error inserting notification: " . mysqli_error($conn);
                }
    
            }

    }else{
        $stmt = $conn->prepare("UPDATE orders SET order_status = ? WHERE order_reference = ?");
        $stmt->bind_param("ss", $status, $ref);

        if ($stmt->execute()) {
            $buyer_id = $_POST['buyer_id'];
            $seller_id = $_POST['seller_id'];
            $sqlNotif = "INSERT INTO notifications (seller_id, buyer_id, message, transact_code) VALUES (?, ?, ?, ?)";

            $stmtNotif = $conn->prepare($sqlNotif);
            $stmtNotif->bind_param("iiss", $seller_id, $buyer_id, $mess, $ref);
            
            if ($stmtNotif->execute()) {
                $ch = curl_init();
                $parameters = array(
                    'apikey' => 'a98eb9abe2636f1d3c09370d98663a40',
                    'number' => $number,
                    'message' => $mess,
                    'sendername' => ''
                );
                
                curl_setopt($ch, CURLOPT_URL, 'https://semaphore.co/api/v4/messages');
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($parameters));
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                
                $output = curl_exec($ch);

                if (curl_errno($ch)) {
                    echo 'CURL Error: ' . curl_error($ch);
                } else {
                    echo "<script>alert('SUCCESSFULLY CHANGED'); window.location.href = document.referrer;</script>";
                }

                curl_close($ch);
            } else {
                echo "Error inserting notification: " . mysqli_error($conn);
            }

            $stmtNotif->close();
        } else {
            echo "Error updating order: " . mysqli_error($conn);
        }
    }
}
}
?>
