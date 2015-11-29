<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  
  
  
  <?php if ($orders) { ?>
  <?php foreach ($orders as $order) { ?>
  
  <table class="compare-info">
    <tbody>
        
       <tr>
       <td class="contrast_font history"><?php echo $text_order_id; ?></td>
       <td class="contrast_font">#<?php echo $order['order_id']; ?></td>
      </tr>
      
      <tr>
       <td class="contrast_font history"><?php echo $text_status; ?></td>
       <td class="contrast_font"><?php echo $order['status']; ?></td>
      </tr>
      
      <tr>
       <td class="contrast_font history"><?php echo $text_date_added; ?></td>
       <td class="contrast_font"><?php echo $order['date_added']; ?></td>
      </tr>
      
      <tr>
       <td class="contrast_font history"><?php echo $text_products; ?></td>
       <td class="contrast_font"><?php echo $order['date_added']; ?></td>
      </tr>
      
      <tr>
       <td class="contrast_font history"><?php echo $text_date_added; ?></td>
       <td class="contrast_font"><?php echo $order['products']; ?></td>
      </tr>
      
      <tr>
       <td class="contrast_font history"><?php echo $text_customer; ?></td>
       <td class="contrast_font"><?php echo $order['name']; ?></td>
      </tr>
      
      <tr>
       <td class="contrast_font history"><?php echo $text_total; ?></td>
       <td class="contrast_font"><span class="price"><?php echo $order['total']; ?></span></td>
      </tr>
      
      <tr>
      
       <td colspan="2" class="white_back">
       <a class="button contrast" href="<?php echo $order['href']; ?>"><?php echo $button_view; ?></a>
       <a class="button remove" href="<?php echo $order['reorder']; ?>"><?php echo $button_reorder; ?></a>
		</td>
      </tr>
      
    </tbody>
   </table>
  
  <?php } ?>
  
  <div class="pagination"><?php echo $pagination; ?></div>
  
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php } ?>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>