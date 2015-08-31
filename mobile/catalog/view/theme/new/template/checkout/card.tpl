  <div>
    <div class="f18 pt20">实名信息备案</div>
    <div class="selectads mb20 mt10">
      <div class="tsxx mt10">
          <span>提示信息：</span>
          因涉及国家监管部门规定，需要对购买人信息实名备案，可益网站不会保留相关个人隐私信息，请放心填写。
      </div>
      <div class="newaddr formsub formsubB" style="border-top:none" >
        <form class="form_newaddr" name="form_newaddr" >
          <ul>
            <li>
              <label style="width: 20%;">姓名：</label>
              <input style="width: 210px;" type="text" class="intxt" id='xm' value="<?php if(isset( $this->session->data['card_info'])) echo $this->session->data['card_info']['card_name']; ?>">
              <span class="need">*</span></li>
            <li>
              <label style="width: 20%;">证件类型：</label>
              <select name="zdi" class="sys_select">
                <option>身份证</option>
                </select>
              <span class="need">*</span> <span class="Validform_checktip"></span> </li>
            <li>
              <label style="width: 20%;">证件号：</label>
              <input style="width: 210px;" type="text" class="intxt" id="cd" value="<?php if(isset( $this->session->data['card_info'])) echo $this->session->data['card_info']['card_code']; ?>">
              <span class="need">*</span></li>
            <li>
              <label style="width: 20%;">手机号：</label>
              <input style="width: 210px;" type="text" class="intxt" id="ph" value="<?php if(isset( $this->session->data['card_info'])) echo $this->session->data['card_info']['card_phone']; ?>">
            <span class="need">*</span></li>
            <li>
              <label style="width: 20%;">Email：</label>
              <input style="width: 210px;" type="text" class="intxt" id="em" value="<?php if(isset( $this->session->data['card_info'])) echo $this->session->data['card_info']['card_email']; ?>">
                <span class="need">*</span>
            </li>
          </ul>
        </form>
      </div>
    </div>
  </div>