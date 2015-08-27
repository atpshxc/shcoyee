<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<!--div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div-->
  <div class="bg">
  <div class="w1200 pt15">
    <div class="left w150">
      <div style="padding-bottom:12px;">
        <div class="w150_bt f14w">帮助中心</div>
        <div class="w150_bt2 f14w"><img src="/catalog/view/theme/new/images/jian.jpg" width="9" height="9" class="left jian" />购物指南</div>
        <ul class="bzzx">
          <li><a id="infoid_17" href="index.php?route=information/helpcenter&information_id=17">可益购物流程</a></li>
          <li><a id="infoid_18" href="index.php?route=information/helpcenter&information_id=18">商品验货与签收</a></li>
          <li><a id="infoid_19" href="index.php?route=information/helpcenter&information_id=19">消费者告知书</a></li>
          <li><a id="infoid_25" href="index.php?route=information/helpcenter&information_id=25">关税表</a></li>
        </ul>
        <div class="w150_bt2 f14w"><img src="/catalog/view/theme/new/images/jian.jpg" width="9" height="9" class="left jian" />售后服务</div>
        <ul class="bzzx">
          <li><a id="infoid_10" href="index.php?route=information/helpcenter&information_id=10">品牌售后服务</a></li>
          <li><a id="infoid_11" href="index.php?route=information/helpcenter&information_id=11">退换货地址</a></li>
          <li><a id="infoid_12" href="index.php?route=information/helpcenter&information_id=12">退换货政策</a></li>
          <li><a id="infoid_13" href="index.php?route=information/helpcenter&information_id=13">退款说明</a></li>
        </ul>
        <div class="w150_bt2 f14w"><img src="/catalog/view/theme/new/images/jian.jpg" width="9" height="9" class="left jian" />支付与配送</div>
        <ul class="bzzx">
          <li><a id="infoid_14" href="index.php?route=information/helpcenter&information_id=14">支付方式</a></li>
          <li><a id="infoid_20" href="index.php?route=information/helpcenter&information_id=20">配送方式</a></li>
          <li><a id="infoid_22" href="index.php?route=information/helpcenter&information_id=22">物流状态查询</a></li>
        </ul>
      </div>
      <div style="padding-bottom:12px;">
        <div class="w150_bt f14w">可益</div>
        <div class="w150_bt2 f14w"><img src="/catalog/view/theme/new/images/jian.jpg" width="9" height="9" class="left jian" />公司介绍</div>
        <ul class="bzzx">
          <li><a id="infoid_4" href="index.php?route=information/helpcenter&information_id=4">关于可益</a></li>
          <li><a id="infoid_9" href="index.php?route=information/helpcenter&information_id=9">联系我们</a></li>
          <li><a id="infoid_5" href="index.php?route=information/helpcenter&information_id=5">隐私说明</a></li>
        </ul>
      </div>
    </div>
    <div class="right w1028">
      <p class="w1028_bt bold"><?php echo $heading_title; ?></p>
      <div class="w1028_nr f14w"><?php echo $description; ?></div>
    </div>
  </div>
</div>

  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>