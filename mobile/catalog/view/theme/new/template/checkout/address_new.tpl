
        <form class="form_newaddr" name="form_newaddr" >
          <ul>
            <li>
              <label>地址别名：</label>
              <input type="hidden" name="SysNo" value="0">
              <input style="width: 210px;" type="text" class="intxt">
              <span class="need">*</span> <span class="Validform_checktip">简单易记的地址名称，如"家"，"我的公司"等</span> </li>
            <li>
              <label>收货人：</label>
              <input style="width: 210px;" type="text" class="intxt">
              <span class="need">*</span> <span class="Validform_checktip"></span> </li>
            <li>
              <label>所在地区：</label>
              <select class="sys_select" style="width:150px;" name="Province">
                <option>请选择省份</option>
                <option>北京</option>
                <option>天津</option>
              </select>
              <select class="sys_select" style="width:150px;" name="City">
                <option>请选择城市</option>
              </select>
              <select class="sys_select" style="width:150px;">
                <option>请选择地区</option>
              </select>
              <span class="need">*</span> <span class="Validform_checktip"></span> </li>
            <li>
              <label>详细地址：</label>
              <input style="width: 430px;" type="text" class="intxt">
              <span class="need">*</span> <span class="Validform_checktip">请您正确填写详细收货地址，如街道名、门牌号、房间名等信息</span> </li>
            <li>
              <label>手机号码：</label>
              <input style="width: 145px;" type="text" class="intxt">
              或<span class="p0_5"> 固定电话：</span>
              <input style="width: 145px;" type="text" class="intxt" maxlength="15">
              <span class="need">*</span> <span class="Validform_checktip">手机和电话必须填写一个</span> </li>
            <li>
              <label>邮政编码：</label>
              <input style="width: 145px;" type="text" class="intxt">
              <span class="need">*</span><span class="Validform_checktip"></span>
              <input type="hidden" name="ReceiveFax" value="">
            </li>
          </ul>
          <p class="action"> <a href="javascript:void(0);" class="btn"><span>保存地址</span></a> <a href="javascript:void(0);" class="btn cancel"><span>取消</span></a> <span class="Validform_checktip"></span> </p>
        </form>