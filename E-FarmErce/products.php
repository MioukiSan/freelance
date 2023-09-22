<?php
    require_once './includes/db.php';

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <?php require_once './includes/head.php'; ?>
</head>
<body>
    <?php require_once './includes/navbar.php';?>
    <div class="container">
        <div class="row">
            <form class="d-flex mt-4" action="?query"  method="GET" role="search">
              <input class="form-control form-control-lg" type="search" name="searchprod" placeholder="Search products" aria-label="Search">
              <button class="btn btn-outline-success" type="submit">Search</button>
           </form>
        </div>
        <div class="col-md-12 pt-3">
            <div class="row row-cols-1 row-cols-md-4 g-4">
            <?php
            if (isset($_GET['searchprod'])) {
                $searchkey = $_GET['searchprod'];
                $query = "SELECT * FROM products 
                        WHERE (product_name LIKE ? OR product_cat LIKE ?)
                        AND product_status = 'On Sale'
                        AND product_stock > min_order
                        ORDER BY date_added DESC";
                $searchkeyWithWildcards = '%' . $searchkey . '%';
                $stmt = mysqli_prepare($conn, $query);
                mysqli_stmt_bind_param($stmt, "ss", $searchkeyWithWildcards, $searchkeyWithWildcards);
                mysqli_stmt_execute($stmt);
                $results = mysqli_stmt_get_result($stmt);
            } else {
                $query = "SELECT * FROM products WHERE product_status = 'On Sale' AND product_stock > min_order ORDER BY date_added DESC";
                $results = mysqli_query($conn, $query);
            }
            foreach ($results as $row) {
            ?>
                <button class="btn" type="button mx-auto" data-bs-toggle="modal" data-bs-target="#itemModal<?=$row['product_id']?>">
                    <div class="col h-100">
                        <div class="card">
                            <img  style="width: 100%; height: 15em; max-width: 500px;" src="./images/<?= $row['product_img'] ?>">
                            <div class="card-body">
                                <h5 class="card-title"><?= $row['product_name']; ?></h5>
                                Price: <?= CURRENCY .  number_format($row['product_price'],2) ?> per kg<br>
                                Stock: <?= $row['product_stock'] ?>kg<br>
                            </div>
                        </div>
                    </div>
                </button>
                <div class="modal fade" id="itemModal<?=$row['product_id']?>" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-7">
                                        <img style="height: auto; width: 100%;" src="./images/<?= $row['product_img'] ?>">
                                    </div>
                                    <div class="col-md-5">
                                        <b>Name:</b> <?= $row['product_name'] ?><br>
                                        <b>Product Price:</b><br> <?= CURRENCY .  number_format($row['product_price'],2) ?> per kg<br>
                                        <b> Stock:</b> <?= $row['product_stock'] ?>kg<br>
                                        <b>Minimum Order :</b>  <?= $row['min_order'] ?> kg<br>
                                        <b>Product Details:<br></b>  <?= $row['product_details'] ?><br>
                                        <div class="form-group mb-3 mt-3">
                                        <form action="./extension/add_cart.php" method="POST">
                                            <label for="qty" class="mb-3"><b>Quantity</b></label>
                                            <input type="number" name="qty" class="form-control" value="<?php echo $row['min_order'] ?>" min="<?php echo $row['min_order'] ?>" max="<?php echo $row['product_stock'] ?>">
                                        </div>
                                        <div class="float-end d-flex">
                                            <input type="hidden" name="user_id" value="<?php echo $user_id; ?>">
                                            <input type="hidden" name="product_id" value="<?= $row['product_id']; ?>">
                                            <button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
                                            <?php if ($user_id != 0) { ?>
                                                <button type="submit" class="btn btn-outline-success" name="addcart">Add to Cart</button>
                                            <?php } else { ?>
                                                <button type="button" class="btn btn-outline-success" onclick="openLoginModal(<?=$row['product_id']?>)">
                                                    Add to Cart
                                                </button>
                                            <?php  } ?>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    function openLoginModal(product_id) {
                        $('#itemModal' + product_id).modal('hide');
                        $('#loginModal').modal('show'); 
                    }
                </script>
            <?php } ?>
            </div>
        </div>
    </div>
</body>
</html>
