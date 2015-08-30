<?php echo $header; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>
<style>
    .tab02{ width: 100%; margin-top: 10px;}
    .sc02{ background: #c40001;width: 60px; height: 28px; line-height: 28px; color: #fff; display: block; text-align: center; cursor: pointer}
    .sc02:hover{ background: #ff3048}
</style>

<div class="bg">
    <div class="left w150">
       <?php echo $column_left; ?>
    </div>
    <div class="right w1028" style="width:70%;margin-bottom:60px;">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
		  <?php foreach ($downloads as $download) { ?>
		  <div class="download-list">
			<div class="download-id"><b><?php echo $text_order; ?></b> <?php echo $download['order_id']; ?></div>
			<div class="download-status"><b><?php echo $text_size; ?></b> <?php echo $download['size']; ?></div>
			<div class="download-content">
			  <div><b><?php echo $text_name; ?></b> <?php echo $download['name']; ?><br />
				<b><?php echo $text_date_added; ?></b> <?php echo $download['date_added']; ?></div>
			  <div><b><?php echo $text_remaining; ?></b> <?php echo $download['remaining']; ?></div>
			  <div class="download-info">
				<?php if ($download['remaining'] > 0) { ?>
				<a href="<?php echo $download['href']; ?>" class="button"><span><?php echo $text_download; ?></span></a>
				<?php } ?>
			  </div>
			</div>
		  </div>
		  <?php } ?>
		  <div class="pagination"><?php echo $pagination; ?></div>
	  </div>
</div>
  <?php echo $content_bottom; ?>
<?php echo $footer; ?>