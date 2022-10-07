<?php init_head(); ?>
<div id="wrapper">
   <div class="content">
      <div class="row">
         <div class="col-md-12" id="small-table">
            <div class="panel_s">
               <div class="panel-body">
                  <div class="row">
                     <div class="col-md-12">
                      <h4 class="no-margin font-bold"><i class="fa fa-clone menu-icon menu-icon" aria-hidden="true"></i> <?php echo _l($title); ?></h4>
                      <hr>
                      <br>

                    </div>
                  </div>
                  <div class="row">
                     
                    <div class=" col-md-3">
                        <div class="form-group">
                          <select name="warehouse_filter[]" id="warehouse_filter" class="selectpicker" multiple="true" data-live-search="true" data-width="100%" data-none-selected-text="<?php echo _l('filters_by_warehouse'); ?>">

                              <?php foreach($warehouse_filter as $warehouse) { ?>
                                <option value="<?php echo html_entity_decode($warehouse['warehouse_id']); ?>"><?php echo html_entity_decode($warehouse['warehouse_name']); ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class=" col-md-3">
                    <?php $this->load->view('warehouse/item_include/item_select', ['select_name' => 'commodity_filter[]', 'id_name' => 'commodity_filter', 'multiple' => true, 'data_none_selected_text' => 'filters_by_commodity']); ?>
                </div>
                
                <div class=" col-md-2">
                    <div class="form-group">
                      <select name="status[]" id="status" class="selectpicker" data-live-search="true" multiple="true" data-width="100%" data-none-selected-text="<?php echo _l('filters_by_status'); ?>">

                        <option value="1"><?php echo _l('stock_import'); ?></option>
                        <option value="2"><?php echo _l('stock_export'); ?></option>
                        <option value="3"><?php echo _l('loss_adjustment'); ?></option>
                        <option value="4"><?php echo _l('internal_delivery_note'); ?></option>
                    </select>
                </div>
            </div>
            <div  class="col-md-2 leads-filter-column">
                <div class="form-group" app-field-wrapper="validity_start_date">
                    <div class="input-group date">
                        <input type="text" id="validity_start_date" name="validity_start_date" class="form-control datepicker" value="" autocomplete="off" placeholder="<?php echo _l('from_date') ?>">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar calendar-icon"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div  class="col-md-2 leads-filter-column">
                <div class="form-group" app-field-wrapper="validity_end_date">
                    <div class="input-group date">
                        <input type="text" id="validity_end_date" name="validity_end_date" class="form-control datepicker" value="" autocomplete="off" placeholder="<?php echo _l('to_date') ?>">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar calendar-icon"></i>
                        </div>
                    </div>
                </div>
            </div>        
        </div>
        <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>">
<script>
    function calculatePriceVenta(){
        $('#percentage_gain').val(((($('#price_sale').val() - $('#price_unit').val()) * 100)/$('#price_unit').val()).toFixed(2));
    }
	
	function calculatePriceVentaProducto(id){
		//alert($('#precio_' + id).val());
		//alert($('#costo_' + id).val().replaceAll(",","."));
		$('#porcentaje_' + id).val(((($('#precio_' + id).val() - $('#costo_' + id).val().replaceAll(",",".")) * 100)/$('#costo_' + id).val().replaceAll(",",".")).toFixed(2));
	}

    function sendPrice(id_product, id){
        var price = $("#precio_" + id).val();
        var porcentaje = $("#porcentaje_" + id).val();
        var formData = new FormData();
          formData.append("csrf_token_name", $('input[name="csrf_token_name"]').val());
          formData.append("price", price);
          formData.append("id", id_product);
          formData.append("profif_ratio", porcentaje);
      $.ajax({ 
            url: admin_url + 'warehouse/savePriceProduct', 
            method: 'post', 
            data: formData, 
            contentType: false, 
            processData: false
        }).done(function(response) {
          //var response = JSON.parse(response);
         alert("PRECIO ACTUALIZADO");
        });
    }
    </script>
        <div>
            <center>
<?php echo "<h1>".$_SESSION["item_merma"]." : ".number_format($_SESSION[$_SESSION["item_merma"]],2,",",".")."</h1>"; ?>
<h4>PRECIO POR UNIDAD DE MEDIDA PARA ESTE PRODUCTO.<h4/>
<hr/>
<div  class="col-md-3 leads-filter-column">
                <div class="form-group">
<input type='hidden' id="price_unit" value="<?php echo $_SESSION[$_SESSION["item_merma"]]; ?>" class='form-control' placeholder="Precio de Venta"/>
                              </div>
                              </div>
<div  class="col-md-3 leads-filter-column">
                <div class="form-group">
                    <label>PRECIO VENTA</label>
<input type='number' onkeyUp="calculatePriceVenta()" id="price_sale" class='form-control' placeholder="Precio de Venta"/>
                              </div>
                              </div>
                              <div  class="col-md-3 leads-filter-column">
                <div class="form-group">
                <label>PORCENTAJE</label>
<input type='number' disabled id="percentage_gain" class='form-control' placeholder="Porcentaje de Ganancia"/>
                              </div>
                              </div>
                              </center>
                              </div>
                    <br><br>

                    <style>
                        th, td {
                            white-space: nowrap;
                            vertical-align:middle !important;
                        }

                        </style>

                      <?php render_datatable(array(
                        _l('id'),
                        "TIPO",
                        _l('form_code'),
                        _l('commodity_code'),
                        _l('warehouse_code'),
                        _l('warehouse_name'),
                        _l('day_vouchers'),
                        _l('opening_stock'),
                        _l('closing_stock'),
                        'UNIDAD',
                        "MOVIMIENTO",
                        "RENDIMIENTO",
                        "MERMA",
                        "COSTO UNITARIO",
                        "COSTO",
						"PRECIO",
						"%",
						"",
                        _l('lot_number').'/'._l('quantity_sold'),
                        _l('expiry_date'),
                        _l('note'),
                        _l('status_label'),
                        ),'table_warehouse_history'); ?>
               </div>
            </div>
         </div>
         
      </div>
   </div>
   
</div>


<?php init_tail(); ?>
<?php require 'modules/warehouse/assets/js/warehouse_history_js.php';?>
</body>
</html>

