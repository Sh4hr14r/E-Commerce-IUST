##
#* User database model
#* generated manually
class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :username
  ##
  # user creation validators
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :username
  validates_uniqueness_of :username
  before_create { token_gen(:auth_token)}

  def send_pass_reset
    ##
    # if the user requests password reset ,this method does the job
    token_gen(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.deliver_password_reset(self)
  end

  def token_gen(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
