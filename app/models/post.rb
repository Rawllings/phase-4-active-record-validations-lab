class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true, length: {minimum: 250}
    validates :summary, presence: true, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    validate :facts 

    def facts
        if title == "True Facts"
            errors.add(:title, "can't be clickbait")
        end
    end
end
