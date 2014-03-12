class WeixinMenu < ActiveRecord::Base
  has_many :weixin_buttons
  
  def to_json
    Jbuilder.encode do |json|
      json.button self.weixin_buttons do |ui_button|
        json.name ui_button.name
        if ui_button.weixin_sub_buttons.any?
          json.sub_button ui_button.weixin_sub_buttons do |sub_button|
            json.name sub_button.name
            json.type sub_button.button_type
            case sub_button.button_type
            when 'click'
              json.key sub_button.key
            when 'view'
              json.url sub_button.url
            else
            end
          end
        else
          json.type ui_button.button_type
          case ui_button.button_type
          when 'click'
            json.key ui_button.key
          when 'view'
            json.url ui_button.url
          else
          end
        end
      end
    end
  end
end