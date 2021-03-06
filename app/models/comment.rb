# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  author_id  :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'
end
