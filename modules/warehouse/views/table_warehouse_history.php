<?php

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
    '((quantity + old_quantity) - old_quantity) as mov',
    '(((quantity + old_quantity) - old_quantity)/old_quantity) * 100 as rendi',
    '(1-(((quantity + old_quantity) - old_quantity)/old_quantity)) * 100 as merma',
    '(select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1) as costo',
    '(((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.goods_receipt_id = tblgoods_transaction_detail.goods_receipt_id order by tblgoods_receipt_detail.id desc limit 1)/((((quantity + old_quantity) - old_quantity)/old_quantity) * 100)) * ((quantity + old_quantity) - old_quantity) ) as price_sug',
    '((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1)  * ((quantity + old_quantity) - old_quantity)) as price_sug_2',
    '(select profif_ratio from tblitems where commodity_code = tblgoods_transaction_detail.commodity_id) as gain',
    '(select symbol from tblcurrencies where isdefault = 1 limit 1) as currency',
    '(((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1)  * ((quantity + old_quantity) - old_quantity)) * ((select profif_ratio from tblitems where commodity_code = tblgoods_transaction_detail.commodity_id)/100)) as gain_price',
    '(((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1)  * ((quantity + old_quantity) - old_quantity)) + (((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1)  * ((quantity + old_quantity) - old_quantity)) * ((select profif_ratio from tblitems where commodity_code = tblgoods_transaction_detail.commodity_id)/100))) as price_sale',
    '((((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1)  * ((quantity + old_quantity) - old_quantity)) + (((select unit_price from tblgoods_receipt_detail where tblgoods_receipt_detail.commodity_code = tblgoods_transaction_detail.commodity_id order by tblgoods_receipt_detail.id desc limit 1)  * ((quantity + old_quantity) - old_quantity)) * ((select profif_ratio from tblitems where commodity_code = tblgoods_transaction_detail.commodity_id)/100))) / ((quantity + old_quantity) - old_quantity)) as price_sale_unit',
    'lot_number',
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

         $value = get_goods_receipt_code($aRow['goods_receipt_id']) != null ? get_goods_receipt_code($aRow['goods_receipt_id'])->goods_receipt_code : '';

         if($value != ''){
            $row[] = '<a style="color: green;font-weight: bold;" href="' . admin_url('warehouse/manage_purchase/' . $aRow['goods_receipt_id']) . '" >'. $value.'</a>';
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
            $row[] = '<a style="color: blue;font-weight:bold;" href="' . admin_url('warehouse/manage_internal_delivery/' . $aRow['goods_receipt_id']) . '" >'. $value.'</a>';
         }else{
            $row[] = '';
         }


    }else{
      //3 lost adjustment
         $value = "LA#".$aRow['goods_receipt_id'];

         if($value != ''){
            $row[] = '<a style="color: blue;font-weight:bold;" href="' . admin_url('warehouse/view_lost_adjustment/' . $aRow['goods_receipt_id']) . '" >'. $value.'</a>';
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

              $str .= 'From: <span class="label label-tag tag-id-1"><span class="tag">' . $value . '</span><span class="hide">, </span></span>&nbsp';
              
              $str_code .= 'From: <span class="label label-tag tag-id-1"><span class="tag">' . $value_code . '</span><span class="hide">, </span></span>&nbsp';

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

              $str .= '- To: <span class="label label-tag tag-id-1"><span class="tag">' . $value1 . '</span><span class="hide">, </span></span>&nbsp';
              
              $str_code .= '- To: <span class="label label-tag tag-id-1"><span class="tag">' . $value_code1 . '</span><span class="hide">, </span></span>&nbsp';

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
         $row[] = number_format($aRow['old_quantity'], 4, ".", ","); 
         break;
      case 2:
           //stock_export
        $row[] = number_format((float)number_format($aRow['old_quantity'], 4, ".", ",") + (float)number_format($aRow['quantity'], 4, ".", ","),  4, ".", ",");
         break;
      case 3:
           //lost adjustment
         $row[] = number_format($aRow['old_quantity'], 4, ".", ",");
         break;
      case 4:
           //internal_delivery_note
         $row[] = number_format($aRow['old_quantity'], 4, ".", ",");
         break;
       
     } 

    

    //update view old quantity, new quantity
    if($aRow['old_quantity'] != null && $aRow['old_quantity'] != ''){
         switch ($aRow[db_prefix().'goods_transaction_detail.status']) {
           case 1:
           //stock_import
              $row[] = "<span style='color: white;background-color:green; padding: 10px;font-weightbold;border-radius: 5px;'>".(float)$aRow['old_quantity'] + (float)$aRow['quantity']."<span>";

               break;
           case 2:
           //stock_export
               $row[] = "<span style='color: white;background-color:green; padding: 10px;font-weightbold;border-radius: 5px;'>".(float)$aRow['old_quantity']."<span>";
               break;
           case 3:
           //lost adjustment
               $row[] = "<span style='color: white;background-color:green; padding: 10px;font-weightbold;border-radius: 5px;'>".$aRow['quantity']."<span>";
               break;
           case 4:
           //internal_delivery_note
               $row[] = "<span style='color: white;background-color:green; padding: 10px;font-weightbold;border-radius: 5px;'>".app_format_money((float)$aRow['old_quantity'] - (float)$aRow['quantity'],'')."<span>";
               break;
       } 

    }else{
       $row[] = $aRow['quantity'];
    }
    
    $color = "green";
    $signo = "+";
    switch ($aRow[db_prefix().'goods_transaction_detail.status']) {
      case 1:
          $color = "green";
          $signo = "+";
          break;
      case 2:
          $color = "red";
          $signo = "-";
          break;
      case 3:
          $color = "blue";
          $signo = "";
          break;
      case 4:
          $color = "red";
          $signo = "-";
          break;
    }  

  $row[] = '<span style="color: grey;font-weight: bold;">'.$aRow['unit'].'</span>';
    $row[] = '<span style="color: '.$color.';font-weight: bold;">'.$signo.number_format($aRow['mov'], 4, ".", ",").'</span>';

    if($aRow[db_prefix().'goods_transaction_detail.status'] == 3)
      $row[] = '<span style="color: green;font-weight: bold;">'.number_format($aRow['rendi'], 4, ".", ",").' %</span>';
    else
      $row[] = '<span style="color: green;font-weight: bold;">-</span>';

    if($aRow[db_prefix().'goods_transaction_detail.status'] == 3)
      $row[] = '<span style="color: red;font-weight: bold;">'.number_format($aRow['merma'], 4, ".", ",").' %</span>';
    else
      $row[] = '<span style="color: red;font-weight: bold;">-</span>';

      $row[] = '<span style="color: orange;font-weight: bold;">'.number_format($aRow['costo'], 4, ".", ",").$aRow['currency'].'</span>';

      if($aRow[db_prefix().'goods_transaction_detail.status'] == 3)
        $row[] = '<span style="color: red;font-weight: bold;">'.number_format($aRow['price_sug'], 4, ".", ",").$aRow['currency'].'</span>';
      else
        $row[] = '<span style="color: red;font-weight: bold;">'.number_format($aRow['price_sug_2'], 4, ".", ",").$aRow['currency'].'</span>';

    $row[] = '<span style="color: green;font-weight: bold;">'.number_format($aRow['gain'], 4, ".", ",").'%</span>';

    $row[] = '<span style="color: green;font-weight: bold;">'.number_format($aRow['gain_price'], 4, ".", ",").$aRow['currency'].'</span>';

    $row[] = '<span style="color: green;font-weight: bold;">'.number_format($aRow['price_sale_unit'], 4, ".", ",").$aRow['currency'].'</span>';

    $row[] = '<span style="color: green;font-weight: bold;">'.number_format($aRow['price_sale'], 4, ".", ",").$aRow['currency'].'</span>';

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
               $row[] = _l('stock_import');
               break;
           case 2:
               $row[] = _l('stock_export');
               break;
           case 3:
               $row[] = _l('lost, adjustment');
               break;
           case 4:
               $row[] = _l('internal_delivery_note');
               break;
       }  
     
     
    $output['aaData'][] = $row;

    }



