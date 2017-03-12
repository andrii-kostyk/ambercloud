module Speech
  class TTS

  	def initialize text
  		@text = text
  	end

  	def perform
  		@text && audio_from_text || file_url('default/error.wav')
  	end

  	private

  	def audio_from_text
  		name = generete_name
  		system_send name
      CleanTtsWorker.perform_in(1.minutes, name)
  		file_url name
  	end

  	def generete_name
  		dc = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
  		Digest::MD5.hexdigest((0...50).map { dc[rand(dc.length)] }.join + Time.now.to_s) + '.wav'
  	end

  	def tts_path
  		Rails.root.join("public").to_s + "/tts/"
  	end

  	def file_url name
      if Rails.env.development? 
        "http://localhost:3000/tts/#{name}"
      else
  		  "http://amber-cloud.space/tts/#{name}"
      end
  	end

  	def system_send name
  		command = "pico2wave -w #{tts_path + name} -l en-GB '#{@text}'"
  	  system(command)
  	end

  end
end