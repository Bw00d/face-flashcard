class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sent_invitations, :class_name => 'Invitation', :foreign_key => 'sender_id'
  belongs_to :invitation
  before_validation :check_invitation

  private
  def check_invitation
    token = Invitation.find_by_token(self.invitation_token.strip)
    if !token.nil?
      token.update_attributes(confirmed: true)
      true
    else
      self.errors.add(:summary, "Invitation token it invalid.")
      false 
    end
  end
end
