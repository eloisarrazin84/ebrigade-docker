<?php

  # project: eBrigade
  # homepage: https://ebrigade.app
  # version: 5.3

  # Copyright (C) 2004, 2021 Nicolas MARCHE (eBrigade Technologies)
  # This program is free software; you can redistribute it and/or modify
  # it under the terms of the GNU General Public License as published by
  # the Free Software Foundation; either version 2 of the License, or
  # (at your option) any later version.
  #
  # This program is distributed in the hope that it will be useful,
  # but WITHOUT ANY WARRANTY; without even the implied warranty of
  # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  # GNU General Public License for more details.
  # You should have received a copy of the GNU General Public License
  # along with this program; if not, write to the Free Software
  # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  
include_once ("config.php");
check_all(17);
$id=$_SESSION['id'];
$section=$_SESSION['SES_SECTION'];
get_session_parameters();

check_feature("vehicules");

writehead();
writeBreadCrumb();

$suggestedsection=$section;
if ( check_rights($id, 17, $filter)) $suggestedsection=$filter;
if (isset ($_GET["section"])) $suggestedsection=$_GET["section"];

$mysection=get_highest_section_where_granted($id,17);

if ( check_rights($id, 24) ) $section='0';
else if ( $mysection <> '' ) {
    if ( is_children($section,$mysection)) 
        $section=$mysection;
}

//=====================================================================
// affiche la fiche vehicule
//=====================================================================

echo "<script type='text/javascript' src='js/checkForm.js'></script>";
echo "</head>";
echo "<body>";

echo "<div align=center>";

echo "<form name='vehicule' action='save_vehicule.php'>";
echo "<input type='hidden' name='V_ID'>";
echo "<input type='hidden' name='groupe'>";
echo "<input type='hidden' name='EQ_ID' value='1'>";
echo "<input type='hidden' name='TV_CODE'>";
echo "<input type='hidden' name='V_IMMATRICULATION'>";
echo "<input type='hidden' name='V_COMMENT'>";
echo "<input type='hidden' name='VP_ID'>";
echo "<input type='hidden' name='V_ANNEE'>";
echo "<input type='hidden' name='V_ASS_DATE'>";
echo "<input type='hidden' name='V_CT_DATE'>";
echo "<input type='hidden' name='V_REV_DATE'>";
echo "<input type='hidden' name='V_TITRE_DATE'>";
echo "<input type='hidden' name='V_INVENTAIRE'>";
echo "<input type='hidden' name='V_INDICATIF'>";
echo "<input type='hidden' name='operation' value='insert'>";
echo "<input type='hidden' name='from'>";
for ( $i = 1 ; $i <= 8 ; $i++) {
    echo "<input type='hidden' name='P".$i."'>";
}
//=====================================================================
// ligne 1
//=====================================================================

echo "<div class='table-responsive'>";
echo "<div class='container-fluid'>";
echo "<div class='row'>";
echo "<div class='col-sm-6'>
    <div class='card hide card-default graycarddefault' align=center style='margin-bottom: 5px;'>
        <div class='card-header graycard'>
            <div class='card-title'><strong>G�n�ralit�s</strong></div>
        </div>
        <div class='card-body graycard'>";

echo "<table class='noBorder maxsize' cellspacing=0 border=0 >";


//=====================================================================
// ligne type
//=====================================================================

$query2="select distinct TV_CODE, TV_LIBELLE from type_vehicule
         order by TV_CODE";
$result2=mysqli_query($dbc,$query2);

echo "<tr>
            <td>Type $asterisk</td>
            <td align=left >
        <select name='TV_CODE' class='form-control form-control-sm maxsize' data-container='body' data-style='btn btn-default' data-live-search='true'>";
while (custom_fetch_array($result2)) {
    echo "<option value='$TV_CODE' class=''>$TV_CODE - $TV_LIBELLE</option>";
}
echo "</select>";
echo "</td>
      </tr>";


//=====================================================================
// ligne immatriculation
//=====================================================================

echo "<tr>
            <td>Immatriculation</td>
            <td  align=left><input type='text' name='V_IMMATRICULATION' size='20' class='form-control form-control-sm' title=\"ce champ d�signe l'immatriculation ou le macaron\">";
echo "</tr>";

//=====================================================================
// num�ro d'indicatif
//=====================================================================

echo "<tr>
            <td>Indicatif</td>
            <td  align=left><input type='text' name='V_INDICATIF' size='30' class='form-control form-control-sm'>";
echo " </td>
      </tr>";
//=====================================================================
// ligne ann�e
//=====================================================================

$curyear=date("Y");
$year=$curyear - 30; 
echo "<tr>
            <td>Ann�e</td>
            <td  align=left>
            <select class='form-control form-control-sm smalldropdown3-nofont' name='V_ANNEE' data-style='btn btn-default'>";
while ( $year <= $curyear + 1 ) {
    if ( $year == $curyear ) $selected = 'selected';
    else $selected = '';
    echo "<option value='$year' $selected>$year</option>";
    $year++;
}        
echo "</select></tr>";


//=====================================================================
// ligne kilometrage
//=====================================================================

echo "<tr>
            <td>Kilom�trage</td>
            <td  align=left>
            <input type='text' name='V_KM' size='5' class='form-control form-control-sm' value='0' onchange='checkNumber2(this,0)'
            title=\"ce champ d�signe le kilom�trage actuel\">";
echo "</tr>";


echo "<tr>
            <td>Prochaine r�vision</td>
            <td  align=left>
            <input type='text' name='V_KM_REVISION' size='5' class='form-control form-control-sm' value='0' onchange='checkNumber2(this,0)'
            title=\"ce champ d�signe le kilom�trage auquel la prochaine r�vision devra �tre faite\">";
echo "</tr>";

//=====================================================================
// ligne mod�le
//=====================================================================

echo "<tr>
            <td>Mod�le</td>
            <td  align=left><input type='text' name='V_MODELE' class='form-control form-control-sm' size='25'>";
echo "</tr>";

//=====================================================================
// ligne section
//=====================================================================

if (  $nbsections == 0 ) {
    echo "<tr>
            <td>Section $asterisk</td>
            <td  align=left>";
    echo "<select id='groupe' name='groupe' class=' form-control form-control-sm' title=\"ce champ d�signe la section, centre ou niveau hi�rarchique auquel le v�hicule est affect�\" data-style='btn btn-default'>";
     
    $level=get_level($section);
    $mycolor=get_color_level($level);
    $class="style='background: $mycolor;'";
    
    if ( isset($_SESSION['sectionorder']) ) $sectionorder=$_SESSION['sectionorder'];
    else $sectionorder=$defaultsectionorder;
        
    if ( check_rights($id, 24))
        display_children2(-1, 0, $suggestedsection, $nbmaxlevels, $sectionorder);
    else { 
        echo "<option value='$suggestedsection' $class >".get_section_code($suggestedsection)." - ".get_section_name($suggestedsection)."</option>";
        display_children2($section, $level +1, $suggestedsection, $nbmaxlevels);
    }
    
    echo "</select></td> ";
    echo "</tr>";
}
else echo "<input type='hidden' name='groupe' value='0'>";

//=====================================================================
// ligne type
//=====================================================================
if ( $gardes == 1 ) {
    
    if ( isset($_SESSION['filter']) ) $defaultsection=$_SESSION['filter'];
    else $defaultsection=$_SESSION['SES_SECTION'];
    
    $query2 ="select EQ_ID, EQ_NOM from type_garde ";
    if ( $nbsections == 0 and $pompiers == 1 ) $query2 .=" where S_ID = ".$defaultsection;
    $query2 .=" order by EQ_ID";
    $result2=mysqli_query($dbc,$query2);

    echo "<tr>
            <td>
            Usage principal</td>
            <td  align=left>
        <select class='form-control form-control-sm' name='EQ_ID'>
        <option value='0' $selected>Aucun</option>";
    while ($row2=@mysqli_fetch_array($result2)) {
        $EQ_ID=$row2["EQ_ID"];
        $EQ_NOM=$row2["EQ_NOM"];
        echo "<option value='$EQ_ID'>$EQ_NOM</option>";
    }
    echo "</select>";
    echo "</tr>";
}

//=====================================================================
// vehicule externe
//=====================================================================

if (check_rights($_SESSION['id'], 24) and ($nbsections ==  0 )) {
    echo "<tr>
                <td>V�hicule $cisname</td>
                <td  align=left>
                <label class='switch'>
                    <input type='checkbox' name='V_EXTERNE' value='1'>
                    <span class='slider round'></span>               
                </label>            
                <font size=1><i>mis � disposition (utilisable, non modifiable)<i></font>";
    echo " </td></tr>";
}          

//=====================================================================
// dates d'assurance de contr�le technique et de r�vision
//=====================================================================

echo "<input type='hidden' name='dc0' value='".getnow()."'>";

echo "</table></div></div></div>";
    
    echo "<div class='col-sm-6'>
        <div class='card hide card-default graycarddefault' style='margin-bottom:5px'>
            <div class='card-header graycard'>
                <div class='card-title'><strong> �quipement </strong></div>
            </div>
            <div class='card-body graycard'>";
    echo "<table class='noBorder maxsize'>";

// assurance
echo "<tr>
            <td>Fin assurance</td>
            <td  align=left>
            <input type='text' size='10' name='dc1' class='form-control form-control-sm datepicker datepicker2 datesize' data-provide='datepicker'
            title=\"ce champ d�signe la date de fin d'assurance\"
            placeholder='JJ-MM-AAAA' autocomplete='off'>
            </td></tr>";


// contr�le technique
echo "<tr>
            <td>Contr�le technique</td>
            <td  align=left>
            <input type='text' size='10' name='dc2' class='form-control form-control-sm datepicker datepicker2 datesize' data-provide='datepicker'
            title=\"ce champ d�signe la date de validit� du contrr�le technique\"
            placeholder='JJ-MM-AAAA' autocomplete='off'
            ></td></tr>";

// r�vision
echo "<tr>
            <td>Prochaine r�vision</td>
            <td  align=left>
            <input type='text' size='10' name='dc3' class='form-control form-control-sm datepicker datepicker2 datesize' data-provide='datepicker'
            title=\"ce champ d�signe la date recommand�e de r�vision dde ce v�hicule\"
            placeholder='JJ-MM-AAAA' autocomplete='off'
            ></td></tr>";
            
// titre d'acc�s
echo "<tr>
            <td>Exp Titre d'acc�s</td>
            <td  align=left>
            <input type='text' size='10' name='dc4' class='form-control form-control-sm datepicker datepicker2 datesize' data-provide='datepicker'
            title=\"ce champ d�signe la date d'expiration du titre d'acc�s\"
            placeholder='JJ-MM-AAAA' autocomplete='off'
            ></td></tr>";

//=====================================================================
// num�ro d'inventaire
//=====================================================================

echo "<tr>
            <td>N�d'inventaire</td>
            <td  align=left><input type='text' name='V_INVENTAIRE' class='form-control form-control-sm' size='30'>";
echo " </td>
      </tr>";

      
//=====================================================================
// ligne commentaire
//=====================================================================

echo "<tr>
          <td>Commentaire</td>
          <td><textarea name='V_COMMENT' class='form-control form-control-sm' cols='30' rows='3' 
            style='FONT-SIZE: 10pt; FONT-FAMILY: Arial;'
            ></textarea></td>";
echo "</tr>";  

echo "</table></div></div></div></div>";
echo "<input type='submit' class='btn btn-success' value='Sauvegarder'>";
echo "<input type='button' class='btn btn-secondary' value='Retour' name='annuler' onclick=\"javascript:history.back(1);\"></div></form>";

writefoot();
?>
