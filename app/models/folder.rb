class Folder < ActiveRecord::Base
  default_scope where(:deleted => false)

  has_many :groupings, :dependent => :destroy
  has_many :groups, :through => :groupings
  has_many :items, :dependent => :destroy
  has_many :belongings, :dependent => :destroy
  has_many :users, :through => :belongings
  validates :name, :presence => true, :uniqueness => true
end
