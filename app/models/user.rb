class User < ApplicationRecord

    
    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
    attr_accessor :password
    
      before_save :encrypt_password
      after_save :clear_password
    
      EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
      validates :username, :presence => true, :uniqueness => true, :length => { :in => 5..20 }
      validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
      validates :password, :confirmation => true

      validates_length_of :password, :in => 6..20, :on => :create
    
    
      def self.authenticate(username_or_email="", login_password="")
    
        if  EMAIL_REGEX.match(username_or_email)    
          user = User.find_by_email(username_or_email)
        else
          user = User.find_by_username(username_or_email)
        end
    
        if user && user.match_password(login_password)
          return user
        else
          return false
        end
      end   
    
      def match_password(login_password="")
        encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
      end
    
      def encrypt_password
        unless password.blank?
          self.salt = BCrypt::Engine.generate_salt
          self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
        end
      end
    
      def clear_password
        self.password = nil
      end
    
    
end
