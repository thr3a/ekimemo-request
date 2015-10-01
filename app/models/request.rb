class Request < ActiveRecord::Base
	validates :title, presence: true, length: { in: 10..100 }
end
