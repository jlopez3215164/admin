<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * get status modules wh
 * @param  string $module_name 
 * @return boolean             
 */
function acc_get_status_modules($module_name){
	$CI             = &get_instance();

	$sql = 'select * from '.db_prefix().'modules where module_name = "'.$module_name.'" AND active =1 ';
	$module = $CI->db->query($sql)->row();
	if($module){
		return true;
	}else{
		return false;
	}
}

/**
 * check account exists
 * @param  string $key_name 
 * @return boolean or integer           
 */
function acc_account_exists($key_name){
	$CI             = &get_instance();

	$CI->load->model('accounting/accounting_model');

	if(get_option('acc_add_default_account') == 0){
        $CI->accounting_model->add_default_account();
    }

    if(get_option('acc_add_default_account_new') == 0){
        $CI->accounting_model->add_default_account_new();
    }

	$sql = 'select * from '.db_prefix().'acc_accounts where key_name = "'.$key_name.'"';
	$account = $CI->db->query($sql)->row();

	if($account){
		return $account->id;
	}else{
		return false;
	}
}