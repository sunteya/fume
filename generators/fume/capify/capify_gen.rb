class CapifyGen < Fume::Gen::Base

  def manifest
    record do |m|
      cp_files m, File.join("**", "*")
    end
  end
end
