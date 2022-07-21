<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?php init_head(); ?>
<div id="wrapper">
  <div class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="panel_s">
          <div class="panel-body">
          	<div class="row">
             <div class="col-md-12">
              <h4 class="no-margin font-bold"><?php echo _l($title); ?> </h4>
 				<br>
             </div>
            </div>
	            <div class="horizontal-scrollable-tabs preview-tabs-top">
	            <div class="scroller arrow-left"><i class="fa fa-angle-left"></i></div>
	            <div class="scroller arrow-right"><i class="fa fa-angle-right"></i></div>
	            <div class="horizontal-tabs">
	               <ul class="nav nav-tabs nav-tabs-horizontal mbot15" role="tablist">
	                  <li role="presentation" class="active">
	                     <a href="#tab_pur_invoice" aria-controls="tab_pur_invoice" role="tab" data-toggle="tab">
	                     <?php echo _l('pur_invoice'); ?>
	                     </a>
	                  </li>
	                  <li role="presentation">
	                     <a href="#payment_record" aria-controls="payment_record" role="tab" data-toggle="tab">
	                     <?php echo _l('payment_record'); ?>
	                     </a>
	                  </li>   
	                  <li role="presentation">
	                     <a href="#tab_reminders" onclick="initDataTable('.table-reminders', admin_url + 'misc/get_reminders/' + <?php echo html_entity_decode($pur_invoice->id) ;?> + '/' + 'pur_invoice', undefined, undefined, undefined,[1,'asc']); return false;" aria-controls="tab_reminders" role="tab" data-toggle="tab">
	                     <?php echo _l('pur_invoice_reminders'); ?>
	                     <?php
	                        $total_reminders = total_rows(db_prefix().'reminders',
	                          array(
	                           'isnotified'=>0,
	                           'staff'=>get_staff_user_id(),
	                           'rel_type'=>'pur_invoice',
	                           'rel_id'=>$pur_invoice->id
	                           )
	                          );
	                        if($total_reminders > 0){
	                          echo '<span class="badge">'.$total_reminders.'</span>';
	                        }
	                        ?>
	                     </a>
	                  </li>
	                     <?php
	                     $customer_custom_fields = false;
	                     if(total_rows(db_prefix().'customfields',array('fieldto'=>'pur_invoice','active'=>1)) > 0 ){
	                          $customer_custom_fields = true;
	                      ?>
	                  <li role="presentation" >
	                     <a href="#custom_fields" aria-controls="custom_fields" role="tab" data-toggle="tab">
	                     <?php echo _l( 'custom_fields'); ?>
	                     </a>
	                  </li>
	                  <?php } ?>
	                  <li role="presentation">
	                     <a href="#tab_tasks" onclick="init_rel_tasks_table(<?php echo html_entity_decode($pur_invoice->id); ?>,'pur_invoice'); return false;" aria-controls="tab_tasks" role="tab" data-toggle="tab">
	                     <?php echo _l('tasks'); ?>
	                     </a>
	                  </li>
	                  <li role="presentation">
	                     <a href="#tab_notes" onclick="get_sales_notes_inv(<?php echo html_entity_decode($pur_invoice->id); ?>,'purchase'); return false" aria-controls="tab_notes" role="tab" data-toggle="tab">
	                     <?php echo _l('pur_invoice_notes'); ?>
	                     <span class="notes-total">
	                        <?php $totalNotes       = total_rows(db_prefix().'notes', ['rel_id' => $pur_invoice->id, 'rel_type' => 'pur_invoice']);
	                        if($totalNotes > 0){ ?>
	                           <span class="badge"><?php echo ($totalNotes); ?></span>
	                        <?php } ?>
	                     </span>
	                     </a>
	                  </li>
	                  <li role="presentation">
	                     <a href="#attachment" aria-controls="attachment" role="tab" data-toggle="tab">
	                     <?php echo _l('attachment'); ?>
	                     </a>
	                  </li>  
	                  
	                  
	               </ul>
	            </div>
	         	</div>

	         	<div class="row">
	         		<div class="col-md-3">
	         			<?php $class = '';
	         			if($pur_invoice->payment_status == 'unpaid'){
	         				$class = 'danger';
	         			}elseif($pur_invoice->payment_status == 'paid'){
	         				$class = 'success';
	         			}elseif($pur_invoice->payment_status == 'partially_paid'){
	         				$class = 'warning';
	         			} ?>
	         			<span class="label label-<?php echo html_entity_decode($class); ?> mtop5 s-status invoice-status-3"><?php echo _l($pur_invoice->payment_status); ?></span>
	         		</div>
	         		<div class="col-md-9 _buttons">
	         			<div class="visible-xs">
		                  <div class="mtop10"></div>
		               	</div>
		               	<div class="pull-right">
		               		<a href="<?php echo admin_url('purchase/pur_invoice/'.$pur_invoice->id); ?>" data-toggle="tooltip" title="<?php echo _l('edit_invoice'); ?>" class="btn btn-default btn-with-tooltip mright5" data-placement="bottom"><i class="fa fa-pencil-square-o"></i></a>
		               		
		               	   <?php if(purinvoice_left_to_pay($pur_invoice->id) > 0){ ?>
			               	<a href="#" onclick="add_payment(<?php echo html_entity_decode($pur_invoice->id); ?>); return false;" class="btn btn-success pull-right"><i class="fa fa-plus-square"></i>&nbsp;<?php echo ' '._l('payment'); ?></a>
			               <?php } ?>
		               	</div>

	         		</div>
	         	</div>

	         	<div class="clearfix"></div>
         		<hr class="hr-panel-heading" />

	         	<div class="tab-content">
	         		<div role="tabpanel" class="tab-pane ptop10 active" id="tab_pur_invoice">
	         			<div class="col-md-6 pad_left_0">
	         				<div class="col-md-6 pad_left_0 border-right">
	         					<p><?php echo _l('invoice_number').':'; ?><span class="pull-right bold"><?php echo html_entity_decode($pur_invoice->invoice_number); ?></span></p>
	         				</div>
	         				<div class="col-md-6 pad_right_0">
	         					<p><?php echo _l('invoice_date').':'; ?><span class="pull-right bold"><?php echo _d($pur_invoice->invoice_date); ?></span></p>
	         				</div>
	         				<div class="col-md-12 pad_left_0 pad_right_0">
	         					<hr class="mtop5 mbot5">
	         				</div>

	         				<div class="col-md-6 pad_left_0 border-right">
	         					<p><?php echo _l('contract').':'; ?><span class="pull-right bold"><a href="<?php echo admin_url('purchase/contract/'.$pur_invoice->contract); ?>" ><?php echo get_pur_contract_number($pur_invoice->contract); ?></a></span></p>
	         				</div>
	         				<div class="col-md-6 pad_right_0">
	         					<p><?php echo _l('invoice_amount').':'; ?><span class="pull-right bold"><?php echo app_format_money($pur_invoice->subtotal,''); ?></span></p>
	         				</div>
	         				<div class="col-md-12 pad_left_0 pad_right_0">
	         					<hr class="mtop5 mbot5">
	         				</div>

	         				<div class="col-md-6 pad_left_0 border-right">
	         					<p><?php echo _l('tax').':'; ?><span class="pull-right bold"><?php echo html_entity_decode($pur_invoice->tax_rate).'%'; ?></span></p>
	         				</div>
	         				<div class="col-md-6 pad_right_0">
	         					<p><?php echo _l('tax_value').':'; ?><span class="pull-right bold"><?php echo app_format_money($pur_invoice->tax,''); ?></span></p>
	         				</div>
	         				<div class="col-md-12 pad_left_0 pad_right_0">
	         					<hr class="mtop5 mbot5">
	         				</div>

	         				<div class="col-md-12 pad_left_0 pad_right_0 ">
	         					<p><?php echo _l('total').':'; ?><span class="pull-right bold"><?php echo app_format_money($pur_invoice->total,''); ?></span></p>
	         				</div>
	         				
	         				<div class="col-md-12 pad_left_0 pad_right_0">
	         					<hr class="mtop5 mbot5">
	         				</div>

	         				<div class="col-md-12 pad_left_0 pad_right_0 ">
	         					<p><span class="bold"><?php echo _l('adminnote').': '; ?></span><span><?php echo html_entity_decode($pur_invoice->adminnote); ?></span></p>
	         				</div>

	         			</div>

	         			<div class="col-md-6">

	         				<div class="col-md-12 pad_left_0 pad_right_0 ">
	         					<div id="inputTagsWrapper">
			                       <label for="tags" class="control-label"><i class="fa fa-tag" aria-hidden="true"></i> <?php echo _l('tags'); ?></label>
			                       <input type="text" class="tagsinput" id="tags" name="tags" value="<?php echo (isset($pur_invoice) ? prep_tags_input(get_tags_in($pur_invoice->id,'pur_invoice')) : ''); ?>" data-role="tagsinput">
			                    </div>
	         				</div>
	         				<div class="col-md-12 pad_left_0 pad_right_0">
	         					<hr class="mtop5 mbot5">
	         				</div>

	         				<div class="col-md-6 pad_left_0 border-right">
	         					<p><?php echo _l('transaction_id').':'; ?><span class="pull-right bold"><?php echo html_entity_decode($pur_invoice->transactionid); ?></span></p>
	         				</div>
	         				<div class="col-md-6 pad_right_0">
	         					<p><?php echo _l('transaction_date').':'; ?><span class="pull-right bold"><?php echo _d($pur_invoice->transaction_date); ?></span></p>
	         				</div>
	         				<div class="col-md-12 pad_left_0 pad_right_0">
	         					<hr class="mtop5 mbot5">
	         				</div>
	         				<div class="col-md-6 pad_left_0 border-right">
	         					<p><?php echo _l('add_from').':'; ?><span class="pull-right bold"><a href="<?php echo admin_url('staff/profile/'.$pur_invoice->add_from); ?>" ><?php echo get_staff_full_name($pur_invoice->add_from); ?></a></span></p>
	         				</div>
	         				<div class="col-md-6 pad_right_0">
	         					<p><?php echo _l('date_add').':'; ?><span class="pull-right bold"><?php echo _d($pur_invoice->date_add); ?></span></p>
	         				</div>
	         				<div class="col-md-12 pad_left_0 pad_right_0">
	         					<hr class="mtop5 mbot5">
	         				</div>

	         				<div class="col-md-12 pad_left_0 pad_right_0 ">
	         					<p><span class="bold"><?php echo _l('vendor_note').': '; ?></span><span><?php echo html_entity_decode($pur_invoice->vendor_note); ?></span></p>
	         				</div>
	         				<div class="col-md-12 pad_left_0 pad_right_0">
	         					<hr class="mtop5 mbot5">
	         				</div>
	         				<div class="col-md-12 pad_left_0 pad_right_0 ">
	         					<p><span class="bold"><?php echo _l('terms').': '; ?></span><span><?php echo html_entity_decode($pur_invoice->terms); ?></span></p>
	         				</div>

	         				
	         			</div>
	         		</div>
	         		<div role="tabpanel" class="tab-pane" id="tab_reminders">
		               <a href="#" data-toggle="modal" class="btn btn-info" data-target=".reminder-modal-pur_invoice-<?php echo html_entity_decode($pur_invoice->id); ?>"><i class="fa fa-bell-o"></i> <?php echo _l('estimate_set_reminder_title'); ?></a>
		               <hr />
		               <?php render_datatable(array( _l( 'reminder_description'), _l( 'reminder_date'), _l( 'reminder_staff'), _l( 'reminder_is_notified')), 'reminders'); ?>
		               <?php $this->load->view('admin/includes/modals/reminder',array('id'=>$pur_invoice->id,'name'=>'pur_invoice','members'=>$members,'reminder_title'=>_l('estimate_set_reminder_title'))); ?>
		            </div>

		            <div role="tabpanel" class="tab-pane" id="tab_notes">
	                    <br>
	                     <?php echo form_open(admin_url('purchase/add_pur_invoice_note/'.$pur_invoice->id),array('id'=>'sales-notes','class'=>'pur_invoice-notes-form')); ?>
	                     <?php echo render_textarea('description'); ?>
	                     <div class="text-right">
	                        <button type="submit" class="btn btn-info mtop15 mbot15"><?php echo _l('estimate_add_note'); ?></button>
	                     </div>
	                     <?php echo form_close(); ?>
	                     <hr />
	                     <div class="panel_s mtop20 no-shadow" id="sales_notes_area">
	                     </div>
                  	</div>

                  	<div role="tabpanel" class="tab-pane" id="payment_record">
		               <div class="col-md-6 pad_left_0" >
		               <h4 class="font-medium mbot15 bold text-success"><?php echo _l('payment_for_pur_invoice').' '.$pur_invoice->invoice_number; ?></h4>
		               </div>
		               
		               <div class="clearfix"></div>
		               <table class="table dt-table">
		                   <thead>
		                     <th><?php echo _l('payments_table_amount_heading'); ?></th>
		                      <th><?php echo _l('payments_table_mode_heading'); ?></th>
		                      <th><?php echo _l('payment_transaction_id'); ?></th>
		                      <th><?php echo _l('payments_table_date_heading'); ?></th>
		                      <th><?php echo _l('approval_status'); ?></th>
		                      <th><?php echo _l('options'); ?></th>
		                   </thead>
		                  <tbody>
		                     <?php foreach($payment as $pay) { ?>
		                        <tr>
		                           <td><?php echo app_format_money($pay['amount'],''); ?></td>
		                           <td><?php echo get_payment_mode_by_id($pay['paymentmode']); ?></td>
		                           <td><?php echo html_entity_decode($pay['transactionid']); ?></td>
		                           <td><?php echo _d($pay['date']); ?></td>
		                           <td><?php echo get_status_approve($pay['approval_status']); ?></td>
		                           <td>
		                           	<?php if(has_permission('purchase','','edit') || is_admin()){ ?>
		                           		<a href="<?php echo admin_url('purchase/payment_invoice/'.$pay['id']); ?>" class="btn btn-default btn-icon" data-toggle="tooltip" data-placement="top" title="<?php echo _l('view'); ?>" ><i class="fa fa-eye "></i></a>
		                           	<?php } ?>

		                           	<?php if(has_permission('purchase','','delete') || is_admin()){ ?>
		                            <a href="<?php echo admin_url('purchase/delete_payment_pur_invoice/'.$pay['id'].'/'.$pur_invoice->id); ?>" class="btn btn-danger btn-icon _delete" data-toggle="tooltip" data-placement="top" title="<?php echo _l('delete'); ?>" ><i class="fa fa-remove"></i></a>
		                        	<?php } ?>
		                           </td>
		                        </tr>
		                     <?php } ?>
		                  </tbody>
		               </table>
		            </div>

                  	<div role="tabpanel" class="tab-pane" id="attachment">
                  		<?php echo form_open_multipart(admin_url('purchase/purchase_invoice_attachment/'.$pur_invoice->id),array('id'=>'partograph-attachments-upload')); ?>
		            
		                <div class="col-md-12 pad_left_0 pad_right_0">
					        <div class="attachments">
					          <div class="attachment">
					            <div class="mbot15">
					              <div class="form-group">
					                <label for="attachment" class="control-label"><?php echo _l('ticket_add_attachments'); ?></label>
					                <div class="input-group">
					                  <input type="file" extension="<?php echo str_replace('.','',get_option('ticket_attachments_file_extensions')); ?>" filesize="<?php echo file_upload_max_size(); ?>" class="form-control" name="attachments[0]" accept="<?php echo get_ticket_form_accepted_mimes(); ?>">
					                  <span class="input-group-btn">
					                    <button class="btn btn-success add_more_attachments p8-half" data-max="10" type="button"><i class="fa fa-plus"></i></button>
					                  </span>
					                </div>
					              </div>
					            </div>
					          </div>
					        </div>
					    </div>

		             
		                   <button id="obgy_btn2" type="submit" class="btn btn-info pull-right"><?php echo _l('submit'); ?></button>
		          
		                <?php echo form_close(); ?>
		               
		               <div class="col-md-12" id="purinv_pv_file">
		                                    <?php
		                                        $file_html = '';
		                                        if(count($pur_invoice_attachments) > 0){
		                                            $file_html .= '<hr />
		                                                    <p class="bold text-muted">'._l('customer_attachments').'</p>';
		                                            foreach ($pur_invoice_attachments as $f) {
		                                                $href_url = site_url(PURCHASE_PATH.'pur_invoice/'.$f['rel_id'].'/'.$f['file_name']).'" download';
		                                                                if(!empty($f['external'])){
		                                                                  $href_url = $f['external_link'];
		                                                                }
		                                               $file_html .= '<div class="mbot15 row inline-block full-width" data-attachment-id="'. $f['id'].'">
		                                              <div class="col-md-8">
		                                                 <a name="preview-purinv-btn" onclick="preview_purinv_btn(this); return false;" rel_id = "'. $f['rel_id']. '" id = "'.$f['id'].'" href="Javascript:void(0);" class="mbot10 mright5 btn btn-success pull-left" data-toggle="tooltip" title data-original-title="'. _l('preview_file').'"><i class="fa fa-eye"></i></a>
		                                                 <div class="pull-left"><i class="'. get_mime_class($f['filetype']).'"></i></div>
		                                                 <a href=" '. $href_url.'" target="_blank" download>'.$f['file_name'].'</a>
		                                                 <br />
		                                                 <small class="text-muted">'.$f['filetype'].'</small>
		                                              </div>
		                                              <div class="col-md-4 text-right">';
		                                                if($f['staffid'] == get_staff_user_id() || is_admin()){
		                                                $file_html .= '<a href="#" class="text-danger" onclick="delete_purinv_attachment('. $f['id'].'); return false;"><i class="fa fa-times"></i></a>';
		                                                } 
		                                               $file_html .= '</div></div>';
		                                            }
		                                            $file_html .= '<hr />';
		                                            echo html_entity_decode($file_html);
		                                        }
		                                     ?>
		                                  </div>

		               <div id="purinv_file_data"></div>
                  	</div>

                  	<div role="tabpanel" class="tab-pane" id="tab_tasks">
                     <?php init_relation_tasks_table(array('data-new-rel-id'=>$pur_invoice->id,'data-new-rel-type'=>'pur_invoice')); ?>
                  </div>


	         	</div>

          </div>
        </div>
    </div>
  </div>
</div>

<div class="modal fade" id="payment_record_pur" tabindex="-1" role="dialog">
    <div class="modal-dialog dialog_30" >
        <?php echo form_open(admin_url('purchase/add_invoice_payment/'.$pur_invoice->id),array('id'=>'purinvoice-add_payment-form')); ?>
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">
                    <span class="edit-title"><?php echo _l('edit_payment'); ?></span>
                    <span class="add-title"><?php echo _l('new_payment'); ?></span>
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                     <div id="additional"></div>
                     <?php echo render_input('amount','amount',app_format_money(purinvoice_left_to_pay($pur_invoice->id),''),'text',array('data-type' => 'currency')); ?>
                        <?php echo render_date_input('date','payment_edit_date'); ?>
                        <?php echo render_select('paymentmode',$payment_modes,array('id','name'),'payment_mode'); ?>
                        
                        <?php echo render_input('transactionid','payment_transaction_id'); ?>
                        <?php echo render_textarea('note','note','',array('rows'=>7)); ?>

                    </div>
                </div>
            </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo _l('close'); ?></button>
                    <button type="submit" class="btn btn-info"><?php echo _l('submit'); ?></button>
                </div>
            </div><!-- /.modal-content -->
            <?php echo form_close(); ?>
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
<?php init_tail(); ?>
</body>
</html>