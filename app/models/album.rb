class Album < ActiveRecord::Base
  validates :band_id, :name, presence: true
  after_initialize :ensure_defaults

  belongs_to :band,
      primary_key: :id,
      foreign_key: :band_id,
      class_name: :Band

  has_many :tracks,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Track

  private
  def ensure_defaults
    self.live ||= false
  end
end
