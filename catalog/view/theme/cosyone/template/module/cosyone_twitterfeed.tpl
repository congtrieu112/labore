<div class="box">
<?php if ($module_title){ ?>
<div class="box-heading"><?php echo $module_title; ?></div>
<?php } ?>
<div class="box-content">
<div class="tweet-feed-widget<?php echo $module; ?>"></div>
</div>
</div>
<script type="text/javascript">
  $('.tweet-feed-widget<?php echo $module; ?>').tweetFeed({
  widgetId: '<?php echo $widget_id; ?>',
  maxTweets: <?php echo $limit; ?>,
  height:'100%'
  });
</script>