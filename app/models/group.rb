class Group < ActiveRecord::Base
  default_scope where(:deleted => false)

  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  has_many :groupings, :dependent => :destroy
  has_many :folders, :through => :groupings

  validates :name, :presence => true, :uniqueness => true
end
