<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Payments_model extends App_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('invoices_model');
    }

    /**
     * Get payment by ID
     * @param  mixed $id payment id
     * @return object
     */
    public function get($id)
    {
        $this->db->select('*,' . db_prefix() . 'invoicepaymentrecords.id as paymentid');
        $this->db->join(db_prefix() . 'payment_modes', db_prefix() . 'payment_modes.id = ' . db_prefix() . 'invoicepaymentrecords.paymentmode', 'left');
        $this->db->order_by(db_prefix() . 'invoicepaymentrecords.id', 'asc');
        $this->db->where(db_prefix() . 'invoicepaymentrecords.id', $id);
        $payment = $this->db->get(db_prefix() . 'invoicepaymentrecords')->row();
        if (!$payment) {
            return false;
        }
        // Since version 1.0.1
        $this->load->model('payment_modes_model');
        $payment_gateways = $this->payment_modes_model->get_payment_gateways(true);
        if (is_null($payment->id)) {
            foreach ($payment_gateways as $gateway) {
                if ($payment->paymentmode == $gateway['id']) {
                    $payment->name = $gateway['name'];
                }
            }
        }

        return $payment;
    }


    /**
     * Print bill
     * @param  mixed $idBill idBill
     * @return array
     */
    public function printBill($idBill)
    {
        $this->db->query("UPDATE tblinvoices SET is_print_fiscal = 1 where id = " . $idBill);
    }

    public function printNoFiscalBill($idBill)
    {
        //$this->db->query("UPDATE tblinvoices SET is_print_fiscal = 0 where id = " . $idBill);
        $order_info = $this->db->query("select t1.*, t2.company, t2.address, t2.phonenumber, t2.vat from tblinvoices t1 left join tblclients t2 on t1.clientid = t2.userid left join tblcontacts t3 on t2.userid = t3.userid where t1.id = " . $idBill)->result()[0];
        $iteminfo = $this->db->query("select * from tblitemable t where rel_id = " . $idBill . " and rel_type = 'invoice'")->result();
        $system_param = $this->db->query("select * from system_param")->result();
        $currency = $this->db->query("select * from tblcurrencies where is_secondary_currency = 1")->result()[0];
        //Imprimimos la nota
        /*********************************************** NOTA DE ENTREGA ********************************************/
        //Imprimir comanda de cocina
        //****************************************************/
        date_default_timezone_set("America/Caracas");
        $DateAndTime = date('d-m-Y h:i:s a', time());
        $DateAndTimeId = date('d-m-Y-h-i-s-a', time());
        //Buscamos las impresoras de precuenta
        //$kitchenlist = $this->db->select('kitchenid as kitchen_id,kitchen_name,ip,port')->from('tbl_kitchen')->where('is_prebill', 1)->order_by('kitchen_name', 'Asc')->get()->result();
        //=====================================================================================================================================================
        //$alliteminfo = $this->order_model->customerorderkitchenAll($orderid);
        //$singleorderinfo = $this->order_model->kitchen_ajaxorderinfoall($id);
        //$billinfo = $this->db->select('*')->from('bill')->where('order_id', $id)->get()->row();
        //=====================================================================================================================================================
        //foreach ($kitchenlist as $kitchen) {
        //--------------------------------------------------------------------
        try {
            //$path = "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\orion-core-server\\Queue\\" . "P_" . "192.168.1.40" . "-" . $DateAndTimeId . "-NOTA.printer";
            //$system_param
            $path = $system_param[0]->value . "P_" . "192.168.1.40" . "-" . $DateAndTimeId . "-NOTA.printer";
            $archivo = fopen($path, "wb");
            if ($archivo == false) {
                echo "Error al crear el archivo";
            } else {
                // Escribir en el archivo:
                //fwrite($archivo, "------------------------------------------------\r\n");
                //fwrite($archivo, "PRECUENTA: \r\n");
                //fwrite($archivo, "IMAGE_COMMAND||C:\\ORION\\logo.bmp");
                
                fwrite($archivo, "------------------------------------------------\r\n");
                fwrite($archivo, "DISTRIBUIDORA BODEGON VSA CALLE MEXICO EDIFICIO MI PARAISO PISO PB URB. NUEVA CARACAS
                CATIA CARACAS
                Venezuela 1071
                RIF: J500018878
                \r");
                fwrite($archivo, "------------------------------------------------\r\n");
                fwrite($archivo, "ORDEN: " . $order_info->number . "\r\n");
                fwrite($archivo, "APERTURA: " . $order_info->datecreated . "\r\n");
                fwrite($archivo, "------------------------------------------------\r\n");
                //$table_name = "MESA";
                /*if ($singleorderinfo->tablename == "") {
                                   $table_name  = "ORDEN LIBRE";
                               }*/
                //fwrite($archivo, "MESA: " . $table_name . "\r\n");
                fwrite($archivo, "CLIENTE: " . $order_info->company . "\r\n");
                fwrite($archivo, "RIF/CED.: " . $order_info->vat . "\r\n");
                fwrite($archivo, "DIRECCION: " . $order_info->address . "\r\n");
                fwrite($archivo, "TELEFONO: " . $order_info->phonenumber . "\r\n");
                //fwrite($archivo, "ATENDIO: " . "" . " " . "" . "\r\n");
                //fwrite($archivo, "AREA: " . $kitchen->kitchen_name . "\r\n");

                //fwrite($archivo, "COMENTARIO: " . "" . "\r\n");
                fwrite($archivo, "------------------------------------------------\r\n");
                fwrite($archivo, "PRODUCTO CANT.x PRECIO\r\n");
                fwrite($archivo, "------------------------------------------------\r\n");
                $subtotal = 0;
                foreach ($iteminfo as $item) {
                    $total = 47 - (strlen($item->qty . " x " . substr($item->description, 0, 24)) . "\r\n" . strlen((number_format($item->rate, 2, ",", ".")) . " = " . (number_format($item->rate * $item->qty, 2, ",", ".")) . ""));
                    $spaces = str_repeat(" ", $total);
                    //if ($item->kitchenid == $kitchen->kitchenid) {
                    //if($item->description != "Set"){
                    fwrite($archivo, substr($item->description, 0, 24) . $spaces . "\r\n" . number_format($item->qty, 2, ",", ".") . " x " . (number_format($item->rate, 2, ",", ".")) . " = " . (number_format($item->rate * $item->qty, 2, ",", ".")) . "\r\n");
                    //}
                    //$printer-> text("----- ".$item->variantName."\n");

                    $subtotal = $subtotal + ($item->rate * $item->qty);
                }
                fwrite($archivo, "------------------------------------------------\r\n");
                $total = 48 - (strlen('SUB-TOTAL') + strlen((number_format($subtotal, 2, ",", ".")) . ""));
                $spaces = str_repeat(" ", $total);
                fwrite($archivo, "SUB-TOTAL" . $spaces . number_format($subtotal, 2, ",", ".") . " \r\n");
                $total = 48 - (strlen('IMPUESTO') + strlen(number_format($order_info->total_tax, 2, ",", ".") . ""));
                $spaces = str_repeat(" ", $total);
                fwrite($archivo, "IMPUESTO" . $spaces . number_format($order_info->total_tax, 2, ",", ".") . " \r\n");
                //$total = 48 - (strlen('SERVICIO') + strlen(round($singleorderinfo->service_charge, 2) . ""));
                //$spaces = str_repeat(" ", $total);
                //fwrite($archivo, "SERVICIO" . $spaces . round($singleorderinfo->service_charge, 2) . " \r\n");
                //fwrite($archivo, "------------------------------------------------\r\n");
                $total = 48 - (strlen('TOTAL ') + strlen((number_format($order_info->total, 2, ",", ".")) . ""));
                $spaces = str_repeat(" ", $total);
                fwrite($archivo, "TOTAL " . "" . $spaces . number_format($order_info->total, 2, ",", ".") . " \r\n");
                //BS
                $total = 48 - (strlen('TOTAL BS ') + strlen((number_format($order_info->total * $currency->tasa, 2, ",", ".")) . ""));
                $spaces = str_repeat(" ", $total);
                fwrite($archivo, "TOTAL BS " . "" . $spaces . number_format($order_info->total * $currency->tasa, 2, ",", ".") . " \r\n");
                fwrite($archivo, "------------------------------------------------\r\n");
                //$total = 48 - (strlen('TASA') + strlen((0) . ""));
                //$spaces = str_repeat(" ", $total);
                //fwrite($archivo, "TASA" . $spaces . $currency_tasa[0]["curr_rate"] . " \r\n");
                //$total = 48 - (strlen('TOTAL ' . $currency_tasa[0]["curr_icon"]) + strlen((round($singleorderinfo->totalamount * $currency_tasa[0]["curr_rate"], 2)) . ""));
                //$spaces = str_repeat(" ", $total);
                //fwrite($archivo, "TOTAL " . $currency_tasa[0]["curr_icon"] . $spaces . number_format($singleorderinfo->totalamount * $currency_tasa[0]["curr_rate"], 2, ",", ".") . " \r\n");
                fwrite($archivo, "------------------------------------------------\r\n");
                fwrite($archivo, "FECHA: " . $DateAndTime . "\r\n");
                fwrite($archivo, "IMPRESORA: " . "192.168.1.40" . "\r\n");
                fwrite($archivo, "TASA: " . number_format($currency->tasa, 2, ",", ".") . "\r\n");
                //fwrite($archivo, "EQUIPO: " . $this->getRealIP() . "\r\n");
                fwrite($archivo, "------------------------------------------------\r\n");
                /*fwrite($archivo, "ESTE TICKET NO ES UN DOCUMENTO FISCAL\r\n");
                               fwrite($archivo, "------------------------------------------------\r\n");
                               fwrite($archivo, "SI DESEA FACTURA PERSONALIZADA:\r\n");
                               fwrite($archivo, "------------------------------------------------\r\n");
                               fwrite($archivo, "CEDULA/RIF:\r\n\n");
                               fwrite($archivo, "________________________________________________\r\n\n");
                               fwrite($archivo, "NOMBRE/RAZON SOCIAL:\r\n\n");
                               fwrite($archivo, "________________________________________________\r\n\n");
                               fwrite($archivo, "------------------------------------------------\r\n");
                               fwrite($archivo, "OTROS DATOS:\r\n");
                               fwrite($archivo, "------------------------------------------------\r\n");
                               fwrite($archivo, "________________________________________________\r\n\n");
                               fwrite($archivo, "________________________________________________\r\n\n");
                               fwrite($archivo, "________________________________________________\r\n\n");
                               fwrite($archivo, "________________________________________________\r\n\n");
                               fwrite($archivo, "________________________________________________\r\n\n");*/
                // Fuerza a que se escriban los datos pendientes en el buffer:
                fflush($archivo);
            }
        } finally {
            // Cerrar el archivo:
            fclose($archivo);
        }
        //--------------------------------------------------------------------
        //}
        //***********************************************************************************************************/
    }

    public function printCreditNoteFiscal($idBill)
    {
        $this->db->query("UPDATE tblinvoices SET is_print_fiscal = 3 where id = " . $idBill);
    }

    public function deleteBill($idBill)
    {
        $this->db->query("DELETE FROM tblinvoices where id = " . $idBill);
        $this->db->query("DELETE FROM tblinvoicepaymentrecords where invoiceid = " . $idBill);
        $this->db->query("DELETE FROM tblitemable where rel_type = 'invoice' and rel_id = " . $idBill);
    }

    /**
     * Get all invoice payments
     * @param  mixed $invoiceid invoiceid
     * @return array
     */
    public function get_invoice_payments($invoiceid)
    {
        $this->db->select('*,' . db_prefix() . 'invoicepaymentrecords.id as paymentid');
        $this->db->join(db_prefix() . 'payment_modes', db_prefix() . 'payment_modes.id = ' . db_prefix() . 'invoicepaymentrecords.paymentmode', 'left');
        $this->db->order_by(db_prefix() . 'invoicepaymentrecords.id', 'asc');
        $this->db->where('invoiceid', $invoiceid);
        $payments = $this->db->get(db_prefix() . 'invoicepaymentrecords')->result_array();
        // Since version 1.0.1
        $this->load->model('payment_modes_model');
        $payment_gateways = $this->payment_modes_model->get_payment_gateways(true);
        $i = 0;
        foreach ($payments as $payment) {
            if (is_null($payment['id'])) {
                foreach ($payment_gateways as $gateway) {
                    if ($payment['paymentmode'] == $gateway['id']) {
                        $payments[$i]['id'] = $gateway['id'];
                        $payments[$i]['name'] = $gateway['name'];
                    }
                }
            }
            $i++;
        }

        return $payments;
    }

    /**
     * Process invoice payment offline or online
     * @since  Version 1.0.1
     * @param  array $data $_POST data
     * @return boolean
     */
    public function process_payment($data, $invoiceid = '')
    {
        // Offline payment mode from the admin side
        if (is_numeric($data['paymentmode'])) {
            if (is_staff_logged_in()) {
                $id = $this->add($data);

                return $id;
            }

            return false;

            // Is online payment mode request by client or staff
        } elseif (!is_numeric($data['paymentmode']) && !empty($data['paymentmode'])) {
            // This request will come from admin area only
            // If admin clicked the button that dont want to pay the invoice from the getaways only want
            if (is_staff_logged_in() && has_permission('payments', '', 'create')) {
                if (isset($data['do_not_redirect'])) {
                    $id = $this->add($data);

                    return $id;
                }
            }

            if (!is_numeric($invoiceid)) {
                if (!isset($data['invoiceid'])) {
                    die('No invoice specified');
                }
                $invoiceid = $data['invoiceid'];
            }

            if (isset($data['do_not_send_email_template'])) {
                unset($data['do_not_send_email_template']);
                $this->session->set_userdata([
                    'do_not_send_email_template' => true,
                ]);
            }

            $invoice = $this->invoices_model->get($invoiceid);
            // Check if request coming from admin area and the user added note so we can insert the note also when the payment is recorded
            if (isset($data['note']) && $data['note'] != '') {
                $this->session->set_userdata([
                    'payment_admin_note' => $data['note'],
                ]);
            }

            if (get_option('allow_payment_amount_to_be_modified') == 0) {
                $data['amount'] = get_invoice_total_left_to_pay($invoiceid, $invoice->total);
            }

            $data['invoiceid'] = $invoiceid;
            $data['invoice'] = $invoice;
            $data = hooks()->apply_filters('before_process_gateway_func', $data);

            $this->load->model('payment_modes_model');
            $gateway = $this->payment_modes_model->get($data['paymentmode']);

            $gateway->instance->process_payment($data);
        }

        return false;
    }

    /**
     * Check whether payment exist by transaction id for the given invoice
     *
     * @param  int $transactionId
     * @param  int|null $invoiceId
     *
     * @return bool
     */
    public function transaction_exists($transactionId, $invoiceId = null)
    {
        return total_rows('invoicepaymentrecords', array_filter([
            'transactionid' => $transactionId,
            'invoiceid' => $invoiceId
        ])) > 0;
    }

    /**
     * Record new payment
     * @param array $data payment data
     * @return boolean
     */
    public function add($data, $subscription = false)
    {
        // Check if field do not redirect to payment processor is set so we can unset from the database
        if (isset($data['do_not_redirect'])) {
            unset($data['do_not_redirect']);
        }

        if ($subscription != false) {
            $after_success = get_option('after_subscription_payment_captured');

            if ($after_success == 'nothing' || $after_success == 'send_invoice') {
                $data['do_not_send_email_template'] = true;
            }
        }

        if (isset($data['do_not_send_email_template'])) {
            unset($data['do_not_send_email_template']);
            $do_not_send_email_template = true;
        } elseif ($this->session->has_userdata('do_not_send_email_template')) {
            $do_not_send_email_template = true;
            $this->session->unset_userdata('do_not_send_email_template');
        }

        if (is_staff_logged_in()) {
            if (isset($data['date'])) {
                $data['date'] = to_sql_date($data['date']);
            } else {
                $data['date'] = date('Y-m-d H:i:s');
            }
            if (isset($data['note'])) {
                $data['note'] = nl2br($data['note']);
            } elseif ($this->session->has_userdata('payment_admin_note')) {
                $data['note'] = nl2br($this->session->userdata('payment_admin_note'));
                $this->session->unset_userdata('payment_admin_note');
            }
        } else {
            $data['date'] = date('Y-m-d H:i:s');
        }

        $data['daterecorded'] = date('Y-m-d H:i:s');
        $data = hooks()->apply_filters('before_payment_recorded', $data);

        $this->db->insert(db_prefix() . 'invoicepaymentrecords', $data);
        $insert_id = $this->db->insert_id();
        if ($insert_id) {
            $invoice = $this->invoices_model->get($data['invoiceid']);
            $force_update = false;

            if (!class_exists('Invoices_model', false)) {
                $this->load->model('invoices_model');
            }

            if ($invoice->status == Invoices_model::STATUS_DRAFT) {
                $force_update = true;
                // update invoice number for invoice with draft - V2.7.2
                $this->invoices_model->change_invoice_number_when_status_draft($invoice->id);
            }

            update_invoice_status($data['invoiceid'], $force_update);

            $activity_lang_key = 'invoice_activity_payment_made_by_staff';
            if (!is_staff_logged_in()) {
                $activity_lang_key = 'invoice_activity_payment_made_by_client';
            }

            $this->invoices_model->log_invoice_activity($data['invoiceid'], $activity_lang_key, !is_staff_logged_in() ? true : false, serialize([
                app_format_money($data['amount'], $invoice->currency_name),
                '<a href="' . admin_url('payments/payment/' . $insert_id) . '" target="_blank">#' . $insert_id . '</a>',
            ]));

            log_activity('Payment Recorded [ID:' . $insert_id . ', Invoice Number: ' . format_invoice_number($invoice->id) . ', Total: ' . app_format_money($data['amount'], $invoice->currency_name) . ']');

            // Send email to the client that the payment is recorded
            $payment = $this->get($insert_id);
            $payment->invoice_data = $this->invoices_model->get($payment->invoiceid);
            set_mailing_constant();
            $paymentpdf = payment_pdf($payment);
            $payment_pdf_filename = mb_strtoupper(slug_it(_l('payment') . '-' . $payment->paymentid), 'UTF-8') . '.pdf';
            $attach = $paymentpdf->Output($payment_pdf_filename, 'S');

            if (
                !isset($do_not_send_email_template)
                || ($subscription != false && $after_success == 'send_invoice_and_receipt')
                || ($subscription != false && $after_success == 'send_invoice')
            ) {
                $template_name = 'invoice_payment_recorded_to_customer';
                $pdfInvoiceAttachment = false;
                $attachPaymentReceipt = true;
                $emails_sent = [];

                $where = ['active' => 1, 'invoice_emails' => 1];

                if ($subscription != false) {
                    $where['is_primary'] = 1;
                    $template_name = 'subscription_payment_succeeded';

                    if ($after_success == 'send_invoice_and_receipt' || $after_success == 'send_invoice') {
                        $invoice_number = format_invoice_number($payment->invoiceid);
                        set_mailing_constant();
                        $pdfInvoice = invoice_pdf($payment->invoice_data);
                        $pdfInvoiceAttachment = $pdfInvoice->Output($invoice_number . '.pdf', 'S');

                        if ($after_success == 'send_invoice') {
                            $attachPaymentReceipt = false;
                        }
                    }
                    // Is from settings: Send Payment Receipt
                } else {
                    if (get_option('attach_invoice_to_payment_receipt_email') == 1) {
                        $invoice_number = format_invoice_number($payment->invoiceid);
                        set_mailing_constant();
                        $pdfInvoice = invoice_pdf($payment->invoice_data);
                        $pdfInvoiceAttachment = $pdfInvoice->Output($invoice_number . '.pdf', 'S');
                    }
                }

                $contacts = $this->clients_model->get_contacts($invoice->clientid, $where);

                foreach ($contacts as $contact) {
                    $template = mail_template(
                        $template_name,
                        $contact,
                        $invoice,
                        $subscription,
                        $payment->paymentid
                    );

                    if ($attachPaymentReceipt) {
                        $template->add_attachment([
                            'attachment' => $attach,
                            'filename' => $payment_pdf_filename,
                            'type' => 'application/pdf',
                        ]);
                    }

                    if ($pdfInvoiceAttachment) {
                        $template->add_attachment([
                            'attachment' => $pdfInvoiceAttachment,
                            'filename' => str_replace('/', '-', $invoice_number) . '.pdf',
                            'type' => 'application/pdf',
                        ]);
                    }
                    $merge_fields = $template->get_merge_fields();

                    if ($template->send()) {
                        array_push($emails_sent, $contact['email']);
                    }

                    $this->app_sms->trigger(SMS_TRIGGER_PAYMENT_RECORDED, $contact['phonenumber'], $merge_fields);
                }

                if (count($emails_sent) > 0) {
                    $additional_activity_data = serialize([
                        implode(', ', $emails_sent),
                    ]);
                    $activity_lang_key = 'invoice_activity_record_payment_email_to_customer';
                    if ($subscription != false) {
                        $activity_lang_key = 'invoice_activity_subscription_payment_succeeded';
                    }
                    $this->invoices_model->log_invoice_activity($invoice->id, $activity_lang_key, false, $additional_activity_data);
                }
            }

            $this->db->where('staffid', $invoice->addedfrom);
            $this->db->or_where('staffid', $invoice->sale_agent);
            $staff_invoice = $this->db->get(db_prefix() . 'staff')->result_array();

            $notifiedUsers = [];
            foreach ($staff_invoice as $member) {
                if (get_option('notification_when_customer_pay_invoice') == 1) {
                    if (is_staff_logged_in() && $member['staffid'] == get_staff_user_id()) {
                        continue;
                    }
                    // E.q. had permissions create not don't have, so we must re-check this
                    if (user_can_view_invoice($invoice->id, $member['staffid'])) {
                        $notified = add_notification([
                            'fromcompany' => true,
                            'touserid' => $member['staffid'],
                            'description' => 'not_invoice_payment_recorded',
                            'link' => 'invoices/list_invoices/' . $invoice->id,
                            'additional_data' => serialize([
                                format_invoice_number($invoice->id),
                            ]),
                        ]);
                        if ($notified) {
                            array_push($notifiedUsers, $member['staffid']);
                        }
                        send_mail_template(
                            'invoice_payment_recorded_to_staff',
                            $member['email'],
                            $member['staffid'],
                            $invoice,
                            $attach,
                            $payment->id
                        );
                    }
                }
            }

            pusher_trigger_notification($notifiedUsers);

            hooks()->do_action('after_payment_added', $insert_id);

            return $insert_id;
        }

        return false;
    }

    /**
     * Update payment
     * @param  array $data payment data
     * @param  mixed $id   paymentid
     * @return boolean
     */
    public function update($data, $id)
    {
        $payment = $this->get($id);

        $data['date'] = to_sql_date($data['date']);
        $data['note'] = nl2br($data['note']);

        $data = hooks()->apply_filters('before_payment_updated', $data, $id);

        $this->db->where('id', $id);
        $this->db->update(db_prefix() . 'invoicepaymentrecords', $data);
        if ($this->db->affected_rows() > 0) {
            if ($data['amount'] != $payment->amount) {
                update_invoice_status($payment->invoiceid);
            }
            log_activity('Payment Updated [Number:' . $id . ']');

            return true;
        }

        return false;
    }

    /**
     * Delete payment from database
     * @param  mixed $id paymentid
     * @return boolean
     */
    public function delete($id)
    {
        $current = $this->get($id);
        $current_invoice = $this->invoices_model->get($current->invoiceid);
        $invoiceid = $current->invoiceid;
        hooks()->do_action('before_payment_deleted', [
            'paymentid' => $id,
            'invoiceid' => $invoiceid,
        ]);
        $this->db->where('id', $id);
        $this->db->delete(db_prefix() . 'invoicepaymentrecords');
        if ($this->db->affected_rows() > 0) {
            update_invoice_status($invoiceid);
            $this->invoices_model->log_invoice_activity($invoiceid, 'invoice_activity_payment_deleted', false, serialize([
                $current->paymentid,
                app_format_money($current->amount, $current_invoice->currency_name),
            ]));
            log_activity('Payment Deleted [ID:' . $id . ', Invoice Number: ' . format_invoice_number($current->id) . ']');

            return true;
        }

        return false;
    }

    public function add_batch_payment($paymentsData)
    {
        $sendBatchPaymentEmail = true;
        if (isset($paymentsData['do_not_send_invoice_payment_recorded'])) {
            $sendBatchPaymentEmail = false;
        }

        $paymentIds = [];
        foreach ($paymentsData['invoice'] as $data) {
            if (empty($data['invoiceid']) || empty($data['amount']) || empty($data['date']) || empty('paymentmode')) {
                continue;
            }

            $data['date'] = to_sql_date($data['date']);
            $data['daterecorded'] = date('Y-m-d H:i:s');
            $data = hooks()->apply_filters('before_payment_recorded', $data);

            $this->db->insert(db_prefix() . 'invoicepaymentrecords', $data);
            $insert_id = $this->db->insert_id();

            if ($insert_id) {
                $paymentIds[] = $insert_id;
                $invoice = $this->invoices_model->get($data['invoiceid']);
                $force_update = false;

                if (!class_exists('Invoices_model', false)) {
                    $this->load->model('invoices_model');
                }

                if ($invoice->status == Invoices_model::STATUS_DRAFT) {
                    $force_update = true;
                    // update invoice number for invoice with draft - V2.7.2
                    $this->invoices_model->change_invoice_number_when_status_draft($invoice->id);
                }
                update_invoice_status($data['invoiceid'], $force_update);

                $this->invoices_model->log_invoice_activity(
                    $data['invoiceid'],
                    'invoice_activity_payment_made_by_staff',
                    false,
                    serialize([
                        app_format_money($data['amount'], $invoice->currency_name),
                        '<a href="' . admin_url('payments/payment/' . $insert_id) . '" target="_blank">#' . $insert_id . '</a>',
                    ])
                );
                log_activity('Payment Recorded [ID:' . $insert_id . ', Invoice Number: ' . format_invoice_number($invoice->id) . ', Total: ' . app_format_money(
                    $data['amount'],
                    $invoice->currency_name
                ) . ']');
            }
            hooks()->do_action('after_payment_added', $insert_id);
        }

        if (count($paymentIds) > 0 && $sendBatchPaymentEmail) {
            $this->send_batch_payment_notification_to_customers($paymentIds);
        }

        return count($paymentIds);
    }

    private function send_batch_payment_notification_to_customers($paymentIds)
    {
        $paymentData = $this->db
            ->select(db_prefix() . 'invoicepaymentrecords.*,' . db_prefix() . 'invoices.currency,' . db_prefix() . 'invoices.clientId,' . db_prefix() . 'invoices.hash')
            ->join(db_prefix() . 'invoices', 'invoicepaymentrecords.invoiceid=invoices.id')
            ->where_in('invoicepaymentrecords.id', $paymentIds)
            ->get(db_prefix() . 'invoicepaymentrecords')
            ->result();

        // used collection groupBy as a workaround for mysql8.0 only full group mode
        $paymentData = collect($paymentData)->groupBy('clientId');

        foreach ($paymentData as $clientId => $payments) {
            $contacts = $this->get_contacts_for_payment_emails($clientId);
            foreach ($contacts as $contact) {
                if (count($payments) === 1) {
                    $this->send_invoice_payment_recorded($payments[0], $contact);
                } else {
                    $template = mail_template('invoice_batch_payments', $payments, $contact);
                    foreach ($payments as $payment) {
                        $payment = $this->get($payment->id);
                        $payment->invoice_data = $this->invoices_model->get($payment->invoiceid);
                        $template = $this->_add_payment_mail_attachments_to_template($template, $payment);
                    }
                    $template->send();
                }
            }
        }
    }

    public function send_invoice_payment_recorded($payment, $contact)
    {
        if (!class_exists('Invoices_model', false)) {
            $this->load->model('invoices_model');
        }

        // to get structure matching payment_pdf()
        $payment = $this->get($payment->id);
        $payment->invoice_data = $this->invoices_model->get($payment->invoiceid);
        $template = mail_template('invoice_payment_recorded_to_customer', (array) $contact, $payment->invoice_data, false, $payment->id);
        $template = $this->_add_payment_mail_attachments_to_template($template, $payment);

        return $template->send();
    }

    private function _add_payment_mail_attachments_to_template($template, $payment)
    {
        set_mailing_constant();

        $paymentPDF = payment_pdf($payment);
        $filename = mb_strtoupper(slug_it(_l('payment') . '-' . $payment->paymentid), 'UTF-8') . '.pdf';
        $attach = $paymentPDF->Output($filename, 'S');
        $template->add_attachment([
            'attachment' => $attach,
            'filename' => $filename,
            'type' => 'application/pdf',
        ]);

        if (get_option('attach_invoice_to_payment_receipt_email') == 1) {
            $invoice_number = format_invoice_number($payment->invoiceid);
            set_mailing_constant();
            $pdfInvoice = invoice_pdf($payment->invoice_data);
            $pdfInvoiceAttachment = $pdfInvoice->Output($invoice_number . '.pdf', 'S');

            $template->add_attachment([
                'attachment' => $pdfInvoiceAttachment,
                'filename' => str_replace('/', '-', $invoice_number) . '.pdf',
                'type' => 'application/pdf',
            ]);
        }
        return $template;
    }

    private function get_contacts_for_payment_emails($client_id)
    {
        if (!class_exists('Clients_model', false)) {
            $this->load->model('clients_model');
        }
        return $this->clients_model->get_contacts($client_id, [
            'active' => 1,
            'invoice_emails' => 1,
        ]);
    }
}