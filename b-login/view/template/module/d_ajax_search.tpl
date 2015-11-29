<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb"> 
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><i class="icon-puzzle"></i> <?php echo $heading_title; ?> <?php echo $version; ?></h1>
      <div class="buttons"><?php if(isset($stores)){ ?>
        <select onChange="location='<?php echo $module_link; ?>&store_id='+$(this).val()">
          <?php foreach($stores as $store){ ?>
          <?php if($store['store_id'] ==  $store_id){ ?>
          <option value="<?php echo $store['store_id']; ?>" selected="selected" ><?php echo $store['name']; ?></option>
          <?php }else{ ?>
          <option value="<?php echo $store['store_id']; ?>" ><?php echo $store['name']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
        <?php } ?><a onclick="saveAndStay();" class="button"><?php echo $button_save_and_stay; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
       <div id="tabs" class="htabs">
        <a href="#settings" class="htab-item"><span class="icon-puzzle"> <?php echo $text_settings; ?></span></a> 
        <a href="#instructions" class="htab-item"><span class="icon-graduation-cap"></span><?php echo $text_instructions; ?></a>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
       <div id="settings" >
        <table class="form">
          <tr>
            <td><?php echo $entry_search_on_off; ?><i class="icon-question" data-help="<?php echo $tooltip_search_on_off; ?>" rel="tooltip"></i></td>
            <td><?php if (isset($d_ajax_search['search_on_off']) && $d_ajax_search['search_on_off']) { ?>
              <input type="radio" name="d_ajax_search[search_on_off]" value="1" checked="checked" />
              <?php echo $text_on; ?>
              <input type="radio" name="d_ajax_search[search_on_off]" value="0" />
              <?php echo $text_off; ?>
              <?php } else { ?>
              <input type="radio" name="d_ajax_search[search_on_off]" value="1" />
              <?php echo $text_on; ?>
              <input type="radio" name="d_ajax_search[search_on_off]" value="0" checked="checked" />
              <?php echo $text_off; ?>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_search_width; ?><i class="icon-question" data-help="<?php echo $tooltip_search_width; ?>" rel="tooltip"></i></td>
            <td><?php if (isset($d_ajax_search['search_width'])) { ?>
              <input type="text" name="d_ajax_search[search_width]" value="<?php echo $d_ajax_search['search_width']; ?>"  />
              <?php } else { ?>
              <input type="text" name="d_ajax_search[search_width]" value="290px"  />
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_search_max_symbols; ?><i class="icon-question" data-help="<?php echo $tooltip_search_max_symbols; ?>" rel="tooltip"></i></td>
            <td><?php if (isset($d_ajax_search['search_max_symbols'])) { ?>
              <input type="text" name="d_ajax_search[search_max_symbols]" value="<?php echo $d_ajax_search['search_max_symbols']; ?>"  />
              <?php } else { ?>
              <input type="text" name="d_ajax_search[search_max_symbols]" value="0"  />
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_search_max_results; ?><i class="icon-question" data-help="<?php echo $tooltip_search_max_results; ?>" rel="tooltip"></i></td>
            <td><?php if (isset($d_ajax_search['search_max_results'])) { ?>
              <input type="text" name="d_ajax_search[search_max_results]" value="<?php echo $d_ajax_search['search_max_results']; ?>"  />
              <?php } else { ?>
              <input type="text" name="d_ajax_search[search_max_results]" value="15"  />
              <?php } ?></td>
          </tr>
		  <tr>
		  <td><?php echo $entry_search_first_sybmols; ?><i class="icon-question" data-help="<?php echo $tooltip_search_first_symbols; ?>" rel="tooltip"></i></td>
          <td><input type="checkbox" name="d_ajax_search[search_first_symbols]" <?php if (isset($d_ajax_search['search_first_symbols'])) echo 'checked="checked"'; ?>><?php echo $text_on; ?></td>
		  </tr>
		  <tr>
		  <td><?php echo $entry_search_priority; ?></td>
          <td>
		  <div id="sortable" class="sortable atab col-xs-6 col-md-4">
		  <?php if (isset($d_ajax_search['search_product_sort'])) { ?>
		  <?php for($i=0;$i<5;$i++) { ?>
          <?php if (isset($d_ajax_search['search_product_sort'])) {if ($d_ajax_search['search_product_sort']==$i) { ?><div class="atab-item sort-item">
          <input type="hidden" class="sort-value" name="d_ajax_search[search_product_sort]" value="<?php echo $d_ajax_search['search_product_sort']; ?>"><input type="checkbox" name="d_ajax_search[search_product_on]" <?php if (isset($d_ajax_search['search_product_on'])) echo 'checked="checked"'; ?>> <?php echo $text_product; ?><span class="icon-drag"></span></div><?php } } ?>

          <?php if (isset($d_ajax_search['search_category_sort'])) {if ($d_ajax_search['search_category_sort']==$i) { ?><div class="atab-item sort-item">
          <input type="hidden" class="sort-value" name="d_ajax_search[search_category_sort]" value="<?php echo $d_ajax_search['search_category_sort']; ?>"><input type="checkbox" name="d_ajax_search[search_category_on]" <?php if (isset($d_ajax_search['search_category_on'])) echo 'checked="checked"'; ?>> <?php echo $text_category; ?><span class="icon-drag"></span></div><?php } } ?>

          <?php if (isset($d_ajax_search['search_manufacturer_sort'])) {if ($d_ajax_search['search_manufacturer_sort']==$i) { ?><div class="atab-item sort-item">
          <input type="hidden" class="sort-value" name="d_ajax_search[search_manufacturer_sort]" value="<?php echo $d_ajax_search['search_manufacturer_sort']; ?>"><input type="checkbox" name="d_ajax_search[search_manufacturer_on]" <?php if (isset($d_ajax_search['search_manufacturer_on'])) echo 'checked="checked"'; ?>> <?php echo $text_manufacturer; ?><span class="icon-drag"></span></div><?php } } ?>

          <?php if (isset($d_ajax_search['search_information_sort'])) {if ($d_ajax_search['search_information_sort']==$i) { ?><div class="atab-item sort-item">
          <input type="hidden" class="sort-value" name="d_ajax_search[search_information_sort]" value="<?php echo $d_ajax_search['search_information_sort']; ?>"><input type="checkbox" name="d_ajax_search[search_information_on]" <?php if (isset($d_ajax_search['search_information_on'])) echo 'checked="checked"'; ?>> <?php echo $text_information; ?><span class="icon-drag"></span></div><?php } } ?>

          <?php if ($is_blog==1) { ?><?php if (isset($d_ajax_search['search_blog_article_sort'])) {if ($d_ajax_search['search_blog_article_sort']==$i) { ?><div class="atab-item sort-item">
          <input type="hidden" class="sort-value" name="d_ajax_search[search_blog_article_sort]" value="<?php echo $d_ajax_search['search_blog_article_sort']; ?>"><input type="checkbox" name="d_ajax_search[search_blog_aticle_on]" <?php if (isset($d_ajax_search['search_blog_aticle_on'])) echo 'checked="checked"'; ?>> <?php echo $text_blog_article; ?><span class="icon-drag"></span></div><?php } } } ?>  

		  <?php if ($is_blog==1) { ?><?php if (isset($d_ajax_search['search_blog_category_sort'])) {if ($d_ajax_search['search_blog_category_sort']==$i) { ?><div class="atab-item sort-item"><input type="hidden" class="sort" name="d_ajax_search[search_blog_category_sort]" value="<?php echo $d_ajax_search['search_blog_category_sort']; ?>"><input type="checkbox" name="d_ajax_search[search_blog_category_on]" <?php if (isset($d_ajax_search['search_blog_category_on'])) echo 'checked="checked"'; ?>> <?php echo $text_blog_category; ?><span class="icon-drag"></span></div><?php } } } ?>  
		 <?php } ?>
		 <?php } else { ?>
		 <div class="atab-item sort-item"><input type="hidden" class="sort-value" name="d_ajax_search[search_product_sort]" value="0"><input type="checkbox" name="d_ajax_search[search_product_on]" checked="checked"> <?php echo $text_product; ?><span class="icon-drag"></span></div>
		 <div class="atab-item sort-item"><input type="hidden" class="sort-value" name="d_ajax_search[search_category_sort]" value="1"><input type="checkbox" name="d_ajax_search[search_category_on]" checked="checked"> <?php echo $text_category; ?><span class="icon-drag"></span></div>
		 <div class="atab-item sort-item"><input type="hidden" class="sort-value" name="d_ajax_search[search_manufacturer_sort]" value="2"><input type="checkbox" name="d_ajax_search[search_manufacturer_on]"> <?php echo $text_manufacturer; ?><span class="icon-drag"></span></div>
     <div class="atab-item sort-item"><input type="hidden" class="sort-value" name="d_ajax_search[search_information_sort]" value="2"><input type="checkbox" name="d_ajax_search[search_information_on]"> <?php echo $text_information; ?><span class="icon-drag"></span></div>
		 <?php if ($is_blog==1) { ?><div class="atab-item sort-item"><input type="hidden" class="sort-value" name="d_ajax_search[search_blog_article_sort]" value="3"><input type="checkbox" name="d_ajax_search[search_blog_aticle_on]"><?php echo $text_blog_article; ?><span class="icon-drag"></span></div><?php } ?>
		 <?php if ($is_blog==1) { ?><div class="atab-item sort-item"><input type="hidden" class="sort-value" name="d_ajax_search[search_blog_category_sort]" value="4"><input type="checkbox" name="d_ajax_search[search_blog_category_on]"><?php echo $text_blog_category; ?><span class="icon-drag"></span></div><?php } ?>
		<?php } ?>
		 </div>
		  </td>
		  </tr>
		  <tr>
		  <td><?php echo $entry_search_price; ?></td>
          <td><input type="checkbox" name="d_ajax_search[search_price]" <?php if (isset($d_ajax_search['search_price'])) echo 'checked="checked"'; ?>><?php echo $text_on; ?></td>
		  </tr>
		  <tr>
		  <td><?php echo $entry_search_special; ?></td>
          <td><input type="checkbox" name="d_ajax_search[search_special]" <?php if (isset($d_ajax_search['search_special'])) echo 'checked="checked"'; ?>><?php echo $text_on; ?></td>
		  </tr>
		  <tr>
		  <td><?php echo $entry_search_tax; ?></td>
          <td><input type="checkbox" name="d_ajax_search[search_tax]" <?php if (isset($d_ajax_search['search_tax'])) echo 'checked="checked"'; ?>><?php echo $text_on; ?></td>
		  </tr>
      <tr>
            <td><?php echo $entry_search_class; ?><i class="icon-question" data-help="<?php echo $tooltip_search_class; ?>" rel="tooltip"></i></td>
            <td class="form-vertical"><?php if (isset($d_ajax_search['search_class'])) { ?>
              <input type="text" name="d_ajax_search[search_class]" value="<?php echo $d_ajax_search['search_class']; ?>"  />
              <?php } else { ?>
              <input  type="text" name="d_ajax_search[search_class]" value="[name=search], [name=filter_name], [name=search_oc]"  />
              <?php } ?></td>
          </tr>
		  <tr>
            <td><span><?php echo $text_version_check; ?></span><i class="icon-question" data-help="<?php echo $tooltip_general_version; ?>" rel="tooltip"></i></td>
            <td><a onClick="versionCheck('<?php echo $route; ?>', '#version_result', '<?php echo $token; ?>')" class="button"><?php echo $button_version_check; ?></a>
              <div id="version_result"></div>
            </td>
          </tr>
        </table>
       </div>
      <div id="instructions" class="htab-content">
        <div class="tab-body">
          <?php echo $text_instructions_full; ?>
        </div>
      </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
	 $(function() {
      $( "#sortable" ).sortable({
        axis: "y",
        placeholder: "ui-state-highlight",
        distance: 5,
        stop: function( event, ui ) {
          ui.item.children( ".sort-item" ).triggerHandler( "focusout" );
      $(this).find(".sort-item").each(function(i, el){
        $(this).find(".sort-value").val($(el).index())
      });
        }
      });
  });
</script>
<script type="text/javascript">
$(document).ready(function(){
    $('#tabs a').tabs(); 
    $('#sub_tabs a').tabs(); 
})

function saveAndStay(){
    $.ajax( {
      type: "POST",
      data: $('#form').serialize(),
    beforeSend: function() {
    $('#form').fadeTo('slow', 0.5);
    },
    complete: function() {
    $('#form').fadeTo('slow', 1);   
    },
      success: function( response ) {
      //  console.log( response );
      }
    } );  
  }

  $('#version_check').click(function(){
  $.ajax( {
      type: "POST",
      url: 'index.php?route=module/quickcheckout/version_check&token=<?php echo $token; ?>',
    dataType: 'json',
    beforeSend: function() {
    $('#form').fadeTo('slow', 0.5);
    },
    complete: function() {
    $('#form').fadeTo('slow', 1);   
    },
      success: function( json ) {
        console.log( json );
    if(json['error']){
      $('#version_result').html('<div class="warning">' + json['error'] + '</div>')
    }
    if(json['attention']){
      $html = '';
      if(json['update']){
         $.each(json['update'] , function(k, v) {
            $html += '<div>Version: ' +k+ '</div><div>'+ v +'</div>';
         });
      }
       $('#version_result').html('<div class="attention">' + json['attention'] + $html + '</div>')
    }
    if(json['success']){
      $('#version_result').html('<div class="success">' + json['success'] + '</div>')
    } 
      }
  })
})
</script>
<?php echo $footer; ?>