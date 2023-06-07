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
    <title>Admin Registration</title>
    <!-- Bootstrap CSS Link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            overflow: hidden;
        }
    </style>
</head>
<body>
    <div class="container-fluid m-3">
        <h2 class="text-center mb-5">Admin Registration</h2>
        <div class="row d-flex justify-content-center">
            <div class="col-lg-6 col-xl-5">
                <img src="../images/logoadmin.jpg" alt="Admin Registration" class="img-fluid"/>
            </div>

            <div class="col-lg-6 col-xl-4">
                <form action="" method="POST">
                    <div class="form-outline mb-4">
                        <label for="adminname" class="form-label">Username</label>
                        <input type="text" id="adminname" name="adminname" placeholder="Enter your name" required="required"
                        class="form-control"/>
                    </div>

                    <div class="form-outline mb-4">
                        <label for="email" class="form-label">Email</label>
                        <input type="text" id="email" name="email" placeholder="Enter your email" required="required"
                        class="form-control"/>
                    </div>

                    <div class="form-outline mb-4">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your Password" required="required"
                        class="form-control"/>
                    </div>

                    <div class="form-outline mb-4">
                        <label for="confirm_password" class="form-label">Confirm Password</label>
                        <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password" required="required"
                        class="form-control"/>
                    </div>

                    <div>
                        <input type="submit" class="bg-info py-2 px-3 border-0" name="admin_registratrion" value="Register"/>
                        <p class="small fw-bold mt-2 pt-1">Have you an account ? <a href="admin_login.php" class="link-danger">Login</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
   
</body>
</html>

<?php 
    if(isset($_POST['admin_registratrion'])) {
        $admin_name = $_POST['adminname'];
        $admin_email = $_POST['email'];
        $admin_password = $_POST['password'];
        $hash_password = password_hash($admin_password,PASSWORD_DEFAULT);
        $conf_admin_password = $_POST['confirm_password'];
        
        //Select query
        $select_query = "SELECT * FROM `admin_table` WHERE admin_name='$admin_name' OR admin_email='$admin_email'";
        $result=mysqli_query($con,$select_query);
        $rows_count= mysqli_num_rows($result);
        if($rows_count > 0) {
            echo "<script>alert('Username and Email already exist')</script>";
        }else if($admin_password!=$conf_admin_password){
            echo "<script>alert('Passwords do not match')</script>";
        }else {
             //insert query
            $insert_query = "INSERT INTO `admin_table` (admin_name,admin_email,admin_password) VALUES
            ('$admin_name','$admin_email','$hash_password')";
            $sql_execute=mysqli_query($con,$insert_query);
            if($sql_execute){
                echo "<script>alert('Data inserted successfully')</script>";
            }else {
                die(mysqli_error($con));
            }
        }
    }
?>