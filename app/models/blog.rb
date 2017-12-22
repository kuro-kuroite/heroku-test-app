class Blog < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true, length: {in: 1..140}
end
