class Member < ApiModel
  attr_accessor :id, :name, :profile_pic, :attributes,
    :challenges_entered, :active_challenges, :time_zone,
    :total_1st_place, :total_2nd_place, :total_3st_place,
    :total_wins, :total_public_money, :total_points, :valid_submissions,
    :summary_bio, :quote, :percent_submitted,
    :first_name, :last_name, :email, :address_line1, :address_line2, :city, :zip, :state, :phone_mobile, :time_zone, :country,
    :preferred_payment, :paperwork_received, :paperwork_sent, :paperwork_year, :paypal_payment_address,
    :company, :school, :years_of_experience, :work_status, :shirt_size, :age_range, :gender,
    :website, :twitter, :github, :facebook, :linkedin, :badgeville_id, :can_judge

  has_many :recommendations
  has_many :challenges, parent: Member
  has_many :payments
  has_many :referrals

  def self.api_endpoint
    "members"
  end  

  def self.has_many_api_endpoint
    api_endpoint
  end    

  # Used for resourceful routes (instead of id)
  def to_param
    name
  end

  def all_challenges
    self.class.http_get "members/#{name}/challenges"
  end

  def all_past_challenges(offset=0)
    self.class.http_get("members/#{name}/challenges/past?offset=#{offset}")
  end        

  def active_challenges(all_challenges)
    all_challenges.active.map {|challenge| Challenge.new challenge}
  end  

  def watching_challenges(all_challenges)
    all_challenges.watching.map {|challenge| Challenge.new challenge}
  end    

  def past_challenges(all_challenges)
    all_challenges.past.map {|challenge| Challenge.new challenge}
  end

  def self.login_type(membername)
    http_get "members/#{membername}/login_type"
  end

  def inbox
    self.class.http_get("messages/inbox/#{@name}").map {|message| Message.new message}
  end  

  def from
    self.class.http_get("messages/from/#{@name}").map {|message| Message.new message}
  end    

end
