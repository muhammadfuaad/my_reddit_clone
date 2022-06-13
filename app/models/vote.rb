class Vote < ApplicationRecord
	belongs to :account
	belongs to :post

	validates_uniqueness_of :account_id, scope: :post_id

	after_create :increment_vote
	after_destrroy :decrement_vote

	def	increment_vote
		field = self.upvote ? :upvotes : :downvotes
		Post.find(self.post_id).increment(field).save
	end
		
	def decrement_vote
		field = self.upvote ? :upvotes : :downvotes
		Post.find(self.post_id).decrement(field).save
	end
end