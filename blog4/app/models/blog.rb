class Blog < ApplicationRecord::Base
validates :title, :content,  presence: true
end
