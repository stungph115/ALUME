 
 <?php 
    require_once("fonction.php");
?>
 
 <!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PPE</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="header-top">
            <div class="container">
                <div class="ht-left">
                    <div class="mail-service">
                        <i class=" fa fa-envelope"></i>
                        alu-me.marseille@gmail.com
                    </div>
                    <div class="phone-service">
                        <i class=" fa fa-phone"></i>
                        +33 456 789 123
                    </div>
                </div>
                <div class="ht-right">
                     
                    <a href="login.php" class="login-panel"><i class="fa fa-user"></i>Mon compte</a>
                   
                    <div class="top-social">
                        <a href="#"><i class="ti-facebook"></i></a>
                        <a href="#"><i class="ti-twitter-alt"></i></a>
                        <a href="#"><i class="ti-linkedin"></i></a>
                        <a href="#"><i class="ti-pinterest"></i></a>
                    </div>
                   
                </div>
            </div>
        </div>
        <div class="container">
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="index.php">
                                <img src="img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                            <button type="button" class="category-btn">Nos cat??gories</button>
                            <div class="input-group">
                                <input type="text" placeholder="Dites-moi ce que vous voulez?">
                                <button type="button"><i class="ti-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container">
                
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="index.php">Accueil</a></li>
                        <li><a href="membre.php">Espace client</a></li>
                        <li><a href="#">Nos produits</a>
                            <ul class="dropdown">
                                <li><a href="porte.php">Porte d'entr??e</a></li>
                                <li><a href="fenetre.php">Fen??tre</a></li>
                                <li><a href="loggia.php">Loggia</a></li>
                            </ul>
                        </li>
                        <li class="active"><a href="commande.php">Mes commandes</a></li>
                        <li><a href="contact.php">Contact</a></li>
                        <li><a href="#">Pages</a>
                            <ul class="dropdown">
                                <li><a href="#">Blog Details</a></li>
                                <li><a href="#">Shopping Cart</a></li>
                                <li><a href="#">Checkout</a></li>
                                <li><a href="#">Faq</a></li>
                                <li><a href="#">Register</a></li>
                                <li><a href="#">Login</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End --> 
        <!-- Shopping Cart Section Begin -->
    <section class="checkout-section spad">
        <div class="container">
            <form action="#" class="checkout-form">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="checkout-content">
                            <a href="login.php" class="content-btn">Identifiez-vous</a>
                        </div>
                        <h4>Vous n'??tes pas encore client chez nous?</h4>
                        <div class="row">
                           <form method="POST" action ="">

                            <div class="col-lg-6">
                                <label for="Email">Votre Email<span>*</span></label>
                                <input type="text" name="EMAIL">
                            </div>
                            <div class="col-lg-6">
                                <label for="passe"> Mot de passe<span>*</span></label>
                                <input type="text" name="MDP">
                            </div>
                            <div class="col-lg-12">
                                <label for="nom">Votre nom</label>
                                <input type="text" name="NOM">
                            </div>
                            <div class="col-lg-12">
                                <label for="TEL">Votre num??ro de t??l??phone</label>
                                <input type="text" name="TEL">
                            </div>
                            
                            <div class="col-lg-12">
                                <div class="create-item">
                                    <label for="acc-create">
                                       
                                        <button type="submit" value="submit" name="submit" class="site-btn register-btn"> Cr??er un compte</button>
                                    </label>
                                </div>
                            </div>
                        </form>
                            <?php
                            if (isset($_POST['submit']))
                                {
                                    insertclient($_POST);
                                    echo "<br/> Insertion reussie </br>";

                                }
                            ?>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="checkout-content">
                            <input type="text" placeholder="Enter Your Coupon Code">
                        </div>
                        <div class="place-order">
                            <h4>Votre commande</h4>
                            <div class="order-total">
                                <ul class="order-table">
                                    <li>Ligne commande <span>Total</span></li>
                                    <li class="fw-normal">Fen??tre rond x 1 <span>369,00 ???</span></li>
                                    <li class="fw-normal">Porte Muse x 1 <span>2299,00 ???</span></li>
                                    <li class="fw-normal">Toit de terrasse x 1 <span>849,15 ???</span></li>
                                    <li class="fw-normal">frais de port <span>offert</span></li>
                                    <li class="total-price">Total <span>3517,15 ???</span></li>
                                </ul>
                                <div class="payment-check">
                                    <div class="pc-item">
                                        <label for="pc-check">
                                            Cheque Payement
                                            <input type="checkbox" id="pc-check">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="pc-item">
                                        <label for="pc-paypal">
                                            Paypal
                                            <input type="checkbox" id="pc-paypal">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="order-btn">
                                    <button type="submit" class="site-btn place-btn">commander</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
     <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer-left">
                        <div class="footer-logo">
                            <a href="#"><img src="img/footer-logo.jpg" alt=""></a>
                        </div>
                        <ul>
                            <li>Adresse: 387 Boulevard National 13003 Marseille</li>
                            <li>Phone: +33 456 789 123</li>
                            <li>Email: alu-me.marseille@gmail.com</li>
                        </ul>
                        <div class="footer-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1">
                    <div class="footer-widget">
                        <h5>Information</h5>
                        <ul>
                            <li><a href="#">Qui sommes nous ?</a></li>
                            <li><a href="#">Check-out</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Serivius</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="footer-widget">
                        <h5>Mon compte</h5>
                        <ul>
                            <li><a href="#">Mon compte</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Shopping Cart</a></li>
                            <li><a href="#">Achat</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="newslatter-item">
                        <h5>Rejoignez notre newsletter maintenant</h5>
                        <p>Recevez des mises ?? jour par e-mail sur notre derni??re produit et nos offres sp??ciales.</p>
                        <form action="#" class="subscribe-form">
                            <input type="text" placeholder="Enter Your Mail">
                            <button type="button">Souscrire</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-reserved">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright-text">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | PHAM Son Tung
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                        <div class="payment-pic">
                            <img src="img/payment-method.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/jquery.dd.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>