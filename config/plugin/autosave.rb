# Copyright (c) 2009 Michael Fellinger <m.fellinger@gmail.com>
#
# Description:
#
# Autosave every second when inactive and changes have been made.
#
# Usage:
#
# Put following line into your rc.rb
#   VER.plugin :autosave

VER.startup_hook do
  VER.when_inactive_for 500 do
    VER.layout.views.each do |view|
      text = view.text

      next if text.pristine? || text.persisted?

      VER::Methods::Save.file_save(text)
    end
  end
end
