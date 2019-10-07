require_relative 'module'

module Screengrab
  class Setup
    # This method will take care of creating a screengrabfile and other necessary files

	def set_path(arg)
		template_location = "#{Screengrab::ROOT}
        screengrabfile_path = File.join(path, "#{arg}")
	end

    def self.create(path, is_swift_fastfile: false)
      if is_swift_fastfile
		set_path('Screengrabfile.swift')
      else
        set_path('Screengrabfile')
      end

      if File.exist?(screengrabfile_path)
        UI.user_error!("Screengrabfile already exists at path '#{screengrabfile_path}'. Run 'screengrab' to use screengrab.")
      end

      File.write(screengrabfile_path, File.read(template_location))

      UI.success("Successfully created new Screengrabfile at '#{screengrabfile_path}'")
    end
  end
end
