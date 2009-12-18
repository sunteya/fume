require 'fume/authlogic'
require 'fume/searchlogic'
require 'fume/simple_theme'
require 'fume/rails_ext'

Fume::Authlogic.enable
Fume::Searchlogic.enable
Fume::SimpleTheme.enable
Fume::RailsExt.enable

module Fume
  def self.root
    @root ||= Pathname.new(File.dirname(__FILE__)).join("..")
  end
end

# if Object.const_defined? "Rake"
#   unless Rake::Task.task_defined? "fume"
#     rake_files = File.join(File.dirname(__FILE__), '..', 'tasks', '*.rake')
#     Dir[rake_files].each do |rake_file|
#       load rake_file
#     end
#   end
# end
