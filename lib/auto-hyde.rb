require 'systemu'
require 'sinatra/base'

# =====================================================================================================================
# Setup Github Post-Receive route and action
# =====================================================================================================================

class AutoHyde < Sinatra::Base

  EMAIL_TEMPLATE = <<-EMAIL
    Your Jekyll rebuild failed at #{Time.now} with the following error:
    #{@error}
  EMAIL

  post '/auto-hyde' do
    cmd = "cd #{settings.jekyll_dir} && git pull && #{settings.jekyll_bin}#{' --pygments' if settings.pygments} #{settings.build_dir}"
    result = systemu(cmd)
    if result[0] == 0
      "Rebuild Failed:\n" + result[2]
      if settings.email 
        require 'pony'
        @error = result[2];
        Pony.mail :to => settings.email,
                  :from => "no-reply@#{`hostname`.strip}",
                  :subject => 'Jekyll Rebuild Failed',
                  :body => erb(EMAIL_TEMPLATE)
      end
    end
  end

end