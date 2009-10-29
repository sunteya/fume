class FumeSimpleThemeGenerator < Rails::Generator::Base

  def manifest
    @manifest_util = Rails::Generator::Manifest.new(self)
    
    # generate_images
    cp_files orig_source_pathname.join("images"), orig_target_pathname.join("public", "images")
    
    # generate_stylesheets
    cp_files orig_source_pathname.join("stylesheets"), orig_target_pathname.join("public", "stylesheets"), [ "*.css" ]

    # generate_javascripts
    cp_files orig_source_pathname.join("javascripts"), orig_target_pathname.join("public", "javascripts")

    @manifest_util
  end

  def orig_target_pathname
    Pathname.new(self.destination_root)
  end

  def orig_source_pathname
    Pathname.new(self.source_root)
  end

  def cp_files(source_pathname, target_pathname, patterns = ["**/*"])
    patterns.each do |pattern|
      Pathname.glob(source_pathname.join(pattern)) do |source_path|
        relative_path = source_path.relative_path_from(source_pathname)
        target_path = target_pathname.join(relative_path)

        if source_path.directory?
          @manifest_util.directory target_path.relative_path_from(orig_target_pathname) unless target_path.exist?
        else
          @manifest_util.directory target_path.dirname.relative_path_from(orig_target_pathname) unless target_path.dirname.exist?
          @manifest_util.file source_path.relative_path_from(orig_source_pathname).to_s, target_path.relative_path_from(orig_target_pathname).to_s
        end
      end
    end
  end
end
