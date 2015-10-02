<?php
    if (isset($_GET['conf'])) {
        if ($_GET['conf']=='ok') {
            echo "<div class='notif-ok' id='notif-ok'>";
            echo "<p>Vous avez bien été enregistré !</p>";
            echo "</div>";
        } else {
            echo "<div class='notif-error' id='notif-error'>";
            echo "<p>Erreur d'enregistrement</p>";
            echo "</div>";
        }
    }

    if (isset($_GET['log'])) {
        if ($_GET['log']=='ok') {
            echo "<div class='notif-ok' id='notif-ok'>";
            echo "<p>Vous êtes connecté !</p>";
            echo "</div>";
        } else {
            echo "<div class='notif-error' id='notif-error'>";
            echo "<p>Erreur de connexion</p>";
            echo "</div>";
        }
    }

?>