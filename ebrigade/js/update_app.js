function logEvent(message, withTime=1) {
    var logElem = document.querySelector(".upgrade_report");

    if ( withTime == 1 ) {
        var time = new Date();
        var timeStr = time.toLocaleTimeString();
        logElem.innerHTML += "<strong>"+ timeStr + "</strong> " + message + "<br/>";
    }
    else {
        logElem.innerHTML +=  message + "<br/>";
    }
}

function confirm_maj() {
    swal("Voulez�vous�faire�la<br>mise�� jour�vers "+ newversion + " maintenant?<br>Cette op�ration�prendra�quelques�secondes, voire minutes. Les utilisateurs ne pourront pas se connecter pendant cette courte p�riode.",
    {addButton: 1, classButton: "btn-primary confirm", textButton: "Confirmer"},
    {class: 'icon swal2-info', style: 'flex', disableButton: 0});

    $('.confirm').on('click', function() {
        closeSwal();
        document.getElementById("update_button").style.display = "none";
        logEvent("<b>D�but mise � jour</b>");
        maintenance_on ();
        return 0;
    });
}

function maintenance_on () {
    // activate maintenance mode
    logEvent("Passage de la base en mode maintenance <div id='spin_0' style='display: inline'><i class='fas fa-cog fa-spin fa-lg' title='maintenance mode'></i></div>");
    $.ajax({type: "POST", url: 'update_app.php', dataType: 'json', data: {reason: 'maintenance_on'},
        success: function() {
            document.getElementById("spin_0").innerHTML  = "<i class='fa fa-check' style='color:green' title='passsage en mode maintenance r�ussi'></i>";
            logEvent("Maintenance mode activ� <i class='fa fa-check' style='color:green' title='Maintenance mode activ�'></i>");
            download ();
        },
        error: function() {
            document.getElementById("spin_0").innerHTML  = "<i class='fas fa-exclamation-circle' style='color:red' title='erreur lors du passsage en mode maintenance'></i>";
            logEvent("Une�erreur�est�survenu�lors du passage en mode maintenance. <i class='fas fa-exclamation-circle'  style='color:red' title='erreur mode maintenance'></i>");
            return 1;
        }
    });
    return 0;
}

function download () {
    // download new package
    logEvent("D�but t�l�chargement du nouveau package <div id='spin_1' style='display: inline'><i class='fas fa-cog fa-spin fa-lg' title='t�l�chargement en cours'></i></div>");
    $.ajax({type: "POST", url: 'download_package.php', dataType: 'json', data: {package: newpackage, md5sum: md5, reason: 'Mise a jour'},
        success: function() {
            document.getElementById("spin_1").innerHTML  = "<i class='fa fa-check' style='color:green' title='t�l�chargement r�ussi'></i>";
            logEvent("T�l�chargement r�ussi de <b>" + newpackage +"</b> <i class='fa fa-check' style='color:green' title='t�l�chargement r�ussi'></i>");
            if ( auto_backup == 1 ) backup ();
            else unzip ();
        },
        error: function() {
            document.getElementById("spin_1").innerHTML  = "<i class='fas fa-exclamation-circle' style='color:red' title='erreur lors du t�l�chargement'></i>";
            logEvent("Une�erreur�est�survenu�lors�du�t�l�chargement�de�la�mise�� jour. Veuillez�r�essayer�plus�tard. <i class='fas fa-exclamation-circle'  style='color:red' title='erreur lors du t�l�chargement'></i>");
            return 1;
        }
    });
    return 0;
}

function backup () {
    // backup if needed
    logEvent("D�but Backup de la base de donn�es <div id='spin_2' style='display: inline'><i class='fas fa-cog fa-spin fa-lg' title='backup'></i></div>");
    $.ajax({type: "POST", url: 'update_app.php', dataType: 'json', data: {reason: 'backup'},
        success: function() {
            document.getElementById("spin_2").innerHTML  = "<i class='fa fa-check' style='color:green' title='database backup r�ussi'></i>";
            logEvent("Database backup r�ussi <i class='fa fa-check' style='color:green' title='backup r�ussi'></i>");
            unzip ();
        },
        error: function() {
            document.getElementById("spin_2").innerHTML  = "<i class='fas fa-exclamation-circle' style='color:red' title='erreur lors du backup'></i>";
            logEvent("Une�erreur�est�survenu�lors�du backup de la database. <i class='fas fa-exclamation-circle'  style='color:red' title='erreur lors du backup'></i>");
            return 1;
        }
    });
    return 0;
}

function unzip () {
    // unzip
    logEvent("D�but extraction de "+ newpackage +" <div id='spin_3' style='display: inline'><i class='fas fa-cog fa-spin fa-lg' title='unzip'></i></div>");
    $.ajax({type: "POST", url: 'update_app.php', dataType: 'json', data: {package: newpackage, reason: 'unzip'},
        success: function() {
            document.getElementById("spin_3").innerHTML  = "<i class='fa fa-check' style='color:green' title='unzip r�ussi'></i>";
            logEvent("Extraction r�ussie <i class='fa fa-check' style='color:green' title='unzip r�ussi'></i>");
            db_upgrade ();
        },
        error: function() {
            document.getElementById("spin_3").innerHTML  = "<i class='fas fa-exclamation-circle' style='color:red' title='erreur lors unzip'></i>";
            logEvent("Une�erreur�est�survenu�lors�de l'extraction des nouveaux fichiers. <i class='fas fa-exclamation-circle'  style='color:red' title='erreur lors unzip'></i>");
            return 1;
        }
    });
    return 0;
}

function db_upgrade () {
    // db_upgrade
    logEvent("D�but upgrade database vers <b>"+ newversion +"</b> <div id='spin_4' style='display: inline'><i class='fas fa-cog fa-spin fa-lg' title='db_upgrade'></i></div>");
    $.ajax({type: "POST", url: 'update_app.php', dataType: 'json', data: {package: newpackage, reason: 'db_upgrade'},
        success: function (data) {
            if (data == 2) {
                closeSwal();
                document.getElementById("spin_4").innerHTML  = "<i class='fas fa-exclamation-circle' style='color:red' title='version de la base incompatible avec les fichiers.'></i>";
                swal("La base de donn�es est incompatible avec le code de l'application web<br>\
                version de l'application web:<b> "+newversion+"</b><br>\
                version requise pour la base de donn�es:<b> "+newdbversion+"</b><br>\
                Vous devez manuellement ex�cuter les fichiers d'upgrade sur la base(voir r�pertoire sql)<br>\
                Vous devez d�sactiver manuellement <br>le mode maintenance");
                logEvent("Erreur: Pas de fichier sql d'upgrade trouv� <i class='fas fa-exclamation-circle' style='color:red' title='erreur lors du database upgrade'></i>");
                return 1;
            }
            else if (data == 1) {
                closeSwal();
                document.getElementById("spin_4").innerHTML  = "<i class='fa fa-check' style='color:green' title='database upgrade r�alis� mais quelques erreurs'></i>";
                swal("La mise � jour vers la version "+newdbversion+" a g�n�r� des erreurs non bloquantes<br> <a href = "+logfile+" target=_blank>Consulter le rapport d'erreur.</a><br>Nous vous invitons � corriger les erreurs manuellement.");
                logEvent("Database upgrade r�ussi mais avec des erreurs <a href='" + logfile + "' target=_blank>Voir le log</a> <i class='fa fa-exclamation-triangle' style='color:orange' title='database upgrade r�ussi mais avec des erreurs'></i>");
            }
            else if (data == 0) {
                if ( currentdbversion == newdbversion ) {
                    document.getElementById("spin_4").innerHTML  = "<i class='fa fa-check' style='color:green' title='Pas de changements requis dans la base'></i>";
                }
                else {
                    document.getElementById("spin_4").innerHTML  = "<i class='fa fa-check' style='color:green' title='database upgrade r�ussi'></i>";
                    logEvent("Database upgrade r�ussi <a href='" + logfile + "' target=_blank>Voir le log</a> <i class='fa fa-check' style='color:green' title='database upgrade r�ussi'></i>");
                }
            }
            maintenance_off ();
        },
        error: function() {
            document.getElementById("spin_4").innerHTML  = "<i class='fas fa-exclamation-circle' style='color:red' title='erreur lors du database upgrade'></i>";
            logEvent("Une�erreur�est�survenu�pendant la mise � jour de la base de donn�es. <a href='" + logfile + "' target=_blank>Voir le log</a> <i class='fas fa-exclamation-circle' style='color:red' title='erreur lors du database upgrade'></i>");
            return 1;
        }
    });
    return 0;
}

function maintenance_off () {
    // desactivate maintenance mode
    logEvent("D�sactivation du mode maintenance <div id='spin_5' style='display: inline'><i class='fas fa-cog fa-spin fa-lg' title='maintenance mode'></i></div>");
    $.ajax({type: "POST", url: 'update_app.php', dataType: 'json', data: {reason: 'maintenance_off', patch_version: newversion},
        success: function() {
            document.getElementById("spin_5").innerHTML  = "<i class='fa fa-check' style='color:green' title='d�sactivation mode maintenance r�ussi'></i>";
            logEvent("Maintenance mode d�sactiv� <i class='fa fa-check' style='color:green' title='Maintenance mode d�sactiv�'></i>");
            logEvent("<b>Fin de la mise � jour. Vous utilisez maintenant " + newversion + "</b> ");
            logEvent("<br>Pensez � purger le cache du navigateur (CTRL + F5)",withTime=0);
        },
        error: function() {
            document.getElementById("spin_5").innerHTML  = "<i class='fas fa-exclamation-circle' style='color:red' title='erreur lors de la d�sactivation mode maintenance'></i>";
            logEvent("Une�erreur�est�survenu�lors de la d�sactivation du mode maintenance. <i class='fas fa-exclamation-circle' style='color:red' title='erreur mode maintenance'></i>");
            return 1;
        }
    });
    return 0;
}