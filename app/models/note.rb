class Note < ActiveRecord::Base
  validates :track_id, :user_id, :body, presence: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :track,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: :Track

  has_one :album,
    through: :track,
    source: :album
end
