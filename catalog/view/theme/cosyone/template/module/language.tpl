<?php if (count($languages) > 1) { ?>
<div class="language_current contrast_font">
    <?php foreach ($languages as $language) { ?>
        <?php if ($language['code'] == $language_code) { ?>
            <a class="head"><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                <?php echo $text_language; ?><i class="fa fa-angle-down"></i>
            </a>
        <?php } ?>
    <?php } ?>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div id="language" class="top_header_drop_down">
            <?php foreach ($languages as $language) { ?>
                <?php if ($language['code'] == $language_code) { ?>
                    <a class="current"><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /><?php echo $language['name']; ?></a>
                <?php } else { ?>
                    <a onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $(this).parent().parent().submit();">
                    <img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /><?php echo $language['name']; ?></a>
                <?php } ?>
            <?php } ?>
            <input type="hidden" name="language_code" value="" />
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        </div>
    </form>
</div>
<?php } ?>