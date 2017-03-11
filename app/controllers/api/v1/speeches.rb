module API  
  module V1
    class Speeches < Grape::API
      include API::V1::Defaults
      before do
        authorize
      end

      resource :speeches do
        post "tts", root: :speeches do
          text = params['text'] && params['text'].length > 0 && params['text'] || nil
          Response.perform true, { url: Speech::TTS.new(text).perform }
        end
      end

    end
  end
end