class Collaborator < ActiveRecord::Base
  attr_reader :user_ids
  belongs_to :user
  belongs_to :wiki
end
