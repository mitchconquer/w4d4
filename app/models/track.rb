class Track < ActiveRecord::Base
  validates :album_id, :name, presence: true
  after_initialize :ensure_defaults

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album

  has_many :notes,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: :Note

  private
  def ensure_defaults
    self.bonus ||= false
  end
end
