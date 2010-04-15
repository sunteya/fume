class SimpleThemeGen < Fume::Gen::Base

  def manifest
    record do |m|
      cp_files m, File.join("public", "themes", "**", "*")
      cp_files m, File.join("public", "stylesheets", "*.css")
    end
  end
end
