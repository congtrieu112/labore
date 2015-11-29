<?php echo $header; ?>
<style type="text/css">
  /* Correcciones para estilo jolivapps*/ 
  table.form{
    margin-bottom: 10px;
  }
  table.form > tbody{
    border: 1px dashed #CCC;
    padding-top: 0px;
  }
  table.form > tbody.none{
    border: 0px;
  }
  table.form > tbody.none > tr > td{
    border-bottom: 0px;
    padding:6px
  }
  table.form > tbody > tr > td {
    border-bottom: 0px; 
  }
  .box > .content h2 {
    text-transform: none;
    margin-bottom: 0px;
    margin-top: 5px;
  }
  .help{
    cursor: pointer;
    display: inline;
  }

  /* Estilos para la tabla de tabs */
  table.tab-form {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
  }
  table.tab-form > tbody > tr > td {
    padding: 10px 10px 10px 25px;
    color: #000000;
    border-bottom: 1px dotted #CCCCCC;
  }
  table.tab-form h3{
    color: #FFAA71;
    margin-left: -15px;
    margin-top: 3px;
  }

  /* Estilos de Pestañas*/
  .lang-input{
    white-space: nowrap;
    margin-right: 15px;
  }
  legend {
    color: #8A8A8A;
    font-weight: bold;
    padding-left: 10px;
    padding-right: 10px;
    font-size: 13px;
    font-style: italic;
    background-color: white;
  }
  fieldset{
    border: 1px dashed #CCC;
    padding: 5px 0px 13px 13px;
    margin-bottom: 10px;
  }
  fieldset > div > label{
    display: inline-block;
    width: 100px;
    font-weight: bold;
  }
  fieldset  .scrollbox{
    margin-left: 105px;
    margin-top: 15px;
  }
  fieldset  .margin_top{
    margin-top: 10px;
  }
  legend  input{
    margin-left:0px;
  }
  .info{
    color: #808080;
  }
  .vtabs > a > div{
    display: inline-block;
  }
  #module div.scrollbox {
    width: 250px;
  }
  .qtip ul{
    margin-top:5px;
    padding-left: 20px
  }
</style>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/tabs.png" alt="" /> <?php echo $heading_title_url; ?></h1>
      <div class="buttons">
        <a onclick="$('#form').attr('action', location + '&exit=true');$('#form').submit();" class="button"><span><?php echo $button_save_exit; ?></span></a>
        <a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a>
        <a href="<?php echo $cancel; ?>" class="button"><span><?php echo $button_cancel; ?></span></a>
      </div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tbody>
            <tr>
              <td style="border-bottom: 0px;">
                <h2><?php echo $header_tabs; ?></h2>
              </td>
            </tr>
            <tr>
              <td>
                <div id="tabs-container">
                    <div class="vtabs">
                      <?php foreach ($tabs as $keyTab => $tab) { ?>
                        <a href="#tab-tab-<?php echo $keyTab; ?>" id="tab-<?php echo $keyTab; ?>">
                          <div><?php echo $tab['tab_title']; ?>&nbsp;</div>
                          <img src="view/image/delete.png" alt="" onclick="removeTab(<?php echo $keyTab; ?>);return false;" />
                        </a>
                      <?php } ?>
                      <span id="tab-add" onclick="addTab();" style="cursor:pointer;" >
                          <?php echo $button_add_tab; ?>&nbsp;
                          <img src="view/image/add.png" alt="" />
                      </span> 
                    </div>
                    <?php foreach ($tabs as $keyTab => $tab) { ?>
                      <div id="tab-tab-<?php echo $keyTab; ?>" class="vtabs-content">
                          <table class="tab-form">
                            <tr>
                              <td colspan="2">
                                <h3><?php echo $entry_title; ?></h3>
                                <?php foreach ($languages as $language) { ?>
                                  <span class="lang-input">
                                    <input size="20" type="text" name="showintabs_tab[<?php echo $keyTab; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo $tab['title'][$language['language_id']]; ?>" <?php if( $language['language_id'] == $language_admin_id ){ echo 'class="language-title"'; } ?> />
                                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                                  </span>
                                <?php } ?>
                              </td>
                            </tr>
                            <tr>
                              <td colspan="2">
                                <h3><?php echo $entry_source; ?></h3>
                                <fieldset>
                                  <legend>
                                    <input type="radio" id="select_product<?php echo $keyTab; ?>" name="showintabs_tab[<?php echo $keyTab; ?>][data_source]" value="SP" <?php if (!isset($tab['data_source']) || (isset($tab['data_source']) && $tab['data_source'] == 'SP')) { echo 'checked="checked"'; } ?> />
                                    <label for="select_product<?php echo $keyTab; ?>"><?php echo $header_products_select; ?></label>
                                  </legend>
                                  <div class="field_cont" <?php if (isset($tab['data_source']) && $tab['data_source'] != 'SP') { echo 'style="display:none"'; } ?> >
                                    <label><?php echo $entry_products; ?></label>
                                    <input type="text" name="products" value="" id="<?php echo $keyTab; ?>"/>
                                    <div id="products-tabs-<?php echo $keyTab; ?>" class="scrollbox">
                                      <?php if(isset($tab['products'])){ ?>
                                        <?php $class = 'odd'; ?>
                                        <?php foreach ($tab['products'] as $product_tab) { ?>
                                          <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                          <div id="product-tabs-<?php echo $keyTab; ?>-<?php echo $product_tab['product_id']; ?>" class=" <?php echo  $class; ?>">
                                            <?php echo $product_tab['name']; ?> (<?php echo $product_tab['model']; ?>)
                                            <input type="hidden" name="showintabs_tab[<?php echo $keyTab; ?>][products][<?php echo $product_tab['product_id']; ?>][product_id]" value="<?php echo $product_tab['product_id']; ?>" />
                                            <img src="view/image/delete.png" alt="" class="delete" />
                                          </div>
                                        <?php } ?>
                                      <?php } ?>
                                    </div>
                                  </div>
                                </fieldset>
                                <fieldset>
                                  <legend>
                                    <input type="radio" id="predef_groups<?php echo $keyTab; ?>" name="showintabs_tab[<?php echo $keyTab; ?>][data_source]" value="PG" <?php if (isset($tab['data_source']) && $tab['data_source'] == 'PG') { echo 'checked="checked"'; } ?> />
                                    <label for="predef_groups<?php echo $keyTab; ?>"><?php echo $header_predefined_groups; ?></label>
                                  </legend>
                                  <div class="field_cont" <?php if (isset($tab['data_source']) && $tab['data_source'] != 'PG') { echo 'style="display:none"'; } ?> >
                                    <label><?php echo $entry_group; ?></label>
                                    <select name="showintabs_tab[<?php echo $keyTab; ?>][product_group]">
                                      <option value="BS" <?php if (isset($tab['product_group']) && $tab['product_group'] == 'BS') { echo 'selected="selected"'; } ?> ><?php echo $text_best_seller; ?></option>
                                      <option value="LA" <?php if (isset($tab['product_group']) && $tab['product_group'] == 'LA') { echo 'selected="selected"'; } ?> ><?php echo $text_latest_products; ?></option>
                                      <option value="SP" <?php if (isset($tab['product_group']) && $tab['product_group'] == 'SP') { echo 'selected="selected"'; } ?> ><?php echo $text_special_products; ?></option>
                                      <option value="PP" <?php if (isset($tab['product_group']) && $tab['product_group'] == 'PP') { echo 'selected="selected"'; } ?> ><?php echo $text_popular_products; ?></option>
                                    </select>
                                  </div>
                                </fieldset>
                                <fieldset>
                                  <legend>
                                    <input type="radio" id="custom_query<?php echo $keyTab; ?>" name="showintabs_tab[<?php echo $keyTab; ?>][data_source]" value="CQ" <?php if (isset($tab['data_source']) && $tab['data_source'] == 'CQ') { echo 'checked="checked"'; } ?>/>
                                    <label for="custom_query<?php echo $keyTab; ?>"><?php echo $header_custom_query; ?></label>
                                  </legend>
                                  <div class="field_cont" <?php if (isset($tab['data_source']) && $tab['data_source'] != 'CQ') { echo 'style="display:none"'; } ?> >
                                    <label><?php echo $entry_filter; ?></label>
                                      <select name="showintabs_tab[<?php echo $keyTab; ?>][filter_category]">
                                          <option value="ALL"><?php echo $text_all_categories; ?></option>
                                        <?php foreach ($categories as $category) { ?>
                                          <option value="<?php echo $category['category_id']; ?>" <?php if (isset($tab['filter_category']) && $tab['filter_category'] == $category['category_id']) { echo 'selected="selected"'; } ?> ><?php echo $category['name']; ?></option>
                                        <?php } ?>
                                      </select>
                                      <span class="info"><?php echo $text_category; ?></span>
                                      <select name="showintabs_tab[<?php echo $keyTab; ?>][filter_manufacturer]">
                                          <option value="ALL"><?php echo $text_all_manufacturer; ?></option>
                                        <?php foreach ($manufacturers as $manufacturer) { ?>
                                          <option value="<?php echo $manufacturer['manufacturer_id']; ?>" <?php if (isset($tab['filter_manufacturer']) && $tab['filter_manufacturer'] == $manufacturer['manufacturer_id']) { echo 'selected="selected"'; } ?> ><?php echo $manufacturer['name']; ?></option>
                                        <?php } ?>
                                      </select>
                                      <span class="info"><?php echo $text_manufacturer; ?></span>
                                      </br>
                                      <label><?php echo $entry_sort_query; ?></label>
                                      <select class="margin_top" name="showintabs_tab[<?php echo $keyTab; ?>][sort]">
                                          <option value="pd.name" <?php if (isset($tab['sort']) && $tab['sort'] == 'pd.name') { echo 'selected="selected"'; } ?> ><?php echo $text_sort_name; ?></option>
                                          <option value="rating" <?php if (isset($tab['sort']) && $tab['sort'] == 'rating') { echo 'selected="selected"'; } ?> ><?php echo $text_sort_rating; ?></option>
                                          <option value="sort_order" <?php if (isset($tab['sort']) && $tab['sort'] == 'sort_order') { echo 'selected="selected"'; } ?> ><?php echo $text_sort_sort_order; ?></option>
                                          <option value="p.price" <?php if (isset($tab['sort']) && $tab['sort'] == 'p.price') { echo 'selected="selected"'; } ?> ><?php echo $text_sort_price; ?></option>
                                          <option value="p.date_added" <?php if (isset($tab['sort']) && $tab['sort'] == 'p.date_added') { echo 'selected="selected"'; } ?> ><?php echo $text_sort_added; ?></option>  
                                      </select>
                                   </div>
                                </fieldset>
                              </td>
                            </tr>
                          </table>
                        </div>
                    <?php } ?>
                </div>
              </td>
            </tr>
            <tr>
              <td></td>
            </tr>
          </tbody>

          <tbody class="none">
            <tr>
              <td></td>
            </tr>
          </tbody>

          <tbody>
            <tr>
              <td style="border-bottom: 0px;">
                <h2><?php echo $header_configuration; ?></h2>
              </td>
            </tr>
            <tr>
              <td>
                 <table id="module" class="list">
                  <thead>
                    <tr>
                      <td class="left"><?php echo $entry_show_tabs; ?></td>
                       <td class="left"><?php echo $entry_grid; ?></td>
                       <td class="left"><?php echo $entry_carousel; ?></td>
                      <td class="left"><?php echo $entry_image; ?></td>
                      <td class="left"><?php echo $entry_limit; ?></td>
                      <td class="left"><?php echo $entry_layout; ?></td>
                      <td class="left"><?php echo $entry_position; ?></td>
                      <td class="left"><?php echo $entry_status; ?></td>
                      <td class="right"><?php echo $entry_sort_order; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <?php $module_row = 0; ?>
                  <?php foreach ($modules as $module) { ?>
                   <tbody id="module-row<?php echo $module_row; ?>">
                      <tr>
                        <td class="left">
                          <div class="scrollbox">
                              <?php $class = 'odd'; ?>
                              <?php foreach ($tabs as $keytab => $tab) { ?>
                                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                <div class="<?php echo $class; ?>">
                                  <?php if (isset($module['tabs']) && in_array($keytab, $module['tabs'])) { ?>
                                    <label>
                                      <input type="checkbox" name="showintabs_module[<?php echo $module_row; ?>][tabs][]" value="<?php echo $keytab; ?>" checked="checked" />
                                      <?php echo $tab['tab_title']; ?>
                                    </label>
                                  <?php } else { ?>
                                    <label>
                                      <input type="checkbox" name="showintabs_module[<?php echo $module_row; ?>][tabs][]" value="<?php echo $keytab; ?>" />
                                      <?php echo $tab['tab_title']; ?>
                                    </label>
                                  <?php } ?>
                                </div>
                              <?php } ?>
                            </div>
                        </td>
                        
                        <td class="left">
                          <select name="showintabs_module[<?php echo $module_row; ?>][columns]">
    		 <option <?php if ($module['columns'] == 'grid5') { echo 'selected="selected"'; } ?> value="grid5"><?php echo $text_grid5; ?></option>
             <option <?php if ($module['columns'] == 'grid4') { echo 'selected="selected"'; } ?> value="grid4"><?php echo $text_grid4; ?></option>
             <option <?php if ($module['columns'] == 'grid3') { echo 'selected="selected"'; } ?> value="grid3"><?php echo $text_grid3; ?></option>
             <option <?php if ($module['columns'] == 'grid1') { echo 'selected="selected"'; } ?> value="grid1"><?php echo $text_grid1; ?></option>
                          </select>
                        </td>
                        
                         <td class="left">
                          <select name="showintabs_module[<?php echo $module_row; ?>][carousel]">
    		 <option <?php if ($module['carousel'] == '') { echo 'selected="selected"'; } ?> value=""><?php echo $text_disable; ?></option>
             <option <?php if ($module['carousel'] == 'enabled') { echo 'selected="selected"'; } ?> value="enabled"><?php echo $text_enable; ?></option>
                          </select>
                        </td>
                        
                        <td class="left">
                          <input type="text" name="showintabs_module[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" size="3" />
                          <input type="text" name="showintabs_module[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" size="3" />
                          <?php if (isset($error_image[$module_row])) { ?>
                          <span class="error"><?php echo $error_image[$module_row]; ?></span>
                          <?php } ?>
                        </td>
                        
                       
                        
                        
                        <td class="left">
                          <input type="text" name="showintabs_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="3" />
                        </td>
                        <td class="left">
                          <select name="showintabs_module[<?php echo $module_row; ?>][layout_id]">
                            <?php foreach ($layouts as $layout) { ?>
                              <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                              <?php } else { ?>
                                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                              <?php } ?>
                            <?php } ?>
                          </select>
                        </td>
                        <td class="left">
                          <select name="showintabs_module[<?php echo $module_row; ?>][position]">
                            <option <?php if ($module['position'] == 'content_top') { echo 'selected="selected"'; } ?> value="content_top"><?php echo $text_content_top; ?></option>
                            <option <?php if ($module['position'] == 'content_bottom') { echo 'selected="selected"'; } ?> value="content_bottom"><?php echo $text_content_bottom; ?></option>
                            
                            <option <?php if ($module['position'] == 'column_left') { echo 'selected="selected"'; } ?> value="column_left"><?php echo $text_column_left; ?></option>
                            
                            <option <?php if ($module['position'] == 'column_right') { echo 'selected="selected"'; } ?> value="column_right"><?php echo $text_column_right; ?></option>
                            
                            <option <?php if ($module['position'] == 'footer_modules') { echo 'selected="selected"'; } ?> value="footer_modules"><?php echo $text_footer_modules; ?></option>
                          </select>
                        </td>
                        <td class="left"><select name="showintabs_module[<?php echo $module_row; ?>][status]">
                             <option value="1" <?php if ($module['status'] == '1') { echo 'selected="selected"'; } ?>><?php echo $text_enable; ?></option>
                             <option value="0" <?php if ($module['status'] == '0') { echo 'selected="selected"'; } ?>><?php echo $text_disable; ?></option>
                          </select>
                        </td>
                        <td class="right"><input type="text" name="showintabs_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
                        <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
                        <input type="hidden" name="showintabs_module[<?php echo $module_row; ?>][module_row]" value="<?php echo $module_row; ?>"  /> 
                      </tr>
                    </tbody>
                    <?php $module_row++; ?>
                  <?php } ?>
                  <tfoot>
                  <tr>
                    <td colspan="9"></td>
                    <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
                  </tr>
                </tfoot>
              </table>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
//Config ayudas
var qtip_cfg={
   position: {corner: {target: 'topMiddle',tooltip: 'bottomMiddle'}},
   style: { name: 'blue',tip: 'bottomMiddle',},
   show: {effect: function() {$(this).effect('slide', {mode: 'show', direction: 'down'}, 300);}},
   hide: {effect: function() {$(this).effect('slide', {mode: 'hide', direction: 'down'}, 300);}}
 };
//ayudas
$('.help').qtip(qtip_cfg);
//--></script>
<script type="text/javascript"><!--
//Gestion de pestañas
$('.vtabs a').tabs();

function addTab(){
  //Caculamos numero de pestaña es valor de ultima + 1
  if(! $('input[name=\'products\']').last().attr('id')){
    var tab_row = 0;
  }else{
    var tab_row = parseInt($('input[name=\'products\']').last().attr('id'), 10) + 1;
  }

  //COmponemos html de una pestaña
  var html = '';
  html += '<div id="tab-tab-' + tab_row + '" class="vtabs-content">';
  html += '<table class="tab-form"><tr>';
  html += '<td colspan="2"><h3><?php echo $entry_title; ?></h3>';
    <?php foreach ($languages as $language) { ?>
  html += '<span class="lang-input">';
  html += '<input size="20" type="text" name="showintabs_tab[' + tab_row + '][title][<?php echo $language['language_id']; ?>]" value="" <?php if( $language['language_id'] == $language_admin_id ){ echo 'class="language-title"'; } ?> />';
  html += ' <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span> ';
    <?php } ?>
  html += '</td></tr>';
  html += '<tr><td colspan="2">';
  html += '  <h3><?php echo $entry_source; ?></h3>';
  html += '    <fieldset><legend>';
  html += '     <input type="radio" id="select_product' + tab_row + '" name="showintabs_tab[' + tab_row + '][data_source]" value="SP" checked="checked"/> <label for="select_product' + tab_row + '"><?php echo $header_products_select; ?></label> </legend>';
  html += '     <div class="field_cont">';
  html += '       <label><?php echo $entry_products; ?></label>';
  html += '       <input type="text" name="products" value="" id="' + tab_row + '"/>';
  html += '       <div id="products-tabs-' + tab_row + '" class="scrollbox"></div>';
  html += '     </div>';
  html += '    </fieldset><fieldset><legend>';
  html += '     <input type="radio" id="predef_groups' + tab_row + '" name="showintabs_tab[' + tab_row + '][data_source]" value="PG" /> <label for="predef_groups' + tab_row + '"><?php echo $header_predefined_groups; ?></label></legend>';
  html += '     <div class="field_cont" style="display:none" >';
  html += '      <label><?php echo $entry_group; ?></label>';
  html += '      <select name="showintabs_tab[' + tab_row + '][product_group]">';
  html += '        <option value="BS" ><?php echo $text_best_seller; ?></option>';
  html += '        <option value="LA" ><?php echo $text_latest_products; ?></option>';
  html += '        <option value="SP" ><?php echo $text_special_products; ?></option>';
  html += '        <option value="PP" ><?php echo $text_popular_products; ?></option>';
  html += '      </select></div></fieldset><fieldset>';
  html += '    <legend>';                   
  html += '    <input type="radio" id="custom_query' + tab_row + '" name="showintabs_tab[' + tab_row + '][data_source]" value="CQ" /> <label for="custom_query' + tab_row + '"> <?php echo $header_custom_query; ?></label> </legend>';
  html += '       <div class="field_cont" style="display:none">';
  html += '      <label><?php echo $entry_filter; ?></label>';
  html += '       <select name="showintabs_tab[' + tab_row + '][filter_category]">';
  html += '         <option value="ALL"><?php echo $text_all_categories; ?></option>';
                   <?php foreach ($categories as $category) { ?>
  html += '         <option value="<?php echo $category['category_id']; ?>" ><?php echo addslashes($category['name']); ?></option>';
                   <?php } ?>
  html += '     </select>';
  html += '     <span class="info"><?php echo $text_category; ?></span>';
  html += '       <select  ="showintabs_tab[' + tab_row + '][filer_manufacturer]">';
  html += '       <option value="ALL"><?php echo $text_all_manufacturer; ?></option>';
         <?php foreach ($manufacturers as $manufacturer) { ?>
  html += '       <option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo addslashes($manufacturer['name']); ?></option>';
         <?php } ?>
  html += '     </select><span class="info"><?php echo $text_manufacturer; ?></span></br>';
  html += '     <label><?php echo $entry_sort_query; ?></label>';
  html += '        <select class="margin_top" name="showintabs_tab[' + tab_row + '][sort]">';
  html += '         <option value="pd.name" ><?php echo $text_sort_name; ?></option>';
  html += '         <option value="rating" ><?php echo $text_sort_rating; ?></option>';
  html += '         <option value="sort_order" ><?php echo $text_sort_sort_order; ?></option>';
  html += '         <option value="p.price" ><?php echo $text_sort_price; ?></option>';
  html += '         <option value="p.date_added" ><?php echo $text_sort_added; ?></option>';  
  html += '     </select></div></fieldset></td></tr>';
  html += '  </table></div>';

  $('#tabs-container').append(html);

  //Componemos link de pestaña
  var link = '';
  link += '<a href="#tab-tab-' + tab_row + '" id="tab-' + tab_row + '">';             
  link += '  <div><?php echo $text_tab; ?>' + tab_row + '</div>&nbsp;';
  link += '  <img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#tab-tab-' + tab_row + '\').remove(); $(\'#tab-' + tab_row + '\').remove(); return false;" />';
  link += '</a>';
  
  $('#tab-add').before(link);
  
  //Ponemos el autocomplet al input
  $('input[name=\'products\']').autocomplete(autocomp_cfg);

  //Reactivamos tabs
  $('.vtabs a').tabs();
  
  //Seleccionamos ultima tab
  $('#tab-' + tab_row).trigger('click');
  
  //Actualizamos ayudas para esta pestaña
  $('#tab-tab-' + tab_row + ' .help').qtip(qtip_cfg);
}

//Configuraicon de autocomplet
var autocomp_cfg={
  delay: 500,
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=module/showintabs/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
      dataType: 'json',
      success: function(json) {   
        response($.map(json, function(item) {
          return {
            label: item.name,
            value: item.product_id,
            model: item.model
          }
        }));
      }
    });
  }, 
  select: function(event, ui) {
    var tab_row = $(this).attr('id');

    $('#product-tabs-' + tab_row + '-' + ui.item.value).remove();

    var prodElement = '';
    prodElement += '<div id="product-tabs-' + tab_row + '-' + ui.item.value + '">' +  ui.item.label + ' (' + ui.item.model + ')<img src="view/image/delete.png" alt="" class="delete" />';
    prodElement += '  <input type="hidden" name="showintabs_tab[' + tab_row + '][products][' + ui.item.value + '][product_id]" value="' + ui.item.value + '" />';
    prodElement += '</div>';

    $('#products-tabs-' + tab_row).append(prodElement);
    $('#products-tabs-' + tab_row + ' > div:odd').attr('class', 'odd');
    $('#products-tabs-' + tab_row + ' > div:even').attr('class', 'even');
        
    return false;
  },
  focus: function(event, ui) {
      return false;
  }
};

// Autocomplet de productos
$('input[name=\'products\']').autocomplete(autocomp_cfg);

//Delete de productos
$('.scrollbox div .delete').live('click', function() {
  $(this).parent().remove();
  $('.scrollbox > div:odd').attr('class', 'odd');
  $('.scrollbox > div:even').attr('class', 'even'); 
});
//--></script>

<script type="text/javascript"><!--
//Gestion de módulos
var module_row = <?php echo $module_row; ?>;

function addModule() {  
  html  = '<tbody id="module-row' + module_row + '">';
  html += '  <tr>';
  html += '  <td class="left">';
  html += '  <div class="scrollbox">';
            <?php $class = 'odd'; ?>
            <?php foreach ($tabs as $keytab => $tab) { ?>
              <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
  html += '   <div class="<?php echo $class; ?>">';
  html += '   <label><input type="checkbox" name="showintabs_module[' + module_row + '][tabs][]" value="<?php echo $keytab; ?>" />';
  html += '    <?php echo $tab['tab_title']; ?> </label>';
  html += '  </div>';
            <?php } ?>
  html += '</div>';
  html += '</td>';
  html += ' <td class="left">';
  html += ' <select name="showintabs_module[' + module_row + '][columns]">';
  html += ' <option value="grid5"><?php echo $text_grid5; ?></option>';
  html += ' <option value="grid4"><?php echo $text_grid4; ?></option>';
  html += ' <option value="grid3"><?php echo $text_grid3; ?></option>';
  html += ' <option value="grid1"><?php echo $text_grid1; ?></option>';
  html += ' </select>';
  html += ' <td class="left">';
  html += ' <select name="showintabs_module[' + module_row + '][carousel]">';
  html += ' <option value=""><?php echo $text_disable; ?></option>';
  html += ' <option value="enabled"><?php echo $text_enable; ?></option>';
  html += ' </select>';
  html += '</td>';
  html += '<td class="left">';
  html += ' <input type="text" name="showintabs_module[' + module_row + '][image_width]" value="200" size="3" />';
  html += ' <input type="text" name="showintabs_module[' + module_row + '][image_height]" value="200" size="3" />';
  html += ' </td>';
  html += '<td class="left">';
  html += ' <input type="text" name="showintabs_module[' + module_row + '][limit]" value="10" size="3" />';
  html += ' </td>';
  html += ' <td class="left">';
  html += ' <select name="showintabs_module[' + module_row + '][layout_id]">';
            <?php foreach ($layouts as $layout) { ?>
  html += '  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
            <?php } ?>
  html += ' </select>';
  html += '</td>';
  html += '<td class="left">';
  html += ' <select name="showintabs_module[' + module_row + '][position]">';
  html += ' <option value="content_top"><?php echo $text_content_top; ?></option>';
  html += ' <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
  html += ' <option value="column_left"><?php echo $text_column_left; ?></option>';
  html += ' <option value="column_right"><?php echo $text_column_right; ?></option>';
  html += ' <option value="footer_modules"><?php echo $text_footer_modules; ?></option>';
  html += '</select>';
  html += '</td>';
  html += '<td class="left"><select name="showintabs_module[' + module_row + '][status]">';
  html += '  <option value="1" ><?php echo $text_enable; ?></option>';
  html += '  <option value="0" ><?php echo $text_disable; ?></option>';
  html += ' </select>';
  html += '</td>';
  html += '<td class="right"><input type="text" name="showintabs_module[' + module_row + '][sort_order]" value="0" size="3" /></td>';
  html += '<td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a>';
  html += '<input type="hidden" name="showintabs_module[' + module_row + '][module_row]" value="' + module_row + '"  /></td>';
  html += '</tr></tbody>';

  $('#module tfoot').before(html);
  
  module_row++;
}
//--></script> 
<script type="text/javascript"><!--
//colapse de fieldsets
$('legend > input').live('change', function() {
  $(this).closest('td').find('div.field_cont').hide(500);
  $(this).closest('fieldset').find('div.field_cont').show(500);
});
//--></script> 
<script type="text/javascript"><!--
//cambio de titulo de pestaña cuando escribe el user
$('.language-title').live('keyup input paste', function() {
  var href = $(this).closest('div').attr('id');
  $('a[href="#' + href + '"] > div').text($(this).val());
});
//--></script> 
<script type="text/javascript"><!--
//control delete pestañas
function removeTab(TabId) {
  $('#tab-' + TabId ).remove(); 
  $('#tab-tab-' + TabId).remove(); 
  $('.vtabs a:first').trigger('click');
  $('input[value="' + TabId + '"]:checkbox').parent().remove(); 
}
//--></script> 
<?php echo $footer; ?>