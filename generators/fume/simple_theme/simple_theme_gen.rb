class SimpleThemeGen < Fume::Gen::Base

  def manifest
    record do |m|
      # generate_images
      cp_files m, File.join("public", "images", "**", "*")

      # generate_stylesheets
      cp_files m, File.join("public", "stylesheets", "*.css")

      # generate_javascripts
      cp_files m, File.join("public", "javascripts", "**", "*")
    end
  end
end
