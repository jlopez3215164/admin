<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?php init_head(); ?>
<div id="wrapper">
    <div class="content">
        <div class="panel_s">
            <div class="panel-body">
              <div class="row">
               
            </div>
        </div>
    </div>
</div>
</div>
</div>
<?php init_tail(); ?>
<script>
    $(function(){
        appValidateForm($('#module_install_form'), {module:{required:true,extension:"zip"}});
    });
</script>
</body>
</html>
