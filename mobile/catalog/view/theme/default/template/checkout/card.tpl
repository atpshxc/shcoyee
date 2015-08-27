<div>
  <table class="form">
      <tr>
          <td colspan="2"><span class="required">提示信息：</span> 因涉及国家监管部门规定，需要对购买人信息实名备案，可益网站不会保留相关个人隐私信息，请放心填写。</td>
    </tr>
    <tr>
      <td><span class="required">*</span> 姓名： </td>
      <td><input type="text" id="xm" value="<?php if(isset( $this->session->data['card_info'])) echo $this->session->data['card_info']['card_name']; ?>" class="large-field" /></td>
    </tr>
    <tr>
      <td><span class="required">*</span> 证件类型：</td>
      <td><select name="zone_id" class="large-field">
              <option>身份证</option>
        </select></td>
    </tr>
    <tr>
      <td><span class="required">*</span> 证件号码：</td>
      <td><input type="text" id="cd" value="<?php if(isset( $this->session->data['card_info'])) echo $this->session->data['card_info']['card_code']; ?>" class="large-field" /></td>
    </tr>
    <tr>
      <td><span class="required">*</span> 手机号码：</td>
      <td><input type="text" id="ph" value="<?php if(isset( $this->session->data['card_info'])) echo $this->session->data['card_info']['card_phone']; ?>" class="large-field" /></td>
    </tr>
    <tr>
      <td><span class="required">*</span> Email：</td>
      <td><input type="text" id="em" value="<?php if(isset( $this->session->data['card_info'])) echo $this->session->data['card_info']['card_email']; ?>" class="large-field" /></td>
    </tr>
  </table>
</div>
<br />