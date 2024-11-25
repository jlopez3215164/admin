<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?php init_head(); ?>
<div id="wrapper" class="customer_profile">
   <div class="content">
      <div class="row">
         <div class="col-md-12">
            <?php if (isset($client) && $client->registration_confirmed == 0 && is_admin()) { ?>
               <div class="alert alert-warning">
                  <?php echo _l('customer_requires_registration_confirmation'); ?>
                  <br />
                  <a
                     href="<?php echo admin_url('clients/confirm_registration/' . $client->userid); ?>"><?php echo _l('confirm_registration'); ?></a>
               </div>
            <?php } else if (isset($client) && $client->active == 0 && $client->registration_confirmed == 1) { ?>
                  <div class="alert alert-warning">
                  <?php echo _l('customer_inactive_message'); ?>
                     <br />
                     <a
                        href="<?php echo admin_url('clients/mark_as_active/' . $client->userid); ?>"><?php echo _l('mark_as_active'); ?></a>
                  </div>
            <?php } ?>
            <?php if (isset($client) && (!has_permission('customers', '', 'view') && is_customer_admin($client->userid))) { ?>
               <div class="alert alert-info">
                  <?php echo _l('customer_admin_login_as_client_message', get_staff_full_name(get_staff_user_id())); ?>
               </div>
            <?php } ?>
         </div>
         <?php if ($group == 'profile') { ?>
            <div class="btn-bottom-toolbar btn-toolbar-container-out text-right">
               <button class="btn btn-info only-save customer-form-submiter">
                  <?php echo _l('submit'); ?>
               </button>
               <?php if (!isset($client)) { ?>
                  <button class="btn btn-info save-and-add-contact customer-form-submiter">
                     <?php echo _l('save_customer_and_add_contact'); ?>
                  </button>
               <?php } ?>
            </div>
         <?php } ?>
         <?php if (isset($client)) { ?>
            <div class="col-md-3">
               <div class="panel_s mbot5">
                  <div class="panel-body padding-10">
                     <h4 class="bold">
                        #<?php echo $client->userid . ' ' . $title; ?>
                        <?php if (has_permission('customers', '', 'delete') || is_admin()) { ?>
                           <div class="btn-group">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                 aria-expanded="false">
                                 <span class="caret"></span>
                              </a>
                              <ul class="dropdown-menu dropdown-menu-right">
                                 <?php if (is_admin()) { ?>
                                    <li>
                                       <a href="<?php echo admin_url('clients/login_as_client/' . $client->userid); ?>"
                                          target="_blank">
                                          <i class="fa fa-share-square-o"></i> <?php echo _l('login_as_client'); ?>
                                       </a>
                                    </li>
                                 <?php } ?>
                                 <?php if (has_permission('customers', '', 'delete')) { ?>
                                    <li>
                                       <a href="<?php echo admin_url('clients/delete/' . $client->userid); ?>"
                                          class="text-danger delete-text _delete"><i class="fa fa-remove"></i>
                                          <?php echo _l('delete'); ?>
                                       </a>
                                    </li>
                                 <?php } ?>
                              </ul>
                           </div>
                        <?php } ?>
                        <?php if (isset($client) && $client->leadid != NULL) { ?>
                           <br />
                           <small>
                              <b><?php echo _l('customer_from_lead', _l('lead')); ?></b>
                              <a href="<?php echo admin_url('leads/index/' . $client->leadid); ?>"
                                 onclick="init_lead(<?php echo $client->leadid; ?>); return false;">
                                 - <?php echo _l('view'); ?>
                              </a>
                           </small>
                        <?php } ?>
                     </h4>
                  </div>
               </div>
               <?php $this->load->view('admin/clients/tabs'); ?>
            </div>
         <?php } ?>
         <div class="col-md-<?php if (isset($client)) {
            echo 9;
         } else {
            echo 12;
         } ?>">
            <div class="panel_s">
               <div class="panel-body">

                  <script>
                     function changePriceGroup(client_id) {
                        //alert(client_id);
                        var group_price = $("#group_price").val();
                        //alert(group_price);
                        console.log("http://3.129.139.40/admin/admin/clients/changePriceGroup/"+ group_price + "/" + client_id);
                        $.ajax({
                           type: "get",
                           url: "http://3.129.139.40/admin/admin/clients/changePriceGroup/"+ group_price + "/" + client_id ,
                           //data: "",
                           processData: false,
                           contentType: false,
                           success: function () {
                              
                              window.location.reload();
                              //$("#reloadSearch").load(window.location.href + " #reloadSearch");
                           },

                        });
                     }
                     function editPriceGroupItem(item_id, price, client_id) {
                        //alert(client_id);
                        //var group_price = $("#group_price").val();
                        //alert(group_price);
                        var price = $("#price_"+item_id).val();
                        console.log("http://3.129.139.40/admin/admin/clients/editPriceGroupItem/"+ item_id + "/" + price + "/" + client_id);
                        $.ajax({
                           type: "get",
                           url: "http://3.129.139.40/admin/admin/clients/editPriceGroupItem/"+ item_id + "/" + price + "/" + client_id ,
                           //data: "",
                           processData: false,
                           contentType: false,
                           success: function () {
                              
                              window.location.reload();
                              //$("#reloadSearch").load(window.location.href + " #reloadSearch");
                           },

                        });
                     }
                     function deletePriceGroupItem(item_id, client_id) {
                        //alert(client_id);
                        //var group_price = $("#group_price").val();
                        //alert(group_price);
                        //var price = $("#price_"+item_id).val();
                        console.log("http://3.129.139.40/admin/admin/clients/deletePriceGroupItem/"+ item_id + "/" + client_id);
                        $.ajax({
                           type: "get",
                           url: "http://3.129.139.40/admin/admin/clients/deletePriceGroupItem/"+ item_id + "/" + client_id ,
                           //data: "",
                           processData: false,
                           contentType: false,
                           success: function () {
                              
                              window.location.reload();
                              //$("#reloadSearch").load(window.location.href + " #reloadSearch");
                           },

                        });
                     }
                  </script>

                  <?php if (isset($client)) { ?>
                     <?php echo form_hidden('isedit'); ?>
                     <?php echo form_hidden('userid', $client->userid); ?>
                     <div class="clearfix"></div>
                  <?php } ?>
                  <div>
                     <div class="tab-content">

                        <?php $this->load->view((isset($tab) ? $tab['view'] : 'admin/clients/groups/profile'));


                        $price_groups = $this->db->query("select * from tblclient_item_price_group")->result();
                        ?>
                        <hr>
                        <div class="form-group col">
                           <label class="col-sm-3 col-form-label">Grupos de Precio</label>
                           <div class="col-sm-7">
                              <select id="group_price" name="group_price" class="form-control">
                                 <option value="" selected="selected">Seleccione uno</option>
                                 <?php
                                 if (!empty($price_groups)) {
                                    foreach ($price_groups as $value) {
                                       ?>
                                       <option value="<?php echo $value->id; ?>"><?php echo $value->name; ?></option>
                                    <?php }
                                 } ?>

                              </select>
                           </div>
                           <div class="col-sm-2">
                              <a type="reset" class="btn btn-primary w-md m-b-5"
                                 onclick="changePriceGroup(<?php echo $client->userid; ?>)">
                                 <?php echo "GUARDAR" ?>
                              </a>
                           </div>
                        </div>
                        <hr>
                        <br />
                        <br />
                        <?php


                        //echo "HOLA MUNDO";
                        $products = $this->db->query("select t2.commodity_name, t2.id, t1.price, t1.date from tblclients_item_price t1 left join tblitems t2 on t1.item_id  = t2.id where t1.client_id = " . $client->userid)->result();


                        ?>
                        <input class="form-control col-md-3 light-table-filter" data-table="order-table" type="text"
                           placeholder="Buscar producto.." />

                        <br />
                        <table class="table table-bordered table-striped table-hover order-table" id="">

                           <thead>
                              <tr style="background-color: #DCF3DE;font-weight: bold;">
                                 <th colspan="6">PRECIOS PARA ESTE CLIENTE</th>
                              </tr>
                              <tr>
                                 <th>PRODUCTO</th>
                                 <th>ID</th>
                                 <th>TOTAL</th>
                                 <th>FECHA</th>
                                 <th></th>
                                 <th></th>
                              </tr>

                           </thead>
                           <caption>
                              Aqui se muestran los precios de los productos para este cliente
                           </caption>
                           <tbody>
                              <?php
                              if (!empty($products)) {
                                 foreach ($products as $value) {
                                    ?>
                                    <tr>
                                       <td>
                                          <?php echo $value->commodity_name; ?>
                                       </td>
                                       <td>
                                          <?php echo $value->id; ?>
                                       </td>

                                       <td>
                                          <input id="price_<?php echo $value->id; ?>" type="text" class="form-control" value="<?php echo $value->price; ?>">

                                       </td>

                                       <td>
                                          <?php echo $value->date; ?>
                                       </td>
                                       <td>

                                          <a type="reset"  class="btn btn-primary w-md m-b-5" onclick="editPriceGroupItem(<?php echo $value->id; ?>, <?php echo $value->price; ?>, <?php echo $client->userid; ?>)">
                                             <?php echo "GUARDAR" ?>
                                          </a>
                                       </td>
                                       <td>

                                          <a type="reset" onclick="deletePriceGroupItem(<?php echo $value->id; ?>, <?php echo $client->userid; ?>)" class="btn btn-danger w-md m-b-5">
                                             <?php echo "ELIMINAR" ?>
                                          </a>
                                       </td>
                                    </tr>

                                    <?php
                                 }
                              } ?>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <?php if ($group == 'profile') { ?>
         <div class="btn-bottom-pusher"></div>
      <?php } ?>
   </div>
</div>
<?php init_tail(); ?>
<?php if (isset($client)) { ?>
   <script>
      $(function () {
         init_rel_tasks_table(<?php echo $client->userid; ?>, 'customer');
      });
      (function (document) {
         'use strict';

         var LightTableFilter = (function (Arr) {

            var _input;

            function _onInputEvent(e) {
               _input = e.target;
               var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
               Arr.forEach.call(tables, function (table) {
                  Arr.forEach.call(table.tBodies, function (tbody) {
                     Arr.forEach.call(tbody.rows, _filter);
                  });
               });
            }

            function _filter(row) {
               var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
               row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
            }

            return {
               init: function () {
                  var inputs = document.getElementsByClassName('light-table-filter');
                  Arr.forEach.call(inputs, function (input) {
                     input.oninput = _onInputEvent;
                  });
               }
            };
         })(Array.prototype);

         document.addEventListener('readystatechange', function () {
            if (document.readyState === 'complete') {
               LightTableFilter.init();
            }
         });

      })(document);
   </script>
<?php } ?>
<?php $this->load->view('admin/clients/client_js'); ?>
</body>

</html>