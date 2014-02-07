class PictureUploader < BaseUploader
  def store_dir
    "uploads/picture"
  end

  def cache_dir
    "caches/picture"
  end
end
