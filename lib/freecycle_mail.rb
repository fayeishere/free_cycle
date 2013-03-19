#### freecycle mail app


$LOAD_PATH << File.join(File.dirname(__FILE__))

require 'mail_config'
require 'mail'
require 'json'

# http://blog.rubybestpractices.com/posts/gregory/033-issue-4-configurable.html
# http://metabates.com/2011/06/28/lets-say-goodbye-to-yaml-for-configuration-shall-we/


# 'mail_config.rb should be a ruby file in the following format:

# module FreeCycleMap
#   USER_CONFIG = {
#     :user_name => "username",
#     :password => "password" }
#   MAIL_CONFIG = {
#     :server => "mailserver",
#     :group => "freecycle mailing list email address" }
# end

# !!! FIXME [wc 2013-03-13]: This is somewhat bad

credentials = {
  :port => 993,
  :enable_ssl => true
}

credentials[:address] = FreeCycleMap::MAIL_CONFIG[:server]
credentials[:user_name] = FreeCycleMap::USER_CONFIG[:user_name]
credentials[:password] = FreeCycleMap::USER_CONFIG[:password]



Mail.defaults { retriever_method :imap, credentials }

# Now we are ready to retrieve mail and work with them.

def recent_offers (count=nil)
  # Returns a list of subject lines with the word 'offer' in them.
  return Mail.find({
                     :order => :desc,
                     :what => :last,
                     :count => count,
                     :keys => ["SUBJECT", "OFFER"]
                   }).map { |m| m.subject }
end
def make_offer_data (subject)
  # Returns a hash of the subject and location (more features to come)
  hash = {
    :subject => subject,
    :location => subject.scan(/\(.*\)/).first }
  unless hash[:location].nil?
    if hash[:location].is_a? String
      hash[:location] = hash[:location][1..-2]
    else
      raise "Location, #{hash[:location]}, neither nil or String."
    end
  end
  return hash
end

def make_recent_offers_data
  # Returns a list of offer_data from offers
  return recent_offers.map { |s| make_offer_data(s) }
end

def make_recent_offers_web_data
  # Return a json string of recent offer data
  make_recent_offers_data().to_json
end
