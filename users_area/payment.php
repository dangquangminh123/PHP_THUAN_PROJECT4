<?php 
    include('../includes/connect.php');
    include('../functions/common_function.php');
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <!-- Bootstrap CSS Link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- css -->
</head>
<style>
    .payment_img {
        width: 90%;
        margin: auto;
        display: block;
    }
</style>
<body>
    <!-- php code -->
    <?php 
        $user_ip= getIPAddress();
        $get_user="SELECT * FROM `user_table` WHERE user_ip='$user_ip'";
        $result=mysqli_query($con,$get_user);
        $run_query=mysqli_fetch_array($result);
        $user_id=$run_query['user_id'];
    ?>
    <div class="container">
        <h2 class="text-center text-info">Payment options</h2>
        <div class="row d-flex justify-content-center align-items-center my-5">
            <div class="col-md-6">
                <form class='' method="POST" target="_blank" action="xulythanhtoanmomo.php?user_id=<?php echo $user_id; ?>"
                enctype="application/x-www-form-urlencoded">
                    <input type="submit" name="momo" value="Thanh toán MOMO ATM" class="btn btn-danger"/>
                </form>
            </div>
            <div class="col-md-6">
                <a href="order.php?user_id=<?php echo $user_id; ?>"><h2 class="text-center">Pay offline</h2></a>
            </div>
        </div>
    </div>
</body>
</html>