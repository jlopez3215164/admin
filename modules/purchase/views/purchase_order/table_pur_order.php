<?php

defined('BASEPATH') or exit('No direct script access allowed');

$custom_fields = get_custom_fields('pur_order', [
    'show_on_table' => 1,
    ]);

$aColumns = [
    'pur_order_number',
    'order_date',
    'type',
    'project',
    'department',
    'vendor',
    'pur_order_name',
    'subtotal',
    'total_tax',
    'total',
    '(SELECT GROUP_CONCAT(name SEPARATOR ",") FROM ' . db_prefix() . 'taggables JOIN ' . db_prefix() . 'tags ON ' . db_prefix() . 'taggables.tag_id = ' . db_prefix() . 'tags.id WHERE rel_id = ' . db_prefix() . 'pur_orders.id and rel_type="pur_order" ORDER by tag_order ASC) as tags', 
    'approve_status',
    'delivery_status',
    'number',
    'expense_convert',
    '(select sum(amount) from tblpur_order_payment where pur_order = tblpur_orders.id) as pagado',
    'total - (select sum(amount) from tblpur_order_payment where pur_order = tblpur_orders.id) as restante',
    ];

if(isset($vendor)){
    $aColumns = [
    'pur_order_number',
    'total',
    'total_tax',
    'vendor', 
    'order_date',
    'number',
    'approve_status',
    
    ];
}

$sIndexColumn = 'id';
$sTable       = db_prefix().'pur_orders';
$join         = [
                    'LEFT JOIN '.db_prefix().'pur_vendor ON '.db_prefix().'pur_vendor.userid = '.db_prefix().'pur_orders.vendor',
                    'LEFT JOIN '.db_prefix().'departments ON '.db_prefix().'departments.departmentid = '.db_prefix().'pur_orders.department',
                    'LEFT JOIN '.db_prefix().'projects ON '.db_prefix().'projects.id = '.db_prefix().'pur_orders.project',
                ];
$i = 0;
foreach ($custom_fields as $field) {
    $select_as = 'cvalue_' . $i;
    if ($field['type'] == 'date_picker' || $field['type'] == 'date_picker_time') {
        $select_as = 'date_picker_cvalue_' . $i;
    }
    array_push($aColumns, 'ctable_' . $i . '.value as ' . $select_as);
    array_push($join, 'LEFT JOIN '.db_prefix().'customfieldsvalues as ctable_' . $i . ' ON '.db_prefix().'pur_orders.id = ctable_' . $i . '.relid AND ctable_' . $i . '.fieldto="' . $field['fieldto'] . '" AND ctable_' . $i . '.fieldid=' . $field['id']);
    $i++;
}

$where = [];

if(isset($vendor)){
    array_push($where, ' AND '.db_prefix().'pur_orders.vendor = '.$vendor);
}

if ($this->ci->input->post('from_date')
    && $this->ci->input->post('from_date') != '') {
    array_push($where, 'AND order_date >= "'.$this->ci->input->post('from_date').'"');
}

if ($this->ci->input->post('to_date')
    && $this->ci->input->post('to_date') != '') {
    array_push($where, 'AND order_date <= "'.$this->ci->input->post('to_date').'"');
}


if ($this->ci->input->post('status') && count($this->ci->input->post('status')) > 0) {
    array_push($where, 'AND approve_status IN (' . implode(',', $this->ci->input->post('status')) . ')');
}

if ($this->ci->input->post('vendor')
    && count($this->ci->input->post('vendor')) > 0) {
    array_push($where, 'AND vendor IN (' . implode(',', $this->ci->input->post('vendor')) . ')');
}

if ($this->ci->input->post('project')
    && count($this->ci->input->post('project')) > 0) {
    array_push($where, 'AND project IN (' . implode(',', $this->ci->input->post('project')) . ')');
}

if ($this->ci->input->post('department')
    && count($this->ci->input->post('department')) > 0) {
    array_push($where, 'AND department IN (' . implode(',', $this->ci->input->post('department')) . ')');
}

if ($this->ci->input->post('delivery_status')
    && count($this->ci->input->post('delivery_status')) > 0) {
    array_push($where, 'AND delivery_status IN (' . implode(',', $this->ci->input->post('delivery_status')) . ')');
}


$type = $this->ci->input->post('type');
if (isset($type)) {
    $where_type = '';
    foreach ($type as $t) {
        if ($t != '') {
            if ($where_type == '') {
                $where_type .= ' AND (tblpur_orders.type = "' . $t . '"';
            } else {
                $where_type .= ' or tblpur_orders.type = "' . $t . '"';
            }
        }
    }
    if ($where_type != '') {
        $where_type .= ')';
        array_push($where, $where_type);
    }
}

//tags filter
$tags_ft = $this->ci->input->post('item_filter');
if (isset($tags_ft)) {
    $where_tags_ft = '';
    foreach ($tags_ft as $commodity_id) {
        if ($commodity_id != '') {
            if ($where_tags_ft == '') {
                $where_tags_ft .= ' AND (tblpur_orders.id = "' . $commodity_id . '"';
            } else {
                $where_tags_ft .= ' or tblpur_orders.id = "' . $commodity_id . '"';
            }
        }
    }
    if ($where_tags_ft != '') {
        $where_tags_ft .= ')';
        array_push($where, $where_tags_ft);
    }
}

$result = data_tables_init($aColumns, $sIndexColumn, $sTable, $join, $where, [db_prefix().'pur_orders.id as id','company','pur_order_number','expense_convert',db_prefix().'projects.name as project_name',db_prefix().'departments.name as department_name']);

$output  = $result['output'];
$rResult = $result['rResult'];

foreach ($rResult as $aRow) {
    $row = [];

   for ($i = 0; $i < count($aColumns); $i++) {
        if (strpos($aColumns[$i], 'as') !== false && !isset($aRow[$aColumns[$i]])) {
            $_data = $aRow[strafter($aColumns[$i], 'as ')];
        } else {
            $_data = $aRow[$aColumns[$i]];
        }

        if($aColumns[$i] == 'total'){
            $_data = app_format_money($aRow['total'], '');
        }elseif($aColumns[$i] == 'pur_order_number'){

            $numberOutput = '';
    
            $numberOutput = '<a href="' . admin_url('purchase/purchase_order/' . $aRow['id']) . '"  onclick="init_pur_order(' . $aRow['id'] . '); return false;" >'.$aRow['pur_order_number']. '</a>';
            
            $numberOutput .= '<div class="row-options">';

            if (has_permission('purchase', '', 'view')) {
                $numberOutput .= ' <a href="' . admin_url('purchase/purchase_order/' . $aRow['id']) . '" onclick="init_pur_order(' . $aRow['id'] . '); return false;" >' . _l('view') . '</a>';
            }
            if ((has_permission('purchase', '', 'edit') || is_admin()) && $aRow['approve_status'] != 2 ) {
                $numberOutput .= ' | <a href="' . admin_url('purchase/pur_order/' . $aRow['id']) . '">' . _l('edit') . '</a>';
            }
            if (has_permission('purchase', '', 'delete') || is_admin()) {
                $numberOutput .= ' | <a href="' . admin_url('purchase/delete_pur_order/' . $aRow['id']) . '" class="text-danger">' . _l('delete') . '</a>';
            }
            $numberOutput .= '</div>';

            $_data = $numberOutput;

        }elseif($aColumns[$i] == 'vendor'){
            $_data = '<a href="' . admin_url('purchase/vendor/' . $aRow['vendor']) . '" >' .  $aRow['company'] . '</a>';
        }elseif ($aColumns[$i] == 'order_date') {
            $_data = _d($aRow['order_date']);
        }elseif($aColumns[$i] == 'approve_status'){
            $_data = get_status_approve($aRow['approve_status']);
        }elseif($aColumns[$i] == 'total_tax'){
            $_data = app_format_money($aRow['total_tax'], '');
        }elseif($aColumns[$i] == 'number'){
            $paid = $aRow['total'] - purorder_left_to_pay($aRow['id']);
            $percent = 0;
            if($aRow['total'] > 0){
                $percent = ($paid / $aRow['total'] ) * 100;
            }
            
            $_data = '<div class="progress">
                          <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                          aria-valuemin="0" aria-valuemax="100" style="width:'.round($percent).'%">
                           ' .round($percent).' % 
                          </div>
                        </div>';
        }elseif($aColumns[$i] == 'expense_convert'){
            if($aRow['expense_convert'] == 0){
             $_data = '<a href="javascript:void(0)" onclick="convert_expense('.$aRow['id'].','.$aRow['total'].'); return false;" class="btn btn-warning btn-icon">'._l('convert').'</a>';
            }else{
                $_data = '<a href="'.admin_url('expenses/list_expenses/'.$aRow['expense_convert']).'" class="btn btn-success btn-icon">'._l('view_expense').'</a>';
            }
        }elseif($aColumns[$i] == '(SELECT GROUP_CONCAT(name SEPARATOR ",") FROM ' . db_prefix() . 'taggables JOIN ' . db_prefix() . 'tags ON ' . db_prefix() . 'taggables.tag_id = ' . db_prefix() . 'tags.id WHERE rel_id = ' . db_prefix() . 'pur_orders.id and rel_type="pur_order" ORDER by tag_order ASC) as tags'){
                
                $_data = render_tags($aRow['tags']);

        }elseif($aColumns[$i] == 'type'){
            $_data = _l($aRow['type']);
        }elseif($aColumns[$i] == 'subtotal'){
            $_data = app_format_money($aRow['subtotal'],'');
        }elseif($aColumns[$i] == 'project'){
            $_data = $aRow['project_name'];
        }elseif($aColumns[$i] == 'department'){
            $_data = $aRow['department_name'];
        }elseif($aColumns[$i] == 'delivery_status'){
            $delivery_status = '';
            if($aRow['delivery_status'] == 0){
                $delivery_status = '<span class="label label-danger">'._l('undelivered').'</span>';
            }else{
                $delivery_status = '<span class="label label-success">'._l('delivered').'</span>';
            }
            $_data = $delivery_status;
        }else {
            if (strpos($aColumns[$i], 'date_picker_') !== false) {
                $_data = (strpos($_data, ' ') !== false ? _dt($_data) : _d($_data));
            }
        }

        $row[] = $_data;
    }
    $output['aaData'][] = $row;

}
