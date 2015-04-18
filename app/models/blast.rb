class Blast < ActiveRecord::Base
	before_save :inliner

	def inliner
		self.body.gsub!('class="wysiwyg-color-blue"', 'style="color: #333399;"')
		self.body.gsub!('class="wysiwyg-color-purple"', 'style="color: #663399;"')
		self.body.gsub!('class="wysiwyg-color-red"', 'style="color: #CC3333;"')
		self.body.gsub!('class="wysiwyg-color-orange"', 'style="color: #FF6633;"')
		self.body.gsub!('class="wysiwyg-color-yellow"', 'style="color: #FFCC33;"')
		self.body.gsub!('class="wysiwyg-color-green"', 'style="color: #009933;"')
		self.body.gsub!('class="wysiwyg-color-grey"', 'style="color: #A9A9A9;"')
		self.body.gsub!('class="wysiwyg-text-align-left"', 'style="text-align: left;"')
		self.body.gsub!('class="wysiwyg-text-align-center"', 'style="text-align: center;"')
		self.body.gsub!('class="wysiwyg-text-align-right"', 'style="text-align: right;"')
	end

end
