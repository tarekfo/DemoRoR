require "digest/sha1"
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :password

  def before_create
    self.hashed_password = User.hash_password(self.password)
  end

  def after_create
    @password = nil
  end

  def try_to_login
    User.login(self.name, self.password) ||
      User.find_by_name_and_hashed_password(name, "")
  end

  def self.login(name, password)
    hashed_password = hash_password(password || "")
    find :first, :conditions => ["name = ? and hashed_password = ?",name, hashed_password]
  end
  before_destroy :dont_destroy_jeje
  def dont_destroy_jeje
    raise "Impossible de détruire Jeje" if self.name == "jeje"
  end
  validates_uniqueness_of :name
  validates_presence_of :name, :password
  
  private
  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end
end
