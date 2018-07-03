class KakaoController < ApplicationController
  def keyboard #json를 hash로,: =>,  :둘다가능
    @keyboard=
    {
      :type => "buttons",
      buttons: ["로또", "메뉴", "고양이"]
    }
    render json: @keyboard #json으로 변환
  end
  
  def message
    @user_msg = params[:content]
    
    @text = "기본 텍스트"
    if @user_msg == "로또"
     @text = "행운의 번호는  " + (1..45).to_a.sample(6).sort.to_s
    elsif @user_msg == "메뉴"
     @text = "메뉴는  " + ["치킨","피자","햄버거"].sample()
    elsif @user_msg == "고양이"
     @url = "http://thecatapi.com/api/images/get?format=xml&type=jpg" 
     @cat_xml = RestClient.get(@url)
     @cat_doc = Nokogiri::XML(@cat_xml)
     @cat_url = @cat_doc.xpath("//url").text
     @text =@cat_url
    end
   
    @return_msg = {
      :text => @text
    }
    
    @return_msg_photo = {
      :text => "나만 고양이 없어",
      :photo => {
        :url => @text,
        :width => 720, 
        :height => 630
      }
      
    }
   
    @return_keyboard = {
      :type => "buttons",
      buttons: ["로또", "메뉴", "고양이"]
    }
   
   if @user_msg == "고양이"
    @result = {
      :message => @return_msg_photo,
      :keyboard => @return_keyboard
    }
   else
    @result = {
      :message => @return_msg,
      :keyboard => @return_keyboard
    }
   end
   

    render json: @result
  end
end
