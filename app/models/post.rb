# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Post < ApplicationRecord
  paginates_per 10

  belongs_to :user
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image

  validates :title, :body, presence: true
end
