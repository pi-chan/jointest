class Entry < ActiveRecord::Base

  has_many :relationships, dependent: :destroy
  has_many :users, through: :relationships

  default_scope {order('entries.published_at DESC')}
end
