require 'securerandom'

class ShortenedUrl < ActiveRecord::Base
  validates :long_url, :short_url, presence: true, uniqueness: true

  belongs_to(:submitter,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User
  )

  has_many(:visits,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: :Visit
  )

  has_many(:visitors,
    Proc.new { distinct },
    :through => :visits,
    :source => :visitor
  )

  def self.random_code
    c = SecureRandom.urlsafe_base64
    while exists?(:short_url == c)
      c = SecureRandom.urlsafe_base64
    end
    c
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(long_url: long_url,
    short_url: random_code, user_id: user.id)
  end

  def num_clicks
    self.visits.length
  end

  def num_uniques
    visitors.length
  end

  def num_recent_uniques
    visit_count = Hash.new(0)
    self.visits.each do |visit|
      visit_count[visit.user_id] += 1 if visit.created_at >= 10.minutes.ago
    end

    visit_count.length
  end
end
