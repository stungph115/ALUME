<?php
function connexion()
{
    $con=mysqli_connect("localhost","root","","PPE");
    if ($con == null)
    {
        echo "<br/> Erreur de connexion au serveur !</br>";
    }
    return $con;
}
function deconnexion($con)
{
    mysqli_close ($con);
}

//register
function insertclient($tab)
{
    
                        
                $con = connexion ();
                    if ($con != null)                            
                        {
                        $requete="insert into client values (null,'".$_POST['NOM']."','".$_POST['EMAIL']."','".$_POST['TEL']."','".$_POST['MDP']."'); ";
                            
                        mysqli_query($con, $requete);
                        mysqli_close($con);
                        }
 }

//espace client
function selectAllclient()

{
    $con=connexion();
    if ($con != null)
        {
            $requete= "select * from client; ";
            $resultats= mysqli_query ($con,$requete);
            deconnexion($con);
            return $resultats ;
        }
}
