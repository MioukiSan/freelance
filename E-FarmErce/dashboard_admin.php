<?php 
    require_once './includes/db.php';

    $admin = $_SESSION['user_id'];
    $query = "SELECT user_type FROM users WHERE user_id = '$admin'";
    $que = mysqli_query($conn, $query);
    $s = mysqli_fetch_assoc($que);
    $r = $s['user_type'];

    if($r != 'Admin'){
        header("location: ./index.php");
    }else{
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMIN MANAGEMENT</title>
    <?php require_once './includes/head.php'; ?>
</head>
<body class="pad">
    <div class="container">
        <?php require_once './includes/sidenav.php';?>
        <div class="row">
        <h1 style="padding-top: 10px;">ADMIN DASHBOARD</h1>
            <div class="col-xl-3 col-md-4 mb-4">
                <div class="card card-custom shadow py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="font-weight-bold text-primary text-uppercase mb-1" style="font-size: small;">
                                    TOTAL ORDERS</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" style="font-size: x-large;"></div>
                            </div>
                            <div class="col-auto text-primary">
                                <ion-icon size="large" name="receipt-outline"></ion-icon>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-4 mb-4">
                <div class="card card-custom shadow py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="font-weight-bold text-info text-uppercase mb-1" style="font-size: small;">
                                    TOTAL SALES</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" style="font-size: x-large;"></div>
                            </div>
                            <div class="col-auto text-info">
                                <ion-icon size="large" name="bar-chart-outline"></ion-icon>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-4 mb-4">
                <div class="card card-custom shadow py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="font-weight-bold text-warning text-uppercase mb-1" style="font-size: small;">
                                    ACTIVE USERS</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" style="font-size: x-large;"></div>
                            </div>
                            <div class="col-auto text-warning">
                                <ion-icon size="large" name="people-circle-outline"></ion-icon>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-4 mb-4">
                <div class="card card-custom shadow py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="font-weight-bold text-success text-uppercase mb-1" style="font-size: small;">
                                    PRODUCTS</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800" style="font-size: x-large;"></div>
                            </div>
                            <div class="col-auto text-success">
                                <ion-icon size="large" name="nutrition-outline"></ion-icon>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>