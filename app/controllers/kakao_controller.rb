class KakaoController < ApplicationController
  def keyboard #json를 hash로,: =>,  :둘다가능

    @keyboard=
    {
      :type => "buttons",
      buttons: ["흡연/금연구역보러가기", "흡연구역등록", "단속구역등록","사용법보기","문의하기"]
    }

    render json: @keyboard

  end
  
  def message
    @user_msg = params[:content]
    @text = "기본 텍스트"
    
    if @user_msg == "흡연/금연구역보러가기"
      @text = "흡연/금연구역보러가기를 원하기군요 밑에 버튼은 눌러주세요"
      @url = "https://mysecond-app-rb2978.c9users.io"
    elsif @user_msg == "흡연구역등록"
      @text = "흡연구역등록를 원하기군요 밑에 버튼은 눌러주세요"
      @url = "https://mysecond-app-rb2978.c9users.io"
    elsif @user_msg == "단속구역등록"
      @text = "단속구역등록를 원하기군요 밑에 버튼은 눌러주세요"
      @url = "https://mysecond-app-rb2978.c9users.io"
    elsif @user_msg == "사용법보기"
      @text = "사용법보기를 원하기군요 밑에 버튼은 눌러주세요"
      @url = "https://mysecond-app-rb2978.c9users.io"
    elsif @user_msg == "문의하기"
      @text = "문의하기를 원하기군요 밑에 버튼은 눌러주세요"
      @url = "https://mysecond-app-rb2978.c9users.io"
    end
   
    @return_msg = {
      
    "text": @text,
    "photo": {
    "url": "https://hello.photo.src",
    "width": 640,
    "height": 480
      },
      "message_button": {
      "label": "링크클릭",
      "url": @url
      }

    }
    
   
    @return_keyboard = {
      :type => "buttons",
      buttons: ["흡연/금연구역보러가기", "흡연구역등록", "단속구역등록","사용법보기","문의하기"]
    }
   

    @result = {
      :message => @return_msg,
      :keyboard => @return_keyboard
    }

   

    render json: @result
  end
end
