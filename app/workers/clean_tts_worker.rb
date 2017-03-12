class CleanTtsWorker
  include Sidekiq::Worker

  def perform(file)
  	path_to_file = Rails.root.join("public").to_s + "/tts/" + file
  	File.delete(path_to_file) if File.exist?(path_to_file)
  	puts "deleted #{file}"
  end
end
