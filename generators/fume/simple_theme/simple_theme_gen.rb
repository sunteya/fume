class SimpleThemeGen < Fume::Gen::Base

  def manifest
    @manifest_util = Rails::Generator::Manifest.new(self)

    # generate_images
    cp_files File.join("public", "images", "**", "*")
    
    # generate_stylesheets
    cp_files File.join("public", "stylesheets", "*.css")
    
    # generate_javascripts
    cp_files File.join("public", "javascripts", "**", "*")

    @manifest_util
  end
end
