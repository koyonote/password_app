class User < ActiveRecord::Base
  default_scope where(:deleted => false)

  has_many :favorites
  has_many :items, :through => :favorites
  has_many :memberships, :dependent => :destroy
  has_many :groups, :through => :memberships
  has_many :belongings, :dependent => :destroy
  has_many :folders, :through => :belongings

  validates_presence_of :login, :name
  validates_uniqueness_of :login

  attr_accessor :password
  validates :password, :confirmation => true
  validates :password, :presence => true, :on => :create

  before_save :encrypt_password

  def get_items
    if self.role == 0
      Item.all
    else
      folders = []
      self.groups.each do |group|
        folders += group.folders
      end
      folders += self.folders
      items = []
      folders.uniq.each do |folder|
        items += folder.items
      end
      items
    end
  end

  def get_folders
    if self.role == 0
      Folder.all
    else
      folders = []
      self.groups.each do |group|
        folders += group.folders
      end
      folders += self.folders
      folders.uniq
    end
  end

  def get_folder(id)
    folder = Folder.find(id)
    if self.role == 0
      folder
    else
      self.groups.each do |group|
        if group.folders.include?(folder)
          return folder
        end
      end
      if self.folders.include?(folder)
        return folder
      end
    end
  end

  def self.authenticate(login, password)
    if user = find_by_login(login)
      if user.hashed_password == BCrypt::Engine.hash_secret(password, user.salt)
        user
      else
        nil
      end
    end
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end
end
