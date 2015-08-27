<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<!--div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div-->
  <h1 style='font-size:16px;'><?php echo $heading_title; ?></h1>
  <hr style='margin-top:5px;margin-bottom:5px;color:red;'></hr>
  <?php echo $description; ?>

  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>