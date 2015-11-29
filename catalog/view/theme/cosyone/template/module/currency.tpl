<?php if (count($currencies) > 1) { ?>
    <div class="currency_current contrast_font"> 
        <?php foreach ($currencies as $currency) { ?>
            <?php if ($currency['code'] == $currency_code) { ?>
                <a class="head"><?php echo $currency['symbol_left']; ?><?php echo $currency['symbol_right']; ?>
                <i class="fa fa-angle-down"></i></a>
            <?php } ?>
        <?php } ?>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div id="currency" class="top_header_drop_down">
                <?php foreach ($currencies as $currency) { ?>
                    <?php if ($currency['code'] == $currency_code) { ?>
                        <a class="current"><?php echo $currency['symbol_left']; ?><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></a>
                    <?php } else { ?>
                        <a  title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();"><?php echo $currency['symbol_left']; ?><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></a>
                    <?php } ?>
                <?php } ?>
                <input type="hidden" name="currency_code" value="" />
                <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
            </div>
        </form>
    </div>
<?php } ?>