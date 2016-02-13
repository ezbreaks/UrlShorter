class Link < ActiveRecord::Base
  mount_uploader :snapshot, SnapshotUploader
  after_create :generate_slug, :screenshot_scrape
  require 'securerandom'

  def generate_slug
    random_string = SecureRandom.hex(5)
    self.slug = random_string
    self.save
  end
  
  def display_slug
    ENV['BASE_URL'] + self.slug
  end
  
  def screenshot_scrape
    Screenshot.perform_async(self.id)
    Scrape.perform_async(self.id)
  end
end
