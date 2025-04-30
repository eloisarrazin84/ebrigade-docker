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
check_all(54);
$id=$_SESSION['id'];
writehead();
get_session_parameters();
if ( check_rights($id,54,"0")) $thislevel=0;
else $thislevel=get_highest_section_where_granted($id,54);
if (isset ($_GET["aml"])) {
    $filter=$thislevel;
}
test_permission_level(54);
if (! check_rights($id,54,$filter)) $filter=$thislevel;
if (isset ($_GET["psid"])) $psid=intval($_GET["psid"]);
else $psid=0;

?>
<STYLE type='text/css'>
.categorie{color:$mydarkcolor; background-color:$mylightcolor; font-size:10pt;}
.type{color:$mydarkcolor; background-color:white; font-size:9pt;}
</STYLE>
<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();
});

function redirect(psid,filter){
    url="parametrage.php?tab=4&child=11&psid="+psid+"&filter="+filter;
    self.location.href=url;
    return true
}

function checkNumber(element,defaultvalue,max)
{   
    var e = document.getElementById(element);
    var s = element.value;
    var re = /^([0-9]+)$/;
    if (! re.test(s) || s > max ) {
          swalAlert("Saisissez un nombre inf�rieur � "+ max+ ": '"+ s + "' ne convient pas.");
         element.value = defaultvalue;
         return false;
    }
    // All characters are numbers.
    return true;
}

function hideRow(k) {
    var select = document.getElementById('affichage['+k+']').value;
    if ( select == 9 ) {
        document.getElementById('perso['+k+']').style.display = '';
    }
    else {
        document.getElementById('perso['+k+']').style.display = 'none';
    }
}

function changeStatus() { 
    what=document.getElementById('image');
    document.getElementById("imageform").submit();
}

</script>
</head>
<?php

$help="Le dipl�me doit �tre imprim� sur une page au format A4 (210 mm x 297 mm), format paysage.
Le champ 'actif' indique si le champ doit �tre imprim�.
La taille de caract�re, ainsi que la police et le style peuvent �tre d�finis.
Le champ x correspond � l'abscisse, distance horizontale en mm � partir de la gauche de la feuille. Valeurs de x entre 0 et 297).
Le champ y correspond � l'ordonn�e, distance verticale en mm � partir du haut de la feuille. Valeurs de x entre 0 et 210.
Si affichage 'personnalis�' est choisi alors les donn�es saisies dans 'Personnalisation' seront imprim�es.";

echo "<body>";
echo "<div align=center class='table-responsive'>
    <table class='noBorder'><tr>
    <td align = center> 
    
    </td></tr></table>";
 
$actif=array();
$affichage=array();
$style=array();
$police=array();
$pos_x=array();
$pos_y =array();
$annexe=array();
$style_org=array("Normal","Gras","Italique","Gras et Italique");
$taille_org=array(8,9,10,11,12,14,16,18);
$police_org=array("Courrier","Arial","Times");
extract($_POST); 

if (isset($_POST["action"])) $action=$_POST["action"];
else $action="show";

//============================================================
//   Reinitialiser
//============================================================
if (isset($_GET["reinit"])) {
    if ( $filter > 0 and $psid > 0 and check_rights($id,54,$filter)) {
        $query="delete from diplome_param where PS_ID=".$psid." and S_ID =".$filter;
        $result=mysqli_query($dbc,$query);
    }
}

//============================================================
//   Save info and upload file.
//============================================================
//Allowable file Mime Types. Add more mime types if you want
$FILE_MIMES = array('image/jpeg','image/jpg','image/x-png','image/pjpeg','image/gif','image/png');
//Allowable file ext. names. you may add more extension names.
$FILE_EXTS  = array('.jpg','.png','.gif');
$upload_dir=$filesdir."/diplomes";
$msgstring="";

//echo "<pre>";
//print_r($_POST);
//echo "</pre>";

// enregistrement dans la table
if ($action == "save") {
    $psid=intval($_POST["psid"]);
    $query="select TYPE from poste where PS_ID=".$psid;
    $result=mysqli_query($dbc,$query);
    $row=mysqli_fetch_array($result);
    $type=str_replace(" ", "",$row["TYPE"]);
    $file_name="";
    
    if ( isset ($_FILES['userfile']) and check_rights($id,54,"0") and $filter==0 ) {
        if ($_FILES['userfile']['size'] <> 0) {
            $error=0;
            $temp_name = $_FILES['userfile']['tmp_name'];
            $file_type = $_FILES['userfile']['type'];
            $file_ext = strtolower(substr($file_name,strrpos($file_name,".")));
            $file_path = $upload_dir."/".$type.".jpg";
           
            //File Size Check
            if ( $_FILES['userfile']['size'] > $MAX_SIZE) {
                 $msgstring = $MAX_SIZE_ERROR;
                 $error=1;
            }
            //File Type/Extension Check
            else if (!in_array($file_type, $FILE_MIMES) && !in_array($file_ext, $FILE_EXTS)) {
                   $msgstring = "Attention, les fichiers du type ($file_type) sont interdits.";
                   $error=1;
            }
            else {
                   // create upload subdir
                   if (!is_dir($upload_dir)) {
                        if (!mkdir($upload_dir))
                            die ("Le r�pertoire d'upload n'existe pas et sa cr�ation a �chou�.");
                        if (!chmod($upload_dir,0755))
                            die ("Echec lors de la mise � jour des permissions.");
                   }
                   if (! $result  =  move_uploaded_file($temp_name, $file_path)) {
                      $msgstring ="Une erreur est apparue lors de l'upload du fichier.";
                      $error=1;
                   }
                   if (!chmod($file_path,0777)) {
                        $msgstring = "Echec lors de la mise � jour des permissions.";
                      $error=1;
                   }
            }
        }
    }
    echo "<font color=red>".$msgstring."</font>";
    
    for($i=1; $i <= $numfields_org ; $i++) { 
        
        $q1="select count(1) as NB from diplome_param where PS_ID=".$psid." and FIELD=".$i." and S_ID=".$filter;
        $r1=mysqli_query($dbc,$q1);
        $row=mysqli_fetch_array($r1);
        
        if ( isset ($actif[$i])) $is_actif = intval($actif[$i]);
        else $is_actif = 0;
        
        if ( $row["NB"] == 0 )
            $query="insert into diplome_param 
                (PS_ID,S_ID,FIELD,ACTIF,AFFICHAGE,TAILLE,STYLE,
                 POLICE,POS_X,POS_Y,
                 ANNEXE) values (".
                $psid.",".$filter.",".$i.",".intval($is_actif).",".intval($affichage[$i]).",".intval($aff_taille[$i]).",".intval($aff_style[$i]).","
                .intval($aff_police[$i]).",".intval($pos_x[$i]).",".intval($pos_y[$i]).", 
                \"".secure_input($dbc,str_replace("\"","'",$annexe[$i]))."\")";
        else     
            $query="UPDATE diplome_param SET ACTIF=".$is_actif.", 
                AFFICHAGE =".intval($affichage[$i]).",
                TAILLE =".intval($aff_taille[$i]).", 
                STYLE=".intval($aff_style[$i]).", 
                POLICE =".intval($aff_police[$i]).", 
                POS_X =".intval($pos_x[$i]).", 
                POS_Y=".intval($pos_y[$i]).", 
                ANNEXE=\"".secure_input($dbc,str_replace("\"","'",$annexe[$i]))."\"
                WHERE PS_ID=".$psid."
                and FIELD=".$i."
                and S_ID=".$filter;
        mysqli_query($dbc,$query);
    }
}


echo "<form enctype='multipart/form-data' name='imageform' id='imageform' action='parametrage.php?tab=4&child=11' method='POST' >";

echo "<div class='div-decal-left' align=left>";
//filtre section
if ( check_rights($id,24)) $disabled="";
else $disabled="disabled";

echo "<select class='selectpicker' data-container='body' data-style='btn btn-default' id='filter' name='filter' $disabled class='selectpicker' data-container='body' data-style='btn btn-default' ".datalive_search()." data-style='btn-default' data-container='body'
        onchange=\"redirect(document.getElementById('selectdiplome').value,document.getElementById('filter').value);\">";
display_children2(-1, 0, $filter, $nbmaxlevels -1, $sectionorder);
echo "</select>";

// filtre comp�tence
echo "<select class='selectpicker' data-container='body' data-style='btn btn-default' id='selectdiplome' name='selectdiplome' class='selectpicker' data-container='body' data-style='btn btn-default' data-style='btn-default' data-container='body'
      onchange=\"redirect(document.getElementById('selectdiplome').value,document.getElementById('filter').value);\">";
$query="select PS_ID, TYPE, DESCRIPTION, PS_PRINT_IMAGE from poste 
                where PS_PRINTABLE=1
              and PS_DIPLOMA=1";
if ( $filter > 0 ) $query .= " and PS_NATIONAL=0";
$query .= " order by TYPE";

$result=mysqli_query($dbc,$query);
$curtype="";
$print_image=0;
if (is_iphone()) $big_device=false;
else $big_device=true;
while (custom_fetch_array($result)) {
    if ( $psid == 0 ) $psid = $PS_ID;
    if ( $psid == $PS_ID ) {
        $selected='selected';
        $curtype=$TYPE;
        $print_image = $PS_PRINT_IMAGE;
    }
    else $selected='';
    if ( ! $big_device ) $DESCRIPTION = substr($DESCRIPTION,0,30);
    echo "<option value='".$PS_ID."' $selected class='option-ebrigade'>".$TYPE." - ".$DESCRIPTION."</option>";
}
echo "</select>";

echo "</div>";

echo "<table class='noBorder'><tr>";

$default=$filesdir."/diplomes/diplome.jpg";
$file=$filesdir."/diplomes/".str_replace(" ", "",$curtype).".jpg";
$btn_class='btn-warning';

if ( file_exists($file)){
    $link=" <a href=showfile.php?diplome=1&file=".str_replace(" ", "",$curtype).".jpg&section=0&evenement=0&message=0
            title='T�l�charger image du dipl�me'><img src=".$file." class='img-thumbnail' width='120'></a>";
   
    $btn_class='btn-success';
    $t='Choisir une autre image';
}
else if ( file_exists($default)) {
    $link=" <a href='showfile.php?diplome=1&file=diplome.jpg&section=0&evenement=0&message=0' title='T�l�charger image du dipl�me'><img src=".$default." class='img-thumbnail' width='120'></a>";
    $t='Choisir une image personnalis�e pour ce dipl�me';
}
else {
    $link=$curtype;
    $btn_class='btn-danger';
    $t='Choisir une image pour ce dipl�me';
}

echo "<tr><td><span class='left10'>Image du dipl�me </span> <span class='badge' style='background-color:purple;'>".str_replace(" ", "",$curtype)."</span> ".$link."
<a href='#' data-toggle='popover' data-trigger='hover' data-content=\"".$help."\"><i class='fa fa-question-circle fa-lg' ></i></a></td></tr>";
if ( $filter == 0 ) {
    echo "<tr><td><span class='left10'>Modifier image</span> <label class='btn $btn_class btn-file' title=\"".$t."\">
    <i class='fa fa-image fa-lg'></i><input type='file' id='userfile' name='userfile' style='display:none;' onchange='javascript:changeStatus();'>
    </label></td></tr>";
    if ( $print_image == 1 )
        $i="<i class='fa fa-check-square fa-lg' style='color:green;' title='Image de dipl�me imprim�e, voir param�trage des comp�tences'></i>";
    else 
        $i="<i class='fa fa-ban fa-lg' style='color:red;' title='Image de dipl�me NON imprim�e, voir param�trage des comp�tences'></i>";
    $H="Si l'impresssion de l'image est activ�e, alors le dipl�me sera obligatoirement imprim�e sur du papier blanc, pas de papier pr�-imprim� possible. Si la case est d�coch�e, 
        Le dipl�me sera imprim�e sur du papier pr�-imprim�, ou sous forme d'aper�u avant impression sur papier blanc. Cette configuration est possible dans le param�trage de la comp�tence.";
    $helper="<a href='#' data-toggle='popover' data-trigger='hover' data-content=\"".$H."\"><i class='fa fa-question-circle fa-lg' ></i></a>";
    echo "<tr><td><span class='left10'>".$i."</span> Imprimer l'image ".$helper."</td></tr>";
}
else 
    echo "<tr><td class=small>La modification de l'image li�e � ce dipl�me n'est possible que au niveau National</td></tr>";
echo "</table>";

echo "<div class='col-sm-10'>";

for($i=1; $i <= $numfields_org; $i++) {
    
    $query="select PS_ID,S_ID, FIELD,ACTIF,AFFICHAGE,TAILLE,STYLE,
                 POLICE,POS_X,POS_Y, ANNEXE from diplome_param 
            where PS_ID=".$psid." and FIELD=".$i." and S_ID in (0,".$filter.")
            order by S_ID desc";
    $result=mysqli_query($dbc,$query);
    $data = @mysqli_fetch_array($result); 
 
    // bloquer certains champs au niveau local
    $modifiable=true;
    $local_disabled="";
    if ( $filter > 0 ) {
        $modifiable=false;
        $local_disabled="disabled";
    }
    
    echo "<div class='card hide card-default graycarddefault cardtab' style='margin-bottom:15px'>
            <div class='card-header graycard cardtab'>
                <div class='card-title'><strong> Impression champ N� $i </strong></div>
            </div>
            <div class='card-body graycard'>";
    echo "<table class='noBorder' cellspacing=0 border=0>";
         
    $local_disabled2=$local_disabled;
    if ($data["ACTIF"]=='1') $checked='checked'; else $checked='';
    if ( ! $modifiable and $data["ACTIF"] == 0 ) $local_disabled2=""; 
    if ( ! $modifiable )
        echo "<input type='hidden' name='actif[".$i."]' id='actif[".$i."]' value=".$data["ACTIF"].">";
    echo "<td>
        <input type='checkbox' name='actif[".$i."]' id='actif[".$i."]' value=1 $checked $local_disabled2/> Actif </td>";
        
        
    echo "<td>Taille "; 
    echo "<select class='selectpicker smalldropdown3-nofont' data-container='body' data-style='btn btn-default' id='aff_taille[".$i."]' name='aff_taille[".$i."]'>";
    for($j=0; $j != 8; $j++) { 
        echo "<option value='".$j."'";
         if ($data["TAILLE"]==$j) echo " selected='selected'";
        echo'>'.$taille_org[$j].'</option>';
    };
    echo "</select></td>";
    
    echo "<td> Affichage ";
    
    echo "<select class='selectpicker smallerdropdown2' data-container='body' data-style='btn btn-default' name='affichage[".$i."]' id='affichage[".$i."]' onchange=\"hideRow(".$i.");\" $local_disabled>";
    
    $query1="select FIELD, FIELD_NAME, CATEGORY from diplome_param_field order by CATEGORY, DISPLAY_ORDER";
    $result1=mysqli_query($dbc,$query1);

    
    $cat="";
    while ( custom_fetch_array($result1)) {
        if ( $cat <> $CATEGORY ) {
            echo "<OPTGROUP  LABEL='".$CATEGORY."'>";
            $cat = $CATEGORY;
        }
        echo "<option value='".$FIELD."'";
        if ($data["AFFICHAGE"]==$FIELD) echo " selected='selected'";
        echo ">".$FIELD_NAME."</option>";
    }
    echo "</select>";
    if ( ! $modifiable )
        echo "<input type='hidden' name='affichage[".$i."]' id='affichage[".$i."]' value=".$data["AFFICHAGE"].">";
    echo "</td>";
    
    echo "<td> Style <select class='selectpicker smallerdropdown2' data-container='body' data-style='btn btn-default' name='aff_style[".$i."]' id='aff_style[".$i."]'>";
    for($j=0; $j != 4; $j++) { 
        echo '<option value="'.$j.'"';
         if ($data["STYLE"]==$j) echo " selected='selected'";
        echo ">".$style_org[$j]."</option>";
    };
    echo "</select></td>";
    
    echo "<td>Police <select class='selectpicker smallerdropdown2' data-container='body' data-style='btn btn-default' name='aff_police[".$i."]' id='aff_police[".$i."]'>";
    for($j=0; $j != 3; $j++) { 
        echo "<option value=".$j;
         if ($data["POLICE"]==$j) echo " selected='selected'";
        echo ">".$police_org[$j]."</option>";
    }
    echo"</select>   
    </td>
    </tr>";
    // echo "</tr></table><table class='noBorder' cellspacing=0 border=0><tr>";
    // echo "<tr>";
    echo "<td>Position X <input name=pos_x[".$i."] id=pos_x_".$i." type='text' size='5' maxlength='5' class='form-control form-control-sm'
    title='Choisir une valeur comprise entre 0 et 297' style='display:inline-flex; width:65px'
    onchange=\"checkNumber(pos_x_".$i.",'".$data["POS_X"]."',297);\"
    value='".$data["POS_X"]."'/></td>";
    
    echo "<td>Position Y <input name=pos_y[".$i."] id=pos_y_".$i." type='text' size='5' maxlength='5' class='form-control form-control-sm'
    title='Choisir une valeur comprise entre 0 et 210' style='display:inline-flex; width:65px'
    onchange=\"checkNumber(pos_y_".$i.",'".$data["POS_Y"]."',210);\" 
    value='".$data["POS_Y"]."'/></td>";
    
    if ( $data["AFFICHAGE"] == 9 ) $style="";
    else $style="style='display:none'";
    echo "<td colspan='3' ><span name='perso[".$i."]' id='perso[".$i."]' $style>Personnalisation:
    <input name='annexe[".$i."]' id='annexe[".$i."]' type='text' size='50' maxlength='50'  
    value=\"".$data["ANNEXE"]."\"/></span></td>";

    echo "</tr></table></div></div>";
}
 
echo "<p><input type='hidden' name='action' value='save'>
      <input type='hidden' name='psid' value='".$psid."'>
      <input type='submit'  class='btn btn-success' value='Sauvegarder'>";
if ( $filter > 0 )
    echo " <input type='button'  class='btn btn-default' value='R�initialiser' title='Remplacer ce param�trage sp�cifique par le param�trage national'
    onclick='javascript:self.location.href=\"parametrage.php?tab=4&child=11&filter=".$filter."&psid=".$psid."&reinit=1\";'>";
echo "</form>
</div>";

writefoot();

?>
