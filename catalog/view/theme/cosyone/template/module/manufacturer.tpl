<div class="box-category">
  <div class="heading-category"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul class="box-manufacturer">
      <?php foreach ($manufacturers as $manufacturer) { ?>
        <li>
          <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
            <a href="<?php echo $manufacturer['href']; ?>" class="active" style="color:red;"><?php echo $manufacturer['name']; ?></a>
          <?php } else { ?>
            <a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
          <?php } ?>
        </li>
      <?php } ?>
    </ul>
  </div>
</div>

<!-- for dropdown use it -->
<!---
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    
  <select onchange="gobrandpage(this.value)" style="width:100%;">
  	<?php foreach ($manufacturers as $manufacturer) { ?>
    <option value="<?php echo $manufacturer['href']; ?>" <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id){ echo "SELECTED"; } ?> class="list-group-item active"><?php echo $manufacturer['name']; ?></option>
    <?php } ?>
  
  </select>
  </div>
</div>
</div>
  --> 

<script>
	function gobrandpage(id){
		window.location.href=id;
	}
</script>