class Profile < ApplicationRecord

    validates_presence_of :title, :body


    def self.by_position
        order("position ASC")
    end
end
