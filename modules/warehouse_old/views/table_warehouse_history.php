<?php

$total_production = 0;

defined('BASEPATH') or exit('No direct script access allowed');

$aColumns = [
    db_prefix().'goods_transaction_detail.id',
    'goods_receipt_id',
    'commodity_id',
    db_prefix().'goods_transaction_detail.warehouse_id',
    db_prefix().'goods_transaction_detail.date_add',
    'old_quantity',
    'quantity',
    '(select unit_code from tblware_unit_type t1 inner join tblgoods_receipt_detail t2 where t1.unit_type_id = t2.unit_id and t2.goods_receipt_id = tblgoods_transaction_detail.goods_receipt_id limit 1) as unit',
    '(select unit_code from tblware_unit_type t1 inner join tblgoods_delivery_detail t2 where t1.unit_type_id = t2.unit_id and t2.goods_delivery_id = tblgoods_transaction_detail.goods_receipt_id limit 1) as unit_2',
    '(select unit_code from tblware_unit_type t1 inner join tblwh_loss_adjustment_detail t2 where t1.unit_type_id = t2.unit and tblgoods_transaction_detail.goods_receipt_id = 0 limit 1) as unit_3',
    '((quantity + old_quantity) - old_quantity) as mov',
    '(((quantity + old_quantity) - old_quantity)/old_quantity) * 100 as rendi',
    '(1-(((quantity + old_quantity) - old_quantity)/old_quantity)) * 100 as merma',
    '(select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1) as costo',
    '(((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.goods_receipt_id = tblgoods_transaction_detail.goods_receipt_id order by tblgoods_receipt_detail.id desc limit 1)/((((quantity + old_quantity) - old_quantity)/old_quantity) * 100)) * ((quantity + old_quantity) - old_quantity) ) as price_sug',
    '((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1)  * ((quantity + old_quantity) - old_quantity)) as price_sug_2',
    '(select profif_ratio from tblitems where id = tblgoods_transaction_detail.commodity_id) as gain',
    '(select id from tblitems where id = tblgoods_transaction_detail.commodity_id) as itemid',
    '(select date_price from tblitems where id = tblgoods_transaction_detail.commodity_id) as date_price_update',
    '(select rate from tblitems where id = tblgoods_transaction_detail.commodity_id) as price_sale_rate',
    '(select symbol from tblcurrencies where isdefault = 1 limit 1) as currency',
    '(((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1)  * ((quantity + old_quantity) - old_quantity)) * ((select profif_ratio from tblitems where commodity_code = ( select commodity_code from tblitems where id = tblgoods_transaction_detail.commodity_id))/100)) as gain_price',
    '(((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1)  * ((quantity + old_quantity) - old_quantity)) + (((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1)  * ((quantity + old_quantity) - old_quantity)) * ((select profif_ratio from tblitems where commodity_code = ( select commodity_code from tblitems where id = tblgoods_transaction_detail.commodity_id)) /100))) as price_sale',
    '((((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1)  * ((quantity + old_quantity) - old_quantity)) + (((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1)  * ((quantity + old_quantity) - old_quantity)) * ((select profif_ratio from tblitems where commodity_code = ( select commodity_code from tblitems where id = tblgoods_transaction_detail.commodity_id)) /100))) / ((quantity + old_quantity) - old_quantity)) as price_sale_unit',
    'lot_number',
    '(select unit_price from tblgoods_receipt_detail inner join tblwh_loss_adjustment_detail on tblgoods_receipt_detail.commodity_code = tblwh_loss_adjustment_detail.items order by tblgoods_receipt_detail.id desc limit 1) as costo_merma',
    db_prefix().'goods_transaction_detail.expiry_date',
    'note',
    db_prefix().'goods_transaction_detail.status',
    ];
$sIndexColumn = 'id';
$sTable       = db_prefix().'goods_transaction_detail';



$where = [];




$warehouse_ft = $this->ci->input->post('warehouse_ft');
$commodity_ft = $this->ci->input->post('commodity_ft'); 
$status_ft = $this->ci->input->post('status_ft'); 


$join =[
  'LEFT JOIN '.db_prefix().'goods_receipt ON '.db_prefix().'goods_receipt.id = '.db_prefix().'goods_transaction_detail.goods_receipt_id AND  '.db_prefix().'goods_transaction_detail.status = 1',
  'LEFT JOIN '.db_prefix().'goods_delivery ON '.db_prefix().'goods_delivery.id = '.db_prefix().'goods_transaction_detail.goods_receipt_id AND  '.db_prefix().'goods_transaction_detail.status = 2',
  'LEFT JOIN '.db_prefix().'wh_loss_adjustment ON '.db_prefix().'wh_loss_adjustment.id = '.db_prefix().'goods_transaction_detail.goods_receipt_id AND  '.db_prefix().'goods_transaction_detail.status = 3',
  'LEFT JOIN '.db_prefix().'internal_delivery_note ON '.db_prefix().'internal_delivery_note.id = '.db_prefix().'goods_transaction_detail.goods_receipt_id AND  '.db_prefix().'goods_transaction_detail.status = 4'
];

array_push($where, " AND consolidate is NULL");

if(isset($warehouse_ft)){

    $where_warehouse_ft = '';
    foreach ($warehouse_ft as $warehouse_id) {
        if($warehouse_id != '')
        {

            if ($where_warehouse_ft == '') {
              $where_warehouse_ft .= ' AND (find_in_set('.$warehouse_id.', '.db_prefix().'goods_transaction_detail.warehouse_id) or find_in_set('.$warehouse_id.', '.db_prefix().'goods_transaction_detail.from_stock_name) or find_in_set('.$warehouse_id.', '.db_prefix().'goods_transaction_detail.to_stock_name) ';

            } else {
              $where_warehouse_ft .= ' or find_in_set('.$warehouse_id.', '.db_prefix().'goods_transaction_detail.warehouse_id) or find_in_set('.$warehouse_id.', '.db_prefix().'goods_transaction_detail.from_stock_name) or find_in_set('.$warehouse_id.', '.db_prefix().'goods_transaction_detail.to_stock_name) ';

            }

        }
    }
    if($where_warehouse_ft != '')
    {
        $where_warehouse_ft .= ')';

        array_push($where, $where_warehouse_ft);
    }
}


    if(isset($commodity_ft)){
        if(!is_array($commodity_ft)){
            $where_commodity_ft = ' AND tblgoods_transaction_detail.commodity_id = "'.$commodity_ft.'"';
            array_push($where, $where_commodity_ft);
            
        }else{

            $where_commodity_ft = '';
            foreach ($commodity_ft as $commodity_id) {
                if($commodity_id != '')
                {
                    if($where_commodity_ft == ''){
                        $where_commodity_ft .= ' AND (tblgoods_transaction_detail.commodity_id = "'.$commodity_id.'"';
                    }else{
                        $where_commodity_ft .= ' or tblgoods_transaction_detail.commodity_id = "'.$commodity_id.'"';
                    }
                }
            }
            if($where_commodity_ft != '')
            {
                $where_commodity_ft .= ')';

                array_push($where, $where_commodity_ft);
            }
        }

    }

if(isset($status_ft)){

    $where_status_ft = '';
    foreach ($status_ft as $status_id) {
        if($status_id != '')
        {
            if($where_status_ft == ''){
                $where_status_ft .= ' AND (tblgoods_transaction_detail.status = "'.$status_id.'"';
            }else{
                $where_status_ft .= ' or tblgoods_transaction_detail.status = "'.$status_id.'"';
            }
        }
    }
    if($where_status_ft != '')
    {
        $where_status_ft .= ')';

        array_push($where, $where_status_ft);
    }
}

if($this->ci->input->post('validity_start_date')){
        $start_date = to_sql_date($this->ci->input->post('validity_start_date'));
    }

    if($this->ci->input->post('validity_end_date')){
        $end_date = to_sql_date($this->ci->input->post('validity_end_date'));
    }

    if(isset($start_date) && isset($end_date)){


        array_push($where, ' AND ( (date_format('.db_prefix().'goods_receipt.date_add,"%Y-%m-%d") BETWEEN "'.$start_date.'" AND "'.$end_date.'") OR (date_format('.db_prefix().'goods_delivery.date_add,"%Y-%m-%d") BETWEEN "'.$start_date.'" AND "'.$end_date.'") OR (date_format('.db_prefix().'internal_delivery_note.date_add,"%Y-%m-%d") BETWEEN "'.$start_date.'" AND "'.$end_date.'") OR (date_format('.db_prefix().'wh_loss_adjustment.date_create,"%Y-%m-%d") BETWEEN "'.$start_date.'" AND "'.$end_date.'") )');



    }elseif(isset($start_date) && !isset($end_date)){

        array_push($where, ' AND ( (date_format('.db_prefix().'goods_receipt.date_add,"%Y-%m-%d") >= "'.$start_date.'" ) OR (date_format('.db_prefix().'goods_delivery.date_add,"%Y-%m-%d") >= "'.$start_date.'") OR (date_format('.db_prefix().'internal_delivery_note.date_add,"%Y-%m-%d") >= "'.$start_date.'") OR (date_format('.db_prefix().'wh_loss_adjustment.date_create,"%Y-%m-%d") >= "'.$start_date.'"))');


    }elseif(!isset($start_date) && isset($end_date)){

        array_push($where, ' AND ( (date_format('.db_prefix().'goods_receipt.date_add,"%Y-%m-%d") <= "'.$end_date.'" ) OR (date_format('.db_prefix().'goods_delivery.date_add,"%Y-%m-%d") <= "'.$end_date.'") OR (date_format('.db_prefix().'internal_delivery_note.date_add,"%Y-%m-%d") <= "'.$end_date.'") OR (date_format('.db_prefix().'wh_loss_adjustment.date_create,"%Y-%m-%d") <= "'.$end_date.'"))');

    }



$result  = data_tables_init($aColumns, $sIndexColumn, $sTable, $join, $where, [db_prefix().'goods_transaction_detail.id',db_prefix().'goods_transaction_detail.old_quantity',db_prefix().'goods_transaction_detail.from_stock_name',db_prefix().'goods_transaction_detail.to_stock_name',db_prefix().'goods_receipt.date_add as 1_date_add',db_prefix().'goods_delivery.date_add as 2_date_add',db_prefix().'internal_delivery_note.date_add as 4_date_add',db_prefix().'wh_loss_adjustment.date_create as 3_date_add', db_prefix().'goods_transaction_detail.date_add as opening_stock_date_add']);


$output  = $result['output'];
$rResult = $result['rResult'];



    foreach ($rResult as $aRow) {
        $row = [];

        
       
    $row[] = $aRow['id'];
    if($aRow[db_prefix().'goods_transaction_detail.status'] == 1){
      $row[] = "<span style='color: white;background-color:#84c529; padding: 10px;font-weight:bold;border-radius: 5px;'>INGRESO</span>";
    } else {
      $row[] = "<span></span>";
    }

    $row[] = "<input class='form-control' type='checkbox'/>";

    if($aRow[db_prefix().'goods_transaction_detail.status'] == 1){

         $value = get_goods_receipt_code($aRow['goods_receipt_id']) != null ? get_goods_receipt_code($aRow['goods_receipt_id'])->goods_receipt_code : '';

         if($value != ''){
            $row[] = '<a style="color: #84c529;font-weight: bold;" href="' . admin_url('warehouse/manage_purchase/' . $aRow['goods_receipt_id']) . '" >'. $value.'</a>';
         }else{
            $row[] = '';
         }



    }elseif($aRow[db_prefix().'goods_transaction_detail.status'] == 2){

         $value = get_goods_delivery_code($aRow['goods_receipt_id']) != null ? get_goods_delivery_code($aRow['goods_receipt_id'])->goods_delivery_code : '';

         if($value != ''){
            $row[] = '<a style="color: red;font-weight:bold;" href="' . admin_url('warehouse/manage_delivery/' . $aRow['goods_receipt_id']) . '" >'. $value.'</a>';
         }else{
            $row[] = '';
         }


    }elseif($aRow[db_prefix().'goods_transaction_detail.status'] == 4){

         $value = get_internal_delivery_code($aRow['goods_receipt_id']) != null ? get_internal_delivery_code($aRow['goods_receipt_id'])->internal_delivery_code : '';

         if($value != ''){
            $row[] = '<a style="color: #337ab7;font-weight:bold;" href="' . admin_url('warehouse/manage_internal_delivery/' . $aRow['goods_receipt_id']) . '" >'. $value.'</a>';
         }else{
            $row[] = '';
         }


    }else{
      //3 lost adjustment
         $value = "AJUSTE_".$aRow['goods_receipt_id'];

         if($value != ''){
            $row[] = '<a style="color: #337ab7;font-weight:bold;" href="' . admin_url('warehouse/view_lost_adjustment/' . $aRow['goods_receipt_id']) . '" >'. $value.'</a>';
         }else{
            $row[] = '';
         }
    }    

     $row[] = wh_get_item_variatiom($aRow['commodity_id']);

     $warehouse_name ='';
     $warehouse_code ='';

    if($aRow[db_prefix().'goods_transaction_detail.status'] == 4){
     
        $str_code = '';
        $str = '';
          if ($aRow['from_stock_name'] != '' && $aRow['from_stock_name'] != '0') {

            $team = get_warehouse_name($aRow['from_stock_name']);
            if($team){
              $value = $team != null ? get_object_vars($team)['warehouse_name'] : '';

              $value_code = $team != null ? get_object_vars($team)['warehouse_code'] : '';

              $str .= 'Desde: <span class="label label-tag tag-id-1"><span class="tag">' . $value . '</span><span class="hide">, </span></span>&nbsp';
              
              $str_code .= 'Desde: <span class="label label-tag tag-id-1"><span class="tag">' . $value_code . '</span><span class="hide">, </span></span>&nbsp';

              $warehouse_name .= $str;
              $warehouse_code .= $str_code;

                $warehouse_name .='<br/>';
                $warehouse_code .='<br/>';
            }

          }

         $str_code = '';
        $str = '';
          if ($aRow['to_stock_name'] != '' && $aRow['to_stock_name'] != '0') {

            $team1 = get_warehouse_name($aRow['to_stock_name']);
            if($team1){
              $value1 = $team1 != null ? get_object_vars($team1)['warehouse_name'] : '';

              $value_code1 = $team1 != null ? get_object_vars($team1)['warehouse_code'] : '';

              $str .= '- Para: <span class="label label-tag tag-id-1"><span class="tag">' . $value1 . '</span><span class="hide">, </span></span>&nbsp';
              
              $str_code .= '- Para: <span class="label label-tag tag-id-1"><span class="tag">' . $value_code1 . '</span><span class="hide">, </span></span>&nbsp';

              $warehouse_name .= $str;
              $warehouse_code .= $str_code;

              
            }

          }


    }else{

         $str_code = '';
        $str = '';

        if(isset($aRow[db_prefix().'goods_transaction_detail.warehouse_id']) && ($aRow[db_prefix().'goods_transaction_detail.warehouse_id'] !='')){
          $arr_warehouse = explode(',', $aRow[db_prefix().'goods_transaction_detail.warehouse_id']);

          if(count($arr_warehouse) > 0){

            foreach ($arr_warehouse as $wh_key => $warehouseid) {
                $str_code = '';
              $str = '';
              if ($warehouseid != '' && $warehouseid != '0') {

                $team = get_warehouse_name($warehouseid);
                if($team){
                  $value = $team != null ? get_object_vars($team)['warehouse_name'] : '';

                  $value_code = $team != null ? get_object_vars($team)['warehouse_code'] : '';

                  $str .= '<span class="label label-tag tag-id-1"><span class="tag">' . $value . '</span><span class="hide">, </span></span>&nbsp';
                  
                  $str_code .= '<span class="label label-tag tag-id-1"><span class="tag">' . $value_code . '</span><span class="hide">, </span></span>&nbsp';

                  $warehouse_name .= $str;
                  $warehouse_code .= $str_code;

                  if($wh_key%3 ==0){
                    $warehouse_name .='<br/>';
                    $warehouse_code .='<br/>';
                  }
                }

              }
            }

          } else {
            $warehouse_name = '';
            $warehouse_code = '';
          }
        }
    }


     $row[] = $warehouse_code;
     $row[] = $warehouse_name;

     if($aRow['goods_receipt_id'] == 0){

       $row[] = _d(date('Y-m-d', strtotime($aRow['opening_stock_date_add']))); 
     }else{
       $row[] = _d($aRow[$aRow[db_prefix().'goods_transaction_detail.status'].'_date_add']); 
     }


    switch ($aRow[db_prefix().'goods_transaction_detail.status']) {
      case 1:
           //stock_import
         $row[] = "<center><span style='color: grey; font-weight:bold;border-radius: 5px;'>".number_format($aRow['old_quantity'], 2, ".", ",")."<span></center>"; 
         break;
      case 2:
           //stock_export
        $row[] = "<center><span style='color: grey; font-weight:bold;border-radius: 5px;'>".number_format((float)number_format($aRow['old_quantity'], 2, ".", ",") + (float)number_format($aRow['quantity'], 2, ".", ","),  2, ".", ",")."<span></center>";
         break;
      case 3:
           //lost adjustment
         $row[] = "<center><span style='color: grey; font-weight:bold;border-radius: 5px;'>".number_format($aRow['old_quantity'], 2, ".", ",")."<span></center>";
         break;
      case 4:
           //internal_delivery_note
         $row[] = "<center><span style='color: grey; font-weight:bold;border-radius: 5px;'>".number_format($aRow['old_quantity'], 2, ".", ",")."<span></center>";
         break;
       
     } 

    

    //update view old quantity, new quantity
    if($aRow['old_quantity'] != null && $aRow['old_quantity'] != ''){
         switch ($aRow[db_prefix().'goods_transaction_detail.status']) {
           case 1:
           //stock_import
              $row[] = "<center><span style='color: #84c529; font-weight:bold;border-radius: 5px;'>".number_format( (float)$aRow['old_quantity'] + (float)$aRow['quantity'], 2, ".", ",")."<span></center>";

               break;
           case 2:
           //stock_export
               $row[] = "<center><span style='color:#84c529; font-weight:bold;border-radius: 5px;'>".number_format( (float)$aRow['old_quantity'], 2, ".", ",")."<span></center>";
               break;
           case 3:
           //lost adjustment
               $row[] = "<center><span style='color:#84c529; font-weight:bold;border-radius: 5px;'>".number_format( $aRow['quantity'], 2, ".", ",")."<span></center>";
               break;
           case 4:
           //internal_delivery_note
               $row[] = "<center><span style='color: #84c529; font-weight:bold;border-radius: 5px;'>".number_format((float)$aRow['old_quantity'] - (float)$aRow['quantity'], 2, ".", ",")."<span></center>";
               break;
       } 

    }else{
       //$row[] = $aRow['quantity'];
       $row[] = "<center><span style='color: #84c529; font-weight:bold;border-radius: 5px;'>".number_format((float)$aRow['quantity'], 2, ".", ",")."<span></center>";
    }
    
    $color = "#84c529";
    $signo = "+";
    switch ($aRow[db_prefix().'goods_transaction_detail.status']) {
      case 1:
          $color = "#84c529";
          $signo = "+";
          break;
      case 2:
          $color = "red";
          $signo = "-";
          break;
      case 3:
          $color = "#337ab7";
          $signo = "";
          break;
      case 4:
          $color = "red";
          $signo = "-";
          break;
    }  

    //$total_production_cost_unit =  $aRow['costo'];
    $value_comp = wh_get_item_variatiom($aRow['commodity_id']);
    $value_comp2 = get_goods_delivery_code($aRow['goods_receipt_id']) != null ? get_goods_delivery_code($aRow['goods_receipt_id'])->goods_delivery_code : '';
    if($_SESSION['codigo'] == ""){
      $_SESSION['codigo'] = $value_comp2;
    }
    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    if($aRow[db_prefix().'goods_transaction_detail.status'] == 2){
        //$value_comp2 = get_goods_delivery_code($aRow['goods_receipt_id']) != null ? get_goods_delivery_code($aRow['goods_receipt_id'])->goods_delivery_code : '';
        if($value_comp2 == $_SESSION["codigo"]){
            if($value_comp == $_SESSION["item_merma"]){
              $total_production_cost_unit = $total_production_cost_unit + $_SESSION[$value_comp];//$aRow['costo'];
            }else{
              $total_production_cost_unit = $total_production_cost_unit + $aRow['costo'];
            }
            $total_production_cost = $total_production_cost + $aRow['price_sug_2'];
            $total_utility_cost = $total_utility_cost + $aRow['gain_price'];
            $total_price_sale_unit = $total_price_sale_unit + $aRow['price_sale_unit'];
            $total_sale_price = $total_sale_price + $aRow['price_sale'];
            $_SESSION['codigo'] = $value_comp2;
        }else{
            $_SESSION['codigo'] = "";
        }
        //$_SESSION["codigo"] = $value_comp2;
    }

    if($aRow[db_prefix().'goods_transaction_detail.status'] == 1 || $aRow[db_prefix().'goods_transaction_detail.status'] == 4){
  $row[] = '<center><span style="color: grey;font-weight: bold;">'.$aRow['unit'].'</span></center>';
    }elseif ($aRow[db_prefix().'goods_transaction_detail.status'] == 2){
      $row[] = '<center><span style="color: grey;font-weight: bold;">'.$aRow['unit_2'].'</span></center>';
    }elseif ($aRow[db_prefix().'goods_transaction_detail.status'] == 3){
      $row[] = '<center><span style="color: grey;font-weight: bold;">'.$aRow['unit_3'].'</span></center>';
    }
  if($aRow['mov'] != 0){
    $row[] = '<center><span style="color: '.$color.';font-weight: bold;">'.$signo.number_format($aRow['mov'], 2, ".", ",").'</span></center>';
  }else{
    $row[] = '<center><span style="color: '.$color.';font-weight: bold;">'.$signo.number_format($aRow['quantity'], 2, ".", ",").'</span></center>';
  }

    if($aRow[db_prefix().'goods_transaction_detail.status'] == 3)
      $row[] = '<center><span style="color: #84c529;font-weight: bold;">'.number_format($aRow['rendi'], 2, ".", ",").' %</span></center>';
    else
      $row[] = '<center><span style="color: #84c529;font-weight: bold;">-</span></center>';

    if($aRow[db_prefix().'goods_transaction_detail.status'] == 3)
      $row[] = '<center><span style="color: red;font-weight: bold;">'.number_format($aRow['merma'], 2, ".", ",").' %</span></center>';
    else
      $row[] = '<center><span style="color: red;font-weight: bold;">-</span></center>';

    if($aRow[db_prefix().'goods_transaction_detail.status'] == 2) {
      if($value_comp == $_SESSION["item_merma"]){
        $value_cost_val = $_SESSION[$value_comp];//$aRow['costo'];
      }else{
        $value_cost_val = $aRow['costo'];
      }
      $row[] = '<center><span style="color: orange;font-weight: bold;">'.number_format($value_cost_val, 2, ".", ",").$aRow['currency'].'</span></center>';
    }
    //COSTO DE LA MERMA QUE DEFINE TODO
    if($aRow[db_prefix().'goods_transaction_detail.status'] == 3) {
      session_start();
      //$value_comp = wh_get_item_variatiom($aRow['commodity_id']);
      $_SESSION[$value_comp] = fdiv($aRow['costo_merma'], $aRow['rendi']) * 100;
      $_SESSION["item_merma"] = $value_comp;
      //$row[] = '<center><span style="color: orange;font-weight: bold;"> - </span></center>';
      $row[] = '<center><span style="color: red;font-weight: bold;">'.number_format(fdiv($aRow['costo_merma'], $aRow['rendi']) * 100, 2, ".", ",").$aRow['currency'].'</span></center>';
    }

    if ($aRow[db_prefix().'goods_transaction_detail.status'] == 1 || $aRow[db_prefix().'goods_transaction_detail.status'] == 4){
      $mov = $aRow['mov'];
      if($aRow['mov'] == 0){
          $mov = $aRow['quantity'];
      }
      if($total_production_cost_unit != 0) {
        //$total_cal = number_format(fdiv(floatval($total_production_cost),floatval($mov)), 2, ".", ",");//calculamos el precio por unidad producida
        $row[] = '<input type="hidden" id="costo_'.$aRow['goods_receipt_id'].'" value="'.number_format($total_production_cost_unit, 2, ".", ",").'"><center><span style="border-radius:5px; color: red;padding: 10px; font-weight: bold;">'.number_format($total_production_cost_unit, 2, ".", ",").$aRow['currency'].'</span></center>';
      }else{
        $row[] = '<center><span style="border-radius:5px; color: red;padding: 10px; font-weight: bold;">'.number_format($aRow['costo'], 2, ".", ",").$aRow['currency'].'</span></center>';
      }
      
    } 

    if($aRow[db_prefix().'goods_transaction_detail.status'] == 2) {
      if($value_comp == $_SESSION["item_merma"]){
        $value_cost_val_2 = $_SESSION[$value_comp];//$aRow['costo'];
      }else{
        $value_cost_val_2 = $aRow['costo'];
      }
      $value_cost_val_2_final = $value_cost_val_2_final + ($value_cost_val_2 * $aRow['mov']);
      $row[] = '<center><span style="color: red;font-weight: bold;">'.number_format(($value_cost_val_2 * $aRow['mov']), 2, ".", ",").$aRow['currency'].'</span></center>';
    }

    if($aRow[db_prefix().'goods_transaction_detail.status'] == 1) {
      $row[] = '<center><span style="color: red;font-weight: bold;">'.number_format(($value_cost_val_2_final), 2, ".", ",").$aRow['currency'].'</span></center>';
      $value_cost_val_2_final = 0;
      $total_production_cost_unit = 0;
    }

    if($aRow[db_prefix().'goods_transaction_detail.status'] == 3 || $aRow[db_prefix().'goods_transaction_detail.status'] == 4) {
      $row[] = '<center><span style="color: red;font-weight: bold;"> - </span></center>';
    }
	 if($aRow[db_prefix().'goods_transaction_detail.status'] == 1) {
		$row[] = "<input type='number' value='".$aRow['price_sale_rate']."' id='precio_".$aRow['goods_receipt_id']."' class='form-control' onkeyup='calculatePriceVentaProducto(".$aRow['goods_receipt_id'].")' placeholder='Precio x unidad'/>";
	 }else{
		 $row[] = "-";
	 }
	 
	  if($aRow[db_prefix().'goods_transaction_detail.status'] == 1) {
		$row[] = "<input type='number' onkeyup='calculatePriceVentaProductoProcentaje(".$aRow['goods_receipt_id'].")' value='".$aRow['gain']."' id='porcentaje_".$aRow['goods_receipt_id']."' class='form-control' placeholder='Porcentaje'/>";
	 }else{
		 $row[] = "-";
	 }
	 
	if($aRow[db_prefix().'goods_transaction_detail.status'] == 1) {
		$row[] = "<button class='btn btn-success' onclick='sendPrice(".$aRow['itemid'].", ".$aRow['goods_receipt_id'].")'>GUARDAR</button>";
	 }else{
		 $row[] = "-";
	 }
		$row[] = $aRow['date_price_update'];
        $lot_number ='';
         if(($aRow['lot_number'] != null) && ( $aRow['lot_number'] != '') ){
            $array_lot_number = explode(',', $aRow['lot_number']);
            foreach ($array_lot_number as $key => $lot_value) {
                
                if($key%2 ==0){
                  $lot_number .= $lot_value;
                }else{
                  $lot_number .= ' : '.$lot_value.' ';
                }

            }
         }



     $row[] = $lot_number;

    

     $expiry_date ='';
         if(($aRow[db_prefix().'goods_transaction_detail.expiry_date'] != null) && ( $aRow[db_prefix().'goods_transaction_detail.expiry_date'] != '') ){
            $array_expiry_date = explode(',', $aRow[db_prefix().'goods_transaction_detail.expiry_date']);
            foreach ($array_expiry_date as $key => $expiry_date_value) {
                
                if($key%2 ==0){
                  $expiry_date .= _d($expiry_date_value);
                }else{
                  $expiry_date .= ' : '.$expiry_date_value.' ';
                }

            }
         }

     $row[] = $expiry_date;

     $row[] = $aRow['note'];
     switch ($aRow[db_prefix().'goods_transaction_detail.status']) {
           case 1:
               $row[] = "<center>ENTRADA</center>";
               break;
           case 2:
               $row[] = "<center>SALIDA</center>";
               break;
           case 3:
               $row[] = "<center>AJUSTE</center>";
               break;
           case 4:
               $row[] = "<center>INTERCAMBIO</center>";
               break;
       }  
       //$row[] = '<a href='.admin_url('warehouse/loss_adjustment').' class="btn btn-danger text-right mright5">ELIMINAR</a>';

    
    $output['aaData'][] = $row;


 
    }

    //$output['aaData'][] = "<span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span>";



