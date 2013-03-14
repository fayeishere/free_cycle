#### freecycle mail app


$LOAD_PATH << File.join(File.dirname(__FILE__))

require 'mail_config'
require 'mail'

# !!! FIXME [wc 2013-03-13]: This is somewhat bad

credentials = {
  :port => 993,
  :enable_ssl => true
}

credentials[:address] = user_config[:address]
credentials[:user_name] = user_config[:user_name]
credentials[:password] = user_config[:password]

Mail.defaults { retriever_method :imap, credentials }

# Now we are ready to retrieve mail and work with them.

def last-dozen-posts
  
end
