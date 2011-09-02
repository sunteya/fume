namespace :cache do
  desc "Rails.cache.clear"
  task :clear => :environment do
    Rails.cache.clear
  end
end
