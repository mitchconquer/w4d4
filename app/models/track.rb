class Track < ActiveRecord::Base
  validates :album_id, :name, presence: true
  after_initialize :ensure_defaults

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album

  private
  def ensure_defaults
    self.bonus ||= false
  end
end
