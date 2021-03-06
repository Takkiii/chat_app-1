class Message < ApplicationRecord
	belongs_to :users

	validates :contents, presence: true, if: 'image.nil?'

	def set_image(file)
		return if file.nil?
		file_name = Time.zone.now.to_i.to_s + file.original_filename
		File.open("public/message_images/#{file_name}", "wb") {|f|f.write(file.read)}
		self.image = file_name
	end
end
