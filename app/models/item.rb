require 'crypt_util'
class Item < ActiveRecord::Base
  default_scope where(:deleted => false)

  has_many :favorites
  has_many :users, :through => :favorites
  has_one :sugar, :dependent => :destroy
  belongs_to :folder

  validates_presence_of :name, :folder_id

  attr_accessor :password
  validates :password, :presence => true, :on => :create

  before_save :encrypt_password
  after_create :create_sugar

  def encrypt_password
    if password.present?
      @salt = CryptUtil.create_password
      self.encrypted_password = CryptUtil.encrypt(password, ATOMIC, @salt)
    end
  end

  def decrypt_password
    sugar = Sugar.find_by_item_id(id)
    CryptUtil.decrypt(self.encrypted_password, ATOMIC, sugar.salt)
  end

  def create_sugar
    Sugar.create!(:item_id => id, :salt => @salt)
  end
end
